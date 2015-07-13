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
  PRIMARY KEY (`id`),
  KEY `IDX_8E89AF95DF522508` (`fiche_id`),
  CONSTRAINT `FK_8E89AF95DF522508` FOREIGN KEY (`fiche_id`) REFERENCES `fiche` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choix`
--

LOCK TABLES `choix` WRITE;
/*!40000 ALTER TABLE `choix` DISABLE KEYS */;
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
-- Table structure for table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `contenu` longtext COLLATE utf8_unicode_ci NOT NULL,
  `createAt` datetime NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E16CE76B4B89032C` (`post_id`),
  CONSTRAINT `FK_E16CE76B4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaire`
--

LOCK TABLES `commentaire` WRITE;
/*!40000 ALTER TABLE `commentaire` DISABLE KEYS */;
INSERT INTO `commentaire` VALUES (1,1,'Alios autem dicere aiunt multo etiam inhumanius (quem locum breviter paulo ante perstrinxi) praesidii adiumentique causa, non benevolentiae neque caritatis, amicitias esse expetendas; itaque, ut quisque minimum firmitatis haberet minimumque virium, ita amicitias appetere maxime; ex eo fieri ut mulierculae magis amicitiarum praesidia quaerant quam viri et inopes quam opulenti et calamitosi quam ii qui putentur beati.','0000-00-00 00:00:00','Alios'),(2,2,'Batnae municipium in Anthemusia conditum Macedonum manu priscorum ab Euphrate flumine brevi spatio disparatur, refertum mercatoribus opulentis, ubi annua sollemnitate prope Septembris initium mensis ad nundinas magna promiscuae fortunae convenit multitudo ad commercanda quae Indi mittunt et Seres aliaque plurima vehi terra marique consueta.','0000-00-00 00:00:00','Bertrand'),(3,3,'Cum saepe multa, tum memini domi in hemicyclio sedentem, ut solebat, cum et ego essem una et pauci admodum familiares, in eum sermonem illum incidere qui tum forte multis erat in ore. Meministi enim profecto, Attice, et eo magis, quod P. Sulpicio utebare multum, cum is tribunus plebis capitali odio a Q. Pompeio, qui tum erat consul, dissideret, quocum coniunctissime et amantissime vixerat, quanta esset hominum vel admiratio vel querella.','0000-00-00 00:00:00','Anne'),(4,4,'Adolescebat autem obstinatum propositum erga haec et similia multa scrutanda, stimulos admovente regina, quae abrupte mariti fortunas trudebat in exitium praeceps, cum eum potius lenitate feminea ad veritatis humanitatisque viam reducere utilia suadendo deberet, ut in Gordianorum actibus factitasse Maximini truculenti illius imperatoris rettulimus coniugem.','0000-00-00 00:00:00','Violette'),(5,2,'Ergo ego senator inimicus, si ita vultis, homini, amicus esse, sicut semper fui, rei publicae debeo. Quid?','0000-00-00 00:00:00','Bertrand'),(6,3,'Nemo quaeso miretur, si post exsudatos labores itinerum longos congestosque adfatim commeatus fiducia vestri ductante barbaricos pagos adventans velut mutato repente consilio ad placidiora deverti.','0000-00-00 00:00:00','linette'),(7,1,'Ideoque fertur neminem aliquando ob haec vel similia poenae addictum oblato de more elogio revocari iussisse, quod inexorabiles quoque principes factitarunt.','0000-00-00 00:00:00','Florent'),(8,2,'Postremo ad id indignitatis est ventum, ut cum peregrini ob formidatam haut ita dudum alimentorum inopiam pellerentur ab urbe praecipites, sectatoribus disciplinarum liberalium i','0000-00-00 00:00:00','Julien'),(9,2,'Hoc inmaturo interitu ipse quoque sui pertaesus excessit e vita aetatis nono anno atque vicensimo cum quadriennio imperasset. natus apud Tuscos in Massa Veternensi, patre Constantio Constantini fratre imperatoris, matreque Galla sorore Rufini et Cerealis, quos trabeae consulares nobilitarunt et praefecturae.','0000-00-00 00:00:00','Julie'),(10,3,'Circa hos dies Lollianus primae lanuginis adulescens, Lampadi filius ex praefecto, exploratius causam Maximino spectante, convictus codicem noxiarum artium nondum per aetatem firmato consilio descripsisse, exulque mittendus, ut sperabatur.','0000-00-00 00:00:00','Vivian'),(11,2,'Et quoniam apud eos ut in capite mundi morborum acerbitates celsius dominantur, ','0000-00-00 00:00:00','Jonathan'),(12,1,'Quapropter a natura mihi videtur potius quam ab indigentia orta amicitia, applicatione magis animi cum quodam sensu amandi quam cogitatione quantum illa res utilitatis esset habitura.','0000-00-00 00:00:00','anne'),(13,1,'Montius nos tumore inusitato quodam et novo ut rebellis et maiestati recalcitrantes Augustae per haec quae strepit incusat iratus nimirum quod contumacem praefectum, quid rerum ordo postulat ignorare dissimulantem formidine tenus iusserim custodiri.','0000-00-00 00:00:00','Anne'),(14,2,'Quapropter a natura mihi videtur potius quam ab indigentia orta amicitia, applicatione magis animi cum quodam sensu amandi quam cogitatione quantum illa res utilitatis esset habitura.','0000-00-00 00:00:00','robert'),(15,3,'Saepissime igitur mihi de amicitia cogitanti maxime illud considerandum videri solet, utrum propter imbecillitatem atque inopiam desiderata sit amicitia, ut dandis recipiendisque meritis quod quisque minus per se ipse posset, id acciperet ab alio vicissimque redderet','0000-00-00 00:00:00','Maxime'),(16,2,'Quod quidem quale sit, etiam in bestiis quibusdam animadverti potest, quae ex se natos.','0000-00-00 00:00:00','Ludo'),(17,1,'Unde Rufinus ea tempestate praefectus praetorio ad discrimen trusus est ultimum. ire enim ipse compellebatur ad militem, quem exagitabat inopia simul et feritas, et alioqui coalito more in ordinarias dignitates asperum semper et saevum, ut satisfaceret atque monstraret, quam ob causam annonae convectio sit impedita.','0000-00-00 00:00:00','Olivier'),(18,2,'llud tamen clausos vehementer angebat quod captis navigiis, quae frumenta vehebant per flumen.','0000-00-00 00:00:00','Martine'),(19,1,'Ut enim benefici liberalesque sumus, non ut exigamus gratiam (neque enim beneficium faeneramur','0000-00-00 00:00:00','Nathalie'),(20,1,'Mon commentaire','2015-07-05 16:59:26','Amelie');
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
  PRIMARY KEY (`id`),
  KEY `IDX_8DD2E37C50962F74` (`lvl_id`),
  KEY `IDX_8DD2E37C41807E1D` (`teacher_id`),
  CONSTRAINT `FK_8DD2E37C41807E1D` FOREIGN KEY (`teacher_id`) REFERENCES `fos_user` (`id`),
  CONSTRAINT `FK_8DD2E37C50962F74` FOREIGN KEY (`lvl_id`) REFERENCES `niveau` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiche`
--

LOCK TABLES `fiche` WRITE;
/*!40000 ALTER TABLE `fiche` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  KEY `IDX_957A647950962F74` (`lvl_id`),
  CONSTRAINT `FK_957A647950962F74` FOREIGN KEY (`lvl_id`) REFERENCES `niveau` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (1,'toto','toto','toto@toto.com','toto@toto.com',1,'9wn4t4mn0y88s4s0oskkos8sw848o84','eX7YaKZywCsyl8tnYuCIqJxh3M+kqs22Rwm9T8EBTiQGyoFQ+MvkFf+CM8m81KaXSQLyRlkmqHPlYd03sgPoxQ==','2015-07-13 15:37:35',0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_TEACHER\";}',0,NULL,NULL),(2,'Abel','abel','abel@lecole.com','abel@lecole.com',1,'u1c8dxobhes4swgk8ockwk8g000ssg','RxLFQEXw0lHwTJSY0AahJEjuIJV25XVPsXxgdGv5oD4BnNnRkVTK76icduBxjOIZ5Sjc3DhQgjbstmDKaaS+oA==','2015-07-13 09:47:06',0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_STUDENT\";}',0,NULL,NULL),(3,'Al','al','al@lecole.com','al@lecole.com',1,'gr0lribsn3coksw8k4scc8wswsw044g','cnPWwMsYS5MNOaRrB5q+kLP24K6vmJD8317Mq9sV5MfaMvcR5Ipne2f6hj9thCbxJD5zbSp2gUTgorKFMvrYGw==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(4,'Alan','alan','alan@lecole.com','alan@lecole.com',1,'dvg4ockjut4w400c48ws0ogkgk04w0g','utkluOGsci8pvR8ujhChVRNCUffa4XjL5z6wiEqWGgZl5HH37EnB14ggDEs5WjLdnJJpY39E8rCaj/aGy4QEeg==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(5,'Arthur','arthur','arthur@lecole.com','arthur@lecole.com',1,'7djdc00h2fockc8so44coc44ccwg8g0','nQ/1rKnLdSje7zujmS8sRd5VoueQFLJoEqbqYm0lutoEfJn+a6cvnuru5z/yXVAI86djgiZaqts/BBYzCaE/kA==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(6,'Carl','carl','carl@lecole.com','carl@lecole.com',1,'dhsbogutjrwwso0g0k8884w8cogk8k0','u4K/bESCCT/KpEipDJU0xlXmUCnXrDLhYZ5uRwZkBLFKcwaW/GL3jejKkfQex+vYn0ydf13PjR/u3gwobMYj+A==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(7,'Blaise','blaise','car@lecole.com','car@lecole.com',1,'3ya27403rrwgkg8woowgkw04kogw4wo','qvScwr9O0rgNeWqEBkflEdZETc4pusSOShWB+5jRO+0ZcmGhNOSeTWgFQg3ei8xJyTzwK0v/9PPHo2XTT3tDAw==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(8,'Isaac','isaac','isaac@lecole.com','isaac@lecole.com',1,'5ds1xtmiwsso8kkwgs4ow8w8c0c00g4','JgRdNCC1yeXPmXqxyspnGTfr5vlzss0HoxAJIFZJJNUttfBHjuypSyBox2ljKCAr/VAfBFkyrC4gqK+/hYOJ0A==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(9,'Steve','steve','steve@lecole.com','steve@lecole.com',1,'gwg6xqcbbfw4ogwskc8g8gsg4ko8w88','Y7iMUHkG9iLpUpKSOUbZVTdF5ytaxkVoERrck2luZ4VofY9ESS7IKZ+xQCTD5g4kenFWFb2xSmIXl49r27xoeQ==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(10,'Alfred','alfred','alfred@lecole.com','alfred@lecole.com',1,'9fsdie7i3484wcw400oskwosog8gkgs','5s5c5PdIMha0QWErgMJ4PqUODTDYOZ/8ai13hAre1g9keWoPK37QgDQN9KFLP41f54tnm2vJyYFRBRdJ8BU+HQ==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(11,'Brendan','brendan','brendan@lecole.com','brendan@lecole.com',1,'9e7o6c0sxw08s4o8kwo8c44c8sw4ckg','8ym2NWKdxwDJoZCS7C5pSvxblGgIvQYdbZx0FmtjJnFv4zHTIFRONmLMhaoJTO1bLnEOIrLcrZDL7/mSklYsnw==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(12,'David','david','david@lecole.com','david@lecole.com',1,'2bgf7mr2iijowko0wk0scwwkogwkoo8','6m4AFXFGS+aLYYfBstZCbbPKtrwaVPA9HGn9CwssX91e6mS2FYnmzI80aSKe3X15MT9pHg/sZLTS6tSj1uNBJQ==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(13,'GGeorge','ggeorge','george@lecole.com','george@lecole.com',1,'bslfe8fc37k0k84o0cs0wokk00488wg','DkEDg1baZrUw2NUsEK6VtW0vfj2TAQrLBEDl/NE0jzSdCQJ5Mep+mZjiTJZWRQI1+pga/yT1ZrfpcvyslOgjpw==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(14,'Jim','jim','jim@lecole.com','jim@lecole.com',1,'o39f04knrg0o0kw48og4gwsgs808wgw','AWOSC+xzpf8RMRc+G9PlHI88PGpsG/aBPmzB5MaOVYJpK5ZOtdsTpwwJMXmMfNCsFzyhuZPi6GBv4xjPX+n6sA==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(15,'LesLeslie','lesleslie','leslie@lecole.com','leslie@lecole.com',1,'i8uy0ipcpvk0s0wcww0cww8ccgww88w','VmoDYBc5ETVttH1zqrqLU01dw6/H9l0OFuDdY9US0JRToyFvOeikAraSmLiqXSSFnEuvQgwLFII/jv4J0xB9+Q==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(16,'Maria','maria','maria@lecole.com','maria@lecole.com',1,'gs82dah64l4ww80c80w0800gg4gkcsg','w44X5G5Pl3f+CIA75TTu4Bx2BizdztxDI4PM4IS8VAh+QTfYKajcGxubcPvjGiGsEUG2Hlcat/imwVpP7/UqLQ==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(17,'Rasmus','rasmus','rasmus@lecole.com','rasmus@lecole.com',1,'djyk0i5kn4ocgcg80kcoogkwg4ogw8s','u0WYEmP8Jqv4zv3b1sVzIerUNUNEWHeVPn2XVlYpiDpdtjUnT8/EK5OqlwG2kxC3IlfJb9RBRDWyo6H/lJJFoA==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(18,'Tim','tim','tim@lecole.com','tim@lecole.com',1,'cu2gygaw9g08ksgssk40gc044g48okw','7o4kPEcuuxaK2tGL3j6D440pfUlG0964kDVVesg1d14N90XmapVuF+ICazH6XNWLU/FJKqXuU9yIWqn/oJqixA==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL);
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
  `extract` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `url_thumbnail` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FAB8C3B36BF700BD` (`status_id`),
  KEY `IDX_FAB8C3B3A76ED395` (`user_id`),
  CONSTRAINT `FK_FAB8C3B36BF700BD` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `FK_FAB8C3B3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Ad quas non plus','Novo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus.','Novo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus, et adhibitis paucis clam ferro succinctis vesperi per tabernas palabatur et conpita quaeritando Graeco sermone, cuius erat inpendio gnarus, quid de Caesare quisque sentiret. et haec confidenter agebat in urbe ubi pernoctantium luminum claritudo dierum solet imitari fulgorem. postremo agnitus saepe iamque, si prodisset, conspicuum se fore contemplans, non nisi luce palam egrediens ad agenda quae putabat seria cernebatur. et haec quidem medullitus multis gementibus agebantur.\r\n\r\nItaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias qui honorem amici anteponat suo? Quid? Haec ut omittam, quam graves, quam difficiles plerisque videntur calamitatum societates! Ad quas non est facile inventu qui descendant. Quamquam Ennius recte.','http://lorempixel.com/600/600/abstract/1',1,1,'2015-06-11 00:00:00'),(2,'Quamquam Ennius','Itaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias','Itaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias qui honorem amici anteponat suo? Quid? Haec ut omittam, quam graves, quam difficiles plerisque videntur calamitatum societates! Ad quas non est facile inventu qui descendant. Quamquam Ennius recte.\r\n\r\nNovo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus, et adhibitis paucis clam ferro succinctis vesperi per tabernas palabatur et conpita quaeritando Graeco sermone, cuius erat inpendio gnarus, quid de Caesare quisque sentiret. et haec confidenter agebat in urbe ubi pernoctantium luminum claritudo dierum solet imitari fulgorem. postremo agnitus saepe iamque, si prodisset, conspicuum se fore contemplans, non nisi luce palam egrediens ad agenda quae putabat seria cernebatur. et haec quidem medullitus multis gementibus agebantur.\r\n','http://lorempixel.com/600/600/abstract/2',1,11,'2015-06-19 00:00:00'),(3,'Gallus ausus','Novo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus.','Novo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus, et adhibitis paucis clam ferro succinctis vesperi per tabernas palabatur et conpita quaeritando Graeco sermone, cuius erat inpendio gnarus, quid de Caesare quisque sentiret. et haec confidenter agebat in urbe ubi pernoctantium luminum claritudo dierum solet imitari fulgorem. postremo agnitus saepe iamque, si prodisset, conspicuum se fore contemplans, non nisi luce palam egrediens ad agenda quae putabat seria cernebatur. et haec quidem medullitus multis gementibus agebantur.\r\n\r\nItaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias qui honorem amici anteponat suo? Quid? Haec ut omittam, quam graves, quam difficiles plerisque videntur calamitatum societates! Ad quas non est facile inventu qui descendant. Quamquam Ennius recte.','http://lorempixel.com/600/600/abstract/3',1,1,'2015-06-10 00:00:00'),(4,'Itaque verae','Itaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias','Itaque verae amicitiae difficillime reperiuntur in iis qui in honoribus reque publica versantur; ubi enim istum invenias qui honorem amici anteponat suo? Quid? Haec ut omittam, quam graves, quam difficiles plerisque videntur calamitatum societates! Ad quas non est facile inventu qui descendant. Quamquam Ennius recte.\n\nNovo denique perniciosoque exemplo idem Gallus ausus est inire flagitium grave, quod Romae cum ultimo dedecore temptasse aliquando dicitur Gallienus, et adhibitis paucis clam ferro succinctis vesperi per tabernas palabatur et conpita quaeritando Graeco sermone, cuius erat inpendio gnarus, quid de Caesare quisque sentiret. et haec confidenter agebat in urbe ubi pernoctantium luminum claritudo dierum solet imitari fulgorem. postremo agnitus saepe iamque, si prodisset, conspicuum se fore contemplans, non nisi luce palam egrediens ad agenda quae putabat seria cernebatur. et haec quidem medullitus multis gementibus agebantur.\n','http://lorempixel.com/600/600/abstract/4',1,7,'2015-06-06 00:00:00'),(5,'Excitavi','Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens','Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens.\r\n','http://lorempixel.com/600/600/abstract/5',2,8,'2015-06-06 00:00:00'),(6,'Finierat','Mox dicta finierat, multitudo omnis ad, quae imperator voluit, promptior laudato consilio consensit in pacem ea ratione maxime percita','Mox dicta finierat, multitudo omnis ad, quae imperator voluit, promptior laudato consilio consensit in pacem ea ratione maxime percita, quod norat expeditionibus crebris fortunam eius in malis tantum civilibus vigilasse, cum autem bella moverentur externa, accidisse plerumque luctuosa, icto post haec foedere gentium ritu perfectaque sollemnitate imperator Mediolanum ad hiberna discessit.\r\n','http://lorempixel.com/600/600/abstract/6',1,6,'2015-05-13 00:00:00'),(7,'Iam in altera','Iam in altera philosophiae parte. quae est quaerendi ac disserendi, quae logikh dicitur, iste vester plane, ut mihi quidem videtur\r\n','Iam in altera philosophiae parte. quae est quaerendi ac disserendi, quae logikh dicitur, iste vester plane, ut mihi quidem videtur, inermis ac nudus est. tollit definitiones, nihil de dividendo ac partiendo docet, non quo modo efficiatur concludaturque ratio tradit, non qua via captiosa solvantur ambigua distinguantur ostendit; iudicia rerum in sensibus ponit, quibus si semel aliquid falsi pro vero probatum sit, sublatum esse omne iudicium veri et falsi putat.\r\n','http://lorempixel.com/600/600/abstract/7',1,15,'2015-06-28 00:00:00'),(8,'Sed cautela','Sed cautela nimia in peiores haeserat plagas','Sed cautela nimia in peiores haeserat plagas, ut narrabimus postea, aemulis consarcinantibus insidias graves apud Constantium, cetera medium principem sed siquid auribus eius huius modi quivis infudisset ignotus, acerbum et inplacabilem et in hoc causarum titulo dissimilem sui.\r\n','http://lorempixel.com/600/600/abstract/8',1,5,'2015-06-11 00:00:00'),(9,'Quare hoc','Quare hoc quidem praeceptum, cuiuscumque est,','Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat.\r\n\r\nDuplexque isdem diebus acciderat malum, quod et Theophilum insontem atrox interceperat casus, et Serenianus dignus exsecratione cunctorum, innoxius, modo non reclamante publico vigore, discessit.','http://lorempixel.com/600/600/abstract/9',2,1,'2015-06-20 00:00:00'),(10,'Etenim si','Etenim si attendere diligenter, existimare vere de','Etenim si attendere diligenter, existimare vere de omni hac causa volueritis, sic constituetis, iudices, nec descensurum quemquam ad hanc accusationem fuisse, cui, utrum vellet, liceret, nec, cum descendisset, quicquam habiturum spei fuisse, nisi alicuius intolerabili libidine et nimis acerbo odio niteretur. Sed ego Atratino, humanissimo atque optimo adulescenti meo necessario, ignosco, qui habet excusationem vel pietatis vel necessitatis vel aetatis. Si voluit accusare, pietati tribuo, si iussus est, necessitati, si speravit aliquid, pueritiae. Ceteris non modo nihil ignoscendum, sed etiam acriter est resistendum.\r\n\r\nAltera sententia est, quae definit amicitiam paribus officiis ac voluntatibus. Hoc quidem est nimis exigue et exiliter ad calculos vocare amicitiam, ut par sit ratio acceptorum et datorum. Divitior mihi et affluentior videtur esse vera amicitia nec observare restricte, ne plus reddat quam acceperit; neque enim verendum est, ne quid excidat, aut ne quid in terram defluat, aut ne plus aequo quid in amicitiam congeratur','http://lorempixel.com/600/600/abstract/10',1,6,'2015-05-30 00:00:00'),(11,'nouvel article','Incenderat autem audaces usque ad insaniam homines ad haec, quae nefariis egere conatibus, Luscus quidam curator urbis subito visus: eosque ut heiulans baiolorum praecentor ad expediendum quod orsi sunt incitans vocibus crebris. qui haut longe postea ideo vivus exustus est.','Incenderat autem audaces usque ad insaniam homines ad haec, quae nefariis egere conatibus, Luscus quidam curator urbis subito visus: eosque ut heiulans baiolorum praecentor ad expediendum quod orsi sunt incitans vocibus crebris. qui haut longe postea ideo vivus exustus est.','utem audac',1,1,'2010-01-01 00:00:00'),(12,'utem audac','utem audac','utem audac','utem audac',1,1,'2013-07-13 00:00:00');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'PUBLISHED','publié'),(2,'UNPUBLISHED','non publié');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-13 21:20:00
