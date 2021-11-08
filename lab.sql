-- MySQL dump 10.19  Distrib 10.3.31-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: order-directory
-- ------------------------------------------------------
-- Server version       10.3.31-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CAT_ID` int(11) NOT NULL,
  `CAT_NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'books'),(2,'games'),(3,'groceries'),(4,'electronics'),(5,'clothes');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CUS_ID` int(11) NOT NULL,
  `CUS_NAME` varchar(20) DEFAULT NULL,
  `CUS_PHONE` varchar(10) DEFAULT NULL,
  `CUS_CITY` varchar(30) DEFAULT NULL,
  `CUS_GENDER` char(1) DEFAULT NULL,
  PRIMARY KEY (`CUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'aakash','9999999999','delhi','m'),(2,'aman','9785463215','noida','m'),(3,'neha','9999999999','mumbai','f'),(4,'megha','9994562399','kolkata','f'),(5,'pulkit','7895999999','lucknow','m');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `ORD_ID` int(11) NOT NULL,
  `ORD_AMOUNT` int(11) NOT NULL,
  `ORD_DATE` date DEFAULT NULL,
  `CUS_ID` int(11) NOT NULL,
  `PROD_ID` int(11) NOT NULL,
  PRIMARY KEY (`ORD_ID`),
  KEY `CUS_ID` (`CUS_ID`),
  KEY `PROD_ID` (`PROD_ID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CUS_ID`) REFERENCES `customer` (`CUS_ID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`PROD_ID`) REFERENCES `product_details` (`PROD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (20,1500,'2021-10-12',3,5),(25,30500,'2021-09-16',5,2),(26,2000,'2021-10-05',1,1),(30,3500,'2021-08-16',4,3),(50,2000,'2021-10-06',2,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `PRO_ID` int(11) NOT NULL,
  `PRO_NAME` varchar(20) DEFAULT NULL,
  `PRO_DESC` varchar(60) DEFAULT NULL,
  `CAT_ID` int(11) NOT NULL,
  PRIMARY KEY (`PRO_ID`),
  KEY `CAT_ID` (`CAT_ID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CAT_ID`) REFERENCES `category` (`CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'gta v','dfjdjfdjfdjfdjfjf',2),(2,'tshirt','dfdfjdfjdkfd',5),(3,'rog laptop','dfnttntnternd',4),(4,'oats','reurentbtoth',3),(5,'harry potter','nbemcthtjth',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_details` (
  `PROD_ID` int(11) NOT NULL,
  `PRO_ID` int(11) NOT NULL,
  `SUPP_ID` int(11) NOT NULL,
  `PROD_PRICE` int(11) NOT NULL,
  PRIMARY KEY (`PROD_ID`),
  KEY `PRO_ID` (`PRO_ID`),
  KEY `SUPP_ID` (`SUPP_ID`),
  CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`PRO_ID`) REFERENCES `product` (`PRO_ID`),
  CONSTRAINT `product_details_ibfk_2` FOREIGN KEY (`SUPP_ID`) REFERENCES `supplier` (`SUPP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (1,1,2,1500),(2,3,5,30000),(3,5,1,3000),(4,2,3,2500),(5,4,1,1000);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `RAT_ID` int(11) NOT NULL,
  `CUS_ID` int(11) NOT NULL,
  `SUPP_ID` int(11) NOT NULL,
  `RAT_RATSTARS` int(11) NOT NULL,
  PRIMARY KEY (`RAT_ID`),
  KEY `SUPP_ID` (`SUPP_ID`),
  KEY `CUS_ID` (`CUS_ID`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`SUPP_ID`) REFERENCES `supplier` (`SUPP_ID`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`CUS_ID`) REFERENCES `customer` (`CUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,2,2,4),(2,3,4,3),(3,5,1,5),(4,1,3,2),(5,4,5,4);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `SUPP_ID` int(11) NOT NULL,
  `SUPP_NAME` varchar(50) DEFAULT NULL,
  `SUPP_CITY` varchar(50) DEFAULT NULL,
  `SUPP_PHONE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SUPP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'rajesh retails','delhi','1234567890'),(2,'appario ltd.','mumbai','2589631470'),(3,'knome products','banglore','9785462315'),(4,'bansal retails','kochi','8975463285'),(5,'mittal ltd.','lucknow','7898456532');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
-- 3)	Display the number of the customer group by their genders who have placed any order of amount greater than or equal to Rs.3000.

select cus_gender, COUNT(*)
from 
	`order`
    inner join
    customer
    on `order`.cus_id = customer.cus_id
where ord_amount >= 3000
group by customer.cus_gender;

-- 4)	Display all the orders along with the product name ordered by a customer having Customer_Id=2.

select *
from
	`order`
    inner join
    product_details
    on `order`.prod_id = product_details.prod_id
    inner join
    product
    on product_details.pro_id = product.pro_id
where cus_id = 2;


-- 5)	Display the Supplier details who can supply more than one product.
-- 5a) Find out supp_id of suppliers supplying more than 1 product

select supp_id
from product_details
group by supp_id
having count(*) > 1;

-- 5b) Use suppliers obtained from the previous query to get the supplier details

select *
from supplier
where supp_id in (
	select supp_id
	from product_details
	group by supp_id
	having count(*) > 1
);


-- 6)	Find the category of the product whose order amount is minimum.

select *
from
	`order`
    inner join product_details on product_details.prod_id = `order`.prod_id
    inner join product on product_details.pro_id = product.pro_id
    inner join category on product.cat_id = category.cat_id
order by ord_amount limit 1;


-- 7)	Display the Id and Name of the Product ordered after “2021-10-05”.
-- filter by (WHERE) ord_date > "2021-10-05"
-- join with product_details and product to get the product name and id

select ord_id, ord_date, product.pro_id, pro_name, pro_desc
from 
	`order`
	inner join product_details on `order`.prod_id = product_details.prod_id
    inner join product on product_details.pro_id = product.pro_id
where ord_date > "2021-10-05";


-- 8)	Print the top 3 supplier name and id and their rating on the basis of their rating along with the customer name who has given the rating.

select supplier.supp_id, supp_name, cus_name, rating.rat_ratstars
from 
	rating
    inner join supplier on supplier.supp_id = rating.supp_id
    inner join customer on customer.cus_id = rating.cus_id
order by rating.rat_ratstars desc limit 3;


-- 9)	Display customer name and gender whose names start or end with character 'A'.


select cus_name, cus_gender
from customer
where cus_name like 'A%' or cus_name like '%A';


-- 10)	Display the total order amount of the male customers.

select cus_gender, sum(ord_amount)
from `order` inner join customer on `order`.cus_id = customer.cus_id
where cus_gender = 'M';


-- 11)	Display all the Customers left outer join with  the orders.
-- join customer with order and display all fields - use "left outer join" instead of "inner join"
-- left outer join ensures that records in the table on the left ALWAYS appear in the result
-- add a new customer Pallavi - initially she has NO order
insert into customer(cus_id, cus_name, cus_phone, cus_city, cus_gender) values(6, 'Pallavi', 1234567890, 'Bangalore', 'F');


select *
from customer left outer join `order` on `order`.cus_id = customer.cus_id;


-- 12)	 Create a stored procedure to display the Rating for a Supplier if any along with the Verdict on that rating if any like if rating >4 then “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”.
-- Right click on order-directory -> Stored Procedure -> Create Stored Procedure

CREATE DEFINER=`root`@`localhost` PROCEDURE `categorize_supplier`()
BEGIN
	-- Verdict on that rating if any like
	-- 			if rating > 4 then "Genuine Supplier"
	-- 			if rating > 2 "Average Supplier"
	--          else "Supplier should not be considered"
	select supplier.supp_id, supp_name, rat_ratstars, 
    case
		when rat_ratstars > 4 then "Genuine Supplier"
        when rat_ratstars > 2 then "Average Supplier"
        else "Supplier should not be considered"
	end as verdict
    from rating inner join supplier on rating.supp_id = supplier.supp_id;
END

