INSERT INTO styles (style_name)
	 VALUES ('pop'), ('rock'), ('rap'), ('R`n`B'), ('punk');

INSERT INTO artists (artist_name)
	 VALUES ('Madonna'), ('Lady Gaga'), ('The Offspring'), ('Bon Jovi'), ('50 cent'), ('Black Eyed Peas'), ('Eminem'), ('Blink-182');

INSERT INTO styles_artists (id_style, id_artist)
	 VALUES (1, 1), (1, 2), (2, 4), (3, 5), (3, 7), (4, 6), (5, 3), (5, 8);

INSERT INTO albums(album_name, year_produced)
	 VALUES ('Levitating', 2020), ('Ghosttown', 2018), 
			('BORN THIS WAY THE TENTH ANNIVERSARY', 2021), ('Chromatica', 2020), 
			('Americana', 1998), ('Splinter', 2003),
			('Keep The Faith', 1992), ('Have A Nice Day', 2005),
			('The Massacre', 2004), ('Animal Ambition: An Untamed Desire To Win', 2018),
			('Behind The Front', 1998), ('Monkey Business', 2005),
			('The Marshall Mathers LP', 2001), ('Relapse: Refill', 2009),
			('Take Off Your Pants And Jacket', 2001), ('Neighborhoods', 2011);
	
INSERT INTO tracks (track_name, duration, id_album)
	 VALUES ('Levitating', 240, 1),
			('Ghosttown', 200, 2),
			('Marry The Night', 300, 3), ('Americano', 200, 3),
			('Alice', 200, 4), ('Fun Tonight', 260, 4),
			('Staring At the Sun', 300, 5), ('The Kids Aren`t Alright', 320, 5),
			('Hit That', 200, 6), ('Lightning Rod', 250, 6),
			('I Believe', 400, 7), ('In These Arms', 260, 7),
			('Welcome To Wherever You Are', 280, 8), ('Complicated', 200, 8),
			('In My Hood', 210, 9), ('Piggy Bank', 250, 9),
			('Pilot', 240, 10), ('Animal Ambition', 300, 10),
			('Movement', 300, 11), ('Duet', 200, 11),
			('My Humps', 250, 12), ('Gone Going', 260, 12),
			('Who Knew', 180, 13),
			('3 a.m.', 190, 14), ('Bagpipes From Baghdad', 200, 14),
			('Story Of A Lonely Guy', 220, 15), ('Reckless Abandon', 250, 15),
			('Wishing Well', 200, 16), ('MH 4.18.2011', 210, 16);

INSERT INTO collections (collection_name, year_produced)
     VALUES ('Halftime is Game Time', 2022),
			('Hits From Her', 2016),
			('smells like the 90`s', 2022), ('Rock Hits 90s', 2021),
			('Rockklassiker', 2021),
			('Creed III The Ultimate Hip Hop Playlist', 2014),
			('Pump It 2020', 2020),
			('I Died For This!?', 2015),
			('Happy Hits 2022', 2022);
		
INSERT INTO artists_albums (id_artist, id_album)
     VALUES (1, 1), (1, 2), (2,3), (2, 4), (3, 5), (3, 6), (4, 7), (4, 8), 
		(5, 9), (5, 10), (6, 11), (6, 12), (7, 13), (7, 14), (8, 15), (8, 16);

INSERT INTO tracks_collections (id_collection, id_track)
     VALUES (1, 1), (2, 2), (3, 3), (3, 4), (4, 4), (5, 6), (6, 7), (7, 16), (8, 10), (8, 3), (9, 20);

--For HW 4 "Продвинутая выборка данных"
INSERT INTO styles_artists (id_style, id_artist)
     VALUES (2, 3), (4, 5), (3,6);
		
UPDATE albums
   SET year_produced = 2019
 WHERE album_name = 'Ghosttown';

INSERT INTO artists_albums (id_artist, id_album)
	 VALUES (7, 1), (2, 7);
		
INSERT INTO artists_albums (id_artist, id_album)
	 VALUES (2, 2);
	

UPDATE tracks 
   SET duration = 180
 WHERE track_name IN ('Hit That', 'Wishing Well');


