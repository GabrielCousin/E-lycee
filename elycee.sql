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
  `reponse` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8E89AF95DF522508` (`fiche_id`),
  CONSTRAINT `FK_8E89AF95DF522508` FOREIGN KEY (`fiche_id`) REFERENCES `fiche` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choix`
--

LOCK TABLES `choix` WRITE;
/*!40000 ALTER TABLE `choix` DISABLE KEYS */;
INSERT INTO `choix` VALUES (1,6,'dsqdqs',4,1),(2,3,'dsqdqsddqs',2,0),(3,3,'la réponse 2 - 0 points',0,1),(4,3,'la réponse 3 - 3 points',3,1),(5,3,'la réponse 4 - -1 point',-1,1),(6,4,'la réponse 1 - non - 5 points',5,0),(7,4,'la réponse 2 - oui - 2 points',2,1),(8,4,'la réponse 3 - non - 3points',3,0),(9,5,'la réponse 1 : oui - 5points',5,1),(10,5,'la réponse 2 : non - 3points',3,0),(11,6,'la réponse 1 : oui 5',5,1),(12,6,'la réponse 2 : non 2',2,1),(13,7,'réponse 5 - oui 3pt',3,1),(14,17,'Deduxit Caesar interneciva antehac potens praeter Isaura Claudiopolis pauca claritudinis.',2,1),(15,17,'Civilibus plerumque dicta post expeditionibus discessit foedere luctuosa in vigilasse.',2,0),(16,17,'Truci latius mollia ululatu per plana repellere superabatur truci quae.',2,0),(17,17,'Interceperat modo innoxius malum quod et casus atrox interceperat acciderat.',2,1),(18,18,'dsqdsqdqs',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaire`
--

LOCK TABLES `commentaire` WRITE;
/*!40000 ALTER TABLE `commentaire` DISABLE KEYS */;
INSERT INTO `commentaire` VALUES (1,'0000-00-00 00:00:00','Alios','Alios autem dicere aiunt multo etiam inhumanius (quem locum breviter paulo ante perstrinxi) praesidii adiumentique causa, non benevolentiae neque caritatis, amicitias esse expetendas; itaque, ut quisque minimum firmitatis haberet minimumque virium, ita amicitias appetere maxime; ex eo fieri ut mulierculae magis amicitiarum praesidia quaerant quam viri et inopes quam opulenti et calamitosi quam ii qui putentur beati.',1),(2,'0000-00-00 00:00:00','Bertrand','Batnae municipium in Anthemusia conditum Macedonum manu priscorum ab Euphrate flumine brevi spatio disparatur, refertum mercatoribus opulentis, ubi annua sollemnitate prope Septembris initium mensis ad nundinas magna promiscuae fortunae convenit multitudo ad commercanda quae Indi mittunt et Seres aliaque plurima vehi terra marique consueta.',2),(3,'0000-00-00 00:00:00','Anne','Cum saepe multa, tum memini domi in hemicyclio sedentem, ut solebat, cum et ego essem una et pauci admodum familiares, in eum sermonem illum incidere qui tum forte multis erat in ore. Meministi enim profecto, Attice, et eo magis, quod P. Sulpicio utebare multum, cum is tribunus plebis capitali odio a Q. Pompeio, qui tum erat consul, dissideret, quocum coniunctissime et amantissime vixerat, quanta esset hominum vel admiratio vel querella.',3),(4,'0000-00-00 00:00:00','Violette','Adolescebat autem obstinatum propositum erga haec et similia multa scrutanda, stimulos admovente regina, quae abrupte mariti fortunas trudebat in exitium praeceps, cum eum potius lenitate feminea ad veritatis humanitatisque viam reducere utilia suadendo deberet, ut in Gordianorum actibus factitasse Maximini truculenti illius imperatoris rettulimus coniugem.',4),(5,'0000-00-00 00:00:00','Bertrand','Ergo ego senator inimicus, si ita vultis, homini, amicus esse, sicut semper fui, rei publicae debeo. Quid?',2),(6,'0000-00-00 00:00:00','linette','Nemo quaeso miretur, si post exsudatos labores itinerum longos congestosque adfatim commeatus fiducia vestri ductante barbaricos pagos adventans velut mutato repente consilio ad placidiora deverti.',5),(7,'0000-00-00 00:00:00','Florent','Ideoque fertur neminem aliquando ob haec vel similia poenae addictum oblato de more elogio revocari iussisse, quod inexorabiles quoque principes factitarunt.',4),(8,'0000-00-00 00:00:00','Julien','Postremo ad id indignitatis est ventum, ut cum peregrini ob formidatam haut ita dudum alimentorum inopiam pellerentur ab urbe praecipites, sectatoribus disciplinarum liberalium i',16),(9,'0000-00-00 00:00:00','Julie','Hoc inmaturo interitu ipse quoque sui pertaesus excessit e vita aetatis nono anno atque vicensimo cum quadriennio imperasset. natus apud Tuscos in Massa Veternensi, patre Constantio Constantini fratre imperatoris, matreque Galla sorore Rufini et Cerealis, quos trabeae consulares nobilitarunt et praefecturae.',NULL),(10,'0000-00-00 00:00:00','Vivian','Circa hos dies Lollianus primae lanuginis adulescens, Lampadi filius ex praefecto, exploratius causam Maximino spectante, convictus codicem noxiarum artium nondum per aetatem firmato consilio descripsisse, exulque mittendus, ut sperabatur.',NULL),(11,'0000-00-00 00:00:00','Jonathan','Et quoniam apud eos ut in capite mundi morborum acerbitates celsius dominantur, ',NULL),(12,'0000-00-00 00:00:00','anne','Quapropter a natura mihi videtur potius quam ab indigentia orta amicitia, applicatione magis animi cum quodam sensu amandi quam cogitatione quantum illa res utilitatis esset habitura.',NULL),(13,'0000-00-00 00:00:00','Anne','Montius nos tumore inusitato quodam et novo ut rebellis et maiestati recalcitrantes Augustae per haec quae strepit incusat iratus nimirum quod contumacem praefectum, quid rerum ordo postulat ignorare dissimulantem formidine tenus iusserim custodiri.',NULL),(14,'0000-00-00 00:00:00','robert','Quapropter a natura mihi videtur potius quam ab indigentia orta amicitia, applicatione magis animi cum quodam sensu amandi quam cogitatione quantum illa res utilitatis esset habitura.',NULL),(15,'0000-00-00 00:00:00','Maxime','Saepissime igitur mihi de amicitia cogitanti maxime illud considerandum videri solet, utrum propter imbecillitatem atque inopiam desiderata sit amicitia, ut dandis recipiendisque meritis quod quisque minus per se ipse posset, id acciperet ab alio vicissimque redderet',NULL),(16,'0000-00-00 00:00:00','Ludo','Quod quidem quale sit, etiam in bestiis quibusdam animadverti potest, quae ex se natos.',NULL),(17,'0000-00-00 00:00:00','Olivier','Unde Rufinus ea tempestate praefectus praetorio ad discrimen trusus est ultimum. ire enim ipse compellebatur ad militem, quem exagitabat inopia simul et feritas, et alioqui coalito more in ordinarias dignitates asperum semper et saevum, ut satisfaceret atque monstraret, quam ob causam annonae convectio sit impedita.',NULL),(18,'0000-00-00 00:00:00','Martine','llud tamen clausos vehementer angebat quod captis navigiis, quae frumenta vehebant per flumen.',NULL),(19,'0000-00-00 00:00:00','Nathalie','Ut enim benefici liberalesque sumus, non ut exigamus gratiam (neque enim beneficium faeneramur',NULL),(20,'2015-07-05 16:59:26','Amelie','Mon commentaire',NULL),(21,'2015-07-16 09:39:33','Amelie','',NULL),(22,'2015-07-26 19:03:28','fsdfsd','fdsfd',16),(23,'2015-07-26 19:03:45','dsqdqs','dqsdqs',16),(24,'2015-08-02 14:11:45','titi','test de commentaire',15),(25,'2015-08-02 14:14:13','titi','test',15),(26,'2015-08-02 14:16:41','titi','spam',15),(27,'2015-08-02 14:16:55','titi','spam',15),(28,'2015-08-02 14:17:24','titi','dfsdsq',15),(29,'2015-08-02 14:17:43','titi','dsqdqs',15),(30,'2015-08-02 14:17:48','titi','dqsdqs',15),(31,'2015-08-02 14:21:25','titi','dqsdqsdqs',15);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiche`
--

LOCK TABLES `fiche` WRITE;
/*!40000 ALTER TABLE `fiche` DISABLE KEYS */;
INSERT INTO `fiche` VALUES (3,1,1,'question 1','Quelle est la question 1?',1),(4,1,1,'question 2','Quelle est la question 2 bis?',1),(5,1,1,'Question 3','Quelle est la question 3?',1),(6,1,1,'Question 4','Quelle est la question 4?',2),(7,1,2,'question 5','La question 5 ?',2),(17,19,2,'Geographie','Natura quae et et natos ita lumen in ita sit ?',1),(18,19,1,'dsqdqs','dsqdqsdsq',2);
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
INSERT INTO `fos_user` VALUES (1,'toto','toto','toto@toto.com','toto@toto.com',1,'9wn4t4mn0y88s4s0oskkos8sw848o84','eX7YaKZywCsyl8tnYuCIqJxh3M+kqs22Rwm9T8EBTiQGyoFQ+MvkFf+CM8m81KaXSQLyRlkmqHPlYd03sgPoxQ==','2015-08-02 16:17:42',0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_TEACHER\";}',0,NULL,NULL,'Henri','Birton'),(2,'Abel','abel','abel@lecole.com','abel@lecole.com',1,'u1c8dxobhes4swgk8ockwk8g000ssg','RxLFQEXw0lHwTJSY0AahJEjuIJV25XVPsXxgdGv5oD4BnNnRkVTK76icduBxjOIZ5Sjc3DhQgjbstmDKaaS+oA==','2015-08-02 15:32:34',0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'abel','Mabrouk'),(3,'Al','al','al@lecole.com','al@lecole.com',1,'gr0lribsn3coksw8k4scc8wswsw044g','cnPWwMsYS5MNOaRrB5q+kLP24K6vmJD8317Mq9sV5MfaMvcR5Ipne2f6hj9thCbxJD5zbSp2gUTgorKFMvrYGw==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(4,'Alan','alan','alan@lecole.com','alan@lecole.com',1,'dvg4ockjut4w400c48ws0ogkgk04w0g','utkluOGsci8pvR8ujhChVRNCUffa4XjL5z6wiEqWGgZl5HH37EnB14ggDEs5WjLdnJJpY39E8rCaj/aGy4QEeg==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(5,'Arthur','arthur','arthur@lecole.com','arthur@lecole.com',1,'7djdc00h2fockc8so44coc44ccwg8g0','nQ/1rKnLdSje7zujmS8sRd5VoueQFLJoEqbqYm0lutoEfJn+a6cvnuru5z/yXVAI86djgiZaqts/BBYzCaE/kA==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(6,'Carl','carl','carl@lecole.com','carl@lecole.com',1,'dhsbogutjrwwso0g0k8884w8cogk8k0','u4K/bESCCT/KpEipDJU0xlXmUCnXrDLhYZ5uRwZkBLFKcwaW/GL3jejKkfQex+vYn0ydf13PjR/u3gwobMYj+A==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(7,'Blaise','blaise','car@lecole.com','car@lecole.com',1,'3ya27403rrwgkg8woowgkw04kogw4wo','qvScwr9O0rgNeWqEBkflEdZETc4pusSOShWB+5jRO+0ZcmGhNOSeTWgFQg3ei8xJyTzwK0v/9PPHo2XTT3tDAw==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(8,'Isaac','isaac','isaac@lecole.com','isaac@lecole.com',1,'5ds1xtmiwsso8kkwgs4ow8w8c0c00g4','JgRdNCC1yeXPmXqxyspnGTfr5vlzss0HoxAJIFZJJNUttfBHjuypSyBox2ljKCAr/VAfBFkyrC4gqK+/hYOJ0A==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(9,'Steve','steve','steve@lecole.com','steve@lecole.com',1,'gwg6xqcbbfw4ogwskc8g8gsg4ko8w88','Y7iMUHkG9iLpUpKSOUbZVTdF5ytaxkVoERrck2luZ4VofY9ESS7IKZ+xQCTD5g4kenFWFb2xSmIXl49r27xoeQ==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,1,'',''),(10,'Alfred','alfred','alfred@lecole.com','alfred@lecole.com',1,'9fsdie7i3484wcw400oskwosog8gkgs','5s5c5PdIMha0QWErgMJ4PqUODTDYOZ/8ai13hAre1g9keWoPK37QgDQN9KFLP41f54tnm2vJyYFRBRdJ8BU+HQ==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(11,'Brendan','brendan','brendan@lecole.com','brendan@lecole.com',1,'9e7o6c0sxw08s4o8kwo8c44c8sw4ckg','8ym2NWKdxwDJoZCS7C5pSvxblGgIvQYdbZx0FmtjJnFv4zHTIFRONmLMhaoJTO1bLnEOIrLcrZDL7/mSklYsnw==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(12,'David','david','david@lecole.com','david@lecole.com',1,'2bgf7mr2iijowko0wk0scwwkogwkoo8','6m4AFXFGS+aLYYfBstZCbbPKtrwaVPA9HGn9CwssX91e6mS2FYnmzI80aSKe3X15MT9pHg/sZLTS6tSj1uNBJQ==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(13,'GGeorge','ggeorge','george@lecole.com','george@lecole.com',1,'bslfe8fc37k0k84o0cs0wokk00488wg','DkEDg1baZrUw2NUsEK6VtW0vfj2TAQrLBEDl/NE0jzSdCQJ5Mep+mZjiTJZWRQI1+pga/yT1ZrfpcvyslOgjpw==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(14,'Jim','jim','jim@lecole.com','jim@lecole.com',1,'o39f04knrg0o0kw48og4gwsgs808wgw','AWOSC+xzpf8RMRc+G9PlHI88PGpsG/aBPmzB5MaOVYJpK5ZOtdsTpwwJMXmMfNCsFzyhuZPi6GBv4xjPX+n6sA==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(15,'LesLeslie','lesleslie','leslie@lecole.com','leslie@lecole.com',1,'i8uy0ipcpvk0s0wcww0cww8ccgww88w','VmoDYBc5ETVttH1zqrqLU01dw6/H9l0OFuDdY9US0JRToyFvOeikAraSmLiqXSSFnEuvQgwLFII/jv4J0xB9+Q==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(16,'Maria','maria','maria@lecole.com','maria@lecole.com',1,'gs82dah64l4ww80c80w0800gg4gkcsg','w44X5G5Pl3f+CIA75TTu4Bx2BizdztxDI4PM4IS8VAh+QTfYKajcGxubcPvjGiGsEUG2Hlcat/imwVpP7/UqLQ==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(17,'Rasmus','rasmus','rasmus@lecole.com','rasmus@lecole.com',1,'djyk0i5kn4ocgcg80kcoogkwg4ogw8s','u0WYEmP8Jqv4zv3b1sVzIerUNUNEWHeVPn2XVlYpiDpdtjUnT8/EK5OqlwG2kxC3IlfJb9RBRDWyo6H/lJJFoA==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(18,'Tim','tim','tim@lecole.com','tim@lecole.com',1,'cu2gygaw9g08ksgssk40gc044g48okw','7o4kPEcuuxaK2tGL3j6D440pfUlG0964kDVVesg1d14N90XmapVuF+ICazH6XNWLU/FJKqXuU9yIWqn/oJqixA==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,2,'',''),(19,'titi','titi','titi@titi.com','titi@titi.com',1,'9wn4t4mn0y88s4s0oskkos8sw848o84','eX7YaKZywCsyl8tnYuCIqJxh3M+kqs22Rwm9T8EBTiQGyoFQ+MvkFf+CM8m81KaXSQLyRlkmqHPlYd03sgPoxQ==','2015-08-02 13:01:32',0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_TEACHER\";}',0,NULL,NULL,'Daniel','Gonzag');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Ad quas non plus','Novo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus.','Novo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus, et adhibitis paucis clam ferro succinctis vesperi per tabernas palabatur et conpita quaeritando Graeco sermone, cuius erat inpendio gnarus, quid de Caesare quisque sentiret. et haec confidenter agebat in urbe ubi pernoctantium luminum claritudo dierum solet imitari fulgorem. postremo agnitus saepe iamque, si prodisset, conspicuum se fore contemplans, non nisi luce palam egrediens ad agenda quae putabat seria cernebatur. et haec quidem medullitus multis gementibus agebantur.\r\n\r\nItaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias qui honorem amici anteponat suo? Quid? Haec ut omittam, quam graves, quam difficiles plerisque videntur calamitatum societates! Ad quas non est facile inventu qui descendant. Quamquam Ennius recte.',1,1,'2015-06-11 00:00:00','a:7:{s:8:\"fileName\";s:23:\"/101122083819702260.jpg\";s:12:\"originalName\";s:22:\"101122083819702260.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:35278;s:4:\"path\";s:24:\"//101122083819702260.jpg\";s:5:\"width\";i:640;s:6:\"height\";i:428;}'),(2,'Quamquam Ennius','Itaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias','Itaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias qui honorem amici anteponat suo? Quid? Haec ut omittam, quam graves, quam difficiles plerisque videntur calamitatum societates! Ad quas non est facile inventu qui descendant. Quamquam Ennius recte.\r\n\r\nNovo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus, et adhibitis paucis clam ferro succinctis vesperi per tabernas palabatur et conpita quaeritando Graeco sermone, cuius erat inpendio gnarus, quid de Caesare quisque sentiret. et haec confidenter agebat in urbe ubi pernoctantium luminum claritudo dierum solet imitari fulgorem. postremo agnitus saepe iamque, si prodisset, conspicuum se fore contemplans, non nisi luce palam egrediens ad agenda quae putabat seria cernebatur. et haec quidem medullitus multis gementibus agebantur.',1,19,'2015-06-19 00:00:00','a:7:{s:8:\"fileName\";s:17:\"/BasicScience.jpg\";s:12:\"originalName\";s:16:\"BasicScience.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:29480;s:4:\"path\";s:18:\"//BasicScience.jpg\";s:5:\"width\";i:470;s:6:\"height\";i:210;}'),(3,'Gallus ausus','Novo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus.','Novo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus, et adhibitis paucis clam ferro succinctis vesperi per tabernas palabatur et conpita quaeritando Graeco sermone, cuius erat inpendio gnarus, quid de Caesare quisque sentiret. et haec confidenter agebat in urbe ubi pernoctantium luminum claritudo dierum solet imitari fulgorem. postremo agnitus saepe iamque, si prodisset, conspicuum se fore contemplans, non nisi luce palam egrediens ad agenda quae putabat seria cernebatur. et haec quidem medullitus multis gementibus agebantur.\r\n\r\nItaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias qui honorem amici anteponat suo? Quid? Haec ut omittam, quam graves, quam difficiles plerisque videntur calamitatum societates! Ad quas non est facile inventu qui descendant. Quamquam Ennius recte.',1,1,'2015-06-10 00:00:00','a:7:{s:8:\"fileName\";s:24:\"/etude-et -formation.jpg\";s:12:\"originalName\";s:23:\"etude-et -formation.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:68242;s:4:\"path\";s:25:\"//etude-et+-formation.jpg\";s:5:\"width\";i:530;s:6:\"height\";i:225;}'),(4,'Itaque verae','Itaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias','Itaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias qui honorem amici anteponat suo? Quid? Haec ut omittam, quam graves, quam difficiles plerisque videntur calamitatum societates! Ad quas non est facile inventu qui descendant. Quamquam Ennius recte.\r\n\r\nNovo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus, et adhibitis paucis clam ferro succinctis vesperi per tabernas palabatur et conpita quaeritando Graeco sermone, cuius erat inpendio gnarus, quid de Caesare quisque sentiret. et haec confidenter agebat in urbe ubi pernoctantium luminum claritudo dierum solet imitari fulgorem. postremo agnitus saepe iamque, si prodisset, conspicuum se fore contemplans, non nisi luce palam egrediens ad agenda quae putabat seria cernebatur. et haec quidem medullitus multis gementibus agebantur.',1,19,'2015-06-06 00:00:00','a:7:{s:8:\"fileName\";s:16:\"/etudes_play.png\";s:12:\"originalName\";s:15:\"etudes_play.png\";s:8:\"mimeType\";s:9:\"image/png\";s:4:\"size\";i:321706;s:4:\"path\";s:17:\"//etudes_play.png\";s:5:\"width\";i:720;s:6:\"height\";i:300;}'),(5,'Excitavi','Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens','Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens.',2,19,'2015-06-06 00:00:00','a:7:{s:8:\"fileName\";s:45:\"/the-digital-marketing-room-homepage-grid.png\";s:12:\"originalName\";s:44:\"the-digital-marketing-room-homepage-grid.png\";s:8:\"mimeType\";s:9:\"image/png\";s:4:\"size\";i:1176990;s:4:\"path\";s:46:\"//the-digital-marketing-room-homepage-grid.png\";s:5:\"width\";i:2481;s:6:\"height\";i:1264;}'),(6,'Finierat','Mox dicta finierat, multitudo omnis ad, quae imperator voluit, promptior laudato consilio consensit in pacem ea ratione maxime percita','Mox dicta finierat, multitudo omnis ad, quae imperator voluit, promptior laudato consilio consensit in pacem ea ratione maxime percita, quod norat expeditionibus crebris fortunam eius in malis tantum civilibus vigilasse, cum autem bella moverentur externa, accidisse plerumque luctuosa, icto post haec foedere gentium ritu perfectaque sollemnitate imperator Mediolanum ad hiberna discessit.',1,19,'2015-05-13 00:00:00','a:7:{s:8:\"fileName\";s:27:\"/marketing-marche-etude.jpg\";s:12:\"originalName\";s:26:\"marketing-marche-etude.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:99859;s:4:\"path\";s:28:\"//marketing-marche-etude.jpg\";s:5:\"width\";i:424;s:6:\"height\";i:283;}'),(7,'Iam in altera','Iam in altera philosophiae parte. quae est quaerendi ac disserendi, quae logikh dicitur, iste vester plane, ut mihi quidem videtur','Iam in altera philosophiae parte. quae est quaerendi ac disserendi, quae logikh dicitur, iste vester plane, ut mihi quidem videtur, inermis ac nudus est. tollit definitiones, nihil de dividendo ac partiendo docet, non quo modo efficiatur concludaturque ratio tradit, non qua via captiosa solvantur ambigua distinguantur ostendit; iudicia rerum in sensibus ponit, quibus si semel aliquid falsi pro vero probatum sit, sublatum esse omne iudicium veri et falsi putat.',1,19,'2015-06-28 00:00:00','a:7:{s:8:\"fileName\";s:23:\"/page_casestudies_7.jpg\";s:12:\"originalName\";s:20:\"page_casestudies.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:60931;s:4:\"path\";s:24:\"//page_casestudies_7.jpg\";s:5:\"width\";i:590;s:6:\"height\";i:240;}'),(8,'Sed cautela','Sed cautela nimia in peiores haeserat plagas','Sed cautela nimia in peiores haeserat plagas, ut narrabimus postea, aemulis consarcinantibus insidias graves apud Constantium, cetera medium principem sed siquid auribus eius huius modi quivis infudisset ignotus, acerbum et inplacabilem et in hoc causarum titulo dissimilem sui.',1,19,'2015-06-11 00:00:00','a:7:{s:8:\"fileName\";s:22:\"/Masterclass-Rajiv.jpg\";s:12:\"originalName\";s:21:\"Masterclass-Rajiv.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:195687;s:4:\"path\";s:23:\"//Masterclass-Rajiv.jpg\";s:5:\"width\";i:528;s:6:\"height\";i:270;}'),(9,'Quare hoc','Quare hoc quidem praeceptum, cuiuscumque est,','Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat.\r\n\r\nDuplexque isdem diebus acciderat malum, quod et Theophilum insontem atrox interceperat casus, et Serenianus dignus exsecratione cunctorum, innoxius, modo non reclamante publico vigore, discessit.',1,1,'2015-06-20 00:00:00','a:7:{s:8:\"fileName\";s:37:\"/etude-de-marche-travail-domicile.jpg\";s:12:\"originalName\";s:36:\"etude-de-marche-travail-domicile.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:37452;s:4:\"path\";s:38:\"//etude-de-marche-travail-domicile.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:345;}'),(10,'Etenim si','Etenim si attendere diligenter, existimare vere de','Etenim si attendere diligenter, existimare vere de omni hac causa volueritis, sic constituetis, iudices, nec descensurum quemquam ad hanc accusationem fuisse, cui, utrum vellet, liceret, nec, cum descendisset, quicquam habiturum spei fuisse, nisi alicuius intolerabili libidine et nimis acerbo odio niteretur. Sed ego Atratino, humanissimo atque optimo adulescenti meo necessario, ignosco, qui habet excusationem vel pietatis vel necessitatis vel aetatis. Si voluit accusare, pietati tribuo, si iussus est, necessitati, si speravit aliquid, pueritiae. Ceteris non modo nihil ignoscendum, sed etiam acriter est resistendum.\r\n\r\nAltera sententia est, quae definit amicitiam paribus officiis ac voluntatibus. Hoc quidem est nimis exigue et exiliter ad calculos vocare amicitiam, ut par sit ratio acceptorum et datorum. Divitior mihi et affluentior videtur esse vera amicitia nec observare restricte, ne plus reddat quam acceperit; neque enim verendum est, ne quid excidat, aut ne quid in terram defluat, aut ne plus aequo quid in amicitiam congeratur',1,19,'2015-05-30 00:00:00','a:7:{s:8:\"fileName\";s:49:\"/rentree-scolaire-lycee-jeanne-d-arc_1249397.jpeg\";s:12:\"originalName\";s:48:\"rentree-scolaire-lycee-jeanne-d-arc_1249397.jpeg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:96431;s:4:\"path\";s:50:\"//rentree-scolaire-lycee-jeanne-d-arc_1249397.jpeg\";s:5:\"width\";i:800;s:6:\"height\";i:532;}'),(11,'nouvel article','Incenderat autem audaces usque ad insaniam homines ad haec, quae nefariis egere conatibus, Luscus quidam curator urbis subito visus: eosque ut heiulans baiolorum praecentor ad expediendum quod orsi sunt incitans vocibus crebris. qui haut longe postea ideo','Incenderat autem audaces usque ad insaniam homines ad haec, quae nefariis egere conatibus, Luscus quidam curator urbis subito visus: eosque ut heiulans baiolorum praecentor ad expediendum quod orsi sunt incitans vocibus crebris. qui haut longe postea ideo vivus exustus est.',2,1,'2010-01-01 00:00:00','a:7:{s:8:\"fileName\";s:34:\"/Social_Studies_Wordle-190d0rf.png\";s:12:\"originalName\";s:33:\"Social_Studies_Wordle-190d0rf.png\";s:8:\"mimeType\";s:9:\"image/png\";s:4:\"size\";i:90290;s:4:\"path\";s:35:\"//Social_Studies_Wordle-190d0rf.png\";s:5:\"width\";i:500;s:6:\"height\";i:300;}'),(13,'Latinas litteras','Euripidis fabulis delectari dicat ?','Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?',2,1,'2015-07-16 10:11:00','a:7:{s:8:\"fileName\";s:18:\"/4fe782d5dd436.jpg\";s:12:\"originalName\";s:17:\"4fe782d5dd436.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:60751;s:4:\"path\";s:19:\"//4fe782d5dd436.jpg\";s:5:\"width\";i:800;s:6:\"height\";i:566;}'),(14,'Caesare','causatus nec regiam','Qui cum venisset ob haec festinatis itineribus Antiochiam, praestrictis palatii ianuis, contempto Caesare, quem videri decuerat, ad praetorium cum pompa sollemni perrexit morbosque diu causatus nec regiam introiit nec processit in publicum, sed abditus multa in eius moliebatur exitium addens quaedam relationibus supervacua, quas subinde dimittebat ad principem.',1,19,'2015-07-16 12:06:00','a:7:{s:8:\"fileName\";s:40:\"/etude-de-marche-travail-domicile_14.jpg\";s:12:\"originalName\";s:36:\"etude-de-marche-travail-domicile.jpg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:37452;s:4:\"path\";s:41:\"//etude-de-marche-travail-domicile_14.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:345;}'),(15,'Volatu rapiunt','Qui si praedam dispexerint celsius, volatu rapiunt celeri,','Saraceni tamen nec amici nobis umquam nec hostes optandi, ultro citroque discursantes quicquid inveniri poterat momento temporis parvi vastabant milvorum rapacium similes, qui si praedam dispexerint celsius, volatu rapiunt celeri, aut nisi impetraverint, non inmorantur.',1,19,'2015-07-17 00:00:00','a:7:{s:8:\"fileName\";s:47:\"/223028971130dabb23960fdc44adf6a8_large_15.jpeg\";s:12:\"originalName\";s:43:\"223028971130dabb23960fdc44adf6a8_large.jpeg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:350505;s:4:\"path\";s:48:\"//223028971130dabb23960fdc44adf6a8_large_15.jpeg\";s:5:\"width\";i:1920;s:6:\"height\";i:1080;}'),(16,'Volatu rapiunt','Qui si praedam dispexerint celsius, volatu rapiunt celeri,','Saraceni tamen nec amici nobis umquam nec hostes optandi, ultro citroque discursantes quicquid inveniri poterat momento temporis parvi vastabant milvorum rapacium similes, qui si praedam dispexerint celsius, volatu rapiunt celeri, aut nisi impetraverint, non inmorantur.',1,19,'2015-07-17 00:00:00','a:7:{s:8:\"fileName\";s:47:\"/223028971130dabb23960fdc44adf6a8_large_16.jpeg\";s:12:\"originalName\";s:43:\"223028971130dabb23960fdc44adf6a8_large.jpeg\";s:8:\"mimeType\";s:10:\"image/jpeg\";s:4:\"size\";i:350505;s:4:\"path\";s:48:\"//223028971130dabb23960fdc44adf6a8_large_16.jpeg\";s:5:\"width\";i:1920;s:6:\"height\";i:1080;}');
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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (2,7,4,2,4),(3,0,4,3,5),(4,0,4,4,5),(5,0,4,5,5),(6,0,4,6,5),(7,0,4,7,5),(8,0,4,8,5),(9,0,4,9,5),(19,5,3,2,4),(20,0,3,3,5),(21,0,3,4,5),(22,0,3,5,5),(23,0,3,6,5),(24,0,3,7,5),(25,0,3,8,5),(26,0,3,9,5),(27,8,5,2,4),(28,0,5,3,5),(29,0,5,4,5),(30,0,5,5,5),(31,0,5,6,5),(32,0,5,7,5),(33,0,5,8,5),(34,0,5,9,5),(35,0,6,2,5),(36,0,6,3,5),(37,0,6,4,5),(38,0,6,5,5),(39,0,6,6,5),(40,0,6,7,5),(41,0,6,8,5),(42,0,6,9,5),(43,0,7,10,5),(44,0,7,11,5),(45,0,7,12,5),(46,0,7,13,5),(47,0,7,14,5),(48,0,7,15,5),(49,0,7,16,5),(50,0,7,17,5),(51,0,7,18,5),(77,0,17,10,5),(78,0,17,11,5),(79,0,17,12,5),(80,0,17,13,5),(81,0,17,14,5),(82,0,17,15,5),(83,0,17,16,5),(84,0,17,17,5),(85,0,17,18,5),(86,0,18,2,5),(87,0,18,3,5),(88,0,18,4,5),(89,0,18,5,5),(90,0,18,6,5),(91,0,18,7,5),(92,0,18,8,5),(93,0,18,9,5);
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

-- Dump completed on 2015-08-03  9:50:14
