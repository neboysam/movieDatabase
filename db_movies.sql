-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Feb 17, 2020 at 02:32 PM
-- Server version: 10.3.14-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_movies`
--

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
CREATE TABLE IF NOT EXISTS `artists` (
  `id_artist` int(11) NOT NULL AUTO_INCREMENT,
  `lastname_artist` varchar(45) DEFAULT NULL,
  `firstname_artist` varchar(45) DEFAULT NULL,
  `birth_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_artist`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id_artist`, `lastname_artist`, `firstname_artist`, `birth_date`) VALUES
(1, 'Kubrick', 'Stanley', '1928'),
(2, 'Miyazaki', 'Hayao', '1941'),
(3, 'Anno', 'Hideaki', '1960'),
(4, 'Takimoto', 'Miori', '1991'),
(5, 'Nishijima', 'Hidetoshi', '1971'),
(6, 'Tyldum', 'Morten', '1976'),
(7, 'Cumberbatch', 'Benedict', '1976'),
(8, 'Knightley', 'Keira', '1985'),
(9, 'Goode', 'Matthew', '1978'),
(10, 'Duellea', 'Keir', '1936'),
(11, 'Lockwood', 'Gary', '1937'),
(12, 'Sylvester', 'William', '1922'),
(13, 'Howitt', 'Peter', '1957'),
(14, 'Atkinson', 'Rowan', '1955'),
(15, 'Imbruglia', 'Natalie', '1975'),
(16, 'Miller', 'Ben', '1966'),
(17, 'Parker', 'Oliver', '1960'),
(18, 'Kerr', 'David', '1967'),
(19, 'Rosamund', 'Pike', '1979'),
(20, 'Kaluuya', 'Daniel', '1989'),
(21, 'Kurylenko', 'Olga', '1979'),
(22, 'Davis', 'Andrew', '1946'),
(23, 'Ford', 'Harrison', '1942'),
(24, 'Tommy Lee', 'Jones', '1946'),
(25, 'Ward', 'Sela', '1956'),
(26, 'Hess', 'Jared', '1979'),
(27, 'Black', 'Jack', '1969'),
(28, 'de la Reguera', 'Ana', '1977'),
(29, 'Jiménew', 'Héctor', '1973'),
(30, 'Woo', 'John', '1946'),
(31, 'Travolta', 'John', '1954'),
(32, 'Cage', 'Nicolas', '1964'),
(33, 'Allen', 'Joan', '1956');

-- --------------------------------------------------------

--
-- Table structure for table `artists_movies`
--

DROP TABLE IF EXISTS `artists_movies`;
CREATE TABLE IF NOT EXISTS `artists_movies` (
  `id_artist` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL,
  `id_uniq` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_artist`,`id_movie`),
  UNIQUE KEY `artists_movies_column_3_uindex` (`id_uniq`),
  KEY `fk_artiste_has_film_film1_idx` (`id_movie`),
  KEY `fk_artiste_has_film_artiste1_idx` (`id_artist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artists_movies`
--

INSERT INTO `artists_movies` (`id_artist`, `id_movie`, `id_uniq`) VALUES
(3, 1, 31),
(4, 1, 41),
(5, 1, 51),
(7, 3, 73),
(8, 3, 83),
(9, 3, 93),
(10, 2, 102),
(11, 2, 112),
(12, 2, 122),
(14, 4, 144),
(14, 5, 145),
(14, 6, 146),
(15, 4, 154),
(16, 4, 164),
(16, 6, 166),
(19, 5, 195),
(20, 5, 205),
(21, 6, 216),
(23, 7, 237),
(24, 7, 247),
(25, 7, 257),
(27, 8, 278),
(28, 8, 288),
(29, 8, 298),
(31, 9, 319),
(32, 9, 329),
(33, 9, 339);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `release_year` int(11) DEFAULT NULL,
  `poster` varchar(250) DEFAULT NULL,
  `synposis` text DEFAULT NULL,
  `genre_id` int(11) NOT NULL,
  `director_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`,`director_id`),
  KEY `fk_film_genre1_idx` (`genre_id`),
  KEY `fk_film_artiste1_idx` (`director_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `release_year`, `poster`, `synposis`, `genre_id`, `director_id`) VALUES
(1, 'The Wind Rises', 2013, 'le_vent_se_leve.jpg', 'A lifelong love of flight inspires Japanese aviation engineer Jiro Horikoshi (Hideaki Anno), whose storied career includes the creation of the A6M World War II fighter plane.', 6, 2),
(2, '2001: A Space Odyssey', 1968, '2001_odysee_de_l_espace.jpg', 'An imposing black structure provides a connection between the past and the future in this enigmatic adaptation of a short story by revered sci-fi author Arthur C. Clarke. When Dr. Dave Bowman (Keir Dullea) and other astronauts are sent on a mysterious mission', 1, 1),
(3, 'The Imitation Game', 2014, 'imitation_game.jpg', 'In 1939, newly created British intelligence agency MI6 recruits Cambridge mathematics alumnus Alan Turing (Benedict Cumberbatch) to crack Nazi codes, including Enigma -- which cryptanalysts had thought unbreakable. Turing\'s team, including Joan Clarke (Keira Knightley), analyze Enigma messages while he builds a machine to decipher them. Turing and team finally succeed and become heroes, but in 1952, the quiet genius encounters disgrace when authorities reveal he is gay and send him to prison.\n', 5, 6),
(4, 'Johnny English', 2003, 'johnny_english.jpg', 'Pascal Sauvage (John Malkovich), a villain intent on stealing Britain\'s Crown Jewels, has murdered the country\'s top undercover agents, and mediocre spy Johnny English (Rowan Atkinson) is ordered to prevent further mayhem. But even with help from quick-thinking sidekick Bough (Ben Miller), the goofy agent lands himself in one precarious situation after another. Only when he meets up with Interpol crime-fighter Lorna Campbell (Natalie Imbruglia) is Johnny able to chip away at Pascal\'s defenses.', 3, 13),
(5, 'Johnny English Reborn', 2011, 'johnny_english_contre_attaque.jpg', 'After a disastrous mission in Mozambique', 3, 17),
(6, 'Johnny English Strikes Again', 2018, 'johnny_english_le_retour.jpg', 'The new adventure begins when a cyberattack reveals the identities of all active undercover agents in Britain, leaving Johnny English as the secret service\'s last hope. Called out of retirement, English dives headfirst into action with the mission to find the mastermind hacker. As a man with few skills and analogue methods, Johnny English must overcome the challenges of modern technology to make this mission a success.', 3, 18),
(7, 'The Fugitive', 1993, 'le_fugitif.jpg', 'Wrongfully accused of murdering his wife, Richard Kimble (Harrison Ford) escapes from the law in an attempt to find her killer and clear his name. Pursuing him is a team of U.S. marshals led by Deputy Samuel Gerard (Tommy Lee Jones), a determined detective who will not rest until Richard is captured. As Richard leads the team through a series of intricate chases, he discovers the secrets behind his wife\'s death and struggles to expose the killer before it is too late.', 2, 22),
(8, 'Nacho Libre', 2006, 'nacho_libre.jpg', 'Ignacio\'s parents were a Scandinavian Lutheran missionary and a Mexican deacon, who both died when Ignacio was a baby. Now a cook for the Oaxaca monastery orphanage where he was raised, Ignacio dreams of becoming a luchador, but wrestling is strictly forbidden by the monastery as it is a sin of vanity.', 3, 26),
(9, 'Face/Off', 1997, 'volte_face.jpg', 'Obsessed with bringing terrorist Castor Troy (Nicolas Cage) to justice, FBI agent Sean Archer (John Travolta) tracks down Troy, who has boarded a plane in Los Angeles. After the plane crashes and Troy is severely injured, possibly dead, Archer undergoes surgery to remove his face and replace it with Troy\'s. As Archer tries to use his disguise to elicit information about a bomb from Troy\'s brother, Troy awakes from a coma and forces the doctor who performed the surgery to give him Archer\'s face.\n', 2, 30);

-- --------------------------------------------------------

--
-- Table structure for table `movie_genres`
--

DROP TABLE IF EXISTS `movie_genres`;
CREATE TABLE IF NOT EXISTS `movie_genres` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie_genres`
--

INSERT INTO `movie_genres` (`id_genre`, `genre`) VALUES
(1, 'Science-fiction'),
(2, 'Action'),
(3, 'Comedy'),
(4, 'Romance'),
(5, 'Historical fiction'),
(6, 'Animation');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artists_movies`
--
ALTER TABLE `artists_movies`
  ADD CONSTRAINT `fk_artiste_has_film_artiste1` FOREIGN KEY (`id_artist`) REFERENCES `artists` (`id_artist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_artiste_has_film_film1` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `fk_film_artiste1` FOREIGN KEY (`director_id`) REFERENCES `artists` (`id_artist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_film_genre1` FOREIGN KEY (`genre_id`) REFERENCES `movie_genres` (`id_genre`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
