/*       
Prabhas Kumra
CS-457
HW #4
*/

DROP TABLE IF EXISTS `Employees`;

CREATE TABLE `Employees` (
  `ENO` int(4) NOT NULL,
  `ENAME` varchar(30),
  `ZIP` int(5) NOT NULL,
  `HDATE` varchar(20),
  PRIMARY KEY (`ENO`)
);

DROP TABLE IF EXISTS `Parts`;

CREATE TABLE `Parts` (
  `PNO` int(5),
  `PNAME` varchar(40),
  `QOH` int(3),
  `PRICE` float(4,2),
  `OLEVEL` int(2),
  PRIMARY KEY (`PNO`)
);

DROP TABLE IF EXISTS `Customers`;

CREATE TABLE `Customers` (
  `CNO` int(4),
  `CNAME` varchar(20),
  `STREET` varchar(30),
  `ZIP` int(5) NOT NULL,
  `PHONE` varchar(20),
  PRIMARY KEY (`CNO`)
);

DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
  `ONO` int(4) NOT NULL,
  `CNO` int(4) NOT NULL,
  `ENO` int(4) NOT NULL,
  `RECEIVED` varchar(20),
  `SHIPPED` varchar(20),
  PRIMARY KEY (`ONO`)
);


DROP TABLE IF EXISTS `Odetails`;

CREATE TABLE `Odetails` (
  `ONO` int(4) NOT NULL,
  `PNO` int(5) NOT NULL,
  `QTY` int(5) NOT NULL,
  PRIMARY KEY (`ONO`,`PNO`),
  FOREIGN KEY (`ONO`) REFERENCES `Orders` (`ONO`),
  FOREIGN KEY (`PNO`) REFERENCES `Parts` (`PNO`)
);


DROP TABLE IF EXISTS `Zipcodes`;

CREATE TABLE `Zipcodes` (
  `ZIP` int(5) NOT NULL,
  `CITY` varchar(20) ,
  PRIMARY KEY (`ZIP`)
);

INSERT INTO `Employees` VALUES (1000,'Jones',67226,'12-DEC-95'),(1001,'Smith',60606,'01-JAN-9'),(1002,'Brown',50302,'01-SEP-94');

INSERT INTO `Parts` VALUES (10506,'Land Before Time I',200,19.99,20),(10507,'Land Before Time II',156,19.99,20),(10508,'Land Before Time III',190,19.99,20),(10509,'Land Before Time IV',60,19.99,20),(10601,'Sleeping Beauty',300,24.99,20),(10701,'When Harry Met Sally',120,19.99,30),(10800,'Dirty Harry',140,14.99,30),(10900,'Dr. Zhivago',100,24.99,30);

INSERT INTO `Customers` VALUES (1111,'Charles','123 Main St.',67226,'316-636-5555'),(2222,'Berram','237 Ash Avenue',67226,'316-689-5555'),(3333,'Barbara','111 Inwood ST.',60606,'316-111-1234');

INSERT INTO `Orders` VALUES (1020,1111,1000,'10-DEC-94','12-DEC-94'),(1021,1111,1000,'12-JAN-95','15-JAN-95'),(1022,2222,1001,'13-FEB-95','20-FEB-95'),(1023,3333,1000,'20-JUN-97','null');

INSERT INTO `Odetails` VALUES (1020,10506,1),(1020,10507,1),(1020,10508,2),(1020,10509,3),(1021,10601,4),(1022,10601,1),(1022,10701,1),(1023,10800,1),(1023,10900,1);

INSERT INTO `Zipcodes` VALUES (50302,'Kansas City'),(54444,'Colombia'),(60606,'Fort Dodge'),(61111,'Fort Hays'),(66002,'Liberal'),(67226,'Wichita');




