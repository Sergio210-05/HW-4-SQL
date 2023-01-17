--1. Artists quantity in each style
   SELECT style_name, COUNT(id_artist) FROM styles st
		  LEFT JOIN styles_artists sa ON st.id_style = sa.id_style
 	GROUP BY st.style_name;

--2.1 Total tracks in 2019-2020
   SELECT COUNT(id_track) FROM tracks t 
		  JOIN albums a ON t.id_album = a.id_album
    WHERE year_produced BETWEEN 2019 AND 2020 
    
--2.2 Tracks in 2019 and 2020 (per each year)
   SELECT year_produced, COUNT(id_track) FROM tracks t 
		  JOIN albums a ON t.id_album = a.id_album
    WHERE year_produced BETWEEN 2019 AND 2020
 GROUP BY year_produced;
 
--3. Average track duration in album
  SELECT album_name, AVG(duration) FROM albums a 
		 JOIN tracks t ON a.id_album = t.id_album 
GROUP BY album_name;

--4. Artists who have released no albums in 2020 
SELECT DISTINCT artist_name FROM artists a 
 WHERE artist_name NOT IN (SELECT artist_name FROM artists a
								  JOIN artists_albums aa ON a.id_artist = aa.id_artist 
								  JOIN albums a2 ON aa.id_album = a2.id_album 
						    WHERE a2.year_produced = 2020);

/*--CHECKING
SELECT album_name, year_produced, artist_name FROM albums a 
JOIN artists_albums aa ON a.id_album = aa.id_album 
JOIN artists a3 ON aa.id_artist = a3.id_artist;
*/

--5. Collection title with selected artist
SELECT DISTINCT  collection_name FROM collections c 
	   JOIN tracks_collections tc ON c.id_collection = tc.id_collection 
	   JOIN tracks t ON tc.id_track = t.id_track 
	   JOIN albums a ON t.id_album = a.id_album 
	   JOIN artists_albums aa ON a.id_album = aa.id_album 
	   JOIN artists a2 ON aa.id_artist = a2.id_artist 
 WHERE artist_name = 'Lady Gaga'
--('Madonna'), ('Lady Gaga'), ('The Offspring'), ('Bon Jovi'), ('50 cent'), ('Black Eyed Peas'), ('Eminem'), ('Blink-182');

/*--CHECKING
SELECT track_name, artist_name, collection_name FROM tracks t 
JOIN albums a ON t.id_album = a.id_album 
JOIN artists_albums aa ON a.id_album = aa.id_album 
JOIN artists a2 ON aa.id_artist = a2.id_artist 
JOIN tracks_collections tc ON t.id_track = tc.id_track 
JOIN collections c ON tc.id_collection = c.id_collection 
*/

--6. Album title with several styles artists
SELECT a.album_name--, artist_name, s.style_name, COUNT(DISTINCT artist_name) count_ar, COUNT(DISTINCT style_name) count_st
FROM albums a 
	   JOIN artists_albums aa ON a.id_album = aa.id_album 
	   JOIN artists a2 ON aa.id_artist = a2.id_artist
	   JOIN styles_artists sa ON a2.id_artist  = sa.id_artist
	   JOIN styles s ON sa.id_style = s.id_style
GROUP BY DISTINCT a.album_name--, artist_name, s.style_name
HAVING COUNT(DISTINCT style_name) > 1
ORDER BY album_name;

/*--CHECKING
SELECT album_name, artist_name, COUNT(artist_name), style_name FROM albums a 
JOIN artists_albums aa ON a.id_album = aa.id_album 
JOIN artists a2 ON aa.id_artist = a2.id_artist
JOIN styles_artists sa ON a2.id_artist  = sa.id_artist
JOIN styles s ON sa.id_style = s.id_style
GROUP BY album_name, a2.artist_name, s.style_name
ORDER BY album_name;
*/

--7. Tracks without collections
SELECT track_name FROM tracks t 
 WHERE t.id_track NOT IN 
	   (SELECT id_track 
	 	  FROM tracks_collections tc);

/*--CHECKING
SELECT track_name, duration FROM tracks t 
JOIN tracks_collections tc ON t.id_track = tc.id_track 
JOIN collections c ON tc.id_collection = c.id_collection 
*/

--8. Artist who has made the least duration track
SELECT a.artist_name 
  FROM artists a  
  JOIN artists_albums aa ON a.id_artist = aa.id_artist 
  JOIN albums a2 ON aa.id_album = a2.id_album  
  JOIN tracks t ON a2.id_album = t.id_album  
 WHERE t.duration = (SELECT MIN(t2.duration) 
					   FROM tracks t2);

/*--CHECKING
  SELECT t.track_name, t.duration, a2.artist_name 
	FROM tracks t 
	JOIN albums a ON t.id_album = a.id_album 
	JOIN artists_albums aa ON a.id_album = aa.id_album 
	JOIN artists a2 ON aa.id_artist = a2.id_artist 
GROUP BY t.track_name, t.duration, a2.artist_name
ORDER BY t.duration;
*/
					  
--9. The smallest albums
SELECT a2.album_name, COUNT(t2.track_name)
  FROM albums a2 
	   LEFT JOIN tracks t2 ON a2.id_album = t2.id_album
 GROUP BY a2.album_name
HAVING COUNT(t2.track_name) = (SELECT COUNT(t.track_name)
								 FROM tracks t
   						   			  LEFT JOIN albums a ON a.id_album = t.id_album
   						     GROUP BY a.album_name 
   						  	 ORDER BY COUNT(t.track_name)
   						  	    LIMIT 1);

/*
SELECT a2.album_name, COUNT(t2.track_name)
FROM albums a2 
LEFT JOIN tracks t2 ON a2.id_album = t2.id_album
GROUP BY a2.album_name
HAVING COUNT(t2.track_name) = (SELECT MIN(m) FROM (SELECT COUNT(t.track_name)
											  FROM tracks t
   							   			 LEFT JOIN albums a ON a.id_album = t.id_album
   							   			  GROUP BY a.album_name) m);
*/
   							   			
/*--CHECKING
SELECT a.album_name, COUNT(t.track_name) 
FROM albums a 
LEFT JOIN tracks t ON a.id_album = t.id_album 
GROUP BY a.album_name
ORDER BY COUNT(t.track_name);
*/
