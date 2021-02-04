CREATE DATABASE IF NOT EXISTS deliverydatabase;
SET GLOBAL event_scheduler="ON";

/*DDL SQL Commands (CREATE)*/

CREATE TABLE IF NOT EXISTS `tblDrivers` (
  `DriverID` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(10) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `ContactNumber` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DriverID`),
  KEY `ContactNumber` (`ContactNumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

CREATE TABLE IF NOT EXISTS `tblDriverInfo` (
  `DriverID` int(10) NOT NULL,
  `Address1` varchar(50) DEFAULT NULL,
  `Address2` varchar(50) DEFAULT NULL,
  `Address3` varchar(40) DEFAULT NULL,
  `County` varchar(20) DEFAULT NULL,
  `PostCode` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`HomePhone`), 
  KEY `PostCode` (`PostCode`),
  KEY `DriverID` (`DriverID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `tblVehicles` (
  `VehicleID` int(11) NOT NULL AUTO_INCREMENT,
  `RegPlate` varchar(20) DEFAULT NULL,
  `Colour` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`VehicleID`),
  KEY `VehicleID` (`VehicleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `tblShifts` (
  `ShiftID` int(11) NOT NULL AUTO_INCREMENT,
  `DriverID` int(10) NOT NULL,
  `VehicleID` int(11) NOT NULL,
  `GPSID` int(11) NOT NULL,
  `ShiftAMBegin` time DEFAULT NULL,
  `ShiftAMEnd` time DEFAULT NULL,
  `ShiftPMBegin` time DEFAULT NULL,
  `ShiftPMEnd` time DEFAULT NULL,
  `ShiftDay` varchar (30) DEFAULT NULL,
  `OnShift` tinyint(1) DEFAULT NULL,
  `ParcelsDelivered` int(11) DEFAULT NULL,
  PRIMARY KEY (`ShiftID`),
  KEY `DriverID` (`DriverID`),
  KEY `ShiftID` (`ShiftID`),
  KEY `VehicleID` (`VehicleID`),
  KEY `GPSID` (`GPSID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `tblLocations` (
  `LocationID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Location` varchar(50) NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tblGPS` (
  `GPSID` int(11) NOT NULL AUTO_INCREMENT,
  `GPSLocation` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`GPSID`),
  KEY `GPSLocation` (`GPSLocation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

/*DML SQL Commands (INSERT, UPDATE)*/
	 
# Drivers table
INSERT INTO `tblDrivers` (`Title`, `FirstName`, `LastName`, `ContactNumber`) VALUES
('Mr', 'Fred', 'Smith', '07745305062'),
('Miss', 'Sandra', 'Lockwood', '07761644358'),
('Ms', 'Eilean', 'Down', '07000352008'),
('Mrs', 'Eva', 'Friedman', '07819639411'),
('Mr', 'Darnell', 'Lopez', '07928224229'),
('Mrs', 'Samera', 'Proctor', '07929279536'),
('Mr', 'Rueben', 'McKenzie', '07869161022'),
('Mrs', 'Donna', 'Griffin', '07845959800'),
('Mr', 'Toby', 'Massey', '07762712265'),
('Mr', 'Dennis', 'Kirby', '07987284439');

# DriversInfo table
INSERT INTO `tblDriverInfo` (`DriverID`, `Address1`, `Address2`, `Address3`, `County`, `PostCode`, `HomePhone`) VALUES
(1, '12 Able Close', 'Ducklington', 'Witney', 'Oxfordshire', 'OX5 4TR', '01652 836521'),
(2, 'Claverhose', 'Little Headley', 'Basingdon', 'Oxfordshire', 'OX3 2WE', '01652 872932'),
(3, '45 Walton Street', 'Applesby', 'Oxford', 'Oxfordshire', 'OX7 2QE', '01652 624918'),
(4, 'Waterson Street', 'Headington', 'Oxford', 'Oxfordshire', 'OX4 8UY', '01652 653155'),
(5, '8 Newport Close', 'Eynsham', 'Witney', 'Oxfordshire', 'OX8 4BE', '01652 769329'),
(6, '65, Walton Street', 'Jericho', 'Oxford', 'Oxfordshire', 'OX2 6WE', '01652 463259'),
(7, 'Crow Cottage', 'Littlehampton', 'Dewhurst', 'Oxfordshire', 'OX9 3WA', '01652 773325'),
(8, '28 Hill Town', 'Jericho', 'Oxford', 'Oxfordshire', 'OX2 5RE', '01652 388249'),
(9, '12 Holly Well Road', 'Cassington', 'Oxford', 'Oxfordshire', 'OX7 3WE', '01652 241827'),
(10, '87 Holmes Road', 'Headington', 'Oxford', 'Oxfordshire', 'OX4 8WS', '01652 823823');

# Vehicles table
INSERT INTO `tblVehicles` (`VehicleID`, `RegPlate`, `Colour`) VALUES
(1, 'LG84-UKX', 'Red'),
(2, 'UK12-TIW', 'Brown'),
(3, 'XM74-FPQ', 'Black'),
(4, 'CG44-UXG', 'White'),
(5, 'YK83-FSR', 'Green');

# GPSs table
INSERT INTO `tblGPS` (`GPSID`, `GPSLocation`) VALUES
(1, 'Oxford'),
(2, 'Oxford'),
(3, 'Oxford'),
(4, 'Oxford'),
(5, 'Oxford');


# Shifts table
INSERT INTO `tblShifts` (`ShiftID`, `DriverID`, `VehicleID`, `GPSID`, `ShiftAMBegin`, `ShiftAMEnd`, `ShiftPMBegin`, `ShiftPMEnd`, `ShiftDay`, `OnShift`, `ParcelsDelivered`) VALUES
(1, 1, 1, 1, '08:00:00', '11:55:00', NULL, NULL, 'Monday', 0, 0),
(2, 2, 2, 2, '08:00:00', '11:55:00', NULL, NULL, 'Monday', 0, 0),
(3, 3, 3, 3, '08:00:00', '11:55:00', NULL, NULL, 'Monday', 0, 0),
(4, 4, 4, 4, '08:00:00', '11:55:00', NULL, NULL, 'Monday', 0, 0),
(5, 5, 5, 5, '08:00:00', '11:55:00', NULL, NULL, 'Monday', 0, 0),
(6, 6, 1, 1, NULL, NULL, '12:00:00', '16:00:00', 'Monday', 0, 0),
(7, 7, 2, 2, NULL, NULL, '12:00:00', '16:00:00', 'Monday', 0, 0),
(8, 8, 3, 3, NULL, NULL, '12:00:00', '16:00:00', 'Monday', 0, 0),
(9, 9, 4, 4, NULL, NULL, '12:00:00', '16:00:00', 'Monday', 0, 0),
(10, 10, 5, 5, NULL, NULL, '12:00:00', '16:00:00', 'Monday', 0, 0),

(11, 1, 1, 1, '08:00:00', '11:55:00', NULL, NULL, 'Tuesday', 0, 0),
(12, 2, 2, 2, '08:00:00', '11:55:00', NULL, NULL, 'Tuesday', 0, 0),
(13, 3, 3, 3, '08:00:00', '11:55:00', NULL, NULL, 'Tuesday', 0, 0),
(14, 4, 4, 4, '08:00:00', '11:55:00', NULL, NULL, 'Tuesday', 0, 0),
(15, 5, 5, 5, '08:00:00', '11:55:00', NULL, NULL, 'Tuesday', 0, 0),
(16, 6, 1, 1, NULL, NULL, '12:00:00', '16:00:00', 'Tuesday', 0, 0),
(17, 7, 2, 2, NULL, NULL, '12:00:00', '16:00:00', 'Tuesday', 0, 0),
(18, 8, 3, 3, NULL, NULL, '12:00:00', '16:00:00', 'Tuesday', 0, 0),
(19, 9, 4, 4, NULL, NULL, '12:00:00', '16:00:00', 'Tuesday', 0, 0),
(20, 10, 5, 5, NULL, NULL, '12:00:00', '16:00:00', 'Tuesday', 0, 0),

(21, 1, 1, 1, '08:00:00', '11:55:00', NULL, NULL, 'Wednesday', 0, 0),
(22, 2, 2, 2, '08:00:00', '11:55:00', NULL, NULL, 'Wednesday', 0, 0),
(23, 3, 3, 3, '08:00:00', '11:55:00', NULL, NULL, 'Wednesday', 0, 0),
(24, 4, 4, 4, '08:00:00', '11:55:00', NULL, NULL, 'Wednesday', 0, 0),
(25, 5, 5, 5, '08:00:00', '11:55:00', NULL, NULL, 'Wednesday', 0, 0),
(26, 6, 1, 1, NULL, NULL, '12:00:00', '16:00:00', 'Wednesday', 0, 0),
(27, 7, 2, 2, NULL, NULL, '12:00:00', '16:00:00', 'Wednesday', 0, 0),
(28, 8, 3, 3, NULL, NULL, '12:00:00', '16:00:00', 'Wednesday', 0, 0),
(29, 9, 4, 4, NULL, NULL, '12:00:00', '16:00:00', 'Wednesday', 0, 0),
(30, 10, 5, 5, NULL, NULL, '12:00:00', '16:00:00', 'Wednesday', 0, 0),

(31, 1, 1, 1, '08:00:00', '11:55:00', NULL, NULL, 'Thursday', 0, 0),
(32, 2, 2, 2, '08:00:00', '11:55:00', NULL, NULL, 'Thursday', 0, 0),
(33, 3, 3, 3, '08:00:00', '11:55:00', NULL, NULL, 'Thursday', 0, 0),
(34, 4, 4, 4, '08:00:00', '11:55:00', NULL, NULL, 'Thursday', 0, 0),
(35, 5, 5, 5, '08:00:00', '11:55:00', NULL, NULL, 'Thursday', 0, 0),
(36, 6, 1, 1, NULL, NULL, '12:00:00', '16:00:00', 'Thursday', 0, 0),
(37, 7, 2, 2, NULL, NULL, '12:00:00', '16:00:00', 'Thursday', 0, 0),
(38, 8, 3, 3, NULL, NULL, '12:00:00', '16:00:00', 'Thursday', 0, 0),
(39, 9, 4, 4, NULL, NULL, '12:00:00', '16:00:00', 'Thursday', 0, 0),
(40, 10, 5, 5, NULL, NULL, '12:00:00', '16:00:00', 'Thursday', 0, 0),

(41, 1, 1, 1, '08:00:00', '11:55:00', NULL, NULL, 'Friday', 0, 0),
(42, 2, 2, 2, '08:00:00', '11:55:00', NULL, NULL, 'Friday', 0, 0),
(43, 3, 3, 3, '08:00:00', '11:55:00', NULL, NULL, 'Friday', 0, 0),
(44, 4, 4, 4, '08:00:00', '11:55:00', NULL, NULL, 'Friday', 0, 0),
(45, 5, 5, 5, '08:00:00', '11:55:00', NULL, NULL, 'Friday', 0, 0),
(46, 6, 1, 1, NULL, NULL, '12:00:00', '16:00:00', 'Friday', 0, 0),
(47, 7, 2, 2, NULL, NULL, '12:00:00', '16:00:00', 'Friday', 0, 0),
(48, 8, 3, 3, NULL, NULL, '12:00:00', '16:00:00', 'Friday', 0, 0),
(49, 9, 4, 4, NULL, NULL, '12:00:00', '16:00:00', 'Friday', 0, 0),
(50, 10, 5, 5, NULL, NULL, '12:00:00', '16:00:00', 'Friday', 0, 0),

(51, 1, 1, 1, '08:00:00', '11:55:00', NULL, NULL, 'Saturday', 0, 0),
(52, 2, 2, 2, '08:00:00', '11:55:00', NULL, NULL, 'Saturday', 0, 0),
(53, 3, 3, 3, '08:00:00', '11:55:00', NULL, NULL, 'Saturday', 0, 0),
(54, 4, 4, 4, '08:00:00', '11:55:00', NULL, NULL, 'Saturday', 0, 0),
(55, 5, 5, 5, '08:00:00', '11:55:00', NULL, NULL, 'Saturday', 0, 0),
(56, 6, 1, 1, NULL, NULL, '12:00:00', '16:00:00', 'Saturday', 0, 0),
(57, 7, 2, 2, NULL, NULL, '12:00:00', '16:00:00', 'Saturday', 0, 0),
(58, 8, 3, 3, NULL, NULL, '12:00:00', '16:00:00', 'Saturday', 0, 0),
(59, 9, 4, 4, NULL, NULL, '12:00:00', '16:00:00', 'Saturday', 0, 0),
(60, 10, 5, 5, NULL, NULL, '12:00:00', '16:00:00', 'Saturday', 0, 0),

(61, 1, 1, 1, '08:00:00', '11:55:00', NULL, NULL, 'Sunday', 0, 0),
(62, 2, 2, 2, '08:00:00', '11:55:00', NULL, NULL, 'Sunday', 0, 0),
(63, 3, 3, 3, '08:00:00', '11:55:00', NULL, NULL, 'Sunday', 0, 0),
(64, 4, 4, 4, '08:00:00', '11:55:00', NULL, NULL, 'Sunday', 0, 0),
(65, 5, 5, 5, '08:00:00', '11:55:00', NULL, NULL, 'Sunday', 0, 0),
(66, 6, 1, 1, NULL, NULL, '12:00:00', '16:00:00', 'Sunday', 0, 0),
(67, 7, 2, 2, NULL, NULL, '12:00:00', '16:00:00', 'Sunday', 0, 0),
(68, 8, 3, 3, NULL, NULL, '12:00:00', '16:00:00', 'Sunday', 0, 0),
(69, 9, 4, 4, NULL, NULL, '12:00:00', '16:00:00', 'Sunday', 0, 0),
(70, 10, 5, 5, NULL, NULL, '12:00:00', '16:00:00', 'Sunday', 0, 0);

# GPSs table
INSERT INTO `tbllocations` (`LocationID`, `Location`) VALUES
(1, 'Aberaeron'),
(2, 'Aberdare'),
(3, 'Aberdeen'),
(4, 'Aberfeldy'),
(5, 'Abergavenny'),
(6, 'Abergele'),
(7, 'Abertillery'),
(8, 'Aberystwyth'),
(9, 'Abingdon'),
(10, 'Accrington'),
(11, 'Adlington'),
(12, 'Airdrie'),
(13, 'Alcester'),
(14, 'Aldeburgh'),
(15, 'Aldershot'),
(16, 'Aldridge'),
(17, 'Alford'),
(18, 'Alfreton'),
(19, 'Alloa'),
(20, 'Alnwick'),
(21, 'Alsager'),
(22, 'Alston'),
(23, 'Amesbury'),
(24, 'Amlwch'),
(25, 'Ammanford'),
(26, 'Ampthill'),
(27, 'Andover'),
(28, 'Annan'),
(29, 'Antrim'),
(30, 'Appleby in Westmorland'),
(31, 'Arbroath'),
(32, 'Armagh'),
(33, 'Arundel'),
(34, 'Ashbourne'),
(35, 'Ashburton'),
(36, 'Ashby de la Zouch'),
(37, 'Ashford'),
(38, 'Ashington'),
(39, 'Ashton in Makerfield'),
(40, 'Atherstone'),
(41, 'Auchtermuchty'),
(42, 'Axminster'),
(43, 'Aylesbury'),
(44, 'Aylsham'),
(45, 'Ayr'),
(46, 'Bacup'),
(47, 'Bakewell'),
(48, 'Bala'),
(49, 'Ballater'),
(50, 'Ballycastle'),
(51, 'Ballyclare'),
(52, 'Ballymena'),
(53, 'Ballymoney'),
(54, 'Ballynahinch'),
(55, 'Banbridge'),
(56, 'Banbury'),
(57, 'Banchory'),
(58, 'Banff'),
(59, 'Bangor'),
(60, 'Barmouth'),
(61, 'Barnard Castle'),
(62, 'Barnet'),
(63, 'Barnoldswick'),
(64, 'Barnsley'),
(65, 'Barnstaple'),
(66, 'Barrhead'),
(67, 'Barrow in Furness'),
(68, 'Barry'),
(69, 'Barton upon Humber'),
(70, 'Basildon'),
(71, 'Basingstoke'),
(72, 'Bath'),
(73, 'Bathgate'),
(74, 'Batley'),
(75, 'Battle'),
(76, 'Bawtry'),
(77, 'Beaconsfield'),
(78, 'Bearsden'),
(79, 'Beaumaris'),
(80, 'Bebington'),
(81, 'Beccles'),
(82, 'Bedale'),
(83, 'Bedford'),
(84, 'Bedlington'),
(85, 'Bedworth'),
(86, 'Beeston'),
(87, 'Bellshill'),
(88, 'Belper'),
(89, 'Berkhamsted'),
(90, 'Berwick upon Tweed'),
(91, 'Betws y Coed'),
(92, 'Beverley'),
(93, 'Bewdley'),
(94, 'Bexhill on Sea'),
(95, 'Bicester'),
(96, 'Biddulph'),
(97, 'Bideford'),
(98, 'Biggar'),
(99, 'Biggleswade'),
(100, 'Billericay'),
(101, 'Bilston'),
(102, 'Bingham'),
(103, 'Birkenhead'),
(104, 'Birmingham'),
(105, 'Bishop Auckland'),
(106, 'Blackburn'),
(107, 'Blackheath'),
(108, 'Blackpool'),
(109, 'Blaenau Ffestiniog'),
(110, 'Blandford Forum'),
(111, 'Bletchley'),
(112, 'Bloxwich'),
(113, 'Blyth'),
(114, 'Bodmin'),
(115, 'Bognor Regis'),
(116, 'Bollington'),
(117, 'Bolsover'),
(118, 'Bolton'),
(119, 'Bootle'),
(120, 'Borehamwood'),
(121, 'Boston'),
(122, 'Bourne'),
(123, 'Bournemouth'),
(124, 'Brackley'),
(125, 'Bracknell'),
(126, 'Bradford'),
(127, 'Bradford on Avon'),
(128, 'Brading'),
(129, 'Bradley Stoke'),
(130, 'Bradninch'),
(131, 'Braintree'),
(132, 'Brechin'),
(133, 'Brecon'),
(134, 'Brentwood'),
(135, 'Bridge of Allan'),
(136, 'Bridgend'),
(137, 'Bridgnorth'),
(138, 'Bridgwater'),
(139, 'Bridlington'),
(140, 'Bridport'),
(141, 'Brigg'),
(142, 'Brighouse'),
(143, 'Brightlingsea'),
(144, 'Brighton'),
(145, 'Bristol'),
(146, 'Brixham'),
(147, 'Broadstairs'),
(148, 'Bromsgrove'),
(149, 'Bromyard'),
(150, 'Brynmawr'),
(151, 'Buckfastleigh'),
(152, 'Buckie'),
(153, 'Buckingham'),
(154, 'Buckley'),
(155, 'Bude'),
(156, 'Budleigh Salterton'),
(157, 'Builth Wells'),
(158, 'Bungay'),
(159, 'Buntingford'),
(160, 'Burford'),
(161, 'Burgess Hill'),
(162, 'Burnham on Crouch'),
(163, 'Burnham on Sea'),
(164, 'Burnley'),
(165, 'Burntisland'),
(166, 'Burntwood'),
(167, 'Burry Port'),
(168, 'Burton Latimer'),
(169, 'Bury'),
(170, 'Bushmills'),
(171, 'Buxton'),
(172, 'Caernarfon'),
(173, 'Caerphilly'),
(174, 'Caistor'),
(175, 'Caldicot'),
(176, 'Callander'),
(177, 'Calne'),
(178, 'Camberley'),
(179, 'Camborne'),
(180, 'Cambridge'),
(181, 'Camelford'),
(182, 'Campbeltown'),
(183, 'Cannock'),
(184, 'Canterbury'),
(185, 'Cardiff'),
(186, 'Cardigan'),
(187, 'Carlisle'),
(188, 'Carluke'),
(189, 'Carmarthen'),
(190, 'Carnforth'),
(191, 'Carnoustie'),
(192, 'Carrickfergus'),
(193, 'Carterton'),
(194, 'Castle Douglas'),
(195, 'Castlederg'),
(196, 'Castleford'),
(197, 'Castlewellan'),
(198, 'Chard'),
(199, 'Charlbury'),
(200, 'Chatham'),
(201, 'Chatteris'),
(202, 'Chelmsford'),
(203, 'Cheltenham'),
(204, 'Chepstow'),
(205, 'Chesham'),
(206, 'Cheshunt'),
(207, 'Chester'),
(208, 'Chester le Street'),
(209, 'Chesterfield'),
(210, 'Chichester'),
(211, 'Chippenham'),
(212, 'Chipping Campden'),
(213, 'Chipping Norton'),
(214, 'Chipping Sodbury'),
(215, 'Chorley'),
(216, 'Christchurch'),
(217, 'Church Stretton'),
(218, 'Cinderford'),
(219, 'Cirencester'),
(220, 'Clacton on Sea'),
(221, 'Cleckheaton'),
(222, 'Cleethorpes'),
(223, 'Clevedon'),
(224, 'Clitheroe'),
(225, 'Clogher'),
(226, 'Clydebank'),
(227, 'Coalisland'),
(228, 'Coalville'),
(229, 'Coatbridge'),
(230, 'Cockermouth'),
(231, 'Coggeshall'),
(232, 'Colchester'),
(233, 'Coldstream'),
(234, 'Coleraine'),
(235, 'Coleshill'),
(236, 'Colne'),
(237, 'Colwyn Bay'),
(238, 'Comber'),
(239, 'Congleton'),
(240, 'Conwy'),
(241, 'Cookstown'),
(242, 'Corbridge'),
(243, 'Corby'),
(244, 'Coventry'),
(245, 'Cowbridge'),
(246, 'Cowdenbeath'),
(247, 'Cowes'),
(248, 'Craigavon'),
(249, 'Cramlington'),
(250, 'Crawley'),
(251, 'Crayford'),
(252, 'Crediton'),
(253, 'Crewe'),
(254, 'Crewkerne'),
(255, 'Criccieth'),
(256, 'Crickhowell'),
(257, 'Crieff'),
(258, 'Cromarty'),
(259, 'Cromer'),
(260, 'Crowborough'),
(261, 'Crowthorne'),
(262, 'Crumlin'),
(263, 'Cuckfield'),
(264, 'Cullen'),
(265, 'Cullompton'),
(266, 'Cumbernauld'),
(267, 'Cupar'),
(268, 'Cwmbran'),
(269, 'Dalbeattie'),
(270, 'Dalkeith'),
(271, 'Darlington'),
(272, 'Dartford'),
(273, 'Dartmouth'),
(274, 'Darwen'),
(275, 'Daventry'),
(276, 'Dawlish'),
(277, 'Deal'),
(278, 'Denbigh'),
(279, 'Denton'),
(280, 'Derby'),
(281, 'Dereham'),
(282, 'Devizes'),
(283, 'Dewsbury'),
(284, 'Didcot'),
(285, 'Dingwall'),
(286, 'Dinnington'),
(287, 'Diss'),
(288, 'Dolgellau'),
(289, 'Donaghadee'),
(290, 'Doncaster'),
(291, 'Dorchester'),
(292, 'Dorking'),
(293, 'Dornoch'),
(294, 'Dover'),
(295, 'Downham Market'),
(296, 'Downpatrick'),
(297, 'Driffield'),
(298, 'Dronfield'),
(299, 'Droylsden'),
(300, 'Dudley'),
(301, 'Dufftown'),
(302, 'Dukinfield'),
(303, 'Dumbarton'),
(304, 'Dumfries'),
(305, 'Dunbar'),
(306, 'Dunblane'),
(307, 'Dundee'),
(308, 'Dunfermline'),
(309, 'Dungannon'),
(310, 'Dunoon'),
(311, 'Duns'),
(312, 'Dunstable'),
(313, 'Durham'),
(314, 'Dursley'),
(315, 'Easingwold'),
(316, 'East Grinstead'),
(317, 'East Kilbride'),
(318, 'Eastbourne'),
(319, 'Eastleigh'),
(320, 'Eastwood'),
(321, 'Ebbw Vale'),
(322, 'Edenbridge'),
(323, 'Edinburgh'),
(324, 'Egham'),
(325, 'Elgin'),
(326, 'Ellesmere'),
(327, 'Ellesmere Port'),
(328, 'Ely'),
(329, 'Enniskillen'),
(330, 'Epping'),
(331, 'Epsom'),
(332, 'Erith'),
(333, 'Esher'),
(334, 'Evesham'),
(335, 'Exeter'),
(336, 'Exmouth'),
(337, 'Eye'),
(338, 'Eyemouth'),
(339, 'Failsworth'),
(340, 'Fairford'),
(341, 'Fakenham'),
(342, 'Falkirk'),
(343, 'Falkland'),
(344, 'Falmouth'),
(345, 'Fareham'),
(346, 'Faringdon'),
(347, 'Farnborough'),
(348, 'Farnham'),
(349, 'Farnworth'),
(350, 'Faversham'),
(351, 'Felixstowe'),
(352, 'Ferndown'),
(353, 'Filey'),
(354, 'Fintona'),
(355, 'Fishguard'),
(356, 'Fivemiletown'),
(357, 'Fleet'),
(358, 'Fleetwood'),
(359, 'Flint'),
(360, 'Flitwick'),
(361, 'Folkestone'),
(362, 'Fordingbridge'),
(363, 'Forfar'),
(364, 'Forres'),
(365, 'Fort William'),
(366, 'Fowey'),
(367, 'Framlingham'),
(368, 'Fraserburgh'),
(369, 'Frodsham'),
(370, 'Frome'),
(371, 'Gainsborough'),
(372, 'Galashiels'),
(373, 'Gateshead'),
(374, 'Gillingham'),
(375, 'Glasgow'),
(376, 'Glastonbury'),
(377, 'Glossop'),
(378, 'Gloucester'),
(379, 'Godalming'),
(380, 'Godmanchester'),
(381, 'Goole'),
(382, 'Gorseinon'),
(383, 'Gosport'),
(384, 'Gourock'),
(385, 'Grange over Sands'),
(386, 'Grangemouth'),
(387, 'Grantham'),
(388, 'Grantown on Spey'),
(389, 'Gravesend'),
(390, 'Grays'),
(391, 'Great Yarmouth'),
(392, 'Greenock'),
(393, 'Grimsby'),
(394, 'Guildford'),
(395, 'Haddington'),
(396, 'Hadleigh'),
(397, 'Hailsham'),
(398, 'Halesowen'),
(399, 'Halesworth'),
(400, 'Halifax'),
(401, 'Halstead'),
(402, 'Haltwhistle'),
(403, 'Hamilton'),
(404, 'Harlow'),
(405, 'Harpenden'),
(406, 'Harrogate'),
(407, 'Hartlepool'),
(408, 'Harwich'),
(409, 'Haslemere'),
(410, 'Hastings'),
(411, 'Hatfield'),
(412, 'Havant'),
(413, 'Haverfordwest'),
(414, 'Haverhill'),
(415, 'Hawarden'),
(416, 'Hawick'),
(417, 'Hay on Wye'),
(418, 'Hayle'),
(419, 'Haywards Heath'),
(420, 'Heanor'),
(421, 'Heathfield'),
(422, 'Hebden Bridge'),
(423, 'Helensburgh'),
(424, 'Helston'),
(425, 'Hemel Hempstead'),
(426, 'Henley on Thames'),
(427, 'Hereford'),
(428, 'Herne Bay'),
(429, 'Hertford'),
(430, 'Hessle'),
(431, 'Heswall'),
(432, 'Hexham'),
(433, 'High Wycombe'),
(434, 'Higham Ferrers'),
(435, 'Highworth'),
(436, 'Hinckley'),
(437, 'Hitchin'),
(438, 'Hoddesdon'),
(439, 'Holmfirth'),
(440, 'Holsworthy'),
(441, 'Holyhead'),
(442, 'Holywell'),
(443, 'Honiton'),
(444, 'Horley'),
(445, 'Horncastle'),
(446, 'Hornsea'),
(447, 'Horsham'),
(448, 'Horwich'),
(449, 'Houghton le Spring'),
(450, 'Hove'),
(451, 'Howden'),
(452, 'Hoylake'),
(453, 'Hucknall'),
(454, 'Huddersfield'),
(455, 'Hungerford'),
(456, 'Hunstanton'),
(457, 'Huntingdon'),
(458, 'Huntly'),
(459, 'Hyde'),
(460, 'Hythe'),
(461, 'Ilford'),
(462, 'Ilfracombe'),
(463, 'Ilkeston'),
(464, 'Ilkley'),
(465, 'Ilminster'),
(466, 'Innerleithen'),
(467, 'Inveraray'),
(468, 'Inverkeithing'),
(469, 'Inverness'),
(470, 'Inverurie'),
(471, 'Ipswich'),
(472, 'Irthlingborough'),
(473, 'Irvine'),
(474, 'Ivybridge'),
(475, 'Jarrow'),
(476, 'Jedburgh'),
(477, 'Johnstone'),
(478, 'Keighley'),
(479, 'Keith'),
(480, 'Kelso'),
(481, 'Kempston'),
(482, 'Kendal'),
(483, 'Kenilworth'),
(484, 'Kesgrave'),
(485, 'Keswick'),
(486, 'Kettering'),
(487, 'Keynsham'),
(488, 'Kidderminster'),
(489, 'Kilbarchan'),
(490, 'Kilkeel'),
(491, 'Killyleagh'),
(492, 'Kilmarnock'),
(493, 'Kilwinning'),
(494, 'Kinghorn'),
(495, 'Kingsbridge'),
(496, 'Kington'),
(497, 'Kingussie'),
(498, 'Kinross'),
(499, 'Kintore'),
(500, 'Kirkby'),
(501, 'Kirkby Lonsdale'),
(502, 'Kirkcaldy'),
(503, 'Kirkcudbright'),
(504, 'Kirkham'),
(505, 'Kirkwall'),
(506, 'Kirriemuir'),
(507, 'Knaresborough'),
(508, 'Knighton'),
(509, 'Knutsford'),
(510, 'Ladybank'),
(511, 'Lampeter'),
(512, 'Lanark'),
(513, 'Lancaster'),
(514, 'Langholm'),
(515, 'Largs'),
(516, 'Larne'),
(517, 'Laugharne'),
(518, 'Launceston'),
(519, 'Laurencekirk'),
(520, 'Leamington Spa'),
(521, 'Leatherhead'),
(522, 'Ledbury'),
(523, 'Leeds'),
(524, 'Leek'),
(525, 'Leicester'),
(526, 'Leighton Buzzard'),
(527, 'Leiston'),
(528, 'Leominster'),
(529, 'Lerwick'),
(530, 'Letchworth'),
(531, 'Leven'),
(532, 'Lewes'),
(533, 'Leyland'),
(534, 'Lichfield'),
(535, 'Limavady'),
(536, 'Lincoln'),
(537, 'Linlithgow'),
(538, 'Lisburn'),
(539, 'Liskeard'),
(540, 'Lisnaskea'),
(541, 'Littlehampton'),
(542, 'Liverpool'),
(543, 'Llandeilo'),
(544, 'Llandovery'),
(545, 'Llandrindod Wells'),
(546, 'Llandudno'),
(547, 'Llanelli'),
(548, 'Llanfyllin'),
(549, 'Llangollen'),
(550, 'Llanidloes'),
(551, 'Llanrwst'),
(552, 'Llantrisant'),
(553, 'Llantwit Major'),
(554, 'Llanwrtyd Wells'),
(555, 'Loanhead'),
(556, 'Lochgilphead'),
(557, 'Lockerbie'),
(558, 'Londonderry'),
(559, 'Long Eaton'),
(560, 'Longridge'),
(561, 'Looe'),
(562, 'Lossiemouth'),
(563, 'Lostwithiel'),
(564, 'Loughborough'),
(565, 'Loughton'),
(566, 'Louth'),
(567, 'Lowestoft'),
(568, 'Ludlow'),
(569, 'Lurgan'),
(570, 'Luton'),
(571, 'Lutterworth'),
(572, 'Lydd'),
(573, 'Lydney'),
(574, 'Lyme Regis'),
(575, 'Lymington'),
(576, 'Lynton'),
(577, 'Mablethorpe'),
(578, 'Macclesfield'),
(579, 'Machynlleth'),
(580, 'Maesteg'),
(581, 'Magherafelt'),
(582, 'Maidenhead'),
(583, 'Maidstone'),
(584, 'Maldon'),
(585, 'Malmesbury'),
(586, 'Malton'),
(587, 'Malvern'),
(588, 'Manchester'),
(589, 'Manningtree'),
(590, 'Mansfield'),
(591, 'March'),
(592, 'Margate'),
(593, 'Market Deeping'),
(594, 'Market Drayton'),
(595, 'Market Harborough'),
(596, 'Market Rasen'),
(597, 'Market Weighton'),
(598, 'Markethill'),
(599, 'Markinch'),
(600, 'Marlborough'),
(601, 'Marlow'),
(602, 'Maryport'),
(603, 'Matlock'),
(604, 'Maybole'),
(605, 'Melksham'),
(606, 'Melrose'),
(607, 'Melton Mowbray'),
(608, 'Merthyr Tydfil'),
(609, 'Mexborough'),
(610, 'Middleham'),
(611, 'Middlesbrough'),
(612, 'Middlewich'),
(613, 'Midhurst'),
(614, 'Midsomer Norton'),
(615, 'Milford Haven'),
(616, 'Milngavie'),
(617, 'Milton Keynes'),
(618, 'Minehead'),
(619, 'Moffat'),
(620, 'Mold'),
(621, 'Monifieth'),
(622, 'Monmouth'),
(623, 'Montgomery'),
(624, 'Montrose'),
(625, 'Morecambe'),
(626, 'Moreton in Marsh'),
(627, 'Moretonhampstead'),
(628, 'Morley'),
(629, 'Morpeth'),
(630, 'Motherwell'),
(631, 'Musselburgh'),
(632, 'Nailsea'),
(633, 'Nailsworth'),
(634, 'Nairn'),
(635, 'Nantwich'),
(636, 'Narberth'),
(637, 'Neath'),
(638, 'Needham Market'),
(639, 'Neston'),
(640, 'New Mills'),
(641, 'New Milton'),
(642, 'Newbury'),
(643, 'Newcastle'),
(644, 'Newcastle Emlyn'),
(645, 'Newcastle upon Tyne'),
(646, 'Newent'),
(647, 'Newhaven'),
(648, 'Newmarket'),
(649, 'Newport'),
(650, 'Newport Pagnell'),
(651, 'Newport on Tay'),
(652, 'Newquay'),
(653, 'Newry'),
(654, 'Newton Abbot'),
(655, 'Newton Aycliffe'),
(656, 'Newton Stewart'),
(657, 'Newton le Willows'),
(658, 'Newtown'),
(659, 'Newtownabbey'),
(660, 'Newtownards'),
(661, 'Normanton'),
(662, 'North Berwick'),
(663, 'North Walsham'),
(664, 'Northallerton'),
(665, 'Northampton'),
(666, 'Northwich'),
(667, 'Norwich'),
(668, 'Nottingham'),
(669, 'Nuneaton'),
(670, 'Oakham'),
(671, 'Oban'),
(672, 'Okehampton'),
(673, 'Oldbury'),
(674, 'Oldham'),
(675, 'Oldmeldrum'),
(676, 'Olney'),
(677, 'Omagh'),
(678, 'Ormskirk'),
(679, 'Orpington'),
(680, 'Ossett'),
(681, 'Oswestry'),
(682, 'Otley'),
(683, 'Oundle'),
(684, 'Oxford'),
(685, 'Padstow'),
(686, 'Paignton'),
(687, 'Painswick'),
(688, 'Paisley'),
(689, 'Peebles'),
(690, 'Pembroke'),
(691, 'Penarth'),
(692, 'Penicuik'),
(693, 'Penistone'),
(694, 'Penmaenmawr'),
(695, 'Penrith'),
(696, 'Penryn'),
(697, 'Penzance'),
(698, 'Pershore'),
(699, 'Perth'),
(700, 'Peterborough'),
(701, 'Peterhead'),
(702, 'Peterlee'),
(703, 'Petersfield'),
(704, 'Petworth'),
(705, 'Pickering'),
(706, 'Pitlochry'),
(707, 'Pittenweem'),
(708, 'Plymouth'),
(709, 'Pocklington'),
(710, 'Polegate'),
(711, 'Pontefract'),
(712, 'Pontypridd'),
(713, 'Poole'),
(714, 'Port Talbot'),
(715, 'Portadown'),
(716, 'Portaferry'),
(717, 'Porth'),
(718, 'Porthcawl'),
(719, 'Porthmadog'),
(720, 'Portishead'),
(721, 'Portrush'),
(722, 'Portsmouth'),
(723, 'Portstewart'),
(724, 'Potters Bar'),
(725, 'Potton'),
(726, 'Poulton le Fylde'),
(727, 'Prescot'),
(728, 'Prestatyn'),
(729, 'Presteigne'),
(730, 'Preston'),
(731, 'Prestwick'),
(732, 'Princes Risborough'),
(733, 'Prudhoe'),
(734, 'Pudsey'),
(735, 'Pwllheli'),
(736, 'Ramsgate'),
(737, 'Randalstown'),
(738, 'Rayleigh'),
(739, 'Reading'),
(740, 'Redcar'),
(741, 'Redditch'),
(742, 'Redhill'),
(743, 'Redruth'),
(744, 'Reigate'),
(745, 'Retford'),
(746, 'Rhayader'),
(747, 'Rhuddlan'),
(748, 'Rhyl'),
(749, 'Richmond'),
(750, 'Rickmansworth'),
(751, 'Ringwood'),
(752, 'Ripley'),
(753, 'Ripon'),
(754, 'Rochdale'),
(755, 'Rochester'),
(756, 'Rochford'),
(757, 'Romford'),
(758, 'Romsey'),
(759, 'Ross on Wye'),
(760, 'Rostrevor'),
(761, 'Rothbury'),
(762, 'Rotherham'),
(763, 'Rothesay'),
(764, 'Rowley Regis'),
(765, 'Royston'),
(766, 'Rugby'),
(767, 'Rugeley'),
(768, 'Runcorn'),
(769, 'Rushden'),
(770, 'Rutherglen'),
(771, 'Ruthin'),
(772, 'Ryde'),
(773, 'Rye'),
(774, 'Saffron Walden'),
(775, 'Saintfield'),
(776, 'Salcombe'),
(777, 'Sale'),
(778, 'Salford'),
(779, 'Salisbury'),
(780, 'Saltash'),
(781, 'Saltcoats'),
(782, 'Sandbach'),
(783, 'Sandhurst'),
(784, 'Sandown'),
(785, 'Sandwich'),
(786, 'Sandy'),
(787, 'Sawbridgeworth'),
(788, 'Saxmundham'),
(789, 'Scarborough'),
(790, 'Scunthorpe'),
(791, 'Seaford'),
(792, 'Seaton'),
(793, 'Sedgefield'),
(794, 'Selby'),
(795, 'Selkirk'),
(796, 'Selsey'),
(797, 'Settle'),
(798, 'Sevenoaks'),
(799, 'Shaftesbury'),
(800, 'Shanklin'),
(801, 'Sheerness'),
(802, 'Sheffield'),
(803, 'Shepshed'),
(804, 'Shepton Mallet'),
(805, 'Sherborne'),
(806, 'Sheringham'),
(807, 'Shildon'),
(808, 'Shipston on Stour'),
(809, 'Shoreham by Sea'),
(810, 'Shrewsbury'),
(811, 'Sidmouth'),
(812, 'Sittingbourne'),
(813, 'Skegness'),
(814, 'Skelmersdale'),
(815, 'Skipton'),
(816, 'Sleaford'),
(817, 'Slough'),
(818, 'Smethwick'),
(819, 'Soham'),
(820, 'Solihull'),
(821, 'Somerton'),
(822, 'South Molton'),
(823, 'South Shields'),
(824, 'South Woodham Ferrers'),
(825, 'Southam'),
(826, 'Southampton'),
(827, 'Southborough'),
(828, 'Southend on Sea'),
(829, 'Southport'),
(830, 'Southsea'),
(831, 'Southwell'),
(832, 'Southwold'),
(833, 'Spalding'),
(834, 'Spennymoor'),
(835, 'Spilsby'),
(836, 'Stafford'),
(837, 'Staines'),
(838, 'Stamford'),
(839, 'Stanley'),
(840, 'Staveley'),
(841, 'Stevenage'),
(842, 'Stirling'),
(843, 'Stockport'),
(844, 'Stockton on Tees'),
(845, 'Stoke on Trent'),
(846, 'Stone'),
(847, 'Stowmarket'),
(848, 'Strabane'),
(849, 'Stranraer'),
(850, 'Stratford upon Avon'),
(851, 'Strood'),
(852, 'Stroud'),
(853, 'Sudbury'),
(854, 'Sunderland'),
(855, 'Sutton Coldfield'),
(856, 'Sutton in Ashfield'),
(857, 'Swadlincote'),
(858, 'Swanage'),
(859, 'Swanley'),
(860, 'Swansea'),
(861, 'Swindon'),
(862, 'Tadcaster'),
(863, 'Tadley'),
(864, 'Tain'),
(865, 'Talgarth'),
(866, 'Tamworth'),
(867, 'Taunton'),
(868, 'Tavistock'),
(869, 'Teignmouth'),
(870, 'Telford'),
(871, 'Tenby'),
(872, 'Tenterden'),
(873, 'Tetbury'),
(874, 'Tewkesbury'),
(875, 'Thame'),
(876, 'Thatcham'),
(877, 'Thaxted'),
(878, 'Thetford'),
(879, 'Thirsk'),
(880, 'Thornbury'),
(881, 'Thrapston'),
(882, 'Thurso'),
(883, 'Tilbury'),
(884, 'Tillicoultry'),
(885, 'Tipton'),
(886, 'Tiverton'),
(887, 'Tobermory'),
(888, 'Todmorden'),
(889, 'Tonbridge'),
(890, 'Torpoint'),
(891, 'Torquay'),
(892, 'Totnes'),
(893, 'Totton'),
(894, 'Towcester'),
(895, 'Tredegar'),
(896, 'Tregaron'),
(897, 'Tring'),
(898, 'Troon'),
(899, 'Trowbridge'),
(900, 'Truro'),
(901, 'Tunbridge Wells'),
(902, 'Tywyn'),
(903, 'Uckfield'),
(904, 'Ulverston'),
(905, 'Uppingham'),
(906, 'Usk'),
(907, 'Uttoxeter'),
(908, 'Ventnor'),
(909, 'Verwood'),
(910, 'Wadebridge'),
(911, 'Wadhurst'),
(912, 'Wakefield'),
(913, 'Wallasey'),
(914, 'Wallingford'),
(915, 'Walsall'),
(916, 'Waltham Abbey'),
(917, 'Waltham Cross'),
(918, 'Walton on Thames'),
(919, 'Walton on the Naze'),
(920, 'Wantage'),
(921, 'Ware'),
(922, 'Wareham'),
(923, 'Warminster'),
(924, 'Warrenpoint'),
(925, 'Warrington'),
(926, 'Warwick'),
(927, 'Washington'),
(928, 'Watford'),
(929, 'Wednesbury'),
(930, 'Wednesfield'),
(931, 'Wellingborough'),
(932, 'Wellington'),
(933, 'Wells'),
(934, 'Wells next the Sea'),
(935, 'Welshpool'),
(936, 'Welwyn Garden City'),
(937, 'Wem'),
(938, 'Wendover'),
(939, 'West Bromwich'),
(940, 'Westbury'),
(941, 'Westerham'),
(942, 'Westhoughton'),
(943, 'Weston super Mare'),
(944, 'Wetherby'),
(945, 'Weybridge'),
(946, 'Weymouth'),
(947, 'Whaley Bridge'),
(948, 'Whitby'),
(949, 'Whitchurch'),
(950, 'Whitehaven'),
(951, 'Whitley Bay'),
(952, 'Whitnash'),
(953, 'Whitstable'),
(954, 'Whitworth'),
(955, 'Wick'),
(956, 'Wickford'),
(957, 'Widnes'),
(958, 'Wigan'),
(959, 'Wigston'),
(960, 'Wigtown'),
(961, 'Willenhall'),
(962, 'Wincanton'),
(963, 'Winchester'),
(964, 'Windermere'),
(965, 'Winsford'),
(966, 'Winslow'),
(967, 'Wisbech'),
(968, 'Witham'),
(969, 'Withernsea'),
(970, 'Witney'),
(971, 'Woburn'),
(972, 'Woking'),
(973, 'Wokingham'),
(974, 'Wolverhampton'),
(975, 'Wombwell'),
(976, 'Woodbridge'),
(977, 'Woodstock'),
(978, 'Wootton Bassett'),
(979, 'Worcester'),
(980, 'Workington'),
(981, 'Worksop'),
(982, 'Worthing'),
(983, 'Wotton under Edge'),
(984, 'Wrexham'),
(985, 'Wymondham'),
(986, 'Yarm'),
(987, 'Yarmouth'),
(988, 'Yate'),
(989, 'Yateley'),
(990, 'Yeadon'),
(991, 'Yeovil'),
(992, 'York');

ALTER TABLE `tblShifts`
  ADD CONSTRAINT FOREIGN KEY (`DriverID`) REFERENCES `tblDrivers` (`DriverID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT FOREIGN KEY (`VehicleID`) REFERENCES `tblVehicles` (`VehicleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT FOREIGN KEY (`GPSID`) REFERENCES `tblGPS` (`GPSID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `tblDriverInfo`
  ADD CONSTRAINT FOREIGN KEY (`DriverID`) REFERENCES `tblDrivers` (`DriverID`) ON DELETE CASCADE ON UPDATE CASCADE;
   
CREATE EVENT GPSLocationUpdate
    ON SCHEDULE
      EVERY 30 MINUTE
    DO
	  UPDATE tblgps SET gpslocation = (SELECT Location FROM tblLocations ORDER BY RAND() LIMIT 1);
	  
UPDATE tblgps SET GPSLocation = "Oxford";
	 	  	  
CREATE EVENT ParcelDeliveryUpdate
    ON SCHEDULE
      EVERY 20 MINUTE
	  ON COMPLETION PRESERVE
    DO 
	  UPDATE tblshifts SET parcelsdelivered = parcelsdelivered + (1 + RAND( ) *3) WHERE onshift = 1;  

UPDATE tblshifts SET parcelsdelivered = 0;
UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Monday" AND ShiftAMBegin="8:00:00";

DELIMITER $$
CREATE EVENT Monday_Shift_Change
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 4 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Monday" AND ShiftAMBegin="8:00:00";
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Monday" AND ShiftPMBegin="12:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Monday_Shift_End
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 8 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Monday" AND ShiftPMEnd="16:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Tuesday_Shift_Begin
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 1 DAY
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Tuesday" AND ShiftAMBegin="8:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Tuesday_Shift_Change
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 1 DAY + INTERVAL 4 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Tuesday" AND ShiftAMBegin="8:00:00";
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Tuesday" AND ShiftPMBegin="12:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Tuesday_Shift_End
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 1 DAY + INTERVAL 8 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Tuesday" AND ShiftPMEnd="16:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Wednesday_Shift_Begin
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 2 DAY
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Wednesday" AND ShiftAMBegin="8:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Wednesday_Shift_Change
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 2 DAY + INTERVAL 4 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Wednesday" AND ShiftAMBegin="8:00:00";
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Wednesday" AND ShiftPMBegin="12:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Wednesday_Shift_End
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 2 DAY + INTERVAL 8 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Wednesday" AND ShiftPMEnd="16:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Thursday_Shift_Begin
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 3 DAY
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Thursday" AND ShiftAMBegin="8:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Thursday_Shift_Change
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 3 DAY + INTERVAL 4 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Thursday" AND ShiftAMBegin="8:00:00";
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Thursday" AND ShiftPMBegin="12:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Thursday_Shift_End
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 3 DAY + INTERVAL 8 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Thursday" AND ShiftPMEnd="16:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Friday_Shift_Begin
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 4 DAY
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Friday" AND ShiftAMBegin="8:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Friday_Shift_Change
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 4 DAY + INTERVAL 4 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Friday" AND ShiftAMBegin="8:00:00";
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Friday" AND ShiftPMBegin="12:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Friday_Shift_End
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 4 DAY + INTERVAL 8 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Friday" AND ShiftPMEnd="16:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Saturday_Shift_Begin
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 5 DAY
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Saturday" AND ShiftAMBegin="8:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Saturday_Shift_Change
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 5 DAY + INTERVAL 4 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Saturday" AND ShiftAMBegin="8:00:00";
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Saturday" AND ShiftPMBegin="12:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Saturday_Shift_End
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 5 DAY + INTERVAL 8 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Saturday" AND ShiftPMEnd="16:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Sunday_Shift_Begin
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 6 DAY
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Sunday" AND ShiftAMBegin="8:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Sunday_Shift_Change
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 6 DAY + INTERVAL 4 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Sunday" AND ShiftAMBegin="8:00:00";
		UPDATE tblshifts SET onshift = IF(onshift =0,1,onshift) WHERE shiftday="Sunday" AND ShiftPMBegin="12:00:00";
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT Sunday_Shift_End
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 6 DAY + INTERVAL 8 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		UPDATE tblshifts SET onshift = IF(onshift =1,0,onshift) WHERE shiftday="Sunday" AND ShiftPMEnd="16:00:00";
	END $$
DELIMITER ;

/*DQL (Queries) SQL Command*/ 

/*SELECT VehicleID, DriverID, FirstName, GPSLocation FROM tblshifts 
INNER JOIN tblgps USING (gpsid) INNER JOIN tbldrivers USING (driverid) 
WHERE VehicleID = FLOOR( RAND()*(5-1)+1) ORDER BY RAND() LIMIT 1;

SELECT DriverID, FirstName, LastName, parcelsdelivered FROM tblshifts 
INNER JOIN tbldrivers USING (driverid) 
WHERE shiftday = "Monday" AND DriverID = FLOOR(RAND()*(10-1+1)+1) LIMIT 1;*/

DELIMITER $$
CREATE EVENT Random_Driver_Location
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL FLOOR(RAND()*(8-1)+1) HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		SELECT VehicleID, DriverID, FirstName, GPSLocation FROM tblshifts 
		INNER JOIN tblgps USING (gpsid) INNER JOIN tbldrivers USING (driverid) 
		WHERE VehicleID = FLOOR( RAND()*(5-1)+1) ORDER BY RAND() LIMIT 1;
	END $$
DELIMITER ;

DELIMITER $$
CREATE EVENT TotalParcelDelivery
	ON SCHEDULE 
	  AT CURRENT_TIMESTAMP + INTERVAL 8 HOUR
	ON COMPLETION PRESERVE
	DO
	BEGIN
		SELECT DriverID, FirstName, LastName, parcelsdelivered FROM tblshifts 
		INNER JOIN tbldrivers USING (driverid) 
		WHERE shiftday = "Monday" AND DriverID = FLOOR(RAND()*(10-1+1)+1) ORDER BY RAND() LIMIT 1;
	END $$
DELIMITER ;

CREATE PROCEDURE show_drivers() 
SELECT DriverID, FirstName, LastName FROM tblDrivers;
/*CALL show_drivers;*/
CREATE PROCEDURE show_am_drivers() 
SELECT DriverID, FirstName, LastName FROM tblDrivers WHERE DriverID IN (
	SELECT DriverID FROM tblshifts WHERE ShiftAMBegin="8:00:00");
/*CALL show_am_drivers;*/

/*Queries + call functions are commented out */