using Dapper;
using System.Data.SqlClient;
using System.Threading.Tasks;
using IdentityServer4.EntityFramework.Entities;
using IdentityServer4.Services;
using Microsoft.Extensions.Configuration;

namespace IdentityServer.Services
{

  public class CorsPolicyService : ICorsPolicyService
  {
    private string connectionString;

    public CorsPolicyService(IConfiguration configuration) {
      connectionString = configuration.GetConnectionString("Local");
    }

    public async Task<bool> IsOriginAllowedAsync(string origin)
    {
      using var connection = new SqlConnection(connectionString);

      ClientCorsOrigin clientCorsOrigin = await connection.QueryFirstOrDefaultAsync<ClientCorsOrigin>("SELECT [Origin] FROM [dbo].[ClientCorsOrigins] WHERE [Origin] = @origin GROUP BY [Origin]", new {
        origin
      });

      return clientCorsOrigin != null;
    }
  }
}