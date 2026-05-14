-- Spotify Project: https://www.youtube.com/watch?v=nHjIsKZ79-M

-- Medium Level
-- 1.Calculate the average danceability of tracks in each album.
SELECT Album, 
       AVG(Danceability) AS avg_danceability
FROM spotify
GROUP BY Album
order by 2 desc

-- Answer: 11,799 albums calculated with top avg_danceability 
-- FOR CERTAIN (Deluxe)	0.975000023841858

-- 2. Find the top 5 tracks with the highest energy values.
SELECT TOP 5 
       Track, 
       MAX(EnergyLiveness) AS Max_EnergyLiveness
FROM spotify
GROUP BY Track
ORDER BY Max_EnergyLiveness DESC

-- Answer: Take It	59.1139259338379
-- Verano Azul	58
-- Salvavidas	57.6551742553711
-- Ants Marching	54.5222930908203
-- Eres Mi Sueño - Versión Radio Edit	51.3812141418457

-- 3.List all tracks along with their views and likes where official_video = TRUE.
SELECT Track, 
       SUM(Views) AS total_views, 
       SUM(Likes) AS total_likes
FROM spotify
WHERE official_video = 1
GROUP BY Track


-- For Top 5 
SELECT TOP 5
       Track, 
       SUM(Views) AS total_views, 
       SUM(Likes) AS total_likes
FROM spotify
WHERE official_video = 1
GROUP BY Track
ORDER BY total_views DESC

-- Answer: 13,537 song tracks with official_video

-- 4. For each album, calculate the total views of all associated tracks.
SELECT Album, Track, SUM(Views) AS total_views
FROM spotify
GROUP BY Album, Track
Order by total_views desc

-- Answer: 18,668 albums with all associated tracks and total views

--5. Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT Track,
       SUM(CASE WHEN most_playedon = 'Youtube' THEN Stream ELSE 0 END) AS streamed_on_youtube,
       SUM(CASE WHEN most_playedon = 'Spotify' THEN Stream ELSE 0 END) AS streamed_on_spotify
FROM spotify
GROUP BY Track

SELECT *
FROM (
    SELECT Track,
           COALESCE(SUM(CASE WHEN most_playedon = 'Youtube' THEN Stream ELSE 0 END), 0) AS streamed_on_youtube,
           COALESCE(SUM(CASE WHEN most_playedon = 'Spotify' THEN Stream ELSE 0 END), 0) AS streamed_on_spotify
    FROM spotify
    GROUP BY Track
) AS t1
WHERE streamed_on_spotify > streamed_on_youtube
  AND streamed_on_youtube <> 0

-- Answer: 185 songs performing well on Spotify than Youtube

---------------------------------------------------------------------