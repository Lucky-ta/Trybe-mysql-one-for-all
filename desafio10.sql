SELECT 
    c.cancao AS 'nome', COUNT(h.cancao_id) AS 'reproducoes'
FROM
    SpotifyClone.cancao AS c
        INNER JOIN
    SpotifyClone.historico_de_reproducoes AS h ON c.cancao_id = h.cancao_id
        INNER JOIN
    SpotifyClone.Usuario AS u ON u.usuario_id = h.usuario_id
        INNER JOIN
    SpotifyClone.Planos AS p ON p.plano_id = u.plano_id
WHERE
    p.plano = 'gratuito'
        OR plano = 'pessoal'
GROUP BY nome
ORDER BY nome;