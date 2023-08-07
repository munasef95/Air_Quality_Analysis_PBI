create TABLE AQ.dimcountry
(
    CountryID int not null,
    country VARCHAR(80) not null,
    Continent varchar(80),
    subRegion varchar(80),
    GDPNominal MONEY,
    GDPGrowth decimal(5,3),
    Population bigint,
    GDPPerCapita money,
    ShareOfWorldGDP decimal(5,3),
	lat float,
	long float

    CONSTRAINT dimcountry_PK_CountryID PRIMARY key (CountryID),
    CONSTRAINT dimcountry_UK_Country UNIQUE (COUNTRY) 
)


create TABLE AQ.dimCity
(
    CityID int not null,
    City VARCHAR(80) not null,

    CONSTRAINT dimCity_PK_CityID PRIMARY key (CityID),
    CONSTRAINT dimCity_UK_City UNIQUE (City)
)

create table AQ.dimAQILevel(
	AQI_CATEGORY VARCHAR(50) NOT NULL,
	AQI_RANGE_MIN INT NOT NULL,
	AQI_RANGE_MAX INT NOT NULL,
	AQI_COLOR_LEVEL VARCHAR (15) NOT NULL,
	CONSTRAINT dimAQILevel_PK_AQI_CATEGORY PRIMARY KEY (AQI_CATEGORY)
)


CREATE TABLE [AQ].[factAirQuality](
	[CountryID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[AQI_Value] [smallint] NOT NULL,
	[AQI_Category] [nvarchar](50) NOT NULL,
	[CO_AQI_Value] [float] NOT NULL,
	[CO_AQI_Category] [nvarchar](50) NOT NULL,
	[Ozone_AQI_Value] [float] NOT NULL,
	[Ozone_AQI_Category] [nvarchar](50) NOT NULL,
	[NO2_AQI_Value] [float] NOT NULL,
	[NO2_AQI_Category] [nvarchar](50) NOT NULL,
	[PM2_5_AQI_Value] [float] NOT NULL,
	[PM2_5_AQI_Category] [nvarchar](50) NOT NULL,
	[lat] [float] NULL,
	[long] [float] NULL,
	CONSTRAINT [factAirQuality_DimCityy_FK_CityID] FOREIGN KEY([CityID]) REFERENCES [AQ].[dimCity] ([CityID]),
	CONSTRAINT [factAirQuality_DimCountry_FK_CountryID] FOREIGN KEY([CountryID]) REFERENCES [AQ].[dimcountry] ([CountryID])
) 






