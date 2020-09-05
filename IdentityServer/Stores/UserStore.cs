using Dapper;
using IdentityServer.Entities;
using IdentityServer.Interfaces;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Claims;
using System.Threading.Tasks;

namespace IdentityServer.Stores
{
    class UserStoreQueries
    {
        public static string GetPassword => "SELECT [PasswordSalt], [PasswordHash] from [dbo].[Users] WHERE [Username] = @username;";
    }

    public class UserStore : IUserStore
    {
        private string connectionString;

        public UserStore(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("Local");
        }

        public Task<User> AutoProvisionUser(string provider, string subjectId, List<Claim> claims)
        {
            throw new NotImplementedException();
        }

        public Task<User> FindByExternalProvider(string provider, string subjectId)
        {
            throw new NotImplementedException();
        }

        public Task<User> FindBySubjectId(string subjectId)
        {
            throw new NotImplementedException();
        }

        public Task<User> FindByUsername(string username)
        {
            throw new NotImplementedException();
        }

        public Task<bool> SaveUser(User user, string newPasswordToHash = null)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> ValidateCredentials(string username, string password)
        {
            using var connection = new SqlConnection(connectionString);

            User user = await connection.QueryFirstAsync<User>(UserStoreQueries.GetPassword, new { username });



            throw new NotImplementedException();
        }
    }
}
