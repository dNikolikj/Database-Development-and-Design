USE [SEDCACADEMYDB]


CREATE TABLE [Student] (
[Id][int] IDENTITY(1,1) NOT NULL,
[FirstName] [nvarchar](100) NOT NULL,
[LastName] [nvarchar] (100) NOT NULL,
[DateOfBirth] [date] NULL,
[EnrolledDate] [date] NULL,
[Gender] [nchar] (1) NOT NULL,
[NationalIdNumber] [nvarchar] (20) NOT NULL,
[StudentCardNumber] [nvarchar] (20) NOT NULL,
CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED([Id] ASC)
)

INSERT INTO [Student]([FirstName], [LastName], [DateOfBirth], [EnrolledDate], [Gender], [NationalIdNumber],[StudentCardNumber]) 
VALUES ('Darko', 'Nikolikj', '1995-14-07', '2021-11-11', 'M', '777', '1407995450221')

SELECT * FROM [Student]

CREATE TABLE [Teacher] (
[Id][int] IDENTITY(1,1) NOT NULL,
[FirstName] [nvarchar](100) NOT NULL,
[LastName] [nvarchar] (100) NOT NULL,
[DateOfBirth] [date] NULL,
[AcademyRank] [nvarchar] (20) NULL,
[HireDate] [date]  NOT NULL,

CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED([Id] ASC)
)
CREATE TABLE [Grade] (
[Id][int] IDENTITY(1,1) NOT NULL,
[StudentId] [int] NOT NULL,
[CourselId] [int]  NOT NULL,
[TeacherId] [int] NOT NULL,
[Grade] [nchar] (1) NOT NULL,
[Comment] [nvarchar] (100) NOT NULL,
[CreateDate] [nvarchar] (20) NOT NULL,

CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED([Id] ASC)
)
CREATE TABLE [Course] (
[Id][int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](100) NOT NULL,
[Credit] [bigint]  NOT NULL,
[AcademicYear] [date]  NOT NULL,
[Semester] [nchar] (1) NOT NULL,
[Gender] [nchar] (1) NOT NULL,
CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED([Id] ASC)
)
CREATE TABLE [GradeDetails] (
[Id][int] IDENTITY(1,1) NOT NULL,
[GradeId] [int] NOT NULL,
[AchievementTypeId] [nvarchar] (100) NOT NULL,
[AchievementPoints] [int] NOT NULL,
[AchievementsMaxPoints] [int] NULL,
[AchievementDate] [date] NOT NULL,
CONSTRAINT [PK_GradeDetails] PRIMARY KEY CLUSTERED([Id] ASC)
)
CREATE TABLE [AchievementType] (
[Id][int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](100) NOT NULL,
[Description] [nvarchar] (200) NOT NULL,
[ParticipationRate] [nvarchar] (150) NULL,
CONSTRAINT [PK_AchievementType] PRIMARY KEY CLUSTERED([Id] ASC)
)