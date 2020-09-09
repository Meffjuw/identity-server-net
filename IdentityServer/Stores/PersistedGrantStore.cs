using Dapper;
using IdentityServer4.Models;
using IdentityServer4.Stores;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.Stores
{
  public class PersistedGrantStoreQueries
  {
    public static string GetByKey = "SELECT * FROM [dbo].[Grant] WHERE [Key] = @key";
    public static string DeleteByKey = "DELETE FROM [dbo].[Grant] WHERE [Key] = @key";
    public static string GetAll => "SELECT * FROM [dbo].[Grant] WHERE [SubjectId] = @SubjectId";
  }
  public class PersistedGrantStore : IPersistedGrantStore
  {
    private string connectionString;

    public PersistedGrantStore(IConfiguration configuration)
    {
      connectionString = configuration.GetConnectionString("Local");
    }

    public async Task<IEnumerable<PersistedGrant>> GetAllAsync(PersistedGrantFilter filter)
    {
      using var connection = new SqlConnection(connectionString);

      var grants = await connection.QueryAsync<PersistedGrant>(PersistedGrantStoreQueries.GetAll, new
      {
        SubjectId = filter.SubjectId
      });

      return grants ?? Enumerable.Empty<PersistedGrant>();
    }

    public async Task<PersistedGrant> GetAsync(string key)
    {
      using var connection = new SqlConnection(connectionString);

      return await connection.QueryFirstOrDefaultAsync<PersistedGrant>(PersistedGrantStoreQueries.GetByKey, new { key });
    }

    public async Task RemoveAllAsync(PersistedGrantFilter filter)
    {
      using var connection = new SqlConnection(connectionString);

      bool hasWhere = false;

      string sql = "DELETE FROM [dbo].[Grant]";

      if (!String.IsNullOrWhiteSpace(filter.ClientId))
      {
        sql += " WHERE [ClientId] = @ClientId";
        hasWhere = true;
      }
      if (!String.IsNullOrWhiteSpace(filter.SubjectId))
      {
        sql += hasWhere ? " AND " : " WHERE ";
        sql += "[SubjectId] = @SubjectId";
      }
      if (!String.IsNullOrWhiteSpace(filter.Type))
      {
        sql += hasWhere ? " AND " : " WHERE ";
        sql += "[Type] = @Type";
      }

      await connection.ExecuteAsync(sql, new { 
        filter.ClientId,
        filter.SubjectId,
        filter.Type
      });
    }

    public async Task RemoveAsync(string key)
    {
      using var connection = new SqlConnection(connectionString);

      await connection.ExecuteAsync(PersistedGrantStoreQueries.DeleteByKey, new { key });
    }

    private string FormatDate(DateTime value)
    {
      // UTC ISO 8601 format
      return ((DateTimeOffset)value).ToUniversalTime().ToString("o");
    }

    private string NullOrDate(DateTime? value)
    {
      return (value.HasValue) ? $"{FormatDate(value.Value)}" : "null";
    }

    public async Task StoreAsync(PersistedGrant grant)
    {
      using var connection = new SqlConnection(connectionString);

      string upsert =
          $"MERGE [Grant] WITH (ROWLOCK) AS [T] " +
          $"USING (SELECT @Key AS [Key]) AS [S] " +
          $"ON [T].[Key] = [S].[Key] " +
          $"WHEN MATCHED THEN UPDATE SET [ClientId]=@ClientId, [CreationTime]=@CreationTime, [Data]=@Data, [Expiration]=@Expiration, [SubjectId]=@SubjectId, [Type]=@Type " +
          $"WHEN NOT MATCHED THEN INSERT ([Key], [ClientId], [CreationTime], [Data], [Expiration], [SubjectId], [Type]) " +
          $"VALUES (@Key,@ClientId,@CreationTime,@Data,@Expiration,@SubjectId,@Type);";

      var obj = new
      {
        grant.Key,
        grant.ClientId,
        CreationTime = FormatDate(grant.CreationTime),
        grant.Data,
        Expiration = NullOrDate(grant.Expiration),
        grant.SubjectId,
        grant.Type
      };

      await connection.ExecuteAsync(upsert, obj);
    }
  }
}
