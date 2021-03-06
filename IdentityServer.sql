USE [master]
GO
/****** Object:  Database [IdentityServer]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE DATABASE [IdentityServer]
 CONTAINMENT = NONE
--  ON  PRIMARY 
-- ( NAME = N'IdentityServer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdentityServer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
--  LOG ON 
-- ( NAME = N'IdentityServer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdentityServer.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IdentityServer] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IdentityServer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IdentityServer] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [IdentityServer] SET ANSI_NULLS ON 
GO
ALTER DATABASE [IdentityServer] SET ANSI_PADDING ON 
GO
ALTER DATABASE [IdentityServer] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [IdentityServer] SET ARITHABORT ON 
GO
ALTER DATABASE [IdentityServer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IdentityServer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IdentityServer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IdentityServer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IdentityServer] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [IdentityServer] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [IdentityServer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IdentityServer] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [IdentityServer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IdentityServer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IdentityServer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IdentityServer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IdentityServer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IdentityServer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IdentityServer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IdentityServer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IdentityServer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IdentityServer] SET RECOVERY FULL 
GO
ALTER DATABASE [IdentityServer] SET  MULTI_USER 
GO
ALTER DATABASE [IdentityServer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IdentityServer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IdentityServer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IdentityServer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IdentityServer] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IdentityServer', N'ON'
GO
ALTER DATABASE [IdentityServer] SET QUERY_STORE = OFF
GO
USE [IdentityServer]
GO
/****** Object:  Table [dbo].[ApiResourceClaims]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceProperties]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [text] NOT NULL,
	[Value] [text] NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResources]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[AllowedAccessTokenSigningAlgorithms] [nvarchar](max) NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [nvarchar](max) NOT NULL,
	[Updated] [nvarchar](max) NULL,
	[LastAccessed] [nvarchar](max) NULL,
	[NonEditable] [int] NOT NULL,
 CONSTRAINT [PK_ApiResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceScopes]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](50) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceSecrets]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [text] NULL,
	[Value] [text] NOT NULL,
	[Expiration] [text] NULL,
	[Type] [text] NOT NULL,
	[Created] [text] NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopeClaims]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_ApiScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopeProperties]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_ApiScopeProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopes]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayName] [text] NULL,
	[Description] [text] NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_ApiScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claim]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Userid] [int] NOT NULL,
	[Issuer] [nvarchar](max) NOT NULL,
	[OriginalIssuer] [nvarchar](max) NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[ValueType] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientClaims]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientCorsOrigins]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCorsOrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Origin] [text] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientGrantTypes]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientGrantTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GrantType] [text] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientGrantTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientIdPRestrictions]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientIdPRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [text] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientPostLogoutRedirectUris]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPostLogoutRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostLogoutRedirectUri] [text] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientProperties]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [text] NOT NULL,
	[Value] [text] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientRedirectUris]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RedirectUri] [text] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [int] NOT NULL,
	[ClientId] [nvarchar](50) NOT NULL,
	[ProtocolType] [text] NOT NULL,
	[RequireClientSecret] [int] NOT NULL,
	[ClientName] [text] NULL,
	[Description] [text] NULL,
	[ClientUri] [text] NULL,
	[LogoUri] [text] NULL,
	[RequireConsent] [int] NOT NULL,
	[AllowRememberConsent] [int] NOT NULL,
	[AlwaysIncludeUserClaimsInIdToken] [int] NOT NULL,
	[RequirePkce] [int] NOT NULL,
	[AllowPlainTextPkce] [int] NOT NULL,
	[RequireRequestObject] [int] NOT NULL,
	[AllowAccessTokensViaBrowser] [int] NOT NULL,
	[FrontChannelLogoutUri] [text] NULL,
	[FrontChannelLogoutSessionRequired] [int] NOT NULL,
	[BackChannelLogoutUri] [text] NULL,
	[BackChannelLogoutSessionRequired] [int] NOT NULL,
	[AllowOfflineAccess] [int] NOT NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[AllowedIdentityTokenSigningAlgorithms] [text] NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[ConsentLifetime] [int] NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [int] NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[EnableLocalLogin] [int] NOT NULL,
	[IncludeJwtId] [int] NOT NULL,
	[AlwaysSendClientClaims] [int] NOT NULL,
	[ClientClaimsPrefix] [text] NULL,
	[PairWiseSubjectSalt] [text] NULL,
	[Created] [text] NOT NULL,
	[Updated] [text] NULL,
	[LastAccessed] [text] NULL,
	[UserSsoLifetime] [int] NULL,
	[UserCodeType] [text] NULL,
	[DeviceCodeLifetime] [int] NOT NULL,
	[NonEditable] [int] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientScopes]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [text] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientSecrets]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [text] NULL,
	[Value] [text] NOT NULL,
	[Expiration] [text] NULL,
	[Type] [text] NOT NULL,
	[Created] [text] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grant]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](200) NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[SubjectId] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResourceClaims]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_IdentityResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResourceProperties]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_IdentityResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResources]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [nvarchar](max) NOT NULL,
	[Updated] [nvarchar](max) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_IdentityResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[PasswordSalt] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[ProviderName] [nvarchar](max) NOT NULL,
	[ProviderSubjectId] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ApiResourceClaims] ON 

INSERT [dbo].[ApiResourceClaims] ([Id], [Type], [ApiResourceId]) VALUES (1, N'name', 1)
INSERT [dbo].[ApiResourceClaims] ([Id], [Type], [ApiResourceId]) VALUES (2, N'email', 3)
INSERT [dbo].[ApiResourceClaims] ([Id], [Type], [ApiResourceId]) VALUES (3, N'name', 3)
SET IDENTITY_INSERT [dbo].[ApiResourceClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiResourceProperties] ON 

INSERT [dbo].[ApiResourceProperties] ([Id], [Key], [Value], [ApiResourceId]) VALUES (1, N'Prop1', N'Val1', 1)
INSERT [dbo].[ApiResourceProperties] ([Id], [Key], [Value], [ApiResourceId]) VALUES (2, N'Prop2', N'Val2', 1)
INSERT [dbo].[ApiResourceProperties] ([Id], [Key], [Value], [ApiResourceId]) VALUES (3, N'Prop3', N'Val3', 3)
SET IDENTITY_INSERT [dbo].[ApiResourceProperties] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiResources] ON 

INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (1, 1, N'Api1', N'Api 1', N'Test entry for Api 1', N'RS256', 1, N'2020-08-30 12:42:31.9587248', NULL, NULL, 1)
INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (3, 1, N'Api2', N'Api 2', N'Test entry for Api 2', N'RS256', 1, N'2020-08-30 12:42:31.9587248', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ApiResources] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiResourceScopes] ON 

INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (1, N'Test', 1)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (2, N'Testy', 1)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (3, N'MoreTest', 3)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (5, N'Fake', 1)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (6, N'NotFake', 3)
INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (7, N'scope1', 1)
SET IDENTITY_INSERT [dbo].[ApiResourceScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiResourceSecrets] ON 

INSERT [dbo].[ApiResourceSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ApiResourceId]) VALUES (1, NULL, N'SECRET', NULL, N'SharedSecret', N'2020-08-30 12:42:31.9587278', 1)
INSERT [dbo].[ApiResourceSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ApiResourceId]) VALUES (2, NULL, N'SECRET2', NULL, N'SharedSecret', N'2020-08-30 12:42:31.9587278', 3)
INSERT [dbo].[ApiResourceSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ApiResourceId]) VALUES (6, NULL, N'SECRET3', NULL, N'SharedSecret', N'2020-08-30 12:42:31.9587278', 1)
INSERT [dbo].[ApiResourceSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ApiResourceId]) VALUES (7, NULL, N'SECRET4', NULL, N'SharedSecret', N'2020-08-30 12:42:31.9587278', 3)
SET IDENTITY_INSERT [dbo].[ApiResourceSecrets] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiScopeClaims] ON 

INSERT [dbo].[ApiScopeClaims] ([Id], [Type], [ScopeId]) VALUES (1, N'WTF', 1)
INSERT [dbo].[ApiScopeClaims] ([Id], [Type], [ScopeId]) VALUES (2, N'TEST', 1)
INSERT [dbo].[ApiScopeClaims] ([Id], [Type], [ScopeId]) VALUES (3, N'WHY', 2)
INSERT [dbo].[ApiScopeClaims] ([Id], [Type], [ScopeId]) VALUES (4, N'WUT', 2)
INSERT [dbo].[ApiScopeClaims] ([Id], [Type], [ScopeId]) VALUES (5, N'NO', 2)
SET IDENTITY_INSERT [dbo].[ApiScopeClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiScopeProperties] ON 

INSERT [dbo].[ApiScopeProperties] ([Id], [Key], [Value], [ScopeId]) VALUES (1, N'Prop1', N'Val1', 2)
INSERT [dbo].[ApiScopeProperties] ([Id], [Key], [Value], [ScopeId]) VALUES (2, N'Prop2', N'Val2', 2)
SET IDENTITY_INSERT [dbo].[ApiScopeProperties] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiScopes] ON 

INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (1, 1, N'scope2', N'scope2', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (2, 1, N'scope1', N'scope1', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (1001, 1, N'scope3', N'scope3', NULL, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[ApiScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] ON 

INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (1, N'client_credentials', 10)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (2, N'authorization_code', 2)
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] ON 

INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [PostLogoutRedirectUri], [ClientId]) VALUES (1, N'https://localhost:44300/signout-callback-oidc', 2)
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] ON 

INSERT [dbo].[ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (1, N'https://localhost:44300/signin-oidc', 2)
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (2, 1, N'interactive', N'oidc', 1, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, N'https://localhost:44300/signout-oidc', 1, NULL, 1, 1, 300, NULL, 3600, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 1, 0, N'client_', NULL, N'2020-08-30 12:42:31.9587248', NULL, NULL, NULL, NULL, 300, 0)
INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (10, 1, N'm2m.client', N'oidc', 1, N'Client Credentials Client', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, NULL, 1, NULL, 1, 0, 300, NULL, 3600, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 1, 0, N'client_', NULL, N'2020-08-30 12:42:31.9587248', NULL, NULL, NULL, NULL, 300, 1)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientScopes] ON 

INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1, N'scope1', 10)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2, N'openid', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (3, N'profile', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (4, N'scope2', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2002, N'openid', 10)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2003, N'scope2', 10)
SET IDENTITY_INSERT [dbo].[ClientScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientSecrets] ON 

INSERT [dbo].[ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (2, NULL, N'o90IbCACXKUkunXoa18cODcLKnQTbjOo5ihEw9j58+8=', NULL, N'SharedSecret', N'2020-08-30 12:42:31.9587278', 2)
INSERT [dbo].[ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (3, NULL, N'fU7fRb+g6YdlniuSqviOLWNkda1M/MuPtH6zNI9inF8=', N'8/30/2021 3:54:38 PM', N'SharedSecret', N'8/30/2020 3:54:38 PM', 10)
SET IDENTITY_INSERT [dbo].[ClientSecrets] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentityResourceClaims] ON 

INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (1, N'website', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (2, N'picture', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (3, N'profile', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (4, N'preferred_username', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (5, N'nickname', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (6, N'middle_name', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (7, N'given_name', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (8, N'family_name', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (9, N'name', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (10, N'gender', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (11, N'birthdate', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (12, N'zoneinfo', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (13, N'locale', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (14, N'updated_at', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (15, N'sub', 2)
SET IDENTITY_INSERT [dbo].[IdentityResourceClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentityResources] ON 

INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (1, 1, N'profile', N'User profile', N'Your user profile information (first name, last name, etc.)', 0, 1, 1, N'2020-08-30 12:42:32.0982662', NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (2, 1, N'openid', N'Your user identifier', NULL, 1, 0, 1, N'2020-08-30 12:42:32.0813018', NULL, 0)
SET IDENTITY_INSERT [dbo].[IdentityResources] OFF
GO
/****** Object:  Index [IX_ApiResourceClaims_ApiResourceId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceClaims_ApiResourceId] ON [dbo].[ApiResourceClaims]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiResourceProperties_ApiResourceId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceProperties_ApiResourceId] ON [dbo].[ApiResourceProperties]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApiResources_Name]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiResources_Name] ON [dbo].[ApiResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiResourceScopes_ApiResourceId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceScopes_ApiResourceId] ON [dbo].[ApiResourceScopes]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiResourceSecrets_ApiResourceId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceSecrets_ApiResourceId] ON [dbo].[ApiResourceSecrets]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiScopeClaims_ScopeId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ApiScopeClaims_ScopeId] ON [dbo].[ApiScopeClaims]
(
	[ScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiScopeProperties_ScopeId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ApiScopeProperties_ScopeId] ON [dbo].[ApiScopeProperties]
(
	[ScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApiScopes_Name]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiScopes_Name] ON [dbo].[ApiScopes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientClaims_ClientId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClientClaims_ClientId] ON [dbo].[ClientClaims]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientCorsOrigins_ClientId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClientCorsOrigins_ClientId] ON [dbo].[ClientCorsOrigins]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientGrantTypes_ClientId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClientGrantTypes_ClientId] ON [dbo].[ClientGrantTypes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientIdPRestrictions_ClientId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClientIdPRestrictions_ClientId] ON [dbo].[ClientIdPRestrictions]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientPostLogoutRedirectUris_ClientId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClientPostLogoutRedirectUris_ClientId] ON [dbo].[ClientPostLogoutRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientProperties_ClientId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClientProperties_ClientId] ON [dbo].[ClientProperties]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientRedirectUris_ClientId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClientRedirectUris_ClientId] ON [dbo].[ClientRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Clients_ClientId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Clients_ClientId] ON [dbo].[Clients]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientScopes_ClientId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClientScopes_ClientId] ON [dbo].[ClientScopes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientSecrets_ClientId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClientSecrets_ClientId] ON [dbo].[ClientSecrets]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdentityResourceClaims_IdentityResourceId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_IdentityResourceClaims_IdentityResourceId] ON [dbo].[IdentityResourceClaims]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdentityResourceProperties_IdentityResourceId]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE NONCLUSTERED INDEX [IX_IdentityResourceProperties_IdentityResourceId] ON [dbo].[IdentityResourceProperties]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_IdentityResources_Name]    Script Date: 9/5/2020 9:43:58 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IdentityResources_Name] ON [dbo].[IdentityResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Claim] ADD  DEFAULT ('') FOR [Issuer]
GO
ALTER TABLE [dbo].[Claim] ADD  DEFAULT ('') FOR [OriginalIssuer]
GO
ALTER TABLE [dbo].[Claim] ADD  DEFAULT ('') FOR [Subject]
GO
ALTER TABLE [dbo].[Claim] ADD  DEFAULT ('') FOR [Type]
GO
ALTER TABLE [dbo].[Claim] ADD  DEFAULT ('') FOR [Value]
GO
ALTER TABLE [dbo].[Claim] ADD  DEFAULT ('') FOR [ValueType]
GO
ALTER TABLE [dbo].[ApiResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceClaims] CHECK CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceProperties] CHECK CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceScopes]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceScopes] CHECK CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceSecrets] CHECK CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeClaims] CHECK CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ApiScopeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeProperties] CHECK CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_ClientClaims_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientClaims] CHECK CONSTRAINT [FK_ClientClaims_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientCorsOrigins] CHECK CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientGrantTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientGrantTypes] CHECK CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientIdPRestrictions] CHECK CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClientProperties_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientProperties] CHECK CONSTRAINT [FK_ClientProperties_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientRedirectUris] CHECK CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientScopes]  WITH CHECK ADD  CONSTRAINT [FK_ClientScopes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientScopes] CHECK CONSTRAINT [FK_ClientScopes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ClientSecrets_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientSecrets] CHECK CONSTRAINT [FK_ClientSecrets_Clients_ClientId]
GO
ALTER TABLE [dbo].[IdentityResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityResourceClaims] CHECK CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[IdentityResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityResourceProperties] CHECK CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId]
GO
/****** Object:  StoredProcedure [dbo].[FindApiResourcesByName]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[FindApiResourcesByName] @names NVARCHAR(MAX) AS
BEGIN

CREATE TABLE #ApiNames (Name NVARCHAR(50));
INSERT INTO #ApiNames (Name)
	SELECT value FROM string_split(@names, ',');

SELECT
[Id],
[Enabled],
MAX([Name]) as [Name],
MAX([DisplayName]) as [DisplayName],
MAX([Description]) as [Description],
[ShowInDiscoveryDocument],
[AllowedAccessTokenSigningAlgorithms],
[Scopes],
[UserClaims],
[Secrets]
 FROM (
	SELECT
	Id,
	[Enabled],
	[Name],
	[DisplayName],
	[Description],
	[ShowInDiscoveryDocument],
	(SELECT
		JSON_QUERY(concat('[' , STRING_AGG(concat('"' , STRING_ESCAPE(value, 'json') , '"'),',') , ']'))
		from string_split([AllowedAccessTokenSigningAlgorithms], ','))
	as [AllowedAccessTokenSigningAlgorithms],
	(SELECT
		JSON_QUERY(concat('[' , STRING_AGG(concat('"' , STRING_ESCAPE([Scope], 'json') , '"'),',') , ']'))
		FROM ApiResourceScopes b
		WHERE a.Id = b.ApiResourceId)
	as [Scopes],
	(SELECT 
		JSON_QUERY(concat('[' , STRING_AGG(concat('"' , STRING_ESCAPE([Type], 'json') , '"'),',') , ']'))
		FROM ApiResourceClaims c
		WHERE a.Id = c.ApiResourceId
	) as [UserClaims],
	JSON_QUERY((
		SELECT *
		FROM ApiResourceSecrets d
		WHERE a.Id = d.ApiResourceId
		FOR JSON AUTO
	)) as [Secrets]
	FROM [dbo].ApiResources a
) AS Result
WHERE Result.Name IN (SELECT [Name] FROM #ApiNames)
group by [id], [Enabled], [Scopes], [UserClaims], [Secrets], [ShowInDiscoveryDocument], [AllowedAccessTokenSigningAlgorithms]
FOR JSON PATH;

END
GO
/****** Object:  StoredProcedure [dbo].[FindApiResourcesByScopeName]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[FindApiResourcesByScopeName] @scopeNames NVARCHAR(MAX) AS
BEGIN

CREATE TABLE #Scopes (Scope NVARCHAR(50));
INSERT INTO #Scopes (Scope)
	SELECT value FROM string_split(@scopeNames, ',');

SELECT
[Id],
[Enabled],
MAX([Name]) as [Name],
MAX([DisplayName]) as [DisplayName],
MAX([Description]) as [Description],
[ShowInDiscoveryDocument],
[AllowedAccessTokenSigningAlgorithms],
[Scopes],
[UserClaims],
[Secrets] as [ApiSecrets]
 FROM (
	SELECT
	Id,
	[Enabled],
	[Name],
	[DisplayName],
	[Description],
	[ShowInDiscoveryDocument],
	(SELECT
		JSON_QUERY(concat('[' , STRING_AGG(concat('"' , STRING_ESCAPE(value, 'json') , '"'),',') , ']'))
		from string_split([AllowedAccessTokenSigningAlgorithms], ','))
	as [AllowedAccessTokenSigningAlgorithms],
	(SELECT
		JSON_QUERY(concat('[' , STRING_AGG(concat('"' , STRING_ESCAPE([Scope], 'json') , '"'),',') , ']'))
		FROM ApiResourceScopes b
		WHERE a.Id = b.ApiResourceId)
	as [Scopes],
	(SELECT 
		JSON_QUERY(concat('[' , STRING_AGG(concat('"' , STRING_ESCAPE([Type], 'json') , '"'),',') , ']'))
		FROM ApiResourceClaims c
		WHERE a.Id = c.ApiResourceId
	) as [UserClaims],
	JSON_QUERY((
		SELECT *
		FROM ApiResourceSecrets d
		WHERE a.Id = d.ApiResourceId
		FOR JSON AUTO
	)) as [Secrets]
	FROM [dbo].ApiResources a
) AS Result
CROSS APPLY OPENJSON([Result].[Scopes],'$') as [Filter]
WHERE [Filter].[value] IN (SELECT Scope FROM #Scopes)
group by [id], [Enabled], [Scopes], [UserClaims], [Secrets], [ShowInDiscoveryDocument], [AllowedAccessTokenSigningAlgorithms]
FOR JSON PATH;

END
GO
/****** Object:  StoredProcedure [dbo].[FindIdentityResourcesByScopeName]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[FindIdentityResourcesByScopeName] @scopeNames NVARCHAR(MAX) AS
BEGIN

CREATE TABLE #Scopes (Scope NVARCHAR(50));
INSERT INTO #Scopes (Scope)
	SELECT value FROM string_split(@scopeNames, ',');

SELECT
[Id]
,[Enabled]
,MAX([Name]) as [Name]
,MAX([DisplayName]) as [DisplayName]
,MAX([Description]) as [Description]
,[ShowInDiscoveryDocument]
,[Required]
,[Emphasize]
,[UserClaims]
 FROM (
	SELECT
	Id,
	[Enabled],
	[Name],
	[DisplayName],
	[Description],
	[ShowInDiscoveryDocument]
	,[Required]
	,[Emphasize]
	,(SELECT 
		JSON_QUERY(concat('[' , STRING_AGG(concat('"' , STRING_ESCAPE([Type], 'json') , '"'),',') , ']'))
		FROM IdentityResourceClaims b
		WHERE a.Id = b.IdentityResourceId
	) as [UserClaims]
	FROM [dbo].[IdentityResources] a
) AS Result
WHERE [Name] in (SELECT Scope FROM #Scopes)
group by [id], [Enabled], [Required], [Emphasize], [UserClaims],  [ShowInDiscoveryDocument]
FOR JSON PATH;

END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllApiResources]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetAllApiResources] AS
BEGIN

SELECT
	Id,
	[Enabled],
	[Name],
	[DisplayName],
	[Description],
	[ShowInDiscoveryDocument],
	(SELECT
		JSON_QUERY(concat('[' , STRING_AGG(concat('"' , STRING_ESCAPE(value, 'json') , '"'),',') , ']'))
		from string_split([AllowedAccessTokenSigningAlgorithms], ','))
	as [AllowedAccessTokenSigningAlgorithms],
	(SELECT
		JSON_QUERY(concat('[' , STRING_AGG(concat('"' , STRING_ESCAPE([Scope], 'json') , '"'),',') , ']'))
		FROM ApiResourceScopes b
		WHERE a.Id = b.ApiResourceId)
	as [Scopes],
	(SELECT 
		JSON_QUERY(concat('[' , STRING_AGG(concat('"' , STRING_ESCAPE([Type], 'json') , '"'),',') , ']'))
		FROM ApiResourceClaims c
		WHERE a.Id = c.ApiResourceId
	) as [UserClaims],
	JSON_QUERY((
		SELECT *
		FROM ApiResourceSecrets d
		WHERE a.Id = d.ApiResourceId
		FOR JSON AUTO
	)) as [ApiSecrets]
FROM [dbo].ApiResources a
FOR JSON PATH;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllApiScopes]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetAllApiScopes] AS
BEGIN

SELECT
    [Id],
    [Enabled],                
    [Name],                   
    [DisplayName],            
    [Description],            
    [Required],               
    [Emphasize],              
    [ShowInDiscoveryDocument]
    ,(SELECT 
	    JSON_QUERY(concat('[' , STRING_AGG(concat('"' , STRING_ESCAPE([Type], 'json') , '"'),',') , ']'))
        FROM ApiScopeClaims c
        WHERE a.Id = c.ScopeId
		
    ) as [UserClaims]
    ,JSON_QUERY((
	    SELECT
		    '{' + STRING_AGG( '"' + [Key] + '":"' + STRING_ESCAPE([Value],'json') + '"' ,',') + '}'
        FROM ApiScopeProperties c
        WHERE a.Id = c.ScopeId
    )) as [Properties]
FROM ApiScopes a

FOR JSON PATH;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllIdentityResources]    Script Date: 9/5/2020 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetAllIdentityResources] AS
BEGIN

SELECT
[Id]
,[Enabled]
,[Name]
,[DisplayName]
,[Description]
,[ShowInDiscoveryDocument]
,[Required]
,[Emphasize]
,(SELECT 
	JSON_QUERY(concat('[' , STRING_AGG(concat('"' , STRING_ESCAPE([Type], 'json') , '"'),',') , ']'))
	FROM IdentityResourceClaims b
	WHERE a.Id = b.IdentityResourceId
) as [UserClaims]
FROM [dbo].[IdentityResources] a
FOR JSON PATH;

END;
GO
USE [master]
GO
ALTER DATABASE [IdentityServer] SET  READ_WRITE 
GO
