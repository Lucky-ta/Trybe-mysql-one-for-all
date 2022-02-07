SELECT 
    artista AS 'artista', album AS 'album'
FROM
    SpotifyClone.Artista AS a
        INNER JOIN
    SpotifyClone.Album AS al ON a.artista_id = al.artista_id
WHERE
    artista = 'Walter Phoenix'
ORDER BY album;