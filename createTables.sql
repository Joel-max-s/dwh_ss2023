CREATE TABLE ZipCodes(
	ZipCodeID INT,
	ZipCode INT,
	PRIMARY KEY (ZipCodeID)
)

CREATE TABLE Neigbourhoods(
	NeigbourhoodID INT,
	Neigbourhood VARCHAR(40),
	PRIMARY KEY (NeigbourhoodID)
)

CREATE TABLE Boroughs(
	BoroughID INT,
	Borough VARCHAR(40),
	PRIMARY KEY (BoroughID)
)

CREATE TABLE Location(
	LocationID INT,
	BoroughID INT,
	NeigbourhoodID INT,
	ZipCodeID INT,
	Longtitude FLOAT, 
	Latitude FLOAT,
	PRIMARY KEY (LocationID),
	CONSTRAINT FK_LocationBorough FOREIGN KEY (BoroughID) REFERENCES Boroughs(BoroughID),
	CONSTRAINT FK_LocationNeighbourhood FOREIGN KEY (NeigbourhoodID) REFERENCES Neigbourhoods(NeigbourhoodID),
	CONSTRAINT FK_LocationZipCode FOREIGN KEY (ZipCodeID) REFERENCES ZipCodes(ZipCodeID)
)

CREATE TABLE Weather(
	WeatherID INT,
	Temperature INT,
	WindSpeed INT,
	Percipitation INT,
	Snowfall INT,
	PRIMARY KEY (WeatherID)
)

CREATE TABLE Time(
	TimeID INT,
	WeatherID INT,
	CollisionDateTime datetime,
	Sunrise time,
	Sunset time,
	PRIMARY KEY (TimeID),
	CONSTRAINT FK_TimeWeather FOREIGN KEY (WeatherID) REFERENCES Weather(WeatherID)
)

CREATE TABLE Crashes(
	CollisionID INT,
	TimeID INT,
	LocationID INT,
	PRIMARY KEY (CollisionID),
	CONSTRAINT FK_CrashesTime FOREIGN KEY (TimeID) REFERENCES Time(TimeID),
	CONSTRAINT FK_CrashesLocation FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
)

CREATE TABLE Vehicle(
	CollisionID INT,
	VehicleID INT,
	VehicleType VARCHAR(20),
	VehicleYear INT,
	PRIMARY KEY (VehicleID),
	CONSTRAINT FK_VehicleCrashes FOREIGN KEY (CollisionID) REFERENCES Crashes(CollisionID)
)

CREATE TABLE Person(
	PersonID INT,
	CollisionID INT,
	VehicleID INT,
	Age INT,
	Injury VARCHAR(20),
	EmotionalStatus VARCHAR(20),
	Gender VARCHAR(20),
	PedRole VARCHAR(20),
	PRIMARY KEY (PersonID),
	CONSTRAINT FK_PersonCrashes FOREIGN KEY (CollisionID) REFERENCES Crashes(CollisionID),
	CONSTRAINT FK_PersonVehicles FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID) 
)
