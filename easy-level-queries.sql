-- Spotify Project: https://www.youtube.com/watch?v=nHjIsKZ79-M

-- Easy Level
-- 1. Retrieve the names of all tracks that have more than 1 billion streams.
Select * from spotify
where Stream > 1000000000

-- Answer: 385 songs

-- 2.List all albums along with their respective artists.
Select DISTINCT  Album,Artist
from spotify
order by 1

-- Answer: 14,177 Distinct Albums with their artists

-- 3. Get the total number of comments for tracks where licensed = TRUE.
SELECT sum(Comments) AS CommentCount
FROM spotify
WHERE Licensed = 1

-- Answer: 497,023,475 Comments

-- 4.Find all tracks that belong to the album type single.
Select count(Album) as Singles
from spotify
where Album_type = 'single'

-- Answer: 4,973 total songs

-- 5.Count the total number of tracks by each artist.
Select Artist, count(*) as total_songs
from spotify
group by Artist

-- Answer: 2,074 total singers


---------------------------------------------------------------------