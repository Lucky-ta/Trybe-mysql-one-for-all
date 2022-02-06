DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.Planos(
	plano_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    plano VARCHAR(30) NOT NULL,
    valor_plano DOUBLE NOT NULL
) ENGINE innoDB;

CREATE TABLE SpotifyClone.Artista(
	artista_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    artista VARCHAR(60) NOT NULL
) ENGINE innoDB;

CREATE TABLE SpotifyClone.Usuario(
	usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    usuario VARCHAR(60) NOT NULL,
    idade INT NOT NULL,
    data_assinatura DATE,
    plano_id INT,
    FOREIGN KEY (plano_id) REFERENCES Planos(plano_id)
) ENGINE innoDB;

CREATE TABLE SpotifyClone.Album(
	album_id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(60) NOT NULL,
    artista_id INT,
    ano_de_lancamento YEAR NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES Artista(artista_id)
) ENGINE innoDB;

CREATE TABLE SpotifyClone.cancao(
	cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    cancao VARCHAR(60) NOT NULL,
    album_id INT,
    artista_id INT,
    duracao_segundos INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Album(album_id),
    FOREIGN KEY (artista_id) REFERENCES Artista(artista_id)
) ENGINE innoDB;


CREATE TABLE SpotifyClone.historico_de_reproducoes(
    usuario_id INT,
    cancao_id INT,
    data_reproducao DATE NOT NULL,
    hora_reproducao TIME NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancao(cancao_id),
    PRIMARY KEY (usuario_id, cancao_id)
) ENGINE innoDB;

CREATE TABLE SpotifyClone.usuario_segue(
	usuario_id INT,
    artista_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES Artista(artista_id),
    PRIMARY KEY (usuario_id, artista_id)
) ENGINE innoDB;




INSERT INTO SpotifyClone.Planos (plano, valor_plano)
	VALUES
		('gratuito', 0),
        ('universitario', 5.99),
        ('pessoal', 6.99),
        ('familiar', 7.99);
        

INSERT INTO SpotifyClone.Artista (artista)
	VALUES 
		('Walter Phoenix'),
		('Peter Strong'),
		('Lance Day'),
		('Freedie Shannon'),
		('Tyler Isle'),
		('Fog');

INSERT INTO SpotifyClone.Usuario (usuario, idade, data_assinatura, plano_id)
	VALUES
		('Thati', 23, '2019-10-20', 1),
        ('Cintia', 35, '2017-12-30', 4),
        ('Bill', 20, '2019-06-05', 2),
        ('Roger', 45, '2020-05-13', 3),
        ('Norman', 58, '2017-02-17', 3),
        ('Patrick', 33, '2017-01-06', 4),
        ('Vivian', 26, '2018-01-05', 2),
        ('Carol', 19, '2018-02-14', 2),
        ('Angelina', 42, '2018-04-29', 4),
        ('Paul', 46, '2017-01-17', 4);

INSERT INTO SpotifyClone.Album (album, artista_id, ano_de_lancamento)
	VALUES
	('Envious', 1, 1990),
    ('Exuberant', 1, 1993),
    ('Hallowed Steam', 2, 1995),
    ('Incandescent', 3, 1998),
    ('Temporary Culture', 4, 2001),
    ('Library of liberty', 4, 2003),
    ('Chained Down', 5, 2007),
    ('Cabinet of fools', 5, 2012),
    ('No guarantees', 5, 2015),
    ('Apparatus', 5, 2015);

INSERT INTO SpotifyClone.cancao (cancao, album_id, artista_id, duracao_segundos)
	VALUES
	('Soul For Us', 1, 1, 200),
    ('Reflections Of Magic', 1, 1, 163),
    ('Dance With Her Own', 1, 1, 116),
    ('Troubles Of My Inner Fire', 2, 1, 203),
    ('Time Fireworks', 2, 1, 152),
    ('Magic Circus', 3, 2, 105),
    ('Honey, So Do I', 3, 2, 207),
    ("Sweetie, Let's Go Wild", 3, 2, 139),
    ('She Knows', 3, 2, 244),
    ('Fantasy For Me', 4, 3, 100),
    ('Celebration Of More', 4, 3, 146),
    ('Rock His Everything', 4, 3, 223),
    ('Home Forever', 4, 3, 231),
    ('Diamond Power', 4, 3, 241),
    ("Let's Be Silly", 4, 3, 132),
    ('Thang Of Thunder', 5, 4, 240),
    ('Words Of Her Life', 5, 4, 185),
    ('Without My Streets', 5, 4, 176),
    ('Need Of The Evening', 6, 4, 190),
    ('History Of My Roses', 6, 4, 222),
    ('Without My Love', 6, 4, 111),
    ('Walking And Game', 6, 4, 123),
    ('Young And Father', 6, 4, 197),
    ('Finding My Traditions', 7, 5, 179),
    ('Walking And Man', 7, 5, 229),
    ('Hard And Time', 7, 5, 135),
    ("Honey, I'm A Lone Wolf", 7, 5, 150),
    ("She Thinks I Won't Stay Tonight", 8, 5, 166),
    ("He Heard You're Bad For Me", 8, 5, 154),
    ("He Hopes We Can't Stay", 8, 5, 210),
    ('I Know I Know', 8, 5, 117),
    ("He's Walking Away", 9, 5, 159),
    ("He's Trouble", 9, 5, 138),
    ('I Heard I Want To Bo Alone', 9, 5, 120),
    ('I Ride Alone', 9, 5, 151),
    ('Honey', 10, 6, 79),
    ('You Cheated On Me', 10, 6, 95),
    ("Wouldn't It Be Nice", 10, 6, 213),
    ('Baby', 10, 6, 136),
    ('You Make Me Feel So..', 10, 6, 83);

INSERT INTO SpotifyClone.usuario_segue (usuario_id, artista_id)
	VALUES
	(1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 3),
    (6, 1),
    (7, 2),
    (7, 5),
    (8, 1),
    (8, 5),
    (9, 6),
    (9, 4),
    (9, 3),
    (10, 2),
    (10, 6);

INSERT INTO SpotifyClone.historico_de_reproducoes (cancao_id, usuario_id, data_reproducao, hora_reproducao)
	VALUES 
	(36, 1, '2020-02-28', '10:45:55'),
    (25, 1, '2020-05-02', '05:30:35'),
    (23, 1, '2020-03-06', '11:22:33'),
    (14, 1, '2020-08-05', '08:05:17'),
    (15, 1, '2020-09-14', '16:32:22'),
    (34, 2, '2020-01-02', '07:40:33'),
	(24, 2, '2020-05-16', '06:16:22'),
	(21, 2, '2020-10-09', '12:27:48'),
	(39, 2, '2020-09-21', '13:14:46'),
	(6, 3, '2020-11-13', '16:55:13'),
	(3, 3, '2020-12-05', '18:38:30'),
	(26, 3, '2020-07-30', '10:00:00'),
	(2, 4, '2021-08-15', '17:10:10'),
	(35, 4, '2021-07-10', '15:20:30'),
	(27, 4, '2021-01-09', '01:44:33'),
	(7, 5, '2020-07-03', '19:33:28'),
	(12, 5, '2017-02-24', '21:14:22'),
	(14, 5, '2020-08-06', '15:23:43'),
	(1, 5, '2020-11-10', '13:52:27'),
	(38, 6, '2019-02-07', '20:33:48'),
	(29, 6, '2017-01-24', '00:31:17'),
	(30, 6, '2017-10-12', '12:35:20'),
	(22, 6, '2018-05-29', '14:56:41'),
	(5, 7, '2018-05-09', '22:30:49'),
	(4, 7, '2020-07-27', '12:52:58'),
	(11, 7, '2018-01-16', '18:40:43'),
	(39, 8, '2018-03-21', '16:56:40'),
	(40, 8, '2020-10-18', '13:38:05'),
	(32, 8, '2019-05-25', '08:14:03'),
	(33, 8, '2021-08-15', '21:37:09'),
	(16, 9, '2021-05-24', '17:23:45'),
	(17, 9, '2018-12-07', '22:48:52'),
	(8, 9, '2021-03-14', '06:14:26'),
	(9, 9, '2020-04-01', '03:36:00'),
	(20, 10, '2017-02-06', '08:21:34'),
	(21, 10, '2017-12-04', '05:33:43'),
	(12, 10, '2017-07-27', '05:24:49'),
	(13, 10, '2017-12-25', '01:03:57');
