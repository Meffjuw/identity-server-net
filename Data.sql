-- Script Date: 8/30/2020 7:22 PM  - ErikEJ.SqlCeScripting version 3.5.2.86
-- Database information:
-- Database: C:\Users\Matt\source\repos\IdentityServer\IdentityServer\IdentityServer.db
-- ServerVersion: 3.30.1
-- DatabaseSize: 240 KB
-- Created: 8/30/2020 2:42 PM

-- User Table information:
-- Number of tables: 24
-- __EFMigrationsHistory: -1 row(s)
-- ApiResourceClaims: -1 row(s)
-- ApiResourceProperties: -1 row(s)
-- ApiResources: -1 row(s)
-- ApiResourceScopes: -1 row(s)
-- ApiResourceSecrets: -1 row(s)
-- ApiScopeClaims: -1 row(s)
-- ApiScopeProperties: -1 row(s)
-- ApiScopes: -1 row(s)
-- ClientClaims: -1 row(s)
-- ClientCorsOrigins: -1 row(s)
-- ClientGrantTypes: -1 row(s)
-- ClientIdPRestrictions: -1 row(s)
-- ClientPostLogoutRedirectUris: -1 row(s)
-- ClientProperties: -1 row(s)
-- ClientRedirectUris: -1 row(s)
-- Clients: -1 row(s)
-- ClientScopes: -1 row(s)
-- ClientSecrets: -1 row(s)
-- DeviceCodes: -1 row(s)
-- IdentityResourceClaims: -1 row(s)
-- IdentityResourceProperties: -1 row(s)
-- IdentityResources: -1 row(s)
-- PersistedGrants: -1 row(s)

SELECT 1;

BEGIN TRANSACTION;

SET IDENTITY_INSERT [IdentityResources] ON;
INSERT INTO [IdentityResources] ([Id],[Enabled],[Name],[DisplayName],[Description],[Required],[Emphasize],[ShowInDiscoveryDocument],[Created],[Updated],[NonEditable]) VALUES (
1,1,'profile','User profile','Your user profile information (first name, last name, etc.)',0,1,1,'2020-08-30 12:42:32.0982662',NULL,0);
INSERT INTO [IdentityResources] ([Id],[Enabled],[Name],[DisplayName],[Description],[Required],[Emphasize],[ShowInDiscoveryDocument],[Created],[Updated],[NonEditable]) VALUES (
2,1,'openid','Your user identifier',NULL,1,0,1,'2020-08-30 12:42:32.0813018',NULL,0);
SET IDENTITY_INSERT [IdentityResources] OFF;

SET IDENTITY_INSERT [IdentityResourceClaims] ON;
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
1,'website',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
2,'picture',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
3,'profile',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
4,'preferred_username',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
5,'nickname',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
6,'middle_name',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
7,'given_name',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
8,'family_name',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
9,'name',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
10,'gender',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
11,'birthdate',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
12,'zoneinfo',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
13,'locale',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
14,'updated_at',1);
INSERT INTO [IdentityResourceClaims] ([Id],[Type],[IdentityResourceId]) VALUES (
15,'sub',2);
SET IDENTITY_INSERT [IdentityResourceClaims] OFF;

SET IDENTITY_INSERT [Clients] ON;
--INSERT INTO [Clients] ([Id],[Enabled],[ClientId],[ProtocolType],[RequireClientSecret],[ClientName],[Description],[ClientUri],[LogoUri],[RequireConsent],[AllowRememberConsent],[AlwaysIncludeUserClaimsInIdToken],[RequirePkce],[AllowPlainTextPkce],[RequireRequestObject],[AllowAccessTokensViaBrowser],[FrontChannelLogoutUri],[FrontChannelLogoutSessionRequired],[BackChannelLogoutUri],[BackChannelLogoutSessionRequired],[AllowOfflineAccess],[IdentityTokenLifetime],[AllowedIdentityTokenSigningAlgorithms],[AccessTokenLifetime],[AuthorizationCodeLifetime],[ConsentLifetime],[AbsoluteRefreshTokenLifetime],[SlidingRefreshTokenLifetime],[RefreshTokenUsage],[UpdateAccessTokenClaimsOnRefresh],[RefreshTokenExpiration],[AccessTokenType],[EnableLocalLogin],[IncludeJwtId],[AlwaysSendClientClaims],[ClientClaimsPrefix],[PairWiseSubjectSalt],[Created],[Updated],[LastAccessed],[UserSsoLifetime],[UserCodeType],[DeviceCodeLifetime],[NonEditable]) VALUES (
--1,1,'m2m.client','oidc',1,'Client Credentials Client',NULL,NULL,NULL,0,1,0,1,0,0,0,NULL,1,NULL,1,0,300,NULL,3600,300,NULL,2592000,1296000,1,0,1,0,1,1,0,'client_',NULL,'2020-08-30 12:42:31.8623497',NULL,NULL,NULL,NULL,300,0);
INSERT INTO [Clients] ([Id],[Enabled],[ClientId],[ProtocolType],[RequireClientSecret],[ClientName],[Description],[ClientUri],[LogoUri],[RequireConsent],[AllowRememberConsent],[AlwaysIncludeUserClaimsInIdToken],[RequirePkce],[AllowPlainTextPkce],[RequireRequestObject],[AllowAccessTokensViaBrowser],[FrontChannelLogoutUri],[FrontChannelLogoutSessionRequired],[BackChannelLogoutUri],[BackChannelLogoutSessionRequired],[AllowOfflineAccess],[IdentityTokenLifetime],[AllowedIdentityTokenSigningAlgorithms],[AccessTokenLifetime],[AuthorizationCodeLifetime],[ConsentLifetime],[AbsoluteRefreshTokenLifetime],[SlidingRefreshTokenLifetime],[RefreshTokenUsage],[UpdateAccessTokenClaimsOnRefresh],[RefreshTokenExpiration],[AccessTokenType],[EnableLocalLogin],[IncludeJwtId],[AlwaysSendClientClaims],[ClientClaimsPrefix],[PairWiseSubjectSalt],[Created],[Updated],[LastAccessed],[UserSsoLifetime],[UserCodeType],[DeviceCodeLifetime],[NonEditable]) VALUES (
2,1,'interactive','oidc',1,NULL,NULL,NULL,NULL,0,1,0,1,0,0,0,'https://localhost:44300/signout-oidc',1,NULL,1,1,300,NULL,3600,300,NULL,2592000,1296000,1,0,1,0,1,1,0,'client_',NULL,'2020-08-30 12:42:31.9587248',NULL,NULL,NULL,NULL,300,0);
SET IDENTITY_INSERT [Clients] OFF;

SET IDENTITY_INSERT [ClientSecrets] ON;
INSERT INTO [ClientSecrets] ([Id],[Description],[Value],[Expiration],[Type],[Created],[ClientId]) VALUES (
1,NULL,'fU7fRb+g6YdlniuSqviOLWNkda1M/MuPtH6zNI9inF8=',NULL,'SharedSecret','2020-08-30 12:42:31.8626063',1);
INSERT INTO [ClientSecrets] ([Id],[Description],[Value],[Expiration],[Type],[Created],[ClientId]) VALUES (
2,NULL,'o90IbCACXKUkunXoa18cODcLKnQTbjOo5ihEw9j58+8=',NULL,'SharedSecret','2020-08-30 12:42:31.9587278',2);
SET IDENTITY_INSERT [ClientSecrets] OFF;

SET IDENTITY_INSERT [ClientScopes] ON;
INSERT INTO [ClientScopes] ([Id],[Scope],[ClientId]) VALUES (
1,'scope1',1);
INSERT INTO [ClientScopes] ([Id],[Scope],[ClientId]) VALUES (
2,'openid',2);
INSERT INTO [ClientScopes] ([Id],[Scope],[ClientId]) VALUES (
3,'profile',2);
INSERT INTO [ClientScopes] ([Id],[Scope],[ClientId]) VALUES (
4,'scope2',2);
SET IDENTITY_INSERT [ClientScopes] OFF;

SET IDENTITY_INSERT [ClientRedirectUris] ON;
INSERT INTO [ClientRedirectUris] ([Id],[RedirectUri],[ClientId]) VALUES (
1,'https://localhost:44300/signin-oidc',2);
SET IDENTITY_INSERT [ClientRedirectUris] OFF;

SET IDENTITY_INSERT [ClientPostLogoutRedirectUris] ON;
INSERT INTO [ClientPostLogoutRedirectUris] ([Id],[PostLogoutRedirectUri],[ClientId]) VALUES (
1,'https://localhost:44300/signout-callback-oidc',2);
SET IDENTITY_INSERT [ClientPostLogoutRedirectUris] OFF;

SET IDENTITY_INSERT [ClientGrantTypes] ON;
INSERT INTO [ClientGrantTypes] ([Id],[GrantType],[ClientId]) VALUES (
1,'client_credentials',1);
INSERT INTO [ClientGrantTypes] ([Id],[GrantType],[ClientId]) VALUES (
2,'authorization_code',2);
SET IDENTITY_INSERT [ClientGrantTypes] OFF;

SET IDENTITY_INSERT [ApiScopes] ON;
INSERT INTO [ApiScopes] ([Id],[Enabled],[Name],[DisplayName],[Description],[Required],[Emphasize],[ShowInDiscoveryDocument]) VALUES (
1,1,'scope2','scope2',NULL,0,0,1);
INSERT INTO [ApiScopes] ([Id],[Enabled],[Name],[DisplayName],[Description],[Required],[Emphasize],[ShowInDiscoveryDocument]) VALUES (
2,1,'scope1','scope1',NULL,0,0,1);
SET IDENTITY_INSERT [ApiScopes] OFF;

COMMIT;

