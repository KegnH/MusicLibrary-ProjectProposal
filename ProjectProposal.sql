drop database IF EXISTS music_library;
create database music_library;
Use music_library;

-- DDL COMMANDS (schemas)

create table ARTIST(
	ArtistID int not null ,
	ArtistName varchar(30) not null ,
	LabelName varchar(30) REFERENCES LABEL(LabelName),
	Birthday varchar(10) ,
	PRIMARY KEY (ArtistID, ArtistName)
    ); 
    
create table SONG(
	SongID int not null ,
	SongTitle varchar(50) not null ,
	ArtistID int not null REFERENCES ARTIST(ArtistID) ON DELETE CASCADE ,
	ArtistName varchar(30) not null REFERENCES ARTIST(ArtistName) ON DELETE CASCADE ,
    AlbumTitle varchar(50) REFERENCES ALBUM(AlbumTitle) ,
	ReleaseDate varchar(10) ,
	Genre varchar(30) ,
	PRIMARY KEY (SongID , SongTitle)
    );
    
create table ALBUM(
	AlbumID int not nulL ,
	AlbumTitle varchar(50) not null ,
	ArtistID int not null REFERENCES ARTIST(ArtistID) ON DELETE CASCADE ,
 	ArtistName varchar(30) not null REFERENCES ARTIST(ArtistName) ON DELETE CASCADE ,
    Genre varchar(30) ,
	ReleaseDate varchar(10) ,
	No_Of_Tracks int , 
	Publisher varchar(30) ,
	PRIMARY KEY (AlbumID, AlbumTitle)
    );
    
create table Features(
	SongID int REFERENCES SONG(SongID) ON DELETE CASCADE ,
	ArtistID int REFERENCES ARTIST(ArtistID) ON DELETE CASCADE ,
	ArtistName varchar(30) REFERENCES ARTIST(ArtistName) ON DELETE CASCADE 
    );

create table AppearsOn (
	SongID int REFERENCES SONG(SongID) ON DELETE CASCADE , 
	AlbumID int REFERENCES ALBUM(AlbumID) ON DELETE CASCADE ,
    TrackNo int
    );

create table Sings(
	ArtistID int REFERENCES ARTIST(ArtistID) ON DELETE CASCADE ,
	SongID int REFERENCES SONG(SongID) ON DELETE CASCADE 
    );
    
create table USERS(
	UserId int not null PRIMARY KEY ,
	UserName varchar(30) not null ,
	Email varchar(30) 
    );

create table ListensTo(
	UserID int REFERENCES USERS(UserID) ON DELETE CASCADE , 
	ArtistID int REFERENCES ARTIST(ArtistID) ON DELETE CASCADE , 
	SongID int REFERENCES SONG(SongID) ON DELETE CASCADE ,
	NoOfPlays int 
    );

create table Rates( 
	UserID int REFERENCES USERS(UserID) ON DELETE CASCADE ,
	SongID int REFERENCES SONG(SongID) ON DELETE CASCADE ,
	Rating float(2) 
    );

create table LABEL( 
	LabelID int not null , 
	LabelName varchar(30) not null ,
	YearEst int ,
    PRIMARY KEY (LabelID, LabelName) 
    );

create table Manages(
	LabelID int REFERENCES LABEL(LabelID) ON DELETE CASCADE , 
	ArtistID int REFERENCES ARTIST(ArtistID) ON DELETE CASCADE ,
	YearStarted int
    );

-- CREATE DATA

-- Tyler, the Creator - Goblin (Deluxe Edition)
insert into ARTIST values(00001, 'Tyler, the Creator', 'XL Recordings Ltd', '01-01-0111'), (00002, 'Frank Ocean', '', '01-01-0101') ;
insert into SONG values(10000, 'She', 00001, 'Tyler, the Creator','Goblin (Deluxe Edition)', '5-10-2011', 'Hip-Hop/Rap') ;
insert into Sings values(00001, 10000);
insert into Features values(10000, 00002, 'Frank Ocean');
insert into ALBUM values(1, 'Goblin (Deluxe Edition)', 00001, 'Tyler, the Creator','Hip-Hop/Rap', '5-10-2011', 18,null);
insert into AppearsOn values(10000, 1, 4);
insert into LABEL values(101, 'XL Recordings Ltd', 2000);

-- Free Nationals - Self-Named Album Title
insert into ARTIST values
(00003, 'Free Nationals', 'OBE, LLC / EMPIRE', '1-1-1111'),
(00004, 'Shafiq Husayn',null, '1-1-2111'),
(00005, 'Daniel Caesar',null, '1-1-2111'),(00006, 'Unknown Mortal Orchestra',null, '1-1-2999'),
(00007, 'Syd',null, '1-1-2111'),
(00008, 'Benny Sings',null, '1-1-2111'),
(00009, 'Anderson .Paak',null, '1-1-2211');
insert into ALBUM values(2, 'Free Nationals', 00003, 'Free Nationals','R&B/Soul', '12-13-19', 13,'OBE, LLC / EMPIRE');
insert into SONG values
(10001, 'Obituaries', 00003, 'Free Nationals', 'Free Nationals', '12-13-19', 'R&B/Soul'), 
(10002, 'Beauty & Essex', 00003, 'Free Nationals', 'Free Nationals', '10-8-19', 'R&B/Soul'),
(10003, 'Shibuya', 00003, 'Free Nationals', 'Free Nationals', '12-13-19', 'R&B/Soul'),
(10004, 'Apartment', 00003, 'Free Nationals', 'Free Nationals', '11-8-19', 'R&B/Soul'),
(10005, 'Gidget', 00003, 'Free Nationals', 'Free Nationals', '12-13-19', 'R&B/Soul');
insert into Sings values(00003,10001),(00003,10002),(00003,10003),(00003,10004),(00003,10005);
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

-- FKJ - French Kiwi Juice & Losing My Way (feat. Tom Misch)
insert into ARTIST values(00010, 'FKJ',null, '1-1-1111'),(00011, 'Tom Misch',null, '1-1-1111'),(00012, '((( O )))',null, '1-1-1111');
insert into SONG values(10006, 'Losing My Way', 00010, 'FKJ',null, '11-16-16', 'Alternative'),
(10007, 'Skyline', 00010, 'FKJ','French Kiwi Juice','1-1-1111', 'Electronic'),(10008, "Vibin' Out", 00010, 'FKJ','French Kiwi Juice', '1-1-1211', 'Electronic');
insert into ALBUM values(3, 'French Kiwi Juice', 00010, 'FKJ','Electronic', '1-1-1111', 12, 'Roche Musique');
insert into Sings values(00010,10006),(00010,10007),(00010,10008);
insert into AppearsOn values(10007,3,2),(10008,3,5);
insert into Features values(10006, 00011,'Tom Misch'),(10008,00012, '((( O )))');

-- Brent Faiyaz - Lost-EP
insert into ARTIST values(00013, 'Brent Faiyaz',null, '1-1-1111');
insert into ALBUM values(4, 'Lost-EP', 00011, 'Brent Faiyaz','R&B/Soul', '10-19-2018', 6, 'LOST KIDS / HUMAN RE SOURCES');
insert into SONG values
(10009, "Why'z It So Hard", 00013, 'Brent Faiyaz', 'Lost-EP', '10-19-2018', 'R&B/Soul'),
(10010, 'Came Right Back', 00013, 'Brent Faiyaz', 'Lost-EP', '10-19-2018', 'R&B/Soul'),
(10011, 'Trust', 00013, 'Brent Faiyaz', 'Lost-EP', '10-19-2018', 'R&B/Soul'),
(10012, 'Around Me', 00013, 'Brent Faiyaz', 'Lost-EP', '10-19-2018', 'R&B/Soul'),
(10013, 'Poundz', 00013, 'Brent Faiyaz', 'Lost-EP', '10-19-2018', 'R&B/Soul'),
(10014, 'Target On My Chest', 00013, 'Brent Faiyaz', 'Lost-EP', '10-19-2018', 'R&B/Soul');
insert into Sings values(00013,10009), (00013,10010), (00013,10011),(00013,10012),(00013,10014);
insert into AppearsOn values(10009,4,1),(10010,4,2),(10011,4,3),(10012,4,4),(10013,4,5),(10014,4,6);

-- Kota the Friend - Foto , etc.
insert into ARTIST values(00014, 'Kota the Friend',null, '1-1-1111'),
(00015,'Lizzy Ashiliegh',null,'1-1-1111'),
(00016,'Saba',null,'1-1-1111');
insert into ALBUM values(5,'Foto', 00014, 'Kota the Friend','Hip-Hop/Rap', '5-14-2019',19,'FLTBYS LLC');
insert into SONG values
(10015, 'Birdie', 00014, 'Kota the Friend',null, '5-14-2019', 'Hip-Hop/Rap'),
(10016, 'California', 00014, 'Kota the Friend',null,'2-21-2020', 'Hip-Hop/Rap'),
(10017, 'Colorado', 00014, 'Kota the Friend',null, '10-24-2020', 'Hip-Hop/Rap'),
(10018, 'Monday', 00014, 'Kota the Friend',null, '1-7-2020', 'Hip-Hop/Rap'),
(10019, 'Show You', 00014, 'Kota the Friend',null, '10-22-2021', 'Hip-Hop/Rap'),
(10020, 'Church', 00014, 'Kota the Friend','Foto','5-14-2019','Hip-Hop/Rap'),
(10021, 'Hollywood', 00014, 'Kota the Friend','Foto','5-14-2019','Hip-Hop/Rap'),
(10022, 'Alkaline', 00014, 'Kota the Friend','Foto','5-14-2019','Hip-Hop/Rap'),
(10023, 'Sedona', 00014, 'Kota the Friend','Foto','5-14-2019','Hip-Hop/Rap'),
(10024, 'Chicago Diner', 00014, 'Kota the Friend','Foto','5-14-2019','Hip-Hop/Rap'),
(10025, 'Bagels', 00014, 'Kota the Friend','Foto','5-14-2019','Hip-Hop/Rap'),
(10026, 'Solar Return', 00014, 'Kota the Friend','Foto','5-14-2019','Hip-Hop/Rap'),
(10027, 'Backyard', 00014, 'Kota the Friend','Foto','5-14-2019','Hip-Hop/Rap'),
(10028, 'Her', 00014, 'Kota the Friend',null,'7-12-16','Hip-Hop/Rap'),
(10029, 'Face It', 00014, 'Kota the Friend',null,'11-12-2021','Hip-Hop/Rap');
insert into Sings values(00014,10015),(00014,10016),(00014,10017),
(00014,10018),(00014,10019),(00014,10020),(00014,10021),
(00014,10022),(00014,10023),(00014,10024),(00014,10025),
(00014,10026),(00014,10027),(00014,10028),(00014,10029);
insert into AppearsOn values(10020,5,2),(10021,5,4),(10022,5,5),(10023,5,6),(10024,5,7),(10025,5,8),(10026,5,10),(10027,5,14);
insert into Features values(10025,00015,'Lizzy Ashiliegh'),(10026,00016,'Saba');

-- Frank Ocean - Channel ORANGE , etc.
insert into ALBUM values(6,'Channel ORANGE', 00002, 'Frank Ocean','Pop', '7-10-2012',17,'THE ISLAND DEF JAM MUSIC GROUP');
insert into SONG values
(10030, 'Thinkin Bout You', 00002, 'Frank Ocean','Channel ORANGE', '4-17-2012', 'Pop'),
(10031, 'Sierra Leone', 00002, 'Frank Ocean','Channel ORANGE', '7-10-2012', 'Pop'),
(10032, 'Sweet Life', 00002, 'Frank Ocean','Channel ORANGE', '7-6-2012', 'Pop'),
(10033, 'Super Rich Kids', 00002, 'Frank Ocean','Channel ORANGE', '7-10-2012', 'Pop'),
(10034, 'Pilot Jones', 00002, 'Frank Ocean','Channel ORANGE', '7-10-2012', 'Pop'),
(10035, 'Crack Rock', 00002, 'Frank Ocean','Channel ORANGE', '7-10-2012', 'Pop'),
(10036, 'Pyramids', 00002, 'Frank Ocean','Channel ORANGE', '6-8-2012', 'Pop'),
(10037, 'Lost', 00002, 'Frank Ocean','Channel ORANGE', '7-10-2012', 'Pop'),
(10038, 'White', 00002, 'Frank Ocean','Channel ORANGE', '7-10-2012', 'Pop'),
(10039, 'Monks', 00002, 'Frank Ocean','Channel ORANGE', '7-10-2012', 'Pop'),
(10040, 'Bad Religion', 00002, 'Frank Ocean','Channel ORANGE', '7-10-2012', 'Pop'),
(10041, 'Pink Matter', 00002, 'Frank Ocean','Channel ORANGE', '7-10-2012', 'Pop'),
(10042, 'Forrest Gump', 00002, 'Frank Ocean','Channel ORANGE', '7-10-2012', 'Pop'),
(10043, 'Chanel', 00002, 'Frank Ocean',null, '3-10-2017', 'Pop'),
(10044, 'DHL', 00002, 'Frank Ocean',null, '11-2-2019', 'Pop'),
(10045, 'In My Room', 00002, 'Frank Ocean',null, '7-10-2012', 'Pop'),
(10046, 'Novacane', 00002, 'Frank Ocean',null, '2-16-2011', 'Pop'),
(10047, 'Swim Good', 00002, 'Frank Ocean',null, '2-16-2011', 'Pop');
insert into Sings values(00002,10030),(00002,10031),(00002,10032),(00002,10033),(00002,10034),(00002,10035),(00002,10036),
(00002,10037),(00002,10038),(00002,10039),(00002,10040),(00002,10041),(00002,10042),(00002,10043),(00002,10044),(00002,10045),
(00002,10046),(00002,10047);
insert into AppearsOn values(10030,6,2),(10031,6,4),(10032,6,5),(10033,6,7),
(10034,6,8),(10035,6,9),(10036,6,10),(10037,6,11),(10038,6,12),(10039,6,13),
(10040,6,14),(10041,6,15),(10042,6,16);
insert into ARTIST values
(00017, 'Earl Sweatshirt','Odd Future','1-1-1111'),
(00018, 'John Mayer',null,null),
(00019, 'Andre 3000',null,null);
insert into Features values(10033,00017,'Earl Sweatshirt'),(10038,00018,'John Mayer'),(10041,00019,'Andre 3000');

-- Blood Orange - Coastal Grooves --
insert into ARTIST values(00020, 'Blood Orange','Domino Records', '12-23-1985');

insert into SONG values
(10048, 'Forget It', 00014, 'Blood Orange','Coastal Grooves', '08-30-11', 'R&B/Soul'),
(10049, 'Sutphin Boulevard', 00020, 'Blood Orange','Coastal Grooves', '08-30-11', 'R&B/Soul'),
(10050, 'Im Sorry We Lied', 00020, 'Blood Orange','Coastal Grooves', '08-30-11', 'R&B/Soul'),
(10051, 'Can We Go Inside Now', 00020, 'Blood Orange','Coastal Grooves', '08-30-11', 'R&B/Soul'),
(10052, "S'Cooled ", 00020, 'Blood Orange','Coastal Grooves', '08-30-11', 'R&B/Soul'),
(10053, 'Complete Failure', 00020, 'Blood Orange','Coastal Grooves', '08-30-11', 'R&B/Soul'),
(10054, 'Instantly Blank(The Goodness)', 00020, 'Blood Orange','Coastal Grooves', '08-30-11', 'R&B/Soul'),
(10055, 'The Complete Knock', 00020, 'Blood Orange','Coastal Grooves', '08-30-11', 'R&B/Soul'),
(10056, "Are You Sure You're Really Busy?", 00020, 'Blood Orange','Coastal Grooves', '08-30-11', 'R&B/Soul'),
(10057, 'Champagne Coast', 00020, 'Blood Orange','Coastal Grooves', '08-30-11', 'R&B/Soul');
						
insert into Sings values(00020, 10048),(00020, 10049),(00020, 10050),(00020, 10051),(00020, 10052),(00020, 10053),(00020, 10054),
(00020, 10055),(00020, 10056),(00020, 10057);

insert into ALBUM values(7, 'Coastal Grooves', 00020, 'Blood Orange','R&B/Soul', '08-30-11', 10, null);

insert into AppearsOn values(10048,7,1), (10049,7,2), (10050,7,3), (10051,7,4), (10052,7,5), 
(10053,7,6), (10054,7,7), (10055,7,8), (10056,7,9), (10057,7,10);
 
 
 -- Fleetwood Mac -- Tango in the night
insert into ARTIST values(00021, 'Fleetwood Mac','Columbia Records', '04-13-1987');
 
insert into SONG values
(10058, 'Big Love', 00021, 'Fleetwood Mac','Tango In The Night', '04-13-1987', 'Rock'),
(10059, 'Seven Wonders', 00021, 'Fleetwood Mac','Tango In The Night', '04-13-1987', 'Rock'),
(10060, 'Everywhere', 00021, 'Fleetwood Mac','Tango In The Night', '04-13-1987', 'Rock'),
(10061, 'Caroline', 00021, 'Fleetwood Mac','Tango In The Night', '04-13-1987', 'Rock'),
(10062, "Tango in the Night", 00021, 'Fleetwood Mac','Tango In The Night', '04-13-1987', 'Rock'),
(10063, 'Mystified', 00021, 'Fleetwood Mac','Tango In The Night', '04-13-1987', 'Rock'),
(10064, 'Little Lies', 00021, 'Fleetwood Mac','Tango In The Night', '04-13-1987', 'Rock'),
(10065, 'Family Man', 00021, 'Fleetwood Mac','Tango In The Night', '04-13-1987', 'Rock'),
(10066, "Welcome to the Room", 00021, 'Fleetwood Mac','Tango In The Night', '04-13-1987', 'Rock'),
(10067, "Isn't It Midnight", 00021, 'Fleetwood Mac' , 'Tango In The Night', '04-13-1987', 'Rock'), 
(10068, "When I See You Again", 00021, 'Fleetwood Mac' , 'Tango In The Night', '04-13-1987', 'Rock'), 
(10069, "You and I, Pt II", 00021, 'Fleetwood Mac' , 'Tango In The Night', '04-13-1987', 'Rock');
 
insert into Sings values(00021, 10058), (00021, 10059), (00021, 10060), (00021, 10061), (00021, 10062), (00021, 10063), (00021, 10064), 
						(00021, 10065), (00021, 10066), (00021, 10067), (00021, 10068), (00021, 10069);
 
insert into ALBUM values(8, 'Tango In the Night', 00021, 'Fleetwood Mac','Rock', '04-13-87', 12, null);
 
insert into AppearsOn values(10058,8,1), (10059,8,2), (10060,8,3), (10061,8,4), (10062,8,5), (10063,8,6), 
							(10064,8,7), (10065,8,8), (10066,8,9), (10067,8,10), (10068,8,11), (10069,8,12);

 
insert into USERS values(11100, 'Keg' , 'jkh044@latech.edu') ;
insert into ListensTo values(11100, 00001, 10000, 24) ;
insert into Rates values(11100, 10000, 9.8) ;

insert into USERS values(11101, 'Reid' , 'rgt007@latech.edu') ;
insert into ListensTo values(11101, 00020, 10050, 30) ;
insert into Rates values(11101, 10050, 9.5);


-- DML COMMANDS (queries)

-- Trigger: Set Artist's LabelName to - Independent if the labelname is set to null
DELIMITER $$

create trigger IndependentArtist BEFORE INSERT ON ARTIST FOR EACH ROW
BEGIN
	IF(NEW.LabelName=null)THEN
		SET NEW.LabelName='- Independent';
    END IF;
END $$
DELIMITER ;

-- Trigger: Set a Song's AlbumName to - Single if the albumname is set to null
DELIMITER $$

create trigger SingleSong BEFORE INSERT ON SONG FOR EACH ROW
BEGIN
	IF(NEW.AlbumTitle is null)
		THEN SET NEW.AlbumTitle='- Single';
    END IF;
END $$
DELIMITER ;


-- Trigger: Checks to ensure an Album has at least 1 song
DELIMITER $$ 
CREATE TRIGGER AlbumMinSong
BEFORE INSERT on ALBUM
FOR EACH ROW
BEGIN
declare msg varchar(255);
IF (NEW.No_Of_Tracks < 1 ) THEN
/* Cause Error Message */
set msg = 'Invalid Number of Tracks: An Album must have at least one song';
signal sqlstate '45000' set message_text = msg;
END IF;
END
$$
DELIMITER ;

-- insert into ALBUM values(00, 'Test', 00, 'Test',null,null,0,null);

-- View Basic Song Information(Title,Artist,Album)
create View BasicSongInfo AS
SELECT s.SongTitle, s.ArtistName, s.AlbumTitle FROM SONG s;

-- Show Artist Name and Song Title for songs with Genre R&B/Soul
create View RBSongs AS
SELECT a.ArtistName , s.SongTitle , Genre
FROM ARTIST a , SONG s
WHERE a.ArtistID = s.ArtistID AND Genre='R&B/Soul';

-- Display Artists and SongTitle using Features table
create View Featuring AS
SELECT a1.ArtistName as PrimaryArtist , s.SongTitle , a2.ArtistName as FeaturedArtist
FROM ARTIST a1 , SONG s, ARTIST a2 , Features f
WHERE a1.ArtistID = s.ArtistID AND s.SongID = f.SongID AND a2.ArtistID = f.ArtistID;

-- Display all songs of an album
create View AllSongsFromAlbum AS
SELECT b.AlbumTitle , s.SongTitle
FROM AppearsOn a , ALBUM b , SONG s
WHERE a.SongID = s.SongID AND a.AlbumID = b.AlbumID;

-- Display Users Ratings and Song Names
create view UserRatings AS
SELECT u.UserName , s.SongTitle , r.Rating
FROM USERS u , SONG s , Rates r
WHERE u.UserID=r.UserID AND s.SongID=r.SongID;

SELECT * FROM BasicSongInfo;
SELECT * FROM RBSongs;
SELECT * FROM Featuring;
SELECT * FROM AllSongsFromAlbum;
SELECT * FROM UserRatings;
