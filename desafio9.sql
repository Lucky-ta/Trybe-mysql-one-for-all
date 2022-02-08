SELECT 
    COUNT(usuario) AS 'quantidade_musicas_no_historico'
FROM
    SpotifyClone.Usuario AS u
        INNER JOIN
    SpotifyClone.historico_de_reproducoes AS h ON u.usuario_id = h.usuario_id
WHERE
    usuario = 'Bill';