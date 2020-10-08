-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 21 Février 2020 à 16:03
-- Version du serveur :  5.7.11
-- Version de PHP :  7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `base_blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id_article` int(11) NOT NULL,
  `titre_article` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `article` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `article_court` text NOT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT '1',
  `commentaire` tinyint(1) NOT NULL DEFAULT '1',
  `img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `articles`
--

INSERT INTO `articles` (`id_article`, `titre_article`, `article`, `article_court`, `actif`, `commentaire`, `img`) VALUES
(2, 'foot', 'Passé par l’Inter Milan, Liverpool, le FC Barcelone et aujourd’hui au Bayern Munich, Philippe Coutinho est un grand, enfin plus exactement un grand joueur puisque le brésilien qui ne mesure qu’ 1m72 ne se démarque pas par sa grande taille. C’est d’ailleurs cette particularité qui est au coeur de l’actualité puisque le site officiel de la Bundesliga a tout simplement publié un article au sein duquel on découvre que le numéro 10 du Bayern Munich utilise des maillots en taille enfant depuis le début de la saison …', 'C\'est au travers d\'un article sur son site internet que la Bundesliga a lancé cette information pour le moins cocasse. Depuis le début de la saison, Philippe Coutinho évolue avec des maillots conçus pour les enfants et non les maillots adultes classiques.', 1, 1, 'fondant.jpg'),
(3, 'cuisine de sport', 'Peu gras, ce gâteau pour le sport est digeste\r\nLa richesse énergétique et minérale de la banane est particulièrement adaptée à l’élaboration d’un gâteau pour le sport, à consommer sous forme d’une collation avant les épreuves sportives ou les entraînement, en remplacement d’un repas traditionnel.\r\n\r\nCette collation représente une alternative de repas pré-compétitif, lorsque les conditions de restauration ne permettent pas un repas classique (déplacement extérieur) ou lors de championnats avec plusieurs épreuves dans la journée. Il présente une composition compatible avec un effort proche, de part sa teneur en glucides.', 'Des recettes simples, de réalisation facile, adaptées à vos besoins spécifiques liés à votre santé et à votre pratique physique. Des recettes de cuisine originales, conçues et testées par le Docteur Frédéric Maton.\r\n\r\nPeu gras, ce gâteau pour le sport est digeste', 1, 0, 'cuisine_minceur2.jpg'),
(4, 'cuisine pour l\'hiver', 'On parle de vite fait, mais surtout de repas, de vrai, de quoi contenter les affamés qui tapent du poing sur la table. Et le pari est rempli haut la cuillère par les pressés du petit plat, juré ! Sautez les pommes de terre avec les magrets de canard, servez les aiguillettes de poulet sur un lit de mangues et d’endives, ou régalez avec des pâtes à la carbonara rapides… Emballez avec de rassasiantes lentilles au poulet, orange, citron et vin blanc, ou assurez les classiques avec une blanquette de dinde express, c’est fait !\r\n\r\nMoins généreux, mais tout aussi savoureux ? On vous aura prévenu(e)s, le menu donne l’eau à la bouche… le saumon se laque aux légumes et sauce Teriyaki, le poulet se dore dans le caramel et la sauce soja avec une pointe de gingembre, quand la poêlée de riz marie poireaux, champignons et parmesan. Vingt petites minutes suffisent au pavé de biche parfum café, pas une de plus pour le croque-monsieur au céleri, jambon fumé et gruyère !\r\n\r\nEt pourquoi pas, au passage, miser sur des petits plats d’hiver vite fait mais légers ? Ils réchauffent et réconfortent sans peser, on veut bien sûr parler des veloutés maison, version carottes et poireaux ou carottes, coco et cumin. Le lendemain, on change avec une irrésistible purée de pommes de terre et patates douces au cumin, avant un cordon bleu au porto façon grand-mère… pour conclure la semaine en beauté avec un gratin de chou-fleur express à la béchamel, parfait pour l’hiver !', 'Entre le travail et la maison, pas question de passer la soirée en cuisine ? Lancez les chronos, les futés de la saison se contentent de 20 minutes pour des petits plats express qui réchauffent ! Réconfortant les soirs de neige, nourrissant après une grosse journée, healthy pour lutter contre les coups de froid ? Chacun(e) son petit plat pour traverser la saison, tant que la recette est facile et le temps en cuisine réduit à l’essentiel !', 0, 1, NULL),
(5, 'cuisine minceur', 'Afin de combler votre gourmandise en innovant vos assiettes, vous achetez souvent des plats préparés ou des conserves déjà cuisinées au supermarché ? Et si vous tentiez de cuisiner ces 15 recettes salées et sucrées que Fourchette &amp; Bikini vous partage dans ce dossier. Bien plus gourmandes que vos traditionnels mets, il est impossible que vous les loupiez.\r\n\r\nCôté salé, vous avez le choix entre un hachis parmentier de bœuf, des cuisses de poulet accompagnées de légumes et rôties au four, des spaghettis à la sauce bolognaise faite maison, une omelette au jambon au curry, des pancakes salés au saumon, au concombre et à l’aneth, des escalopes de veau panées en cordon bleu, un gratin de pommes de terre aux tomates ou un risotto au saumon fumé et aux petits pois, pour ne vous citer que quelques exemples. Côté sucré, la crème au chocolat express, le smoothie à la pomme et à la banane ou le gâteau au yaourt au glaçage chocolaté, vous sont également présentés.\r\n\r\nAvec ce dossier de 15 recettes salées et sucrées, enfilez votre tablier et concoctez des plats et des desserts sans vous creuser la tête à cuisiner. Oui, vous êtes novice en cuisine, mais oui, vous avez également le droit de vous régaler ! Alors, oubliez vos assiettes de spaghettis au gruyère maison ou de lasagnes industrielles réchauffées. Il est grand temps de découvrir cette sélection. Bon appétit !\r\n', 'Pour celles ou ceux qui éprouvent certaines difficultés à cuisiner, il est parfois difficile de préparer autre chose que des haricots verts et des steaks hachés ou des spaghettis au jambon et au gruyère râpé. Oui, vous n’êtes pas doué(e) en cuisine et rares sont les fois où vous avez réalisé des recettes bien plus sophistiquées sans qu’elles soient infâmes pour les papilles… Pourtant, vos sempiternelles recettes faciles et rapides à préparer commencent sérieusement à vous lasser.', 1, 1, 'cuisine_minceur.jpg'),
(6, 'Cuisine chocolat', 'Une très bonne question qui mérite une explication. En fait, pour chaque utilisation, il y a le chocolat adéquat. Par exemple, pour réaliser des gâteaux, n\'importe quel chocolat, même bas de gamme, conviendra. Bien sûr, plus le chocolat est bas de gamme, plus il est difficile de le travailler. Quant au goût, c\'est pareil ! La qualité sera meilleure si vous y mettez le prix. Si vous souhaitez faire un gâteau même simple mais de bonne qualité, optez pour des chocolats pâtissiers. Si vous souhaitez réaliser des décors en chocolat, il va falloir vous tourner vers des magasins de professionnels qui vendent du chocolat de couverture. C\'est le chocolat le plus simple à utiliser en pâtisserie. Le chocolat de couverture est en fait plus riche en beurre de cacao, et il est donc très facile à travailler, alors que le chocolat ganache ou les autres chocolats sont beaucoup moins pratiques. On le trouve sous forme de bloc ou de pastilles dans les épiceries fines ou sur Internet, si vous n\'habitez pas une grande ville. Il existe de bons sites comme Miamstragam et Meilleur du Chef par exemple. Après, il y a d\'autres types de chocolats : le chocolat amer, qui contient peu de sucre et est composé de 90% de cacao minimum (il est généralement noté sur les recettes d\'utiliser un chocolat amer ; si cela n\'est pas mentionné, ajoutez un peu plus de sucre pour enlever son amertume) ; le chocolat noir, qui contient entre 50 et 70% de pâte et de beurre de cacao (ne prenez pas en deçà de ces pourcentages, sinon votre gâteau n\'aura plus de goût !) ; le chocolat au lait, qui est le plus souvent apprécié des enfants et que vous pourrez facilement faire fondre au bain-marie, mais qui est très dur à travailler à de fortes températures ; le chocolat blanc, qui ne contient aucune pâte de cacao, mais prenez alors un chocolat blanc sans lécithine de soja pour réaliser votre dessert.', 'Quel chocolat choisir pour cuisiner ?\r\n\r\nUne très bonne question qui mérite une explication. En fait, pour chaque utilisation, il y a le chocolat adéquat.\r\nPar exemple, pour réaliser des gâteaux, n\'importe quel chocolat,même bas de gamme, conviendra. Bien sûr, plus le chocolat est bas', 1, 1, 'chocolat.jpg'),
(7, 'Ski', 'L’Isère en quelques points\r\nEn Isère, un département proche de Lyon et dont fait partie intégrante la grande ville de Grenoble et son aéroport en facilitant l’accès, vous aurez le choix des stations de ski ! En effet, celles-ci savent recevoir les touristes et on en dénombre pas moins de 23 dans le département. Que ce soit dans de grandes stations comme l’Alpe d’Huez ou encore les 2 Alpes ou bien dans de plus petites stations, elles sauront toutes vous offrir un séjour différents et l’une d’entre elles vous conviendra forcément ! Les grandes stations sont idéales pour les familles grâce à leurs aménagements et leurs label “Famille Plus” (on en compte 5 dans le département de l’Isère), et les plus petites stations sauront vous séduire avec leur charme authentique des villages de montagne ainsi que la paisibilité qu’elles ont à vous offrir. Pour les adeptes de ski nordique, on compte ne Isère 25 site dédiés.\r\n\r\nLe département détient également pas moins de trois grands parcs naturels pour quatre massifs montagneux qui sont : Belledonne, Chartreuse, Oisans et Vercors. Autrement, on retrouve comme stations importantes en Isère :\r\n\r\nl’Alpe d’Huez\r\nl’Alpe du Grand-Serre\r\nles 2 Alpes\r\nles 7 Laux\r\nChamrousse\r\nVaujany\r\nOz-en-Oisans …\r\nUne myriade d’activités s’offrent à vous en Isère !\r\nL’Isère et ses différentes stations de ski vous proposent un grand nombre d’activités pour l’hiver, en lien avec la neige ou non. Vous pourrez alors effectuer des journées dédiées aux sports de glisse comme le ski alpin, le snowboard, du freestyle, des initiation au biathlon par exemple, ou des sports également en pleine nature comme le ski de randonnée ou les randonnées en raquette…\r\n\r\nDes activités comme les promenades en chien de traîneau, de la motoneige ou encore du fat bike sur neige sont également possibles afin de vous offrir le lot d’expériences inoubliables qui vous permettra de trouver à coup sûr des activités qui vous plairont !\r\n\r\nD’autres activités, bien plus insolites et uniques sont également envisageables comme un week-end de deux jours et une nuit dans un IGLOO ! Lors du week-end, vous serez amenés à marcher dans un environnement montagnard naturel, puis à construire vous-même votre igloo avant d’y dormir à la nuit tombée, tout cela encadré par un professionnel qualifié.\r\n\r\nDe nombreux spas et autres centres de bien-être et de Thalasso, massages…  seront également à votre disposition en Isère afin que vous puissiez vous relaxer et vous détendre face à un cadre montagnard sublime. Tous les types de séjours aux sports d’hiver, que ce soit pour se relaxer, expérimenter de nouvelles activités, avoir son lot d’adrénaline et de vitesse dans les sports de glisse, sont accessibles dans le département de l’Isère !', 'Cet hiver vous souhaitez partir dans le département de l’Isère pour vous adonner aux plaisirs de la glisse et de la neige ainsi que pour vivre les plus belles émotions en Isère ? Par “plus belles émotions”, on entend bien que votre séjour rime avec émerveillement, divertissement mais surtout avec acclimatement et dépaysement. Pour vous offrir un aperçu du merveilleux hiver que vous pourrez passer en Isère, nos experts vous parlent de l’hiver en Isère notamment pour 2018/2019 !', 1, 1, NULL),
(8, 'Rugby', 'TOP 14 : TOUTES LES INFOS SUR LE TOP 14 ET L’ASCENSION DU STADE TOULOUSAIN\r\nLe championnat de France de rugby à 15 est une compétition Française créée en 1892 qui consiste à opposer 14 équipes de rugby dans un championnat sur 187 matchs. Le championnat peut être comparé à la Ligue 1 au foot.\r\n\r\nLA CRÉATION DU TOP 14\r\nLa fédération omnisports créée en 1892, le championnat de France de rugby à XV. En 1921, la Fédération française de rugby reprend l’organisation pour la donner en 1998 à la ligue nationale de rugby.\r\n\r\nLe championnat de France ne s’est pas toujours appelé « Top 14 ». A partir de 2005, il a commencé par la formulation top 16, Top 14, Rugby Top 14 Orange. Avant 2005, le championnat se jouait avec plus de 24 équipes.\r\n\r\nLE STADE FRANÇAIS ET LE STADE TOULOUSAIN, LES DEUX PLUS GROSSES ÉQUIPES DU TOP 14.\r\nDe 1893 à 1908 le Stade Français remporte 8 fois le championnat. Jusqu’en 1998 la Stade Français ne gagnera aucun titre pendant cette période. Durant l’année de 1992, Max Guazzini reprend le Stade Français et remporte 5 nouveaux titres en embauchant Bernard Laporte en 2000, 2003, 2004, 2007 et 2015\r\n\r\nPar la suite le Stade Toulousain est le premier club à remporter 5 fois le championnat à la suite de 1922 à 1927.  Jusqu’en 1985 ils remporteront une fois le championnat en 1947. En 1985 commence l’ascension du Stade Toulousain et remporte le championnat en 1986, 1989, 1994, 1995, 1996, 1997, 1999, 2001, 2008, 2011, 2012.\r\n', 'TOP 14 : TOUTES LES INFOS SUR LE TOP 14 ET L’ASCENSION DU STADE TOULOUSAIN\r\nLe championnat de France de rugby à 15 est une compétition Française créée en 1892 qui consiste à opposer 14 équipes de rugby dans un championnat sur 187 matchs. Le championnat peut être comparé à la Ligue 1 au foot.', 1, 1, 'rugby.jpg'),
(20, 'cuisine minceur', 'Afin de combler votre gourmandise en innovant vos assiettes, vous achetez souvent des plats préparés ou des conserves déjà cuisinées au supermarché ? Et si vous tentiez de cuisiner ces 15 recettes salées et sucrées que Fourchette &amp; Bikini vous partage dans ce dossier. Bien plus gourmandes que vos traditionnels mets, il est impossible que vous les loupiez.\r\n\r\nCôté salé, vous avez le choix entre un hachis parmentier de bœuf, des cuisses de poulet accompagnées de légumes et rôties au four, des spaghettis à la sauce bolognaise faite maison, une omelette au jambon au curry, des pancakes salés au saumon, au concombre et à l’aneth, des escalopes de veau panées en cordon bleu, un gratin de pommes de terre aux tomates ou un risotto au saumon fumé et aux petits pois, pour ne vous citer que quelques exemples. Côté sucré, la crème au chocolat express, le smoothie à la pomme et à la banane ou le gâteau au yaourt au glaçage chocolaté, vous sont également présentés.\r\n\r\nAvec ce dossier de 15 recettes salées et sucrées, enfilez votre tablier et concoctez des plats et des desserts sans vous creuser la tête à cuisiner. Oui, vous êtes novice en cuisine, mais oui, vous avez également le droit de vous régaler ! Alors, oubliez vos assiettes de spaghettis au gruyère maison ou de lasagnes industrielles réchauffées. Il est grand temps de découvrir cette sélection. Bon appétit !\r\n', 'Pour celles ou ceux qui éprouvent certaines difficultés à cuisiner, il est parfois difficile de préparer autre chose que des haricots verts et des steaks hachés ou des spaghettis au jambon et au gruyère râpé. Oui, vous n’êtes pas doué(e) en cuisine et rares sont les fois où vous avez réalisé des recettes bien plus sophistiquées sans qu’elles soient infâmes pour les papilles… Pourtant, vos sempiternelles recettes faciles et rapides à préparer commencent sérieusement à vous lasser.', 1, 1, 'gym.jpg'),
(21, 'Jeux olympiques', 'Au Conseil national, le président a reçu une ovation debout de tous les membres. Le président a également assisté à une session du Conseil des États où il a été accueilli par son président Hans Stöckli.\r\n\r\nAu cours d\'un déjeuner offert par Isabelle Moret, il a rencontré les membres du Conseil national suivants : Laurent Wehrli, syndic de Montreux ; Rocco Cattaneo, qui est également vice-président du conseil de fondation du Centre mondial du cyclisme de l\'UCI et membre du comité directeur de l\'UCI, et Mathias Reynard, co-président de l\'intergroupe parlementaire enfance et jeunesse.\r\n\r\nIls ont discuté des excellentes relations entre la Suisse, le canton de Vaud, Lausanne et le CIO, de l\'Agenda olympique 2020, du développement du sport, de la durabilité des Jeux Olympiques et de l\'importance de l\'éducation par le sport, ainsi que des prochains Jeux Olympiques de la Jeunesse d\'hiver, Lausanne 2020, qui sont pour Isabelle Moret, “un encouragement à notre jeunesse à être de plus en plus performante et à tout simplement avoir du plaisir à pratiquer le sport”.', 'LE PRÉSIDENT DU CIO, THOMAS BACH, A ÉTÉ ACCUEILLI AUJOURD\'HUI DANS LES DEUX CHAMBRES DU PARLEMENT SUISSE À BERNE, À L\'INVITATION DE LA NOUVELLE PRÉSIDENTE DU CONSEIL NATIONAL SUISSE, ISABELLE MORET. S\'ADRESSANT AUX MEMBRES DU CONSEIL, ISABELLE MORET A RENDU HOMMAGE AU PRÉSIDENT DU CIO “QUI MET TOUT EN ŒUVRE POUR MODERNISER L’OLYMPISME ET L’ADAPTER À L’ESPRIT DU TEMPS”. ET D\'AJOUTER : "LE CIO A POUR BUT DE CONTRIBUER À LA PAIX ET AU DÉVELOPPEMENT HARMONIEUX DE L’HUMANITÉ À TRAVERS LE SPORT. CETTE VOLONTÉ PASSE PAR LA STRICTE APPLICATION DE LA CHARTE OLYMPIQUE ET DE SON CODE D\'ÉTHIQUE, QUI FONT DE LA PRATIQUE DU SPORT UN DROIT DE L’HOMME".', 1, 1, 'JO.jpg'),
(22, 'Cacao', 'Le cacao est-il bon pour la santé ?\r\nLa fève de cacao renferme nombre de substances intéressantes sur le plan sanitaire. Elle est très riche en lipides et en triglycérides. Bien entendu, leur teneur varie selon l\'origine des fèves.\r\n\r\nLes bases xanthiques (théobromine et caféine) accompagnent des protéines, flavonoïdes, minéraux...\r\n\r\nBienfaits cardiovasculaires et propriétés antioxydantes\r\nLa théobromine est l\'alcaloïde principal du cacao. Elle possède une activité proche de celle de la caféine. Ce sont surtout les propriétés antioxydantes de la plante qui suscitent le plus d\'intérêt scientifique. En effet, les aliments riches en flavonoïdes (thé, vin...) sont considérés comme des protecteurs cardiaques.\r\n\r\nC\'est le cas du cacao dont les propriétés vasodilatatrices sont scientifiquement reconnues. Un travail mené en 2005 a d\'ailleurs montré que le fait de consommer quotidiennement du chocolat noir (et uniquement noir) diminuait la pression artérielle et augmentait la sensibilité à l\'insuline.\r\n\r\nD\'autres recherches indiquent que du côté du cholestérol, une augmentation du HDL (c\'est-à-dire le bon cholestérol) est corrélée à la consommation de cacao. En fait, ce dernier renferme des substances - les phytostérols - qui freinent l\'absorption intestinale du mauvais cholestérol apporté par les autres aliments.\r\n\r\nChocolat, dépendance et minceur\r\nComme tout aliment plaisir, le chocolat stimule la production d\'endomorphines, ce qui créerait une dépendance. Mais cela n\'est peut-être pas si mauvais... car le cacao serait également un aliment minceur ! Citant un travail japonais conduit en 2005, Max Rombi dans son ouvrage « 120 plantes médicinales » explique : « des rats dont le régime alimentaire a été supplémenté en cacao ont subi une nette diminution du poids de leurs tissus adipeux (...) Le cacao diminue la synthèse des acides gras et augmente la thermogénèse (la production de chaleur de l\'organisme - ndlr) ».\r\n\r\nNotons tout de même que le chocolat contient de la tyramine. Les migraineux s\'en méfieront car cette substance peut en effet provoquer des maux de tête.\r\n\r\nSources : \r\n\r\nFisher N.D., Hughes M., Gerhard-Herman M., Hollenberg N.K., Flavanol-rich cocoa induces nitric-oxide-dependent vasodilation in healthy humans ;\r\nGrassi D., Lippi C., Necozione S., Desideri G., Ferri C., Short-term administration of dark chocolate is followed by a significant increase in insulin sensitivity and a decrease in blood pressure in healthy persons ;\r\n« 120 plantes médicinales, composition, mode d\'action et intérêt thérapeutique. De l\'ail à la vigne rouge », Max Rombi et Dominique Robert, éditions Alpen.', 'Originaire d\'Amérique centrale, le cacaoyer est depuis longtemps entré au panthéon des aliments « santé ». Mais sa réputation est-elle méritée ou a-t-elle été créée de toutes pièces par les gourmands pour se dédouaner d\'une consommation excessive ? Réponse.', 1, 1, 'cacao.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_categorie` int(11) NOT NULL,
  `nom_cat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id_categorie`, `nom_cat`) VALUES
(1, 'sport'),
(2, 'hiver'),
(3, 'formation'),
(4, 'printemps');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `id_commentaire` int(11) NOT NULL,
  `commentaire` varchar(350) NOT NULL,
  `date_creat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_article` int(11) NOT NULL,
  `auteur` varchar(100) NOT NULL,
  `valide` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commentaires`
--

INSERT INTO `commentaires` (`id_commentaire`, `commentaire`, `date_creat`, `id_article`, `auteur`, `valide`) VALUES
(1, 'Super! J\'adore', '2019-12-19 09:29:00', 7, 'Munoz Serge', 1),
(2, 'Super le Ski!!!!', '2019-12-19 11:28:03', 7, 'Olive Pierre', 1),
(3, 'Génial!', '2019-12-19 11:31:31', 7, 'Olive Pierre', 1),
(4, 'cela a l\'air délicieux!!', '2020-01-02 10:45:54', 6, 'Munoz Serge', 0);

-- --------------------------------------------------------

--
-- Structure de la table `liaisons`
--

CREATE TABLE `liaisons` (
  `id_liaison` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `liaisons`
--

INSERT INTO `liaisons` (`id_liaison`, `id_article`, `id_user`, `id_categorie`) VALUES
(5, 2, 1, 1),
(6, 3, 1, 1),
(7, 4, 1, 2),
(8, 5, 1, 2),
(9, 6, 1, 2),
(10, 7, 1, 1),
(11, 8, 1, 2),
(12, 9, 1, 1),
(13, 10, 1, 1),
(14, 11, 1, 1),
(15, 12, 1, 3),
(16, 13, 1, 3),
(17, 14, 1, 3),
(18, 15, 1, 3),
(19, 16, 1, 2),
(20, 17, 1, 2),
(21, 18, 1, 1),
(22, 19, 1, 1),
(23, 20, 1, 2),
(24, 21, 1, 1),
(25, 22, 1, 3),
(26, 23, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id_tag` int(11) NOT NULL,
  `noms_tag` varchar(255) DEFAULT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tags`
--

INSERT INTO `tags` (`id_tag`, `noms_tag`, `id_article`) VALUES
(1, 'cuisine, repas, léger', 5),
(2, '', 2),
(3, '', 23),
(4, '', 22),
(5, '', 6),
(6, '', 3),
(7, 'cuisine, repas, léger', 20),
(8, 'cuisine, repas, léger', 8);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `passe` varchar(50) NOT NULL,
  `niv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id_user`, `nom`, `prenom`, `mail`, `passe`, `niv`) VALUES
(1, 'Munoz', 'Serge', 'smtjv@laposte.net', 'serge', 1),
(2, 'Olive', 'Pierre', 'olive@gmail.com', 'olive', 5),
(3, 'Elgueta', 'Anais', 'anais@gmail.com', 'anais', 5),
(4, 'Jacq', 'gildas', 'gj@44.com', 'bibi', 5),
(5, 'Jacq', 'gildas', 'gj@44.com', 'bibi', 5),
(6, 'Elgueta', 'Anais', 'anais@gmail.com', 'tutu', 5);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_article`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id_commentaire`);

--
-- Index pour la table `liaisons`
--
ALTER TABLE `liaisons`
  ADD PRIMARY KEY (`id_liaison`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id_tag`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `id_commentaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `liaisons`
--
ALTER TABLE `liaisons`
  MODIFY `id_liaison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id_tag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
