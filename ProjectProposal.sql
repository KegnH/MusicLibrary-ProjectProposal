drop database IF EXISTS music_library;
create database music_library;
Use music_library;

-- DDL COMMANDS (schemas)

create table ARTIST(
	ArtistID int not null ,
	ArtistName varchar(30) not null ,
	LabelName varchar(30) ,
	Birthday varchar(10) ,
	PRIMARY KEY (ArtistID, ArtistName) -- ,
	-- CONSTRAINT LabelNameFK0 FOREIGN KEY (LabelName) REFERENCES LABEL(LabelName)
    ); 
    
create table SONG(
	SongID int not null ,
	SongTitle varchar(30) not null ,
	ArtistID int REFERENCES ARTIST(ArtistID) ,
	ArtistName varchar(30) REFERENCES ARTIST(ArtistName) ,
    AlbumName varchar(30) ,
	ReleaseDate varchar(10) ,
	Genre varchar(30) ,
	PRIMARY KEY (SongID , SongTitle) -- ,
	-- CONSTRAINT ArtistIDFK0 FOREIGN KEY (ArtistID) REFERENCES ARTIST(ArtistID) ,
	-- CONSTRAINT ArtistNameFK0 FOREIGN KEY (ArtistName) REFERENCES ARTIST(ArtistName) 
    );
    
create table ALBUM(
	AlbumID int not nulL ,
	AlbumTitle varchar(30) not null ,
	ArtistID int not null REFERENCES ARTIST(ArtistID) ,
 	ArtistName varchar(30) not null REFERENCES ARTIST(ArtistName) ,
	ReleaseDate varchar(10) ,
	No_Of_Tracks int , 
	Publisher varchar(30) ,
	PRIMARY KEY (AlbumID, AlbumTitle) -- ,
	-- CONSTRAINT ArtistNameFK2 FOREIGN KEY (ArtistName) REFERENCES ARTIST(ArtistName) ,
	-- CONSTRAINT PubNameFK0 FOREIGN KEY (PubName) REFERENCES PUBLISHER(PubName) 
    );
    
create table Features(
	SongID int REFERENCES SONG(SongID),
	ArtistID int REFERENCES ARTIST(ArtistID),
	ArtistName varchar(30) REFERENCES ARTIST(ArtistName)-- ,
-- 	CONSTRAINT ArtistIDFK1 
-- 		FOREIGN KEY (ArtistID) 
--         REFERENCES ARTIST(ArtistID) ,
-- 	CONSTRAINT ArtistNameFK1 
-- 		FOREIGN KEY (ArtistName) 
-- 		REFERENCES ARTIST(ArtistName) ,
-- 	CONSTRAINT SongIDFK0 
-- 		FOREIGN KEY (SongID) 
--         REFERENCES SONG(SongID) 
    );

create table AppearsOn (
	SongID int REFERENCES SONG(SongID), 
	AlbumID int REFERENCES ALBUM(AlbumID),
    TrackNo int -- ,
-- 	CONSTRAINT SongIDFK1 FOREIGN KEY (SongID)  REFERENCES SONG(SongID) , 
-- 	CONSTRAINT AlbumIDFK0 FOREIGN KEY (AlbumID) REFERENCES ALBUM(AlbumID) 
    );

create table Sings(
	ArtistID int REFERENCES ARTIST(ArtistID),
	SongID int REFERENCES SONG(SongID)-- ,
-- 	CONSTRAINT ArtistIDFK2 FOREIGN KEY (ArtistID) REFERENCES ARTIST(ArtistID) ,
-- 	CONSTRAINT SongIDFK2 FOREIGN KEY (SongID) REFERENCES SONG(SongID) 
    );

create table ListensTo(
	UserID int REFERENCES USER(UserID), 
	ArtistID int REFERENCES ARTIST(ArtistID), 
	SongID int REFERENCES SONG(SongID),
	NoOfPlays int -- ,
-- 	CONSTRAINT UserIDFK0 FOREIGN KEY (UserID) REFERENCES USER(UserID) ,
-- 	CONSTRAINT ArtistIDFK3 FOREIGN KEY (ArtistID) REFERENCES ARTIST(ArtistID) , 
-- 	CONSTRAINT SongIDFK3 FOREIGN KEY (SongID) REFERENCES SONG(ArtistID) 
    );

create table Rates( 
	UserID int REFERENCES USER(UserID),
	SongID int REFERENCES SONG(SongID),
	Rating Numeric(1,1) -- ,
-- 	CONSTRAINT UserIDFK1 FOREIGN KEY (UserID) REFERENCES USER(UserID) ,
-- 	CONSTRAINT SongIDFK4 FOREIGN KEY (SongID) REFERENCES SONG(SongID) 
    );

create table USERS(
	UserId int not null PRIMARY KEY ,
	UserName varchar(30) not null ,
	Email varchar(30) 
    );

create table LABEL( 
	LabelID int not null , 
	LabelName varchar(30) not null ,
	YearEst int ,
    PRIMARY KEY (LabelID, LabelName) 
    );

-- create table PUBLISHER( 
-- 	PubID int not null PRIMARY KEY ,
-- 	PubName varchar(30) not null ,
-- 	YearEst int 
--     );

create table Manages(
	LabelID int REFERENCES LABEL(LabelID), 
	ArtistID int REFERENCES ARTIST(ArtistID),
	YearStarted int -- ,
-- 	CONSTRAINT LabelIDFK1 FOREIGN KEY (LabelID) REFERENCES LABEL(LabelID) ,
--  	CONSTRAINT ArtistIDFK4 FOREIGN KEY (ArtistID) REFERENCES ARTIST(ArtistID) 
    );

-- create table Publish(
-- 	PubID int ,
-- 	AlbumID int ,
-- 	YearPub int ,
-- 	CONSTRAINT PubIDFK0 FOREIGN KEY (PubID) REFERENCES PUBLISHER(PubID) ,
-- 	CONSTRAINT AlbumIDFK1 FOREIGN KEY (AlbumID) REFERENCES ALBUM(AlbumID) 
--     );


-- Possible info for Label Companies (Manager:weak entity, deals, etc)
-- Concerts (Dates, Times, Artists, ticket sales)
-- Playlists

-- CREATE DATA

insert into ARTIST values(00001, 'Tyler, the Creator', 'XL Recordings Ltd', '01-01-0111'), (00002, 'Frank Ocean', '', '01-01-0101') ;
insert into SONG values(10000, 'She', 00001, 'Tyler, the Creator',null, '5-10-2011', 'HipHop/Rap') ;
insert into Sings values(00001, 10000);
insert into Features values(10000, 00002, 'Frank Ocean');
insert into ALBUM values(1, 'Goblin (Deluxe Edition)', 00001, 'Tyler, the Creator', '5-10-2011', 18,null);
insert into AppearsOn values(10000, 1, 4);
insert into LABEL values(101, 'XL Recordings Ltd', 2000);

insert into ARTIST values
(00003, 'Free Nationals', 'OBE, LLC / EMPIRE', '1-1-1111'),
(00004, 'Shafiq Husayn',null, '1-1-2111'),
(00005, 'Daniel Caesar',null, '1-1-2111'),(00006, 'Unknown Mortal Orchestra',null, '1-1-2999'),
(00007, 'Syd',null, '1-1-2111'),
(00008, 'Benny Sings',null, '1-1-2111'),
(00009, 'Anderson .Paak',null, '1-1-2211');
insert into ALBUM values(2, 'Free Nationals', 00003, 'Free Nationals', '12-13-19', 13,null);
insert into SONG values
(10001, 'Obituaries', 00003, 'Free Nationals', 'Free Nationals', '12-13-19', 'R&B/Soul'), 
(10002, 'Beauty & Essex', 00003, 'Free Nationals', 'FreeNationals', '10-8-19', 'R&B/Soul'),
(10003, 'Shibuya', 00003, 'Free Nationals', 'Free Nationals', '12-13-19', 'R&B/Soul'),
(10004, 'Apartment', 00003, 'Free Nationals', 'Free Nationals', '11-8-19', 'R&B/Soul'),
(10005, 'Gidget', 00003, 'Free Nationals', 'Free Nationals', '12-13-19', 'R&B/Soul');
insert into Features values
(10001, 00004, 'Shafiq Husayn'),
(10002, 00005, 'Daniel Caesar'), (10002, 00006, 'Unknown Mortal Orchestra'),
(10003, 00007, 'Syd'),
(10004, 00008, 'Benny Sings'),
(10005, 00009, 'Anderson .Paak');
insert into AppearsOn values
(10001,2,1), 
(10002,2,2),
(10003,2,3),
(10004,2,4),
(10005,2,5);
insert into LABEL values(1001, 'OBE, LLC / EMPIRE', 2000);

insert into ARTIST values(00010, 'FKJ',null, '1-1-1111'),(00011, 'Tom Misch',null, '1-1-1111'),(00012, '((( O )))',null, '1-1-1111');
insert into SONG values(1, 'Losing My Way', 1, 'FKJ',null, '11-16-16', 'Alternative'),
(2, 'Skyline', 1, 'FKJ','French Kiwi Juice','1-1-1111', 'Electronic'),(3, "Vibin' Out", 1, 'FKJ','French Kiwi Juice', '1-1-1211', 'Electronic');
insert into ALBUM values(3, 'French Kiwi Juice', 1, 'FKJ', '1-1-1111', 12, 'Roche Musique');
insert into AppearsOn values(2,1,2),(3,1,5);
insert into Features values(1, 2,'Tom Misch'),(3,3, '((( O )))');

insert into ARTIST values(00011, 'Brent Faiyaz',null, '1-1-1111');
insert into ALBUM values(4, 'Lost-EP', 00011, 'Brent Faiyaz', '10-19-2018', 6, 'LOST KIDS / HUMAN RE SOURCES');
insert into SONG values
(1, "Why'z It So Hard", 1, 'Brent Faiyaz', 'Lost-EP', '10-19-2018', 'R&B/Soul'),
(3, 'Came Right Back', 1, 'Brent Faiyaz', 'Lost-EP', '10-19-2018', 'R&B/Soul'),
(4, 'Trust', 1, 'Brent Faiyaz', 'Lost-EP', '10-19-2018', 'R&B/Soul'),
(2, 'Around Me', 1, 'Brent Faiyaz', 'Lost-EP', '10-19-2018', 'R&B/Soul'),
(6, 'Poundz', 1, 'Brent Faiyaz', 'Lost-EP', '10-19-2018', 'R&B/Soul'),
(5, 'Target On My Chest', 1, 'Brent Faiyaz', 'Lost-EP', '10-19-2018', 'R&B/Soul');
insert into Sings values(1,1), (1,1), (1,1);
insert into AppearsOn values(1,1,1),(1,1,2),(1,1,3),(1,1,4),(1,1,5),(1,1,6);

-- insert into USER values(11100, 'Keg' , 'jkh044@latech.edu') ;
-- insert into ListensTo values(11100, 10000, 00001, 24) ;
-- insert into Rates values(11100, 00001, 9.8) ;

-- DML COMMANDS (queries)

create View BasicSongInfo AS
SELECT s.SongTitle, s.ArtistName, s.AlbumName FROM SONG s;

SELECT SongTitle
FROM SONG 
WHERE Genre='R&B/Soul';
-- create View AllSongsFromAlbum AS
-- SELECT
-- trigger: before insert on song release date must be today or before 
-- views for when a song plays
-- groups song by album, artists
-- display artist/song/album info (name, ratings)
-- display all songs of an album
