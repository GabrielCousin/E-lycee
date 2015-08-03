-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: e-lycee
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `choix`
--

DROP TABLE IF EXISTS `choix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fiche_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` int(11) NOT NULL,
  `reponse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8E89AF95DF522508` (`fiche_id`),
  CONSTRAINT `FK_8E89AF95DF522508` FOREIGN KEY (`fiche_id`) REFERENCES `fiche` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choix`
--

LOCK TABLES `choix` WRITE;
/*!40000 ALTER TABLE `choix` DISABLE KEYS */;
INSERT INTO `choix` VALUES (1,6,'dsqdqs',4,'oui'),(2,3,'dsqdqsddqs',2,'non'),(3,3,'la réponse 2 - 0 points',0,'oui'),(4,3,'la réponse 3 - 3 points',3,'oui'),(5,3,'la réponse 4 - -1 point',-1,'oui'),(6,4,'la réponse 1 - non - 5 points',5,'non'),(7,4,'la réponse 2 - oui - 2 points',2,'oui'),(8,4,'la réponse 3 - non - 3points',3,'non'),(9,5,'la réponse 1 : oui - 5points',5,'oui'),(10,5,'la réponse 2 : non - 3points',3,'non'),(11,6,'la réponse 1 : oui 5',5,'oui'),(12,6,'la réponse 2 : non 2',2,'oui'),(13,7,'réponse 5 - oui 3pt',3,'oui'),(14,17,'Deduxit Caesar interneciva antehac potens praeter Isaura Claudiopolis pauca claritudinis.',2,'oui'),(15,17,'Civilibus plerumque dicta post expeditionibus discessit foedere luctuosa in vigilasse.',2,'non'),(16,17,'Truci latius mollia ululatu per plana repellere superabatur truci quae.',2,'non'),(17,17,'Interceperat modo innoxius malum quod et casus atrox interceperat acciderat.',2,'oui'),(18,18,'dsqdsqdqs',2,'oui'),(19,19,'Vide, quantum, inquam, fallare ?',5,'non'),(20,19,'Iis igitur est difficilius satis facere ?',5,'oui'),(21,20,'dsqddsqdqqs qsdsqdq',5,'non'),(22,21,'rezrezrezr ezr zerezrez',5,'non'),(23,21,'ezaeazezaezae azeazeaze aeza',5,'oui');
/*!40000 ALTER TABLE `choix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe`
--

LOCK TABLES `classe` WRITE;
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ancestors` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `depth` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5BC96BF0E2904019` (`thread_id`),
  CONSTRAINT `FK_5BC96BF0E2904019` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'4','test','',0,'2015-07-18 18:54:15',0);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createAt` datetime NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E16CE76B4B89032C` (`post_id`),
  CONSTRAINT `FK_E16CE76B4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaire`
--

LOCK TABLES `commentaire` WRITE;
/*!40000 ALTER TABLE `commentaire` DISABLE KEYS */;
INSERT INTO `commentaire` VALUES (1,'0000-00-00 00:00:00','Alios','Alios autem dicere aiunt multo etiam inhumanius (quem locum breviter paulo ante perstrinxi) praesidii adiumentique causa, non benevolentiae neque caritatis, amicitias esse expetendas; itaque, ut quisque minimum firmitatis haberet minimumque virium, ita amicitias appetere maxime; ex eo fieri ut mulierculae magis amicitiarum praesidia quaerant quam viri et inopes quam opulenti et calamitosi quam ii qui putentur beati.',1),(2,'0000-00-00 00:00:00','Bertrand','Batnae municipium in Anthemusia conditum Macedonum manu priscorum ab Euphrate flumine brevi spatio disparatur, refertum mercatoribus opulentis, ubi annua sollemnitate prope Septembris initium mensis ad nundinas magna promiscuae fortunae convenit multitudo ad commercanda quae Indi mittunt et Seres aliaque plurima vehi terra marique consueta.',2),(3,'0000-00-00 00:00:00','Anne','Cum saepe multa, tum memini domi in hemicyclio sedentem, ut solebat, cum et ego essem una et pauci admodum familiares, in eum sermonem illum incidere qui tum forte multis erat in ore. Meministi enim profecto, Attice, et eo magis, quod P. Sulpicio utebare multum, cum is tribunus plebis capitali odio a Q. Pompeio, qui tum erat consul, dissideret, quocum coniunctissime et amantissime vixerat, quanta esset hominum vel admiratio vel querella.',3),(4,'0000-00-00 00:00:00','Violette','Adolescebat autem obstinatum propositum erga haec et similia multa scrutanda, stimulos admovente regina, quae abrupte mariti fortunas trudebat in exitium praeceps, cum eum potius lenitate feminea ad veritatis humanitatisque viam reducere utilia suadendo deberet, ut in Gordianorum actibus factitasse Maximini truculenti illius imperatoris rettulimus coniugem.',4),(5,'0000-00-00 00:00:00','Bertrand','Ergo ego senator inimicus, si ita vultis, homini, amicus esse, sicut semper fui, rei publicae debeo. Quid?',2),(6,'0000-00-00 00:00:00','linette','Nemo quaeso miretur, si post exsudatos labores itinerum longos congestosque adfatim commeatus fiducia vestri ductante barbaricos pagos adventans velut mutato repente consilio ad placidiora deverti.',5),(7,'0000-00-00 00:00:00','Florent','Ideoque fertur neminem aliquando ob haec vel similia poenae addictum oblato de more elogio revocari iussisse, quod inexorabiles quoque principes factitarunt.',4),(8,'0000-00-00 00:00:00','Julien','Postremo ad id indignitatis est ventum, ut cum peregrini ob formidatam haut ita dudum alimentorum inopiam pellerentur ab urbe praecipites, sectatoribus disciplinarum liberalium i',16),(9,'0000-00-00 00:00:00','Julie','Hoc inmaturo interitu ipse quoque sui pertaesus excessit e vita aetatis nono anno atque vicensimo cum quadriennio imperasset. natus apud Tuscos in Massa Veternensi, patre Constantio Constantini fratre imperatoris, matreque Galla sorore Rufini et Cerealis, quos trabeae consulares nobilitarunt et praefecturae.',NULL),(10,'0000-00-00 00:00:00','Vivian','Circa hos dies Lollianus primae lanuginis adulescens, Lampadi filius ex praefecto, exploratius causam Maximino spectante, convictus codicem noxiarum artium nondum per aetatem firmato consilio descripsisse, exulque mittendus, ut sperabatur.',NULL),(11,'0000-00-00 00:00:00','Jonathan','Et quoniam apud eos ut in capite mundi morborum acerbitates celsius dominantur, ',NULL),(12,'0000-00-00 00:00:00','anne','Quapropter a natura mihi videtur potius quam ab indigentia orta amicitia, applicatione magis animi cum quodam sensu amandi quam cogitatione quantum illa res utilitatis esset habitura.',NULL),(13,'0000-00-00 00:00:00','Anne','Montius nos tumore inusitato quodam et novo ut rebellis et maiestati recalcitrantes Augustae per haec quae strepit incusat iratus nimirum quod contumacem praefectum, quid rerum ordo postulat ignorare dissimulantem formidine tenus iusserim custodiri.',NULL),(14,'0000-00-00 00:00:00','robert','Quapropter a natura mihi videtur potius quam ab indigentia orta amicitia, applicatione magis animi cum quodam sensu amandi quam cogitatione quantum illa res utilitatis esset habitura.',NULL),(15,'0000-00-00 00:00:00','Maxime','Saepissime igitur mihi de amicitia cogitanti maxime illud considerandum videri solet, utrum propter imbecillitatem atque inopiam desiderata sit amicitia, ut dandis recipiendisque meritis quod quisque minus per se ipse posset, id acciperet ab alio vicissimque redderet',NULL),(16,'0000-00-00 00:00:00','Ludo','Quod quidem quale sit, etiam in bestiis quibusdam animadverti potest, quae ex se natos.',NULL),(17,'0000-00-00 00:00:00','Olivier','Unde Rufinus ea tempestate praefectus praetorio ad discrimen trusus est ultimum. ire enim ipse compellebatur ad militem, quem exagitabat inopia simul et feritas, et alioqui coalito more in ordinarias dignitates asperum semper et saevum, ut satisfaceret atque monstraret, quam ob causam annonae convectio sit impedita.',NULL),(18,'0000-00-00 00:00:00','Martine','llud tamen clausos vehementer angebat quod captis navigiis, quae frumenta vehebant per flumen.',NULL),(19,'0000-00-00 00:00:00','Nathalie','Ut enim benefici liberalesque sumus, non ut exigamus gratiam (neque enim beneficium faeneramur',NULL),(20,'2015-07-05 16:59:26','Amelie','Mon commentaire',NULL),(21,'2015-07-16 09:39:33','Amelie','',NULL),(22,'2015-07-26 19:03:28','fsdfsd','fdsfd',16),(23,'2015-07-26 19:03:45','dsqdqs','dqsdqs',16),(24,'2015-08-02 14:11:45','titi','test de commentaire',15),(25,'2015-08-02 14:14:13','titi','test',15),(26,'2015-08-02 14:16:41','titi','spam',15),(27,'2015-08-02 14:16:55','titi','spam',15),(28,'2015-08-02 14:17:24','titi','dfsdsq',15),(29,'2015-08-02 14:17:43','titi','dsqdqs',15),(30,'2015-08-02 14:17:48','titi','dqsdqs',15),(31,'2015-08-02 14:21:25','titi','dqsdqsdqs',15),(32,'2015-08-03 13:07:25','test','viagra dqsq dqsdqeazeaeaeaz za e',15);
/*!40000 ALTER TABLE `commentaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactemail`
--

DROP TABLE IF EXISTS `contactemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactemail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `createAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactemail`
--

LOCK TABLES `contactemail` WRITE;
/*!40000 ALTER TABLE `contactemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiche`
--

DROP TABLE IF EXISTS `fiche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fiche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `lvl_id` int(11) DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8DD2E37C50962F74` (`lvl_id`),
  KEY `IDX_8DD2E37C41807E1D` (`teacher_id`),
  KEY `IDX_8DD2E37C6BF700BD` (`status_id`),
  CONSTRAINT `FK_8DD2E37C41807E1D` FOREIGN KEY (`teacher_id`) REFERENCES `fos_user` (`id`),
  CONSTRAINT `FK_8DD2E37C50962F74` FOREIGN KEY (`lvl_id`) REFERENCES `niveau` (`id`),
  CONSTRAINT `FK_8DD2E37C6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiche`
--

LOCK TABLES `fiche` WRITE;
/*!40000 ALTER TABLE `fiche` DISABLE KEYS */;
INSERT INTO `fiche` VALUES (3,1,1,'question 1','Quelle est la question 1?',1),(4,1,1,'question 2','Quelle est la question 2 bis?',1),(5,1,1,'Question 3','Quelle est la question 3?',1),(6,1,1,'Question 4','Quelle est la question 4?',2),(7,1,2,'question 5','La question 5 ?',2),(17,19,2,'Geographie','Natura quae et et natos ita lumen in ita sit ?',1),(18,19,1,'dsqdqs','dsqdqsdsq',2),(19,1,2,'Test du oui et non de debug','Alios autem dicere aiunt multo etiam inhumanius',2),(20,1,2,'dsqdsq','dsqdsqdsq qdsqddqsdqs dqsdq',1),(21,1,1,'rerzer zerez rz','re zrezrezrrez rzerezrez rezr',1);
/*!40000 ALTER TABLE `fiche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `lvl_id` int(11) DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  KEY `IDX_957A647950962F74` (`lvl_id`),
  CONSTRAINT `FK_957A647950962F74` FOREIGN KEY (`lvl_id`) REFERENCES `niveau` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (1,'toto','toto','toto@toto.com','toto@toto.com',1,'9wn4t4mn0y88s4s0oskkos8sw848o84','eX7YaKZywCsyl8tnYuCIqJxh3M+kqs22Rwm9T8EBTiQGyoFQ+MvkFf+CM8m81KaXSQLyRlkmqHPlYd03sgPoxQ==','2015-08-03 13:08:36',0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_TEACHER\";}',0,NULL,NULL,'Henri','Birton'),(2,'Abel','abel','abel@lecole.com','abel@lecole.com',1,'u1c8dxobhes4swgk8ockwk8g000ssg','RxLFQEXw0lHwTJSY0AahJEjuIJV25XVPsXxgdGv5oD4BnNnRkVTK76icduBxjOIZ5Sjc3DhQgjbstmDKaaS+oA==','2015-08-03 11:25:29',0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'abel','Mabrouk'),(3,'Al','al','al@lecole.com','al@lecole.com',1,'gr0lribsn3coksw8k4scc8wswsw044g','cnPWwMsYS5MNOaRrB5q+kLP24K6vmJD8317Mq9sV5MfaMvcR5Ipne2f6hj9thCbxJD5zbSp2gUTgorKFMvrYGw==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(4,'Alan','alan','alan@lecole.com','alan@lecole.com',1,'dvg4ockjut4w400c48ws0ogkgk04w0g','utkluOGsci8pvR8ujhChVRNCUffa4XjL5z6wiEqWGgZl5HH37EnB14ggDEs5WjLdnJJpY39E8rCaj/aGy4QEeg==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(5,'Arthur','arthur','arthur@lecole.com','arthur@lecole.com',1,'7djdc00h2fockc8so44coc44ccwg8g0','nQ/1rKnLdSje7zujmS8sRd5VoueQFLJoEqbqYm0lutoEfJn+a6cvnuru5z/yXVAI86djgiZaqts/BBYzCaE/kA==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(6,'Carl','carl','carl@lecole.com','carl@lecole.com',1,'dhsbogutjrwwso0g0k8884w8cogk8k0','u4K/bESCCT/KpEipDJU0xlXmUCnXrDLhYZ5uRwZkBLFKcwaW/GL3jejKkfQex+vYn0ydf13PjR/u3gwobMYj+A==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(7,'Blaise','blaise','car@lecole.com','car@lecole.com',1,'3ya27403rrwgkg8woowgkw04kogw4wo','qvScwr9O0rgNeWqEBkflEdZETc4pusSOShWB+5jRO+0ZcmGhNOSeTWgFQg3ei8xJyTzwK0v/9PPHo2XTT3tDAw==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(8,'Isaac','isaac','isaac@lecole.com','isaac@lecole.com',1,'5ds1xtmiwsso8kkwgs4ow8w8c0c00g4','JgRdNCC1yeXPmXqxyspnGTfr5vlzss0HoxAJIFZJJNUttfBHjuypSyBox2ljKCAr/VAfBFkyrC4gqK+/hYOJ0A==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(9,'Steve','steve','steve@lecole.com','steve@lecole.com',1,'gwg6xqcbbfw4ogwskc8g8gsg4ko8w88','Y7iMUHkG9iLpUpKSOUbZVTdF5ytaxkVoERrck2luZ4VofY9ESS7IKZ+xQCTD5g4kenFWFb2xSmIXl49r27xoeQ==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(10,'Alfred','alfred','alfred@lecole.com','alfred@lecole.com',1,'9fsdie7i3484wcw400oskwosog8gkgs','5s5c5PdIMha0QWErgMJ4PqUODTDYOZ/8ai13hAre1g9keWoPK37QgDQN9KFLP41f54tnm2vJyYFRBRdJ8BU+HQ==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(11,'Brendan','brendan','brendan@lecole.com','brendan@lecole.com',1,'9e7o6c0sxw08s4o8kwo8c44c8sw4ckg','8ym2NWKdxwDJoZCS7C5pSvxblGgIvQYdbZx0FmtjJnFv4zHTIFRONmLMhaoJTO1bLnEOIrLcrZDL7/mSklYsnw==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(12,'David','david','david@lecole.com','david@lecole.com',1,'2bgf7mr2iijowko0wk0scwwkogwkoo8','6m4AFXFGS+aLYYfBstZCbbPKtrwaVPA9HGn9CwssX91e6mS2FYnmzI80aSKe3X15MT9pHg/sZLTS6tSj1uNBJQ==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(13,'GGeorge','ggeorge','george@lecole.com','george@lecole.com',1,'bslfe8fc37k0k84o0cs0wokk00488wg','DkEDg1baZrUw2NUsEK6VtW0vfj2TAQrLBEDl/NE0jzSdCQJ5Mep+mZjiTJZWRQI1+pga/yT1ZrfpcvyslOgjpw==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(14,'Jim','jim','jim@lecole.com','jim@lecole.com',1,'o39f04knrg0o0kw48og4gwsgs808wgw','AWOSC+xzpf8RMRc+G9PlHI88PGpsG/aBPmzB5MaOVYJpK5ZOtdsTpwwJMXmMfNCsFzyhuZPi6GBv4xjPX+n6sA==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(15,'LesLeslie','lesleslie','leslie@lecole.com','leslie@lecole.com',1,'i8uy0ipcpvk0s0wcww0cww8ccgww88w','VmoDYBc5ETVttH1zqrqLU01dw6/H9l0OFuDdY9US0JRToyFvOeikAraSmLiqXSSFnEuvQgwLFII/jv4J0xB9+Q==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(16,'Maria','maria','maria@lecole.com','maria@lecole.com',1,'gs82dah64l4ww80c80w0800gg4gkcsg','w44X5G5Pl3f+CIA75TTu4Bx2BizdztxDI4PM4IS8VAh+QTfYKajcGxubcPvjGiGsEUG2Hlcat/imwVpP7/UqLQ==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(17,'Rasmus','rasmus','rasmus@lecole.com','rasmus@lecole.com',1,'djyk0i5kn4ocgcg80kcoogkwg4ogw8s','u0WYEmP8Jqv4zv3b1sVzIerUNUNEWHeVPn2XVlYpiDpdtjUnT8/EK5OqlwG2kxC3IlfJb9RBRDWyo6H/lJJFoA==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(18,'Tim','tim','tim@lecole.com','tim@lecole.com',1,'cu2gygaw9g08ksgssk40gc044g48okw','7o4kPEcuuxaK2tGL3j6D440pfUlG0964kDVVesg1d14N90XmapVuF+ICazH6XNWLU/FJKqXuU9yIWqn/oJqixA==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(19,'titi','titi','titi@titi.com','titi@titi.com',1,'9wn4t4mn0y88s4s0oskkos8sw848o84','eX7YaKZywCsyl8tnYuCIqJxh3M+kqs22Rwm9T8EBTiQGyoFQ+MvkFf+CM8m81KaXSQLyRlkmqHPlYd03sgPoxQ==','2015-08-02 13:01:32',0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_TEACHER\";}',0,NULL,NULL,'Daniel','Gonzag');
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveau` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveau`
--

LOCK TABLES `niveau` WRITE;
/*!40000 ALTER TABLE `niveau` DISABLE KEYS */;
INSERT INTO `niveau` VALUES (1,'première'),(2,'terminale');
/*!40000 ALTER TABLE `niveau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `extract` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createAt` datetime NOT NULL,
  `picture` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_FAB8C3B36BF700BD` (`status_id`),
  KEY `IDX_FAB8C3B3A76ED395` (`user_id`),
  CONSTRAINT `FK_FAB8C3B36BF700BD` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `FK_FAB8C3B3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Ad quas non plus','Novo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus.','Novo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus, et adhibitis paucis clam ferro succinctis vesperi per tabernas palabatur et conpita quaeritando Graeco sermone, cuius erat inpendio gnarus, quid de Caesare quisque sentiret. et haec confidenter agebat in urbe ubi pernoctantium luminum claritudo dierum solet imitari fulgorem. postremo agnitus saepe iamque, si prodisset, conspicuum se fore contemplans, non nisi luce palam egrediens ad agenda quae putabat seria cernebatur. et haec quidem medullitus multis gementibus agebantur.\r\n\r\nItaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias qui honorem amici anteponat suo? Quid? Haec ut omittam, quam graves, quam difficiles plerisque videntur calamitatum societates! Ad quas non est facile inventu qui descendant. Quamquam Ennius recte.',1,1,'2015-06-11 00:00:00','a:7:{s:8:\"fileName\";s:23:\"/science-header1_25.jpg\";s:12:\"originalName\";s:19:\"Science Header1.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:34123;s:4:\"path\";s:24:\"//science-header1_25.jpg\";s:5:\"width\";i:684;s:6:\"height\";i:418;}'),(2,'Quamquam Ennius','Itaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias','Itaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias qui honorem amici anteponat suo? Quid? Haec ut omittam, quam graves, quam difficiles plerisque videntur calamitatum societates! Ad quas non est facile inventu qui descendant. Quamquam Ennius recte.\r\n\r\nNovo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus, et adhibitis paucis clam ferro succinctis vesperi per tabernas palabatur et conpita quaeritando Graeco sermone, cuius erat inpendio gnarus, quid de Caesare quisque sentiret. et haec confidenter agebat in urbe ubi pernoctantium luminum claritudo dierum solet imitari fulgorem. postremo agnitus saepe iamque, si prodisset, conspicuum se fore contemplans, non nisi luce palam egrediens ad agenda quae putabat seria cernebatur. et haec quidem medullitus multis gementibus agebantur.',1,19,'2015-06-19 00:00:00','a:7:{s:8:\"fileName\";s:17:\"/BasicScience.jpg\";s:12:\"originalName\";s:16:\"BasicScience.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:29480;s:4:\"path\";s:18:\"//BasicScience.jpg\";s:5:\"width\";i:470;s:6:\"height\";i:210;}'),(3,'Gallus ausus','Novo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus.','Novo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus, et adhibitis paucis clam ferro succinctis vesperi per tabernas palabatur et conpita quaeritando Graeco sermone, cuius erat inpendio gnarus, quid de Caesare quisque sentiret. et haec confidenter agebat in urbe ubi pernoctantium luminum claritudo dierum solet imitari fulgorem. postremo agnitus saepe iamque, si prodisset, conspicuum se fore contemplans, non nisi luce palam egrediens ad agenda quae putabat seria cernebatur. et haec quidem medullitus multis gementibus agebantur.\r\n\r\nItaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias qui honorem amici anteponat suo? Quid? Haec ut omittam, quam graves, quam difficiles plerisque videntur calamitatum societates! Ad quas non est facile inventu qui descendant. Quamquam Ennius recte.',1,1,'2015-06-10 00:00:00','a:7:{s:8:\"fileName\";s:24:\"/etude-et -formation.jpg\";s:12:\"originalName\";s:23:\"etude-et -formation.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:68242;s:4:\"path\";s:25:\"//etude-et+-formation.jpg\";s:5:\"width\";i:530;s:6:\"height\";i:225;}'),(4,'Itaque verae','Itaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias','Itaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias qui honorem amici anteponat suo? Quid? Haec ut omittam, quam graves, quam difficiles plerisque videntur calamitatum societates! Ad quas non est facile inventu qui descendant. Quamquam Ennius recte.\r\n\r\nNovo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus, et adhibitis paucis clam ferro succinctis vesperi per tabernas palabatur et conpita quaeritando Graeco sermone, cuius erat inpendio gnarus, quid de Caesare quisque sentiret. et haec confidenter agebat in urbe ubi pernoctantium luminum claritudo dierum solet imitari fulgorem. postremo agnitus saepe iamque, si prodisset, conspicuum se fore contemplans, non nisi luce palam egrediens ad agenda quae putabat seria cernebatur. et haec quidem medullitus multis gementibus agebantur.',1,19,'2015-06-06 00:00:00','a:7:{s:8:\"fileName\";s:16:\"/etudes_play.png\";s:12:\"originalName\";s:15:\"etudes_play.png\";s:8:\"mimeType\";s:9:\"image/png\";s:4:\"size\";i:321706;s:4:\"path\";s:17:\"//etudes_play.png\";s:5:\"width\";i:720;s:6:\"height\";i:300;}'),(5,'Excitavi','Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens','Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens.',2,19,'2015-06-06 00:00:00','a:7:{s:8:\"fileName\";s:45:\"/the-digital-marketing-room-homepage-grid.png\";s:12:\"originalName\";s:44:\"the-digital-marketing-room-homepage-grid.png\";s:8:\"mimeType\";s:9:\"image/png\";s:4:\"size\";i:1176990;s:4:\"path\";s:46:\"//the-digital-marketing-room-homepage-grid.png\";s:5:\"width\";i:2481;s:6:\"height\";i:1264;}'),(6,'Finierat','Mox dicta finierat, multitudo omnis ad, quae imperator voluit, promptior laudato consilio consensit in pacem ea ratione maxime percita','Mox dicta finierat, multitudo omnis ad, quae imperator voluit, promptior laudato consilio consensit in pacem ea ratione maxime percita, quod norat expeditionibus crebris fortunam eius in malis tantum civilibus vigilasse, cum autem bella moverentur externa, accidisse plerumque luctuosa, icto post haec foedere gentium ritu perfectaque sollemnitate imperator Mediolanum ad hiberna discessit.',1,19,'2015-05-13 00:00:00','a:7:{s:8:\"fileName\";s:27:\"/marketing-marche-etude.jpg\";s:12:\"originalName\";s:26:\"marketing-marche-etude.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:99859;s:4:\"path\";s:28:\"//marketing-marche-etude.jpg\";s:5:\"width\";i:424;s:6:\"height\";i:283;}'),(7,'Iam in altera','Iam in altera philosophiae parte. quae est quaerendi ac disserendi, quae logikh dicitur, iste vester plane, ut mihi quidem videtur','Iam in altera philosophiae parte. quae est quaerendi ac disserendi, quae logikh dicitur, iste vester plane, ut mihi quidem videtur, inermis ac nudus est. tollit definitiones, nihil de dividendo ac partiendo docet, non quo modo efficiatur concludaturque ratio tradit, non qua via captiosa solvantur ambigua distinguantur ostendit; iudicia rerum in sensibus ponit, quibus si semel aliquid falsi pro vero probatum sit, sublatum esse omne iudicium veri et falsi putat.',1,19,'2015-06-28 00:00:00','a:7:{s:8:\"fileName\";s:23:\"/page_casestudies_7.jpg\";s:12:\"originalName\";s:20:\"page_casestudies.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:60931;s:4:\"path\";s:24:\"//page_casestudies_7.jpg\";s:5:\"width\";i:590;s:6:\"height\";i:240;}'),(8,'Sed cautela','Sed cautela nimia in peiores haeserat plagas','Sed cautela nimia in peiores haeserat plagas, ut narrabimus postea, aemulis consarcinantibus insidias graves apud Constantium, cetera medium principem sed siquid auribus eius huius modi quivis infudisset ignotus, acerbum et inplacabilem et in hoc causarum titulo dissimilem sui.',1,19,'2015-06-11 00:00:00','a:7:{s:8:\"fileName\";s:22:\"/Masterclass-Rajiv.jpg\";s:12:\"originalName\";s:21:\"Masterclass-Rajiv.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:195687;s:4:\"path\";s:23:\"//Masterclass-Rajiv.jpg\";s:5:\"width\";i:528;s:6:\"height\";i:270;}'),(9,'Quare hoc','Quare hoc quidem praeceptum, cuiuscumque est,','Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat.\r\n\r\nDuplexque isdem diebus acciderat malum, quod et Theophilum insontem atrox interceperat casus, et Serenianus dignus exsecratione cunctorum, innoxius, modo non reclamante publico vigore, discessit.',1,1,'2015-06-20 00:00:00','a:7:{s:8:\"fileName\";s:37:\"/etude-de-marche-travail-domicile.jpg\";s:12:\"originalName\";s:36:\"etude-de-marche-travail-domicile.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:37452;s:4:\"path\";s:38:\"//etude-de-marche-travail-domicile.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:345;}'),(10,'Etenim si','Etenim si attendere diligenter, existimare vere de','Etenim si attendere diligenter, existimare vere de omni hac causa volueritis, sic constituetis, iudices, nec descensurum quemquam ad hanc accusationem fuisse, cui, utrum vellet, liceret, nec, cum descendisset, quicquam habiturum spei fuisse, nisi alicuius intolerabili libidine et nimis acerbo odio niteretur. Sed ego Atratino, humanissimo atque optimo adulescenti meo necessario, ignosco, qui habet excusationem vel pietatis vel necessitatis vel aetatis. Si voluit accusare, pietati tribuo, si iussus est, necessitati, si speravit aliquid, pueritiae. Ceteris non modo nihil ignoscendum, sed etiam acriter est resistendum.\r\n\r\nAltera sententia est, quae definit amicitiam paribus officiis ac voluntatibus. Hoc quidem est nimis exigue et exiliter ad calculos vocare amicitiam, ut par sit ratio acceptorum et datorum. Divitior mihi et affluentior videtur esse vera amicitia nec observare restricte, ne plus reddat quam acceperit; neque enim verendum est, ne quid excidat, aut ne quid in terram defluat, aut ne plus aequo quid in amicitiam congeratur',1,19,'2015-05-30 00:00:00','a:7:{s:8:\"fileName\";s:49:\"/rentree-scolaire-lycee-jeanne-d-arc_1249397.jpeg\";s:12:\"originalName\";s:48:\"rentree-scolaire-lycee-jeanne-d-arc_1249397.jpeg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:96431;s:4:\"path\";s:50:\"//rentree-scolaire-lycee-jeanne-d-arc_1249397.jpeg\";s:5:\"width\";i:800;s:6:\"height\";i:532;}'),(11,'nouvel article','Incenderat autem audaces usque ad insaniam homines ad haec, quae nefariis egere conatibus, Luscus quidam curator urbis subito visus: eosque ut heiulans baiolorum praecentor ad expediendum quod orsi sunt incitans vocibus crebris. qui haut longe postea ideo','Incenderat autem audaces usque ad insaniam homines ad haec, quae nefariis egere conatibus, Luscus quidam curator urbis subito visus: eosque ut heiulans baiolorum praecentor ad expediendum quod orsi sunt incitans vocibus crebris. qui haut longe postea ideo vivus exustus est.',2,1,'2010-01-01 00:00:00','a:7:{s:8:\"fileName\";s:40:\"/caucasian-college-student-female_11.jpg\";s:12:\"originalName\";s:36:\"Caucasian-College-Student-Female.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:1594833;s:4:\"path\";s:41:\"//caucasian-college-student-female_11.jpg\";s:5:\"width\";i:1698;s:6:\"height\";i:1131;}'),(13,'Latinas litteras','Euripidis fabulis delectari dicat ?','Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit? dsdq',2,1,'2015-07-16 00:00:00','a:7:{s:8:\"fileName\";s:30:\"/marketing-marche-etude_13.jpg\";s:12:\"originalName\";s:26:\"marketing-marche-etude.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:99859;s:4:\"path\";s:31:\"//marketing-marche-etude_13.jpg\";s:5:\"width\";i:424;s:6:\"height\";i:283;}'),(14,'Caesare','causatus nec regiam','Qui cum venisset ob haec festinatis itineribus Antiochiam, praestrictis palatii ianuis, contempto Caesare, quem videri decuerat, ad praetorium cum pompa sollemni perrexit morbosque diu causatus nec regiam introiit nec processit in publicum, sed abditus multa in eius moliebatur exitium addens quaedam relationibus supervacua, quas subinde dimittebat ad principem.',1,19,'2015-07-16 12:06:00','a:7:{s:8:\"fileName\";s:40:\"/etude-de-marche-travail-domicile_14.jpg\";s:12:\"originalName\";s:36:\"etude-de-marche-travail-domicile.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:37452;s:4:\"path\";s:41:\"//etude-de-marche-travail-domicile_14.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:345;}'),(15,'Volatu rapiunt','Qui si praedam dispexerint celsius, volatu rapiunt celeri,','Saraceni tamen nec amici nobis umquam nec hostes optandi, ultro citroque discursantes quicquid inveniri poterat momento temporis parvi vastabant milvorum rapacium similes, qui si praedam dispexerint celsius, volatu rapiunt celeri, aut nisi impetraverint, non inmorantur.',1,19,'2015-07-17 00:00:00','a:7:{s:8:\"fileName\";s:23:\"/science-header1_25.jpg\";s:12:\"originalName\";s:19:\"Science Header1.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:34123;s:4:\"path\";s:24:\"//science-header1_25.jpg\";s:5:\"width\";i:684;s:6:\"height\";i:418;}'),(16,'Volatu rapiunt','Qui si praedam dispexerint celsius, volatu rapiunt celeri,','Saraceni tamen nec amici nobis umquam nec hostes optandi, ultro citroque discursantes quicquid inveniri poterat momento temporis parvi vastabant milvorum rapacium similes, qui si praedam dispexerint celsius, volatu rapiunt celeri, aut nisi impetraverint, non inmorantur.',1,19,'2015-07-17 00:00:00','a:7:{s:8:\"fileName\";s:23:\"/science-header1_25.jpg\";s:12:\"originalName\";s:19:\"Science Header1.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:34123;s:4:\"path\";s:24:\"//science-header1_25.jpg\";s:5:\"width\";i:684;s:6:\"height\";i:418;}'),(17,'Impossible ? Un alliage pourrait supporter plus de 4.000 °C !','Les alliages à base d\'hafnium ou de tantale ont des points de fusion élevés.','Les alliages à base d\'hafnium ou de tantale ont des points de fusion élevés. Mais des physiciens pensent avoir trouvé beaucoup plus fort à l\'aide de simulations. Selon eux, un nouvel alliage à base d\'hafnium, de carbone et d\'azote battrait tous les records. En fondant à plus de 4.000 °C, il mériterait d\'être appelé unobtainium, genre de matériau aux propriétés impossibles pour les ingénieurs de l\'aérospatiale et les amateurs de science-fiction.',1,1,'2015-08-03 00:00:00','a:7:{s:8:\"fileName\";s:23:\"/science-header1_25.jpg\";s:12:\"originalName\";s:19:\"Science Header1.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:34123;s:4:\"path\";s:24:\"//science-header1_25.jpg\";s:5:\"width\";i:684;s:6:\"height\";i:418;}'),(18,'Le LHC sur le point de découvrir un nouveau boson ?','Les deux détecteurs géants du LHC, Atlas et CMS, semblent tous les deux voir des traces – ténues – d\'un nouveau boson dont la masse est de 2 TeV. En étant optimiste, il pourrait s\'agir d\'un mythique boson Z\' ou encore W\', souvent prédits par des modèles u','Les premiers résultats des analyses des données collectées avec les détecteurs géants du LHC pour sa deuxième campagne de recherche avec des collisions à 13 TeV vont être présentés lors d’une conférence sur la physique des hautes énergies. Elle se tient à Vienne du 22 au 29 juillet 2015 sous l’égide de la Société Européenne de Physique (EPS, European Physical Society). On en saura peut-être un tout petit peu plus sur une curieuse découverte faite par les membres des collaborations Atlas et CMS.\r\n\r\nEn fait, le terme découverte est exagéré. Les physiciens ont constaté un léger excès de production de paires de bosons intermédiaires du modèle électrofaible dans les produits des collisions à 8 TeV réalisées dans le précédent « run » du LHC avant sa pause de deux années. Cet excès n’est pas statistiquement significatif mais ce qui intrigue les chercheurs est qu’il se manifeste dans deux détecteurs et qu’il peut dans les deux cas s’interpréter comme la désintégration d’un nouveau boson de spin 1 dont la masse est d’environ 2 TeV.\r\n\r\nLa plus grande prudence s’impose dans l’interprétation de ces résultats mais selon certains théoriciens, ils pourraient être la manifestation de l’existence de deux particules mythiques prédites par bon nombre de modèles d’unification des forces : les bosons W’ et Z’, des cousins des bosons Z et W du modèle standard.',1,1,'2015-08-03 00:00:00','a:7:{s:8:\"fileName\";s:23:\"/science-header1_25.jpg\";s:12:\"originalName\";s:19:\"Science Header1.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:34123;s:4:\"path\";s:24:\"//science-header1_25.jpg\";s:5:\"width\";i:684;s:6:\"height\";i:418;}'),(19,'L\'imprévisible ouragan Nadine a enfin livré son secret','L\'ouragan Nadine, qui s\'était dirigé vers l’Europe en septembre 2012 avant de repartir brusquement vers l’Atlantique, avait alors surpris tout le monde. Les prévisionnistes l\'avait même qualifié d’imprévisible. Une équipe de chercheurs vient enfin d\'expli','Chaque automne, plusieurs ouragans (on parle d’ouragan lorsqu’il s’agit d’un cyclone tropical situé dans l’Atlantique nord) se dirigent vers l’Europe occidentale après s’être transformés en dépressions extratropicales en développant des fronts. Il arrive néanmoins, mais c’est très rare, qu’un ouragan conserve sa structure nuageuse spiralée autour d’un œil durant son périple au-dessus de l’Atlantique. Ce fut le cas de celui baptisé Nadine qui, en septembre 2012, s’est approché de l’Europe.\r\n\r\nLa prévision de la trajectoire de cet ouragan a posé quelques problèmes : alors que la prévision à haute résolution du Centre européen de prévision météorologique à moyen terme (CEPMMT) donnait une arrivée de Nadine en mer Méditerranée avec un creusement très profond (une forte diminution de la pression au cœur de l’ouragan), l’ouragan a bifurqué vers l’ouest, puis s’est dissipé dans l’Atlantique.\r\n\r\nPar ailleurs, la prévision dite d’ensemble du CEPMMT, constituée de cinquante prévisions à basse résolution avec des conditions initiales différant légèrement les unes des autres et réalisée afin de déterminer la fiabilité de ces prévisions, a montré que la trajectoire de Nadine était imprévisible dans la mesure où ces cinquante prévisions divergeaient fortement.\r\n\r\nPour comprendre la raison de cette forte incertitude sur la trajectoire de l’ouragan, des chercheurs du laboratoire d’Aérologie (LA, OMP, CNRS, UPS) ont analysé la prévision d’ensemble du CEPMMT. Ils ont ainsi pu mettre en évidence l’existence de deux scénarios possibles pour cette trajectoire, suivant l’intensité forte ou faible de l’interaction entre le vortex cyclonique de Nadine et celui d’une dépression d’altitude — une dépression dont les vents sont de plus en plus forts quand l’altitude augmente, tandis que dans un ouragan, les vents sont de plus en plus faibles lorsque l’altitude augmente — située au même moment au nord de Nadine sur l’Atlantique nord.\r\n\r\nLes simulations indiquent que si le vortex de Nadine reste à une distance supérieure à 1.000 km environ du vortex de la dépression d’altitude (interaction faible), l’ouragan se dirige vers l’ouest, alors que si le vortex de Nadine se rapproche à une distance inférieure à 1.000 km environ du vortex de la dépression d’altitude (interaction forte), Nadine se dirige vers l’est et les côtes du Portugal.\r\n\r\nLes chercheurs ont ensuite effectué diverses simulations avec le modèle de recherche communautaire français Méso-NH : ils on tout d’abord reproduit la simulation haute résolution du CEPMMT puis en ont réalisé d’autres après avoir déplacé Nadine de quelques centaines de kilomètres. Ils ont ainsi pu confirmer les deux scénarios et l’existence d’une distance seuil. Surtout, ils ont pu montrer que c’est la position relative des deux vortex, et non pas la seule distance relative, qui importe.\r\n\r\nCe travail montre la forte sensibilité de la prévision aux positions relatives de l’ouragan et de la dépression d’altitude, avec un point de bifurcation autour de 1.000 km de distance. Il ouvre une nouvelle voie d’amélioration des prévisions des trajectoires des ouragans dans l’Atlantique nord.',1,1,'2015-08-03 00:00:00','a:7:{s:8:\"fileName\";s:30:\"/media_studies_crop_opt_19.jpg\";s:12:\"originalName\";s:26:\"Media_Studies_crop_opt.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:23413;s:4:\"path\";s:31:\"//media_studies_crop_opt_19.jpg\";s:5:\"width\";i:505;s:6:\"height\";i:284;}'),(20,'Au cœur des premières galaxies, pour la première fois','Grâce au radiotélescope Alma, les astronomes ont entrevu pour la première fois la structure des toutes premières galaxies de l\'Univers, qui, jusque-là, n\'apparaissaient que sous forme de taches faiblement lumineuses. De quoi mieux comprendre leur formatio','Lorsque les toutes premières galaxies se sont formées, quelques centaines de millions d’années après le Big Bang, l’Univers était empli d’un brouillard de gaz d’hydrogène. À mesure toutefois que les sources de lumière — tant les étoiles que les quasars alimentés par de vastes trous noirs — se sont multipliées, ce brouillard s’est dissipé et l’Univers est devenu transparent au rayonnement ultraviolet. Les astronomes appellent cela l’époque de la réionisation. Jusqu’à présent, ces premières galaxies, qui revêtaient l’aspect de taches faiblement lumineuses, demeuraient mystérieuses. De nouvelles observations effectuées au moyen d’Alma (Atacama Large Millimeter/submillimeter Array), et rendues possibles grâce à la toute puissance de ce réseau, sont toutefois sur le point de lever en partie ce voile de mystère.\r\n\r\nUne équipe d’astronomes emmenée par Roberto Maiolino (Laboratoire Cavendish et institut Kavli dédié à la cosmologie, université de Cambridge) a pointé Alma en direction de galaxies dont l’existence, quelque 800 millions d’années après le Big Bang, était avérée (redshifts de 6,8 à 7,1). Les astronomes n’ont pas cherché à analyser la lumière en provenance des étoiles, mais plutôt la faible lueur émise par le carbone ionisé (cette raie spectrale tout à fait singulière emporte une grande partie de l’énergie injectée par les étoiles et permet aux astronomes de connaître la distribution du gaz froid à partir duquel les étoiles se forment) constituant en partie les nuages de gaz à partir desquels les étoiles se formaient. Leur objectif était d’étudier l’interaction entre une jeune génération d’étoiles et les nuages de gaz froid qui se sont formés au sein de ces premières galaxies.\r\n\r\nVoir la structure interne des premières galaxies\r\n\r\nLes astronomes n’ont pas davantage recherché les rares objets extrêmement brillants — tels des quasars et des galaxies caractérisées par des taux particulièrement élevés de formation d’étoiles — qui avaient fait l’objet d’observations antérieures. Ils se sont plutôt concentrés sur les galaxies plus classiques et bien plus nombreuses qui ont réionisé l’Univers et nous entourent aujourd’hui.\r\n\r\nDe l’une de ces galaxies, notée BDF2399, Alma a pu capter un signal, certes faible mais clair, produit par le carbone ionisé. Toutefois, cette lueur ne provenait pas du centre de la galaxie mais de sa périphérie.\r\n\r\nSur cette image composite d’Alma et du VLT, on découvre la galaxie BDF 3299 comme elle était 800 millions d’années seulement après le Big Bang. La tache rouge est un vaste nuage de matière détecté par Alma qui participe à la formation de la jeune galaxie. © Eso, R. Maiolino\r\nSur cette image composite d’Alma et du VLT, on découvre la galaxie BDF 3299 comme elle était 800 millions d’années seulement après le Big Bang. La tache rouge est un vaste nuage de matière détecté par Alma qui participe à la formation de la jeune galaxie. © Eso, R. Maiolino\r\n\r\nAndrea Ferrara (École normale supérieure, Pise), coauteure de cette étude, expose l’importance de ces nouvelles découvertes : « Il s’agit de la détection la plus lointaine à ce jour de ce type d’émission en provenance d’une galaxie normale, datée de moins d’un milliard d’années après le Big Bang. Elle nous offre l’opportunité d’assister à la formation des toutes premières galaxies. Pour la première fois, elles nous apparaissent, non pas sous l’aspect de minuscules taches, mais sous la forme d’objets dotés d’une structure interne ! »\r\n\r\nAux dires des astronomes, la localisation périphérique de la lueur observée résulterait de la perturbation qu’exerce l’environnement hostile constitué des étoiles nouvellement formées — tant leur intense rayonnement que les effets des explosions de supernovae — sur les nuages centraux, tandis que le rayonnement produit par le carbone témoigne de l’accrétion du gaz froid qui compose le milieu intergalactique.',1,1,'2015-08-03 00:00:00','a:7:{s:8:\"fileName\";s:31:\"/search-engine-marketing_20.jpg\";s:12:\"originalName\";s:27:\"Search-engine-marketing.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:1927152;s:4:\"path\";s:32:\"//search-engine-marketing_20.jpg\";s:5:\"width\";i:1600;s:6:\"height\";i:1067;}'),(21,'En bref : le Sida recule dans le monde','De 2000 à 2014, le Sida a reculé dans le monde grâce aux efforts déployés, affirme l\'Onusida dans un long rapport de 500 pages qui démontre les énormes progrès accomplis. Nombre de porteurs du VIH, nouveaux cas et de décès : tout a diminué. À ce rythme, l','« Le monde est sur la bonne voie pour mettre fin à l\'épidémie de Sida d\'ici 2030 » : c’est le commentaire de l’Onusida (Programme commun des Nations unies sur le VIH) à l’occasion du dernier rapport sur l’épidémie de Sida dans le monde, publié le 14 juillet. Parlant de « riposte » pour désigner l’effort mondial réalisé depuis les années 2000 à travers le monde, le rapport souligne l’ampleur des résultats obtenus. Pour l’année 2000, le nombre de nouvelles infections par le VIH, le virus du Sida, était estimé à 3,1 millions. Il n’était plus que de 2 millions en 2014. Sans action, il aurait été de 6 millions, affirme le rapport. L\'Onusida estime que 30 millions de cas ont été évités en quinze ans, ce qui représente 7,8 millions de vies sauvées.\r\n\r\nCette baisse générale cache des disparités régionales. C’est en Afrique, là où les victimes sont les plus nombreuses, que les efforts ont le plus porté, faisant drastiquement reculer l’épidémie. En revanche, le Sida progresse en Asie ainsi qu’en Europe, du moins en nombre de personnes porteuses du virus, mais pas en nombre de personnes nouvellement infectées.\r\n\r\nParmi les objectifs du Millénaire, définis par l’Onu, le sixième concernait le Sida et prévoyait qu’avant la fin de 2015, 15 millions de personnes bénéficieraient d’un traitement « salvateur ». Cet objectif est d’ores et déjà atteint, annonce l’Onusida. Alors qu’en 2000, moins de 1 % des personnes portant le VIH étaient soignées, en 2014, 40 % des porteurs du virus ont eu accès à une thérapie antivirale. Entretemps, le coût du traitement a été réduit de 99 % pour descendre à 100 dollars.',1,1,'2015-08-03 00:00:00','a:7:{s:8:\"fileName\";s:20:\"/basicscience_21.jpg\";s:12:\"originalName\";s:16:\"BasicScience.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:29480;s:4:\"path\";s:21:\"//basicscience_21.jpg\";s:5:\"width\";i:470;s:6:\"height\";i:210;}'),(22,'Un vaccin contre la dengue aux résultats encourageants','Trois essais cliniques testant le vaccin contre la dengue, de Sanofi, révèlent son efficacité, surtout chez les enfants de plus de 9 ans. Le vaccin tétravalent a été administré en trois injections espacées de six mois.','Chaque année, 50 millions de cas de dengue sont répertoriés dans le monde, dont 500.000 de dengue hémorragique, une forme grave de la maladie pouvant être mortelle. Les symptômes de la dengue rappellent ceux de la grippe. Cette maladie tropicale et subtropicale a atteint l\'Europe en 2010 avec deux cas. Aucun traitement n’existe. La prévention consiste à éviter les piqûres de moustiques.\r\n\r\nDans un article paru dans New England Journal of Medicine, des chercheurs ont testé l’efficacité et la sécurité à long terme d’un vaccin contre la dengue dans des régions où la maladie est endémique. Ce candidat vaccin tétravalent (c\'est-à-dire qui couvre une gamme préventive de quatre maladies) a été testé dans trois essais cliniques impliquant plus de 30.000 enfants âgés de 2 à 16 ans en Asie-Pacifique et en Amérique latine.\r\n\r\nLe vaccin recombinant vivant atténué a été développé par Sanofi et testé en phase trois dans des essais cliniques randomisés, c\'est-à-dire dans lesquels les sujets sont aléatoirement répartis. Le vaccin a été administré en trois fois : au début, puis 6 mois plus tard, puis à 12 mois. L’efficacité contre la dengue a été testée à long terme, sur une période de 25 mois (13 mois après la dernière dose), soit dans la troisième année. Les données étaient disponibles pour 10.165, 19.898 et 3.203 participants des trois essais.',1,19,'2015-08-03 00:00:00','a:7:{s:8:\"fileName\";s:27:\"/moustique_tigre_01g_22.jpg\";s:12:\"originalName\";s:23:\"moustique_tigre_01G.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:328924;s:4:\"path\";s:28:\"//moustique_tigre_01g_22.jpg\";s:5:\"width\";i:2541;s:6:\"height\";i:1574;}'),(23,'Les éruptions volcaniques peuvent impacter la couche d’ozone stratosphérique','Une étude pluridisciplinaire menée par des chercheurs franco-britanniques démontre que, contrairement à ce qu’avait laissé supposer l’éruption du Pinatubo de 1991, les halogènes (chlore, brome) gazeux d’origine volcanique sont capables de causer un appauv','L’ozone est un gaz dont la présence dans la stratosphère (haute atmosphère où se situe la couche d’ozone) est indispensable à la vie sur Terre car l’ozone stratosphérique est capable de filtrer les rayons UV nocifs émis par le soleil. Un appauvrissement de cet ozone stratosphérique peut ainsi avoir un impact significatif sur la santé humaine et les écosystèmes ainsi que sur le climat.\r\n\r\nCertains composés halogénés d’origine anthropique (de la famille des chlorofluorocarbures ou des halons par exemple) ont été identifiés comme étant responsables de la destruction de la couche d’ozone. Sous l’effet des rayons UV solaires, ces composés se fragmentent dans la stratosphère et libèrent des halogènes gazeux (chlore, brome) qui accélèrent fortement la destruction de l’ozone. Si le rôle de ces halogènes d’origine anthropique a été clairement établi, celui des halogènes naturels issus du dégazage volcanique a longtemps été considéré comme négligeable. On pensait en effet jusqu’à récemment que les halogènes volcaniques comme le chlore et le brome étaient capturés dans la troposphère (basse atmosphère) par les hydrométéores et ne pouvaient donc atteindre la stratosphère.\r\n\r\nLes observations réalisées suite à la plus grande éruption volcanique observée par satellite, l’éruption plinienne du Mont Pinatubo (Philippines), en 1991, ont conforté cette idée. En effet, bien que la colonne éruptive ait atteint 25-30 km d’altitude (bien au-delà de la troposphère) et que les satellites aient permis d’observer un appauvrissement transitoire de l’ozone global de l’ordre de 5 %, les mesures atmosphériques réalisées après l’éruption ont montré que le niveau de chlore dans la stratosphère n’avait pas augmenté significativement. Il a donc été conclu que la grande majorité des halogènes gazeux issus de l’éruption n’avaient pas atteint la stratosphère et ne pouvaient donc être impliqués dans l’appauvrissement de l’ozone global.\r\n\r\nNéanmoins, l’éruption du Pinatubo est un cas bien particulier :\r\n\r\nles études pétrologiques des roches volcaniques produites ont montré que \"seulement\" 3 mégatonnes de chlore auraient été relâchées lors de l’éruption, ce qui est peu comparé à d’autres éruptions connues ;\r\nle typhon Yunya, qui est passé assez près du mont Pinatubo au moment de l’éruption, a très bien pu lessiver efficacement le chlore du panache volcanique ;\r\nles grandes quantités d’aérosols soufrés injectées dans la stratosphère lors de cette éruption ont favorisé la destruction d’ozone par les composés halogénés d’origine anthropique dont la stratosphère était encore, en 1991, particulièrement chargée.\r\nAlors qu’en est-il au juste ?',1,1,'2015-08-03 06:06:31','a:7:{s:8:\"fileName\";s:23:\"/science-header1_25.jpg\";s:12:\"originalName\";s:19:\"Science Header1.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:34123;s:4:\"path\";s:24:\"//science-header1_25.jpg\";s:5:\"width\";i:684;s:6:\"height\";i:418;}'),(24,'Fossile : un lézard de 125 millions d\'années repéré dans son œuf','Grâce à un accélérateur de particules, des paléontologues ont pu explorer un œuf fossile sans le casser pour reconstituer un puzzle complexe en 3D et retrouver la forme de l’animal : c’était un lézard. Un exploit technique et un beau résultat scientifique','Sur le site de Phu Phok, au nord-est de la Thaïlande, des paléontologues venus de plusieurs pays avaient, depuis longtemps, découvert des œufs fossiles d’environ 2 cm. Les restes de faune et de flore associés situaient l’époque vers la fin du Barrémien, soit environ 125 millions d’années, donc au Crétacé inférieur.\r\n\r\nDevant ces œufs à coquille, les paléontologues ont d’abord pensé à des œufs de dinosaures ou d’oiseaux, puisque c’est à cette époque que la lignée aviaire a commencé à diverger des autres dinosaures. Commence ensuite une originale aventure technologique car une équipe, dont Vincent Fernandez et Éric Buffetaut, a étudié ces œufs et utilisé une source de rayons X aux qualités exceptionnelles : l’accélérateur de particules de l’ESRF (European Synchrotron Radiation Facility).\r\n\r\nReconstitution virtuelle et par impression 3D\r\n\r\nSitué à Grenoble, cet accélérateur de particules est conçu pour exploiter le rayonnement synchrotron qui apparaît lorsqu’une particule chargée suit une trajectoire courbe dans un champ électromagnétique. La ronde d’électrons dans l’anneau de 844 m de circonférence produit des rayons électromagnétiques dans la gamme X, puissants, bien focalisés et de fréquences bien contrôlées. Des faisceaux sont ainsi créés, à la demande, et dirigés vers des stations disponibles pour des expériences de toutes sortes : physique, médecine ou biologie. Mais on y vient aussi pour analyser des tableaux ou, comme ici, des fossiles.\r\n\r\nL’analyse, dont les résultats sont publiés dans la revue PlosOne, a permis de repérer des centaines de fragments osseux dans les deux œufs les mieux conservés : 378 dans l’un (le plus jeune des embryons) et 583 dans l’autre. Des modèles en trois dimensions ont été réalisés sur ordinateur, puis des copies par impression 3D, et les chercheurs ont pu, patiemment, reconstituer le squelette de ces embryons fossiles. Ces petits êtres étaient des lézards, classés chez les anguimorphes, un groupe auquel appartenaient les mosasaures et, aujourd’hui, les orvets et les varans.',1,19,'2015-08-03 14:35:29','a:7:{s:8:\"fileName\";s:57:\"/97d471820c_lezard_oeuf_fossile_tete_profil_moitie_24.jpg\";s:12:\"originalName\";s:53:\"97d471820c_Lezard_Oeuf_Fossile_Tete_Profil_Moitie.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:244122;s:4:\"path\";s:58:\"//97d471820c_lezard_oeuf_fossile_tete_profil_moitie_24.jpg\";s:5:\"width\";i:1788;s:6:\"height\";i:1100;}'),(25,'default','default','Ne pas supprimer cet article permettant une valeur par défaut d\'image.\r\n\r\nL’analyse, dont les résultats sont publiés dans la revue PlosOne, a permis de repérer des centaines de fragments osseux dans les deux œufs les mieux conservés : 378 dans l’un (le plus jeune des embryons) et 583 dans l’autre. Des modèles en trois dimensions ont été réalisés sur ordinateur, puis des copies par impression 3D, et les chercheurs ont pu, patiemment, reconstituer le squelette de ces embryons fossiles. Ces petits êtres étaient des lézards, classés chez les anguimorphes, un groupe auquel appartenaient les mosasaures et, aujourd’hui, les orvets et les varans.\r\n\r\n\r\nPour reconstituer la tête de ce lézard du Crétacé inférieur, il a fallu reconstruire le puzzle. © ESRF/V. Fernandez\r\n\r\nUne étrange coquille dure\r\n\r\nLa fine coquille de 350 microns a posé problème aux spécialistes car, chez les lézards et les serpents (c’est-à-dire les squamates), les œufs (chez ceux qui en pondent puisqu’il existe des vivipares dans ce groupe) sont entourés d’une enveloppe souple. Seuls ceux des geckos (les petits lézards grimpeurs) ont une coquille.\r\n\r\nCes œufs à enveloppe minéralisée auraient donc pu évoquer un cousinage entre les deux mais les geckos ne sont pas du tout des anguimorphes. La calcification de la coquille serait donc apparue deux fois chez les squamates et de façon indépendante chez deux groupes éloignés. Le fait n’est pas stupéfiant mais pose la question de la position taxonomique de ces vieux lézards, dont la lignée a peut-être disparu ou dont les descendants (mais quels sont-ils ?) sont revenus à une coquille souple.\r\n\r\nAucun commentaire  RÉAGISSEZ\r\n \r\nACTUALITÉ PRÉCÉDENTE\r\n\r\nLe plus grand dinosaure à plumes avait des ailes mais ne volait pas\r\nACTUALITÉ SUIVANTE\r\n\r\nTetrapodophis, le serpent qui avait quatre pattes\r\nSUR LE MÊME SUJET\r\nActualité\r\n\r\nEn bref : des œufs fossiles dévoilent la vie grégaire des ptérosaures\r\nDes œufs de dinosaures ovoïdes, comme ceux des oiseaux !\r\nLes dinosaures avaient-ils le sang chaud au Crétacé ?\r\nVoir plus\r\nDossier\r\n\r\n\r\nL\'Archéoptéryx\r\n\r\nLe message des dinosaures\r\nDéfinition\r\n\r\nRayonnement fossile\r\nÉnergie fossile\r\nPaléozoologie\r\nTrou dans la couche d\'ozone\r\nRécupération assistée de méthane dans une couche de houille\r\nGisement fossilifère\r\nParadoxe du grand-père\r\nFossile\r\nFond d\'écran\r\n\r\n\r\nLézard\r\n\r\nStar Wars\r\n\r\nCalendrier Novembre 2011\r\nLivre\r\n\r\n\r\nL\'évolution de la végétation depuis deux millions d\'années\r\n\r\nDiététique de l\'expérience : 50 années d\'observations, 50 années de réflexions 50...\r\n\r\nLe Lézard ocellé\r\n\r\nL\'anti-Jurassic Park : Faire parler l\'ADN fossile\r\n\r\nTrop de pétrole ! : Energie fossile et réchauffement climatique\r\n\r\nQue sais-tu des rêves du lézard ?\r\nVoir plus\r\nVOS RÉACTIONS\r\nDÉPOSER UN COMMENTAIRE\r\nAucun commentaire pour le moment.\r\n\r\nLe TOP des actus\r\n17/07	Le plus grand dinosaure à plumes avait des ailes mais ne volait pas\r\n28/07	Tetrapodophis, le serpent qui avait quatre pattes\r\n01/08	Un réchauffement climatique aurait tué les mammouths\r\n21/07	Fossile : un lézard de 125 millions d\'années repéré dans son œuf\r\n10/07	Dinosaures : un nouveau cousin du Tricératops a été découvert\r\nnext\r\nTous nos derniers sujets\r\nGaz naturel liquéfié : contre la pollution de mer, des navires au GNL ?\r\nProjet Loon : Google va lancer ses ballons au Sri Lanka\r\nEn bref : Mosquirix, le vaccin antipaludéen, va être utilisé en Afrique\r\nCrash du SpaceShip de Virgin Galactic : une erreur humaine\r\nUn vaccin contre la dengue aux résultats encourageants\r\nLes éruptions volcaniques peuvent impacter la couche d’ozone stratosphérique\r\nYahoo! LiveText : une nouvelle messagerie vidéo silencieuse\r\nnext',2,2,'2015-08-03 05:15:23','a:7:{s:8:\"fileName\";s:23:\"/science-header1_25.jpg\";s:12:\"originalName\";s:19:\"Science Header1.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:34123;s:4:\"path\";s:24:\"//science-header1_25.jpg\";s:5:\"width\";i:684;s:6:\"height\";i:418;}'),(26,'SYNCHRONISATION DES HORLOGES : UNE ÉNIGME DE 350 ANS EN PASSE D’ÊTRE RÉSOLUE','C’est le Néerlandais Christiaan Huygens qui, en 1665, avait détecté l’étrangeté. Ce grand esprit du XVIIe siècle s’était étonné de voir que deux horloges à balancier – dont il est d’ailleurs l’inventeur – accrochées cote-à-cote finissaient par synchronise','Peu importait le mouvement initial : en quelques dizaines de minutes, les balanciers se stabilisaient dans un mouvement en parfaite opposition de phase.\r\n\r\nDepuis lors, des générations de chercheurs ont tenté d’expliquer le phénomène, sans en finir totalement avec l’énigme, jusqu’aux travaux d’un mathématicien et d’un physicien de l’université de Lisbonne (Portugal). Les chercheurs semblent avoir trouvé la réponse la plus complète et générale, pouvant même s’appliquer à des oscillateurs électroniques.\r\n\r\n DEUX HORLOGES UNIES PAR UNE ÉTRANGE SORTE DE “SYMPATHIE“\r\n\r\nHuygens a raconté sa trouvaille dans plusieurs lettres à son ami mathématicien René-François de Sluse en 1665, où il qualifie le phénomène de “sympathie” entre les horloges. Il l’avait observé pour la première fois sur deux horloges accrochées au mur (alors qu’il était alité dans sa chambre) mais par la suite il ne l’avait étudié que dans le “cas de laboratoire” où elles sont suspendues à une barre en bois tenue par  deux chaises, comme le montre son dessin .',1,1,'2015-08-03 18:34:39','a:7:{s:8:\"fileName\";s:42:\"/furtwangen_uhrenmuseum_11_04_19_hp_26.jpg\";s:12:\"originalName\";s:38:\"furtwangen_uhrenmuseum_11_04_19_hp.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:66919;s:4:\"path\";s:118:\"C:\\wamp3\\www\\Projet\\E-Lycee\\E-lycee\\app/../web/public/upload/images/pictures/furtwangen_uhrenmuseum_11_04_19_hp_26.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:525;}');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` double NOT NULL,
  `fiche_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F3581855DF522508` (`fiche_id`),
  KEY `IDX_F3581855CB944F1A` (`student_id`),
  KEY `IDX_F35818556BF700BD` (`status_id`),
  CONSTRAINT `FK_F35818556BF700BD` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `FK_F3581855CB944F1A` FOREIGN KEY (`student_id`) REFERENCES `fos_user` (`id`),
  CONSTRAINT `FK_F3581855DF522508` FOREIGN KEY (`fiche_id`) REFERENCES `fiche` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (2,7,4,2,4),(3,0,4,3,5),(4,0,4,4,5),(5,0,4,5,5),(6,0,4,6,5),(7,0,4,7,5),(8,0,4,8,5),(9,0,4,9,5),(19,5,3,2,4),(20,0,3,3,5),(21,0,3,4,5),(22,0,3,5,5),(23,0,3,6,5),(24,0,3,7,5),(25,0,3,8,5),(26,0,3,9,5),(27,8,5,2,4),(28,0,5,3,5),(29,0,5,4,5),(30,0,5,5,5),(31,0,5,6,5),(32,0,5,7,5),(33,0,5,8,5),(34,0,5,9,5),(35,0,6,2,5),(36,0,6,3,5),(37,0,6,4,5),(38,0,6,5,5),(39,0,6,6,5),(40,0,6,7,5),(41,0,6,8,5),(42,0,6,9,5),(43,0,7,10,5),(44,0,7,11,5),(45,0,7,12,5),(46,0,7,13,5),(47,0,7,14,5),(48,0,7,15,5),(49,0,7,16,5),(50,0,7,17,5),(51,0,7,18,5),(77,0,17,10,5),(78,0,17,11,5),(79,0,17,12,5),(80,0,17,13,5),(81,0,17,14,5),(82,0,17,15,5),(83,0,17,16,5),(84,0,17,17,5),(85,0,17,18,5),(86,0,18,2,5),(87,0,18,3,5),(88,0,18,4,5),(89,0,18,5,5),(90,0,18,6,5),(91,0,18,7,5),(92,0,18,8,5),(93,0,18,9,5),(94,0,19,10,5),(95,0,19,11,5),(96,0,19,12,5),(97,0,19,13,5),(98,0,19,14,5),(99,0,19,15,5),(100,0,19,16,5),(101,0,19,17,5),(102,0,19,18,5),(103,0,20,10,5),(104,0,20,11,5),(105,0,20,12,5),(106,0,20,13,5),(107,0,20,14,5),(108,0,20,15,5),(109,0,20,16,5),(110,0,20,17,5),(111,0,20,18,5),(112,10,21,2,4),(113,0,21,3,5),(114,0,21,4,5),(115,0,21,5,5),(116,0,21,6,5),(117,0,21,7,5),(118,0,21,8,5),(119,0,21,9,5);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'PUBLISHED','publié'),(2,'UNPUBLISHED','non publié'),(3,'CLOSED','fermé'),(4,'DONE','fait'),(5,'UNDONE','à faire');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_commentable` tinyint(1) NOT NULL,
  `num_comments` int(11) NOT NULL,
  `last_comment_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
INSERT INTO `thread` VALUES ('4','http://e-lycee.io/news/4',1,1,'2015-07-18 18:54:15'),('foo','',0,0,NULL);
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-03 16:17:42
