SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
PRINT N'Creating [dbo].[lk_program]'
GO
CREATE TABLE [dbo].[lk_program]
(
[program_id] [int] NOT NULL IDENTITY(1, 1),
[program_name] [varchar] (350) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_id] [int] NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[lk_designation]'
GO
CREATE TABLE [dbo].[lk_designation]
(
[Designation_ID] [int] NOT NULL IDENTITY(1, 1),
[Designation_name] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Designation_code] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Designation_open_date] [datetime] NULL,
[Designation_short_name] [varchar] (31) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[template_id] [int] NULL,
[rm_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mailformat] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[incl_label] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[lk_app_type]'
GO
CREATE TABLE [dbo].[lk_app_type]
(
[app_type_id] [int] NOT NULL IDENTITY(1, 1),
[app_type] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[DesignationAttribute]'
GO
CREATE TABLE [dbo].[DesignationAttribute]
(
[desig_attribute_id] [int] NOT NULL IDENTITY(1, 1),
[desig_concentration_id] [int] NULL,
[term_id] [int] NULL,
[app_type_id] [int] NULL,
[hard_deadline] [int] NULL,
[soft_deadline] [int] NULL,
[sophas_department_id] [int] NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[lk_area_of_interest]'
GO
CREATE TABLE [dbo].[lk_area_of_interest]
(
[aoi_id] [int] NOT NULL IDENTITY(1, 1),
[aoi_name] [varchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[aoi_order] [int] NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [IX_lk_area_of_interest] on [dbo].[lk_area_of_interest]'
GO
CREATE NONCLUSTERED INDEX [IX_lk_area_of_interest] ON [dbo].[lk_area_of_interest] ([aoi_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[lk_concentration]'
GO
CREATE TABLE [dbo].[lk_concentration]
(
[concentration_id] [int] NOT NULL IDENTITY(1, 1),
[concentration] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_id] [int] NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[DesignationComposite]'
GO
CREATE TABLE [dbo].[DesignationComposite]
(
[composite_id] [int] NOT NULL IDENTITY(1, 1),
[school_id] [int] NULL,
[degree_id] [int] NULL,
[program_id] [int] NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[lk_degree]'
GO
CREATE TABLE [dbo].[lk_degree]
(
[degree_id] [int] NOT NULL IDENTITY(1, 1),
[degree] [varchar] (350) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[degree_name] [varchar] (350) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_id] [int] NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[lk_deadline]'
GO
CREATE TABLE [dbo].[lk_deadline]
(
[dead_line_id] [int] NOT NULL IDENTITY(1, 1),
[dead_line] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_id] [int] NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[lk_option]'
GO
CREATE TABLE [dbo].[lk_option]
(
[option_id] [int] NOT NULL IDENTITY(1, 1),
[option_name] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_id] [int] NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_lk_option] on [dbo].[lk_option]'
GO
ALTER TABLE [dbo].[lk_option] ADD CONSTRAINT [PK_lk_option] PRIMARY KEY CLUSTERED  ([option_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[DesignationConcentration]'
GO
CREATE TABLE [dbo].[DesignationConcentration]
(
[desig_concentration_id] [int] NOT NULL IDENTITY(1, 1),
[composite_id] [int] NULL,
[concentration_id] [int] NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[lk_enrollment]'
GO
CREATE TABLE [dbo].[lk_enrollment]
(
[term_id] [int] NOT NULL IDENTITY(1, 1),
[enrollment] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_id] [int] NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[DesignationAreaOfInterest]'
GO
CREATE TABLE [dbo].[DesignationAreaOfInterest]
(
[designation_aoi_id] [int] NOT NULL IDENTITY(1, 1),
[designation_concentration_id] [int] NOT NULL,
[aoi_id] [int] NOT NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_DesignationAreaOfInterest] on [dbo].[DesignationAreaOfInterest]'
GO
ALTER TABLE [dbo].[DesignationAreaOfInterest] ADD CONSTRAINT [PK_DesignationAreaOfInterest] PRIMARY KEY CLUSTERED  ([designation_aoi_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[DesignationOption]'
GO
CREATE TABLE [dbo].[DesignationOption]
(
[designation_option_id] [int] NOT NULL IDENTITY(1, 1),
[designation_concentration_id] [int] NOT NULL,
[option_id] [int] NOT NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_DesignationOption] on [dbo].[DesignationOption]'
GO
ALTER TABLE [dbo].[DesignationOption] ADD CONSTRAINT [PK_DesignationOption] PRIMARY KEY CLUSTERED  ([designation_option_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[DesignationLookup]'
GO
CREATE TABLE [dbo].[DesignationLookup]
(
[designation_lookup_id] [int] NOT NULL IDENTITY(1, 1),
[program_id] [int] NULL,
[school_code] [int] NULL,
[program_type] [int] NULL,
[program_group] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[school_state] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[school_name] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[name] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[deadline] [datetime] NULL,
[passdline] [datetime] NULL,
[assembly] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[institute] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address1] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address2] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address3] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[extension] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fax] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[outputmdb] [bit] NULL,
[username] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[password] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[school_abbr] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[filetype] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[includerace] [bit] NULL,
[concentration_id] [int] NULL,
[degree_id] [int] NOT NULL,
[deadline_group] [int] NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[DesignationBusinessRules]'
GO
CREATE TABLE [dbo].[DesignationBusinessRules]
(
[rule_id] [int] NOT NULL IDENTITY(1, 1),
[school_id] [int] NOT NULL,
[multiple_degree] [int] NOT NULL,
[multiple_program] [int] NOT NULL,
[multiple_concentration] [int] NOT NULL,
[allow_ranking] [int] NOT NULL,
[min_selection] [int] NOT NULL CONSTRAINT [DF_DesignationBusinessRules_min_seelctions] DEFAULT ((1))
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_sophas_designation_rule] on [dbo].[DesignationBusinessRules]'
GO
ALTER TABLE [dbo].[DesignationBusinessRules] ADD CONSTRAINT [PK_sophas_designation_rule] PRIMARY KEY CLUSTERED  ([rule_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding constraints to [dbo].[DesignationOption]'
GO
ALTER TABLE [dbo].[DesignationOption] ADD CONSTRAINT [IX_DesignationOption] UNIQUE NONCLUSTERED  ([designation_concentration_id], [option_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[DesignationOption]'
GO
ALTER TABLE [dbo].[DesignationOption] ADD
CONSTRAINT [FK_DesignationOption_lk_option] FOREIGN KEY ([option_id]) REFERENCES [dbo].[lk_option] ([option_id]) ON DELETE CASCADE
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating extended properties'
GO
sp_addextendedproperty N'MS_Description', N'Yale has a rule that all applicants need to pick at least 2 entries.', 'SCHEMA', N'dbo', 'TABLE', N'DesignationBusinessRules', 'COLUMN', N'min_selection'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO
