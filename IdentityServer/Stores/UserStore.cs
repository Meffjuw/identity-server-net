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
        public static string Create => "INSERT INTO [dbo].[Users] ([SubjectId], [Username], [PasswordSalt], [PasswordHash], [ProviderName], [ProviderSubjectId] ) VALUES (@SubjectId, @Username, @PasswordSalt, @PasswordHash, @ProviderName, @ProviderSubjectId); SELECT @@IDENTITY;";
    
        public static string GetUser => "SELECT * from [dbo].[Users] WHERE [Username] = @username";
    }

    public class UserStore : IUserStore
    {
        private string connectionString;

        public UserStore(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("Local");
        }

        public async Task<ApplicationUser> Create(string username, string password) {                    
            using var connection = new SqlConnection(connectionString);

            var salt = ApplicationUser.PasswordSaltInBase64();
            var pass = ApplicationUser.PasswordToHashBase64(password, salt);

            var user = new ApplicationUser {
                SubjectId = Guid.NewGuid().ToString(),
                Username = username,
                PasswordSalt = salt,
                PasswordHash = pass,
                ProviderName = "Local",
                ProviderSubjectId = "LOCAL"
            };

            int id = await connection.ExecuteScalarAsync<int>(UserStoreQueries.Create, new {
                user.SubjectId,
                user.Username,
                user.PasswordSalt,
                user.PasswordHash,
                user.ProviderName,
                user.ProviderSubjectId
            });

            user.id = id;

            return user;
        }

        public Task<ApplicationUser> AutoProvisionUser(string provider, string subjectId, List<Claim> claims)
        {
            throw new NotImplementedException();
        }

        public Task<ApplicationUser> FindByExternalProvider(string provider, string subjectId)
        {
            throw new NotImplementedException();
        }

        public Task<ApplicationUser> FindBySubjectId(string subjectId)
        {
            throw new NotImplementedException();
        }

        public async Task<ApplicationUser> FindByUsername(string username)
        {
            using var connection = new SqlConnection(connectionString);
            
            ApplicationUser user = await connection.QueryFirstOrDefaultAsync<ApplicationUser>(UserStoreQueries.GetUser, new { username });

            return user;
        }

        public Task<bool> SaveUser(ApplicationUser user, string newPasswordToHash = null)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> ValidateCredentials(string username, string password)
        {
            using var connection = new SqlConnection(connectionString);

            ApplicationUser user = await connection.QueryFirstOrDefaultAsync<ApplicationUser>(UserStoreQueries.GetPassword, new { username });

            if (user == null) {
                return false;
            }

            return ApplicationUser.PasswordValidation(user.PasswordHash, user.PasswordSalt, password);
        }
    }
}
