SELECT 
    a.artista AS 'artista',
    b.album AS 'album',
    COUNT(us.artista_id) AS 'seguidores'
FROM
    SpotifyClone.Artista AS a
        INNER JOIN
    SpotifyClone.Album AS b ON a.artista_id = b.artista_id
        INNER JOIN
    SpotifyClone.usuario_segue AS us ON us.artista_id = b.artista_id
GROUP BY artista , b.album
ORDER BY seguidores DESC , artista, album
;