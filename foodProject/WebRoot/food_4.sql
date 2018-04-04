/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.23 : Database - food
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`food` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `food`;

/*Table structure for table `t_customer` */

DROP TABLE IF EXISTS `t_customer`;

CREATE TABLE `t_customer` (
  `customerid` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `address` varchar(40) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_customer` */

insert  into `t_customer`(`customerid`,`name`,`address`,`password`) values (2,'admin','123','123'),(3,'sunna','123','123');

/*Table structure for table `t_food` */

DROP TABLE IF EXISTS `t_food`;

CREATE TABLE `t_food` (
  `foodid` int(11) NOT NULL AUTO_INCREMENT,
  `foodname` varchar(40) NOT NULL,
  `unitprice` double DEFAULT NULL,
  `filepath` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`foodid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `t_food` */

insert  into `t_food`(`foodid`,`foodname`,`unitprice`,`filepath`) values (2,'美食二',60,'upload/3.png'),(4,'美食三',34,'upload/4.png'),(5,'美食四',43,'upload/5.png'),(6,'美食五',54,'upload/6.png');

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `orderid` int(30) NOT NULL AUTO_INCREMENT,
  `food` int(11) DEFAULT NULL,
  `foodnum` int(2) DEFAULT NULL,
  `customer` int(30) DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `food` (`food`),
  KEY `customer` (`customer`),
  KEY `FKA0C0C3C3972E5A4` (`food`),
  KEY `FKA0C0C3C3BFD518A4` (`customer`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`food`) REFERENCES `t_food` (`foodid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`customer`) REFERENCES `t_customer` (`customerid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

insert  into `t_order`(`orderid`,`food`,`foodnum`,`customer`,`total`) values (31,2,1,2,60);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
