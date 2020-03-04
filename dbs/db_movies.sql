-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Mar 03, 2020 at 01:28 PM
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
  `image` varchar(255) NOT NULL,
  `biography` text NOT NULL,
  PRIMARY KEY (`id_artist`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id_artist`, `lastname_artist`, `firstname_artist`, `birth_date`, `image`, `biography`) VALUES
(1, 'Kubrick', 'Stanley', '1928', 'artist.png', 'Some text...'),
(2, 'Miyazaki', 'Hayao', '1941', '', ''),
(3, 'Anno', 'Hideaki', '1960', 'Hideaki_Anno.png', 'A Japanese artist, animator, anime creator, director, screenwriter, actor, producer, designer and businessperson.[1] He is best known for creating the popular anime series Neon Genesis Evangelion. His style has become defined by his incorporation of postmodernism and the extensive portrayal of characters\\\' thoughts and emotions, often through unconventional scenes presenting the mental deconstruction of those characters.\\r\\nAnno\\\'s other directorial efforts include Gunbuster (1988), Nadia: The Secret of Blue Water (1990), Kare Kano (1998), Love & Pop (1998), Shiki-Jitsu (2000), Cutie Honey (2004), Re: Cutie Honey (2004), Rebuild of Evangelion (2007–), and Shin Godzilla (2016).\\r\\nAnime directed by Anno that have won the Animage Anime Grand Prix award have been Nadia: The Secret of Blue Water in 1990, Neon Genesis Evangelion in 1995 and 1996, and The End of Evangelion in 1997.\')'),
(4, 'Takimoto', 'Miori', '1991', '', ''),
(5, 'Nishijima', 'Hidetoshi', '1971', '', ''),
(6, 'Tyldum', 'Morten', '1976', '', ''),
(7, 'Cumberbatch', 'Benedict', '1976', 'Benedict_Cumberbatch.jpg', 'Benedict Timothy Carlton Cumberbatch CBE (born 19 July 1976) is an English actor. A graduate of the Victoria University of Manchester, he continued his training at the London Academy of Music and Dramatic Art, obtaining a Master of Arts in Classical Acting. He first performed at the Open Air Theatre, Regent\\\'s Park in Shakespearean productions and made his West End debut in Richard Eyre\\\'s revival of Hedda Gabler in 2005. Since then, he has starred in the Royal National Theatre productions After the Dance (2010) and Frankenstein (2011). In 2015, he played William Shakespeare\\\'s Hamlet at the Barbican Theatre.\\r\\nCumberbatch\\\'s television work includes appearances in Silent Witness (2002) and Fortysomething (2003) before playing Stephen Hawking in the television film Hawking in 2004. He has starred as Sherlock Holmes in the series Sherlock since 2010. He has also headlined Tom Stoppard\\\'s adaptation of Parade\\\'s End (2012), The Hollow Crown: The Wars of the Roses (2016) and Patrick Melrose (2018).'),
(8, 'Knightley', 'Keira', '1985', '', ''),
(9, 'Goode', 'Matthew', '1978', 'Matthew_Goode.jpg', 'Matthew William Goode (born 3 April 1978) is an English actor. He made his screen debut in 2002 with ABC\\\'s TV film feature Confessions of an Ugly Stepsister. His breakthrough role was in the romantic comedy, Chasing Liberty (2004), for which he received a nomination at Teen Choice Awards for Choice Breakout Movie Star – Male. He then appeared in a string of supporting roles in films like Woody Allen\\\'s Match Point (2005), the German-British romantic comedy Imagine Me and You (2006), and the period drama Copying Beethoven (2006). He won praise for his performance as Charles Ryder in Julian Jarrold\\\'s adaptation of Evelyn Waugh\\\'s Brideshead Revisited (2008), and as Ozymandias in the American neo-noir superhero film Watchmen (2009), based on DC Comics\\\' limited series of the same name. He then starred in romantic comedy Leap Year (2010) and Australian drama Burning Man (2011), the latter earning him a nomination for Best Actor at the Film Critics Circle of Australia Awards.'),
(10, 'Duellea', 'Keir', '1936', 'Keir_Dullea.jpg', 'Keir Atwood Dullea (/ˈkɪər dʊˈleɪ/; born May 30, 1936) is an American actor[1] best known for his portrayals of astronaut David Bowman in the 1968 film 2001: A Space Odyssey and its 1984 sequel, 2010: The Year We Make Contact. His other film roles include Bunny Lake Is Missing (1965) and Black Christmas (1974).[2] He studied acting at the Neighborhood Playhouse School of the Theatre in New York City.\\r\\nDullea has also had a long and successful career on stage in New York City and in regional theaters; he has stated that, despite being more recognized for his film work, he prefers the stage.\\r\\nIn 1968, he appeared as astronaut David Bowman in Stanley Kubrick\\\'s film 2001: A Space Odyssey,[16] which became a box-office success and is recognized by critics, filmmakers, and audiences as one of the greatest and most influential films ever made. His line \\\"Open the pod bay doors please, HAL\\\" is #78 on the American Film Institute\\\'s list of 100 movie quotes.\')'),
(11, 'Lockwood', 'Gary', '1937', '', ''),
(12, 'Sylvester', 'William', '1922', '', ''),
(13, 'Howitt', 'Peter', '1957', 'Peter_Howitt.jpg', 'Howitt was born on May 5, 1957, the son of Frank Howitt, a renowned Fleet Street journalist.\\r\\nHowitt grew up in Eltham, London and Bromley, Kent. He was educated at Wyborne Primary School in New Eltham and Colfe\\\'s Grammar School in Lee, South London. While in Eltham he was a member of the Priory Players amateur dramatics group. Howitt spent a brief time at Paisley Grammar School in Paisley, Scotland in 1970. He studied at the Drama Studio London in 1976.\\r\\nHowitt\\\'s first notable TV role was in the 1984–85 series of Yorkshire Television\\\'s long-running programme for schools How We Used To Live, where he starred alongside Brookside actress Sue Jenkins. However, he is much better known for playing Joey Boswell in the BBC TV series Bread. In 1998, he wrote and directed his first film, Sliding Doors (1998). Since then, he has directed several films, including Antitrust (2001), Johnny English (2003), Laws of Attraction (2004), and Dangerous Parking (2008).'),
(14, 'Atkinson', 'Rowan', '1955', 'Rowan_Atkinson.jpg', 'Rowan Sebastian Atkinson CBE (born 6 January 1955) is an English actor, comedian and writer. He is best known for his work on the sitcoms Blackadder (1983–1989) and Mr. Bean (1990–1995). Atkinson first came to prominence in the BBC\\\'s sketch comedy show Not the Nine O\\\'Clock News (1979–1982), receiving the 1981 BAFTA for Best Entertainment Performance, and via his participation in The Secret Policeman\\\'s Ball (1979). His other work includes the James Bond film Never Say Never Again (1983), playing a bumbling vicar in Four Weddings and a Funeral (1994), voicing the red-billed hornbill Zazu in The Lion King (1994), and playing jewellery salesman Rufus in Love Actually (2003). He also featured in the BBC sitcom The Thin Blue Line (1995–1996). His work in theatre includes the 2009 West End revival of the musical Oliver!.'),
(15, 'Imbruglia', 'Natalie', '1975', 'Natalie_Imbruglia.jpg', 'Natalie Jane Imbruglia (/ɪmˈbruːliə/ im-BROO-lee-ə, Italian: [imˈbruʎʎa]; born 4 February 1975) is an Australian-British singer-songwriter, model and actress. In the early 1990s, she played Beth Brennan in the Australian soap opera Neighbours. Three years after leaving the programme, she began a singing career with her chart-topping cover of Ednaswap\\\'s song \\\"Torn\\\".\\r\\nHer subsequent album, Left of the Middle (1997), sold 7 million copies worldwide. Imbruglia\\\'s five subsequent albums have combined sales of 3 million copies worldwide, and her accolades include eight ARIA Awards, two Brit Awards, one Billboard Music Award, and three Grammy nominations.\\r\\nImbruglia has appeared in several films, including the 2003 release Johnny English and the 2009 Australian indie film Closed for Winter. She has modelled for several brands, such as L\\\'Oreal, Gap, and Kailis.'),
(16, 'Miller', 'Ben', '1966', '', ''),
(17, 'Parker', 'Oliver', '1960', '', ''),
(18, 'Kerr', 'David', '1967', '', ''),
(19, 'Rosamund', 'Pike', '1979', '', ''),
(20, 'Kaluuya', 'Daniel', '1989', '', ''),
(21, 'Kurylenko', 'Olga', '1979', '', ''),
(22, 'Davis', 'Andrew', '1946', 'Davis_Andrews.jpg', 'Davis is best known as a big budget Hollywood filmmaker. His film The Fugitive starring Harrison Ford and Tommy Lee Jones received seven Academy Award nominations including Best Picture in 1993. Jones received a nomination and won for best supporting actor that year, which is his only Oscar win to date. The Academy ultimately gave the 1993 Best Picture award to Schindler\\\'s List. That year Davis was also honored with a Golden Globe nomination for Best Director by the Hollywood Foreign Press. The Directors Guild of America nominated him for Outstanding Directorial Achievement in Theatrical Direction.\\r\\nRoger Ebert reviewed The Fugitive in 1993, he begins his review with, \\\"Andrew Davis\\\' The Fugitive is one of the best entertainments of the year, a tense, taut and expert thriller that becomes something more than that, an allegory about an innocent man in a world prepared to crush him.\"'),
(23, 'Ford', 'Harrison', '1942', 'Harrison_Ford.jpg', 'Harrison Ford (born July 13, 1942)[1] is an American actor, aviator, and environmental activist. He gained worldwide fame for his starring role as Han Solo in the original Star Wars Trilogy (1977–1983), eventually reprising the role decades later in the sequel trilogy (2015–2019). Ford is also widely known for his portrayal of Indiana Jones in the Indiana Jones film franchise and as Tom Clancy\\\'s Jack Ryan in the spy thrillers Patriot Games (1992) and Clear and Present Danger (1994).\\r\\n\\r\\nFilm critic Roger Ebert described Ford as \\\"the great modern movie everyman\\\".[2] His career spans six decades and includes roles in many highly successful Hollywood films. Seven films starring Ford have been inducted into the United States National Film Registry: American Graffiti (1973), The Conversation (1974), Star Wars (1977), Apocalypse Now (1979), The Empire Strikes Back (1980), Raiders of the Lost Ark (1981), and Blade Runner (1982).'),
(24, 'Tommy Lee', 'Jones', '1946', '', ''),
(25, 'Ward', 'Sela', '1956', '', ''),
(26, 'Hess', 'Jared', '1979', 'Jared_Hess.jpg', 'Jared Lawrence Hess (born July 18, 1979) and Jerusha Elizabeth Hess (née Demke; born May 12, 1980) are husband-and-wife American filmmakers known for their work on Napoleon Dynamite (2004), Nacho Libre (2006) and Gentlemen Broncos (2009), all of which they co-wrote and which were directed by Jared Hess (Nacho Libre was co-written with Mike White). They also produced music videos for The Postal Service\\\'s third single, \\\"We Will Become Silhouettes\\\", and The Killers\\\' Christmas charity single \\\"Boots\\\".\\r\\nJerusha was born in Omaha, Nebraska and Jared was born in Glendale, Arizona. Jared is a graduate of Burton Elementary School located in Kaysville, Utah and attended Burton Elementary while living in Fruit Heights during his youth. He also attended Manhattan High School in Kansas for two years, before transferring to Preston High School, from which he graduated in 1997.'),
(27, 'Black', 'Jack', '1969', 'Jack_Black.jpg', 'Thomas Jacob, \"Jack\" Black[1] (born August 28, 1969) is an American actor, comedian, singer, musician, songwriter, and YouTuber. He is known for his roles in films such as High Fidelity (2000), Shallow Hal (2001), School of Rock (2003), King Kong (2005), Tenacious D in the Pick of Destiny (2006), The Holiday (2006), the Kung Fu Panda franchise (2008–2016), Tropic Thunder (2008), Gulliver\\\'s Travels (2010), Bernie (2011), Goosebumps (2015), Jumanji: Welcome to the Jungle (2017) and its sequel, Jumanji: The Next Level (2019). For his work in School of Rock and Bernie, he gained Golden Globe nominations, and was inducted into Hollywood\\\'s Walk of Fame in 2018.\\r\\nOutside of acting, Black is the lead vocalist of the Grammy Award-winning comedic rock duo Tenacious D, which he formed in 1994 with Kyle Gass. They have released the albums Tenacious D, The Pick of Destiny, Rize of the Fenix, and Post-Apocalypto. In December 2018, Black launched his YouTube channel Jablinski Games.'),
(28, 'de la Reguera', 'Ana', '1977', 'Ana_de_la_Reguera.jpg', 'Reguera\'s acting career began with her role in the telenovela Azul (1996) followed by Pueblo chico, infierno grande (1997), with Verónica Castro, for which she received the Heraldo award for best female acting, and Desencuentro which was her third telenovela under the direction of Ernesto Alonso.\\r\\nTentaciones (1998) marked her beginning with the production company Argos Comunicación. She was immediately offered a role in Tentaciones and Todo por amor, for which she received the Palmas de or award.\\r\\nCara o Cruz was the first telenovela co-production between Argos Comunicación and Telemundo. Reguera played María Salome in the successful telenovela Gitanas.\\r\\n30 October 2014. Fenix Awards ceremony on Mexico City.\\r\\nIn 2014 Reguera booked a role in the Netflix crime drama Narcos.'),
(29, 'Jiménew', 'Héctor', '1973', '', ''),
(30, 'Woo', 'John', '1946', '', ''),
(31, 'Travolta', 'John', '1954', '', ''),
(32, 'Cage', 'Nicolas', '1964', 'Nicolas_Cage.jpg', 'Nicolas Kim Coppola (born January 7, 1964),[2][3] known professionally as Nicolas Cage, is an American actor and filmmaker. Cage has been nominated for numerous major cinematic awards, and won an Academy Award, a Golden Globe, and Screen Actors Guild Award for his performance in Leaving Las Vegas (1995).\\r\\nDuring his early career, Cage starred in a variety of films such as Rumble Fish (1983), Valley Girl (1983), Racing with the Moon (1984), Birdy (1984), Peggy Sue Got Married (1986), Raising Arizona (1987), Moonstruck (1987), Vampire\\\'s Kiss (1989), Wild at Heart (1990), Fire Birds (1990), Honeymoon in Vegas (1992), and Red Rock West (1993).\\r\\nCage received an Academy Award, a Golden Globe, and Screen Actors Guild Award for his performance as an alcoholic Hollywood writer in Leaving Las Vegas (1995) before coming to the attention of wider audiences with mainstream films, such as The Rock (1996), Face/Off (1997), Con Air (1997), Snake Eyes (1998) and City of Angels (1998). In October 1997, Cage was ranked No. 40 in Empire magazine\\\'s The Top 100 Movie Stars of All Time list, while the next year, he was placed No. 37 in Premiere\\\'s 100 most powerful people in Hollywood.\')'),
(33, 'Allen', 'Joan', '1956', 'JoanAllen.jpg', 'Joan Allen (born August 20, 1956) is an American actress. She began her career with the Steppenwolf Theatre Company in 1977, won the 1984 Drama Desk Award for Outstanding Actress in a Play for And a Nightingale Sang, and won the 1988 Tony Award for Best Actress in a Play for her Broadway debut in Burn This. She is also a three-time Academy Award nominee; receiving Best Supporting Actress nominations for Nixon (1995) and The Crucible (1996), and a Best Actress nomination for The Contender (2000).\r\nAllen\'s other film roles include Manhunter (1986), Peggy Sue Got Married (1986), Tucker: The Man and His Dream (1988), The Ice Storm (1997), Face/Off (1997), Pleasantville (1998), The Bourne Supremacy (2004), The Upside of Anger (2005), The Bourne Ultimatum (2007), Death Race (2008), and The Bourne Legacy (2012). She won the Canadian Screen Award for Best Supporting Actress for the 2015 film Room. She has also starred in the Broadway plays The Heidi Chronicles (1988), Impressionism (2009), and The Waverly Gallery (2018).'),
(34, 'Gooding', 'Cuba Jr.', '1968', 'Cuba_Gooding.jpg', 'Cuba Mark Gooding Jr. (born January 2, 1968) is an American actor, writer, producer, and director. After his breakthrough role as Tre Styles in Boyz n the Hood (1991), he appeared in A Few Good Men (1992), The Tuskegee Airmen (1995), Outbreak (1995), and Jerry Maguire (1996), for which he won the Academy Award for Best Supporting Actor, and What Dreams May Come (1998). He gained later attention for his roles in Men of Honor (2000) as Carl Brashear, and in Michael Bay\'s World War II epic Pearl Harbor (2001) as Doris Miller. His other notable films include As Good as It Gets (1997), the ensemble farce Rat Race (2001), Radio (2003), American Gangster (2007), Lee Daniels\' The Butler (2013), and Selma (2014), playing civil rights attorney Fred Gray. In 2016, he portrayed O.J. Simpson in the FX drama series The People v. O. J. Simpson: American Crime Story, and co-starred in the sixth season of the FX anthology series American Horror Story, subtitled Roanoke.');

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
(23, 9, 239),
(24, 7, 247),
(25, 7, 257),
(27, 8, 278),
(28, 8, 288),
(29, 8, 298),
(31, 9, 319),
(32, 9, 329),
(33, 9, 339),
(34, 10, 3410);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
(9, 'Face/Off', 1997, 'volte_face.jpg', 'Obsessed with bringing terrorist Castor Troy (Nicolas Cage) to justice, FBI agent Sean Archer (John Travolta) tracks down Troy, who has boarded a plane in Los Angeles. After the plane crashes and Troy is severely injured, possibly dead, Archer undergoes surgery to remove his face and replace it with Troy\'s. As Archer tries to use his disguise to elicit information about a bomb from Troy\'s brother, Troy awakes from a coma and forces the doctor who performed the surgery to give him Archer\'s face.\n', 2, 30),
(10, 'Snow Dogs', 2002, 'snow_dogs.jpg', 'Dr. Theodore \"Ted\" Brooks is a successful dentist living in Miami, Florida. Every city bus carries an advertisement for his practice \"Hot Smile\" with his picture. One day Ted receives a letter from Alaska naming him as the only heir of Lucy Watkins, a resident of the backwoods village of Tolketna. Ted\'s mother Amelia reveals that he is adopted; Lucy was his biological mother.\r\n\r\nTed travels to Tolketna to claim his inheritance from Lucy which includes seven Siberian Huskies named Diesel, Mack, Sniff, Yodel, Scooper, Duchess, Demon, and a Border Collie named Nana. Totally out of his element, Ted has to contend with s, thin ice, foxes, skunks, and s; not to mention the proud and aggressive Demon, lead dog and alpha of the pack of sled dogs. However, Ted finds a kindred spirit in Barb, the local bar owner and one of Lucy\'s closest friends. She shows Ted how to care for and manage the dogs and shows him Lucy\'s way of life, even going so far as to defend him against the intimidating and crusty-old mountain man \'Thunder Jack\' who is intent on purchasing Lucy\'s huskies to use in the upcoming Arctic Challenge Sled Dog Race, only two weeks away.', 3, 17);

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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `user_email`, `user_password`) VALUES
(1, 'John', 'info@site.com', '$2y$10$fmRxbKoggeusQ2IzrGqhIu8cqc/aMR553v91JyC1x3wcCRnnq7GeO'),
(2, '', 'test@test.fr', ''),
(3, 'Leo', 'email@gmail.com', '$2y$10$YW8qK1A/CbhL0o6cdTkk7uyMf4I.92MxolDGR51vb5pgFDeWKvVsK');

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
