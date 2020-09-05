using AutoMapper.Configuration.Conventions;
using Dapper;
using IdentityServer.Entities;
using IdentityServer4.Models;
using IdentityServer4.Stores;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.EnvironmentVariables;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.Stores
{
    public class CustomClient : Client
    {
        public int Id;
        public DateTime Created;
    }

    public class ClientStore : IClientStore
    {
        private readonly string ConnectionString;

        public ClientStore(IConfiguration configuration)
        {
            ConnectionString = configuration.GetConnectionString("Local");
        }

        public async Task<int> Create(CustomClient client)
        {
            using var connection = new SqlConnection(ConnectionString);

            client.Created = DateTime.UtcNow;

            return await connection.ExecuteScalarAsync<int>($"insert into Clients" +
                $"(AbsoluteRefreshTokenLifetime,AccessTokenLifetime,AccessTokenType,AllowAccessTokensViaBrowser,AllowOfflineAccess,AllowPlainTextPkce,AllowRememberConsent,AlwaysIncludeUserClaimsInIdToken,AlwaysSendClientClaims,AuthorizationCodeLifetime,BackChannelLogoutSessionRequired,BackChannelLogoutUri,ClientClaimsPrefix,ClientId,ClientName,ClientUri,ConsentLifetime,Description,EnableLocalLogin,Enabled,FrontChannelLogoutSessionRequired,FrontChannelLogoutUri,IdentityTokenLifetime,IncludeJwtId,LogoUri,PairWiseSubjectSalt,ProtocolType,RefreshTokenExpiration,RefreshTokenUsage,RequireClientSecret,RequireConsent,RequirePkce,SlidingRefreshTokenLifetime,UpdateAccessTokenClaimsOnRefresh,NonEditable,RequireRequestObject,Created,DeviceCodeLifetime)" +
                $"values" +
                $"(@AbsoluteRefreshTokenLifetime,@AccessTokenLifetime,@AccessTokenType,@AllowAccessTokensViaBrowser,@AllowOfflineAccess,@AllowPlainTextPkce,@AllowRememberConsent,@AlwaysIncludeUserClaimsInIdToken,@AlwaysSendClientClaims,@AuthorizationCodeLifetime,@BackChannelLogoutSessionRequired,@BackChannelLogoutUri,@ClientClaimsPrefix,@ClientId,@ClientName,@ClientUri,@ConsentLifetime,@Description,@EnableLocalLogin,@Enabled,@FrontChannelLogoutSessionRequired,@FrontChannelLogoutUri,@IdentityTokenLifetime,@IncludeJwtId,@LogoUri,@PairWiseSubjectSalt,@ProtocolType,@RefreshTokenExpiration,@RefreshTokenUsage,@RequireClientSecret,@RequireConsent,@RequirePkce,@SlidingRefreshTokenLifetime,@UpdateAccessTokenClaimsOnRefresh,1,@RequireRequestObject,@Created,@DeviceCodeLifetime);" +
                $"select @@IDENTITY;",
            client);
        }

        public async Task<Client> FindClientByIdAsync(string clientId)
        {
            using var connection = new SqlConnection(ConnectionString);

            //var item = new Secret("511536EF-F270-4058-80CA-1C89C192F69A".Sha256());

            //await connection.ExecuteAsync("insert into ClientSecrets (ClientId,Description,Expiration,Type,Value,Created) values (@ClientId,@Description,@Expiration,@Type,@Value,@Created)", new
            //{
            //    ClientId = 10,
            //    item.Description,
            //    Expiration = item.Expiration != null ? item.Expiration.ToString() : DateTime.UtcNow.AddYears(1).ToString(),
            //    item.Type,
            //    item.Value,
            //    Created = DateTime.UtcNow.ToString()
            //});

            CustomClient client = (await connection.QueryAsync<CustomClient>("select * from Clients where ClientId = @FromClientId", new { FromClientId = clientId })).FirstOrDefault();

            if (client != null)
            {
                using var result = await connection.QueryMultipleAsync(@"
                select * from ClientGrantTypes where ClientId = @Id
                select * from ClientScopes where ClientId = @Id
                select * from ClientSecrets where ClientId = @Id
            ", new { client.Id });
                var grants = result.Read<ClientGrantType>() as List<ClientGrantType>;

                client.AllowedGrantTypes = grants.ConvertAll(grant => grant.GrantType);

                var scopes = result.Read<IdentityServer4.EntityFramework.Entities.ClientScope>() as List<IdentityServer4.EntityFramework.Entities.ClientScope>;

                client.AllowedScopes = scopes.ConvertAll(scope => scope.Scope);

                var secrets = result.Read<IdentityServer4.EntityFramework.Entities.ClientSecret>() as List<IdentityServer4.EntityFramework.Entities.ClientSecret>;

                client.ClientSecrets = secrets.ConvertAll(secret => new Secret
                {
                    Value = secret.Value,
                    Description = secret.Description,
                    Expiration = secret.Expiration,
                    Type = secret.Type
                });
            }

            return client;
        }
    }
}
