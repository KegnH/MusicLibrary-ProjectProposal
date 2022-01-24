create database music_library;
Use music_library;

-- DDL COMMANDS (schemas)
create table SONG(
SongID int not null PRIMARY KEY ,
SongTitle varchar(30) not null PRIMARY KEY ,
ArtistID int not null ,
ArtistName varchar(30) not null ,
ReleaseDate varchar(10) ,
GenreName varchar(30) ,
FOREIGN KEY (ArtistID, ArtistName) REFERENCES ARTIST );

create table Features(
SongID int ,
ArstistID int ,
ArstistName varchar(30) ,
FOREIGN KEY (ArtistID, ArtistName) REFERENCES ARTIST , FOREIGN KEY (SongID) REFERENCES SONG );

create table AppearsOn (
SongID int , 
AlbumID int , 
FOREIGN KEY (SongID)  REFERENCES SONG , FOREIGN KEY (AlbumID) REFERENCES ALBUM);

create table ALBUM(
AlbumID int not null PRIMARY KEY ,
AlbumTitle varchar(30) not null PRIMARY KEY ,
ArtistID int not null ,
ArtistName varchar(30) not null ,
ReleaseDate varchar(10) ,
Publisher varchar(30) ,
PublishDate varchar(10) ,
FOREIGN KEY (ArtistName) REFERENCES ARTIST  );

create table Sings(
ArtistID int ,
SongID int ,
FOREIGN KEY (ArtistID) REFERENCES ARTIST , FOREIGN KEY (SongID) REFERENCES SONG );

create table ARTIST(
ArtistID int  not null PRIMARY KEY ,
ArtistName varchar(30) not null PRIMARY KEY ,
LabelName varchar(30) ,
Birthday varchar(10) ,
FOREIGN KEY (LabelName) REFERENCES LABEL ); 

create table ListensTo(
UserID int , 
ArtistID int , 
SongID int ,
NoOfPlays int ,
FOREIGN KEY (UserID) REFERENCES USER , FOREIGN KEY (ArtistID) REFERENCES ARTIST , 
FOREIGN KEY (SongID) REFERENCES SONG);

create table Rates( 
UserID int ,
SongID int ,
Rating Numeric(1,1) ,
FOREIGN KEY (UserID) REFERENCES USER , FOREIGN KEY (ArtistID) REFERENCES Artist , 
FOREIGN KEY (SongID) REFERENCES SONG);

create table USER(
UserId int not null PRIMARY KEY ,
UserName varchar(30) not null PRIMARY KEY ,
Email varchar(30) );

create table Manages(
LabelID int , 
ArtistID int ,
YearStarted int ,
FOREIGN KEY (LableID) REFERENCES LABEL , FOREIGN KEY (ArtistID) REFERENCES ARTIST );

create table Publish(
PubID int ,
AlbumID int ,
YearPub int ,
FOREIGN KEY (PubID) REFERENCES PUBLISHER , FOREIGN KEY (AlbumID) REFERENCES ALBUM);

create table LABEL( 
LabelID int not null PRIMARY KEY , 
LableName varchar(30) not null ,
YearEst int );

create table PUBLISHER( 
PubID int not null PRIMARY KEY ,
PubName varchar(30) not null ,
YearEst int );


-- CREATE DATA
-- DML COMMANDS (queries)
