-- Boroughs
CREATE TABLE [dbo].[Boroughs](
	[BoroughID] [int] NOT NULL,
	[Borough] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Boroughs] PRIMARY KEY CLUSTERED 
(
	[BoroughID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-- Crashes
CREATE TABLE [dbo].[Crashes](
	[CollisionID] [int] NOT NULL,
	[NumberOfInjured] [tinyint] NULL,
 CONSTRAINT [PK_Crashes] PRIMARY KEY CLUSTERED 
(
	[CollisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Crashes]  WITH CHECK ADD  CONSTRAINT [FK_Crashes_Location] FOREIGN KEY([CollisionID])
REFERENCES [dbo].[Location] ([CollisionID])
GO

ALTER TABLE [dbo].[Crashes] CHECK CONSTRAINT [FK_Crashes_Location]
GO

ALTER TABLE [dbo].[Crashes]  WITH CHECK ADD  CONSTRAINT [FK_Crashes_Time] FOREIGN KEY([CollisionID])
REFERENCES [dbo].[Time] ([CollisionID])
GO

ALTER TABLE [dbo].[Crashes] CHECK CONSTRAINT [FK_Crashes_Time]
GO


-- Crashes_Persons
CREATE TABLE [dbo].[Crashes_Persons](
	[UniqueID] [int] NOT NULL,
	[CollisionID] [int] NOT NULL,
 CONSTRAINT [PK_Crashes_Persons] PRIMARY KEY CLUSTERED 
(
	[UniqueID] ASC,
	[CollisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Crashes_Persons]  WITH CHECK ADD  CONSTRAINT [FK_Crashes_Persons_Crashes] FOREIGN KEY([CollisionID])
REFERENCES [dbo].[Crashes] ([CollisionID])
GO

ALTER TABLE [dbo].[Crashes_Persons] CHECK CONSTRAINT [FK_Crashes_Persons_Crashes]
GO

ALTER TABLE [dbo].[Crashes_Persons]  WITH CHECK ADD  CONSTRAINT [FK_Crashes_Persons_Person] FOREIGN KEY([UniqueID])
REFERENCES [dbo].[Person] ([UniqueID])
GO

ALTER TABLE [dbo].[Crashes_Persons] CHECK CONSTRAINT [FK_Crashes_Persons_Person]
GO


-- Crashes_Vehicles
CREATE TABLE [dbo].[Crashes_Vehicles](
	[UniqueID] [int] NOT NULL,
	[CollisionID] [int] NOT NULL,
 CONSTRAINT [PK_Crashes_Vehicles] PRIMARY KEY CLUSTERED 
(
	[UniqueID] ASC,
	[CollisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Crashes_Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Crashes_Vehicles_Crashes] FOREIGN KEY([CollisionID])
REFERENCES [dbo].[Crashes] ([CollisionID])
GO

ALTER TABLE [dbo].[Crashes_Vehicles] CHECK CONSTRAINT [FK_Crashes_Vehicles_Crashes]
GO

ALTER TABLE [dbo].[Crashes_Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Crashes_Vehicles_Vehicles] FOREIGN KEY([UniqueID])
REFERENCES [dbo].[Vehicles] ([UniqueID])
GO

ALTER TABLE [dbo].[Crashes_Vehicles] CHECK CONSTRAINT [FK_Crashes_Vehicles_Vehicles]
GO


-- Location
CREATE TABLE [dbo].[Location](
	[CollisionID] [int] NOT NULL,
	[ZipCode] [int] NOT NULL,
	[Latitude] [real] NULL,
	[Longitude] [real] NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[CollisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_ZipCodes] FOREIGN KEY([ZipCode])
REFERENCES [dbo].[ZipCodes] ([ZipCode])
GO

ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_ZipCodes]
GO


-- Neighborhoods
CREATE TABLE [dbo].[Neighbourhoods](
	[NeighbourhoodID] [int] NOT NULL,
	[Neighbourhood] [nvarchar](50) NOT NULL,
	[BoroughID] [int] NOT NULL,
 CONSTRAINT [PK_Neighbourhoods] PRIMARY KEY CLUSTERED 
(
	[NeighbourhoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Neighbourhoods]  WITH CHECK ADD  CONSTRAINT [FK_NeighbourhoodsBoroughs] FOREIGN KEY([BoroughID])
REFERENCES [dbo].[Boroughs] ([BoroughID])
GO

ALTER TABLE [dbo].[Neighbourhoods] CHECK CONSTRAINT [FK_NeighbourhoodsBoroughs]
GO


-- Person
CREATE TABLE [dbo].[Person](
	[UniqueID] [int] NOT NULL,
	[PersonID] [nvarchar](50) NULL,
	[CollisionID] [int] NULL,
	[VehicleID] [float] NULL,
	[Age] [int] NULL,
	[Injury] [nvarchar](50) NULL,
	[EmotionalStatus] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[PedRole] [nvarchar](50) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-- Time
CREATE TABLE [dbo].[Time](
	[CollisionID] [int] NOT NULL,
	[CrashDateTime] [datetime2](7) NULL,
	[WeatherID] [smallint] NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[CollisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Time]  WITH CHECK ADD  CONSTRAINT [FK_TimeWeather] FOREIGN KEY([WeatherID])
REFERENCES [dbo].[Weather] ([WeatherID])
GO

ALTER TABLE [dbo].[Time] CHECK CONSTRAINT [FK_TimeWeather]
GO


-- Vehicles	
CREATE TABLE [dbo].[Vehicles](
	[UniqueID] [int] NOT NULL,
	[CollisionID] [int] NULL,
	[VehicleID] [nvarchar](50) NULL,
	[VehicleType] [nvarchar](50) NULL,
	[VehicleYear] [smallint] NULL,
	[VehicleMake] [nvarchar](50) NULL,
	[VehicleModel] [nvarchar](50) NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-- Weather
CREATE TABLE [dbo].[Weather](
	[Temperature] [float] NULL,
	[Sunrise] [datetime2](7) NULL,
	[Sunset] [datetime2](7) NULL,
	[Rainfall] [float] NULL,
	[Snowfall] [float] NULL,
	[Windspeed] [float] NULL,
	[WeatherID] [smallint] NOT NULL,
 CONSTRAINT [PK_Weather] PRIMARY KEY CLUSTERED 
(
	[WeatherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-- ZipCodes
CREATE TABLE [dbo].[ZipCodes](
	[ZipCode] [int] NOT NULL,
	[NeighbourhoodID] [int] NOT NULL,
 CONSTRAINT [PK_ZipCodes] PRIMARY KEY CLUSTERED 
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ZipCodes]  WITH CHECK ADD  CONSTRAINT [FK_ZipCodesNeighbourhood] FOREIGN KEY([NeighbourhoodID])
REFERENCES [dbo].[Neighbourhoods] ([NeighbourhoodID])
GO

ALTER TABLE [dbo].[ZipCodes] CHECK CONSTRAINT [FK_ZipCodesNeighbourhood]
GO