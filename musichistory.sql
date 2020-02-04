-- Query all of the entries in the Genre table
SELECT * FROM Genre;

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist
VALUES (NULL, 'Phil Collins', 1963);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album
VALUES (NULL, 'Face Value', '02/13/1981', 4749, 'Virgin', 28, 6);

INSERT INTO Album
VALUES (NULL, 'Both Sides', '11/08/1993', 6710, 'Virgin', 28, 2);

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song
VALUES (NULL, 'In the Air Tonight', 534, '02/13/1981', 6, 28, 23);

INSERT INTO Song
VALUES (NULL, 'This Must Be Love', 355, '02/13/1981', 6, 28, 23);

INSERT INTO Song
VALUES (NULL, 'Behind the Lines', 353, '02/13/1981', 6, 28, 23);

INSERT INTO Song
VALUES (NULL, 'The Roof Is Leaking', 316, '02/13/1981', 6, 28, 23);

INSERT INTO Song
VALUES (NULL, 'Droned', 249, '02/13/1981', 6, 28, 23);

INSERT INTO Song
VALUES (NULL, 'Hand in Hand', 520, '02/13/1981', 6, 28, 23);

INSERT INTO Song
VALUES (NULL, 'Both Sides of the Story', 642, '11/08/1993', 2, 28, 24);

INSERT INTO Song
VALUES (NULL, 'Cant Turn Back the Years', 440, '11/08/1993', 2, 28, 24);

INSERT INTO Song
VALUES (NULL, 'Everyday', 543, '11/08/1993', 2, 28, 24);

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

SELECT a.ArtistName, alb.Title AS 'Album Title', s.Title  AS 'Song Title'
FROM Song s 
LEFT JOIN Artist a 
ON s.ArtistId = a.ArtistId 
LEFT JOIN Album alb 
ON alb.AlbumId = s.AlbumId 
WHERE a.ArtistId = 28;

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT a.ArtistName, alb.Title AS 'Album Title', COUNT(s.Title)
FROM Song s 
JOIN Artist a 
ON s.ArtistId = a.ArtistId 
JOIN Album alb 
ON alb.AlbumId = s.AlbumId
GROUP BY s.AlbumId;

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT a.ArtistName, COUNT(s.Title)
FROM Song s 
JOIN Artist a 
ON s.ArtistId = a.ArtistId 
GROUP BY s.ArtistId;

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence. 

SELECT a.ArtistName, g.Label, COUNT(s.Title)
FROM Song s 
JOIN Artist a 
ON s.ArtistId = a.ArtistId 
JOIN Genre g
ON g.GenreId = s.GenreId
GROUP BY s.GenreId;

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT Title AS 'Album Title with the Max Duration', MAX(AlbumLength) AS 'Album Length'
FROM Album; 

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT Title AS 'Song Title with the Max Duration', MAX(SongLength) AS 'Song Length'
FROM Song;

-- Modify the previous query to also display the title of the album.

SELECT s.Title AS 'Song Title with the Max Duration', alb.Title AS 'Album Title', MAX(s.SongLength) AS 'Song Length'
FROM Song s
JOIN Album alb
ON  alb.AlbumId = s.AlbumId;