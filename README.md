# CabApplication
The application built for requesting a ride by customers, selecting a request by drivers and monitoring cab requests by admin
*************************************************************************
Database: MySql
Server: Apache Tomcat 8.5
Reference Library: MySql Connector

********************* Application flow and features *********************

#Note: Snapshots for all pages are in Snapshots folder

CustomerApp.jsp
1. Customer can input id and location to submit cab request
2. "AddRequest.java" servlet will be called to verify and add request
3. If waiting requests in Youplus.CabRequest database are less than 10 request will be submitted

DriverLogin.jsp
1. Driver can enter Id and password. For authorized users "DriverApp.jsp" page will be displayed
2. This jsp will call "Login.java" servlet to verify user and load "DriverApp.jsp"

DriverApp.jsp
1. Waiting, ongoing and completed requests will be shown for respective drivers
2. Only 3 closest request will be shown to the driver location. 
3. The driver can have only 1 ongoing request at a time
4. For all requests request time, pick up time and completion time will be shown
4. If driver already does not have any ongoing request he can select any request from Waiting requests
5. After 5 minutes from pick up time request status changes from ongoing to complete

Dashboard.jsp
1. All requests are shown on this page
2. Request ID, Customer ID, Driver ID, Status and Time elapsed since the request are displayed

RequestUpdater.java
1. It contains methods to retrieve and update data on the Youplus database

Request.java
1. This class has all request field as in database
2. It also has getters and setters to retrieve and update request attributes

********************* Queries  for creating tables in Youplus database: *********************
1. Drivers:
	   CREATE TABLE `Drivers` (
	  `id` int(11) NOT NULL,
	  `name` varchar(20) DEFAULT NULL,
	  `location_x` int(11) DEFAULT NULL,
	  `location_y` int(11) DEFAULT NULL,
	  `password` varchar(20) NOT NULL,
	  PRIMARY KEY (`id`)
  	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
2. CabRequest:
	  CREATE TABLE `CabRequests` (
	  `Id` int(11) NOT NULL AUTO_INCREMENT,
	  `Cid` int(11) NOT NULL,
	  `Did` int(11) DEFAULT NULL,
	  `Lx` int(11) NOT NULL,
	  `Ly` int(11) NOT NULL,
	  `Request_Time` timestamp DEFAULT CURRENT_TIMESTAMP,
	  `Start_Time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	  `State` varchar(20) DEFAULT 'Waiting',
	  PRIMARY KEY (`Id`)
	  ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

*************************************************************************
