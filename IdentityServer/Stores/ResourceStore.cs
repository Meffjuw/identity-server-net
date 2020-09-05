using Dapper;
using IdentityServer4.Models;
using IdentityServer4.Stores;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;

namespace IdentityServer.Stores
{
    public class ResourceStoreCommands
    {
        public static string FindApiResourcesByScopeName => "[dbo].[FindApiResourcesByScopeName]";

        public static string FindIdentityResourcesByScopeName => "[dbo].[FindIdentityResourcesByScopeName]";

        public static string FindApiResourcesByName => "[dbo].[FindApiResourcesByName]";

        public static string FindApiScopesByName => @"SELECT
                            [Id],
                            [Enabled],                
                            [Name],                   
                            [DisplayName],            
                            [Description],            
                            [Required],               
                            [Emphasize],              
                            [ShowInDiscoveryDocument],
                            (SELECT 
	                            JSON_QUERY(concat('[' , STRING_AGG(concat('""' , STRING_ESCAPE([Type], 'json') , '""'),',') , ']'))
                                FROM ApiScopeClaims c
                                WHERE a.Id = c.ScopeId
                            ) as [UserClaims],
                            JSON_QUERY((
	                            SELECT
		                            '{' + STRING_AGG( '""' + [Key] + '"":""' + STRING_ESCAPE([Value],'json') + '""' ,',') + '}'
                                FROM ApiScopeProperties c
                                WHERE a.Id = c.ScopeId
                            )) as [Properties]
                            FROM ApiScopes a
                            WHERE a.Name in @scopes
                            FOR JSON PATH";
    }

    public class ResourceStore : IResourceStore
    {
        private readonly string ConnectionString;

        public ResourceStore(IConfiguration configuration)
        {
            ConnectionString = configuration.GetConnectionString("Local");
        }

        public async Task<IEnumerable<ApiResource>> FindApiResourcesByNameAsync(IEnumerable<string> apiResourceNames)
        {
            using var connection = new SqlConnection(ConnectionString);

            var response = await connection.ExecuteScalarAsync<string>(ResourceStoreCommands.FindApiResourcesByName, new { names = string.Join(',', apiResourceNames) }, commandType: CommandType.StoredProcedure);

            if (response != null)
            {
                return JsonSerializer.Deserialize<IEnumerable<ApiResource>>(response); 
            }

            return Enumerable.Empty<ApiResource>();
        }

        public async Task<IEnumerable<ApiResource>> FindApiResourcesByScopeNameAsync(IEnumerable<string> scopeNames)
        {
            using var connection = new SqlConnection(ConnectionString);

            var response = await connection.ExecuteScalarAsync<string>(ResourceStoreCommands.FindApiResourcesByScopeName, new { scopeNames = string.Join(',', scopeNames) }, commandType: CommandType.StoredProcedure);

            if (response != null)
            {
                return JsonSerializer.Deserialize<IEnumerable<ApiResource>>(response);
            }

            return Enumerable.Empty<ApiResource>();
        }

        public async Task<IEnumerable<ApiScope>> FindApiScopesByNameAsync(IEnumerable<string> scopeNames)
        {
            using var connection = new SqlConnection(ConnectionString);

            var response = await connection.ExecuteScalarAsync<string>(ResourceStoreCommands.FindApiScopesByName, new { scopes = scopeNames });

            if(response != null)
            {
                return JsonSerializer.Deserialize<IEnumerable<ApiScope>>(response);
            }

            return Enumerable.Empty<ApiScope>();
        }

        public async Task<IEnumerable<IdentityResource>> FindIdentityResourcesByScopeNameAsync(IEnumerable<string> scopeNames)
        {
            using var connection = new SqlConnection(ConnectionString);

            var response = await connection.ExecuteScalarAsync<string>(ResourceStoreCommands.FindIdentityResourcesByScopeName, new { scopeNames = string.Join(',', scopeNames) }, commandType: CommandType.StoredProcedure);

            if (response != null)
            {
                return JsonSerializer.Deserialize<IEnumerable<IdentityResource>>(response);
            }

            return Enumerable.Empty<IdentityResource>();
        }

        public async Task<Resources> GetAllResourcesAsync()
        {
            using var connection = new SqlConnection(ConnectionString);

            using var result = await connection.QueryMultipleAsync(@"
                EXECUTE [dbo].[GetAllApiResources]
                EXECUTE [dbo].[GetAllApiScopes]
                EXECUTE [dbo].[GetAllIdentityResources]
            ");

            var apiResources = JsonSerializer.Deserialize<IEnumerable<ApiResource>>(result.Read<string>().FirstOrDefault());
            var apiScopes = JsonSerializer.Deserialize<IEnumerable<ApiScope>>(result.Read<string>().FirstOrDefault());
            var identityResources = JsonSerializer.Deserialize<IEnumerable<IdentityResource>>(result.Read<string>().FirstOrDefault());

            return new Resources(identityResources, apiResources, apiScopes);
        }
    }
}
