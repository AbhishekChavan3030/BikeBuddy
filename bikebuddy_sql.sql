show databases; 
create database bikebuddy;
use bikebuddy;

create table mechanic (
FirstName varchar(25) NOT NULL,
LastName varchar(25) NOT NULL,
ContactNumber varchar(10) NOT NULL,
Email varchar(40) UNIQUE,
Address varchar(100) NOT NULL,
UserName varchar(20) PRIMARY KEY,
Password varchar(20) UNIQUE NOT NULL);

create table Parts (
username varchar(20) references mechanic(username),
partid varchar(20),
partname varchar(20),
partmodel varchar(30),
partquantity int(5)
);

create table customer (
FirstName varchar(25) NOT NULL,
LastName varchar(25) NOT NULL,
ContactNumber varchar(10) NOT NULL,
Email varchar(40) UNIQUE,
Address varchar(100) NOT NULL,
UserName varchar(20) PRIMARY KEY,
Password varchar(20) UNIQUE NOT NULL);

create table bike(model varchar(30),
series varchar(30),
brand varchar(30),
engine varchar(4),
year varchar(10),
chassis varchar(4),
reg varchar(15),
username varchar(20) references customer(UserName)
);

CREATE TABLE Specializations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    repairTypeEngine VARCHAR(50) DEFAULT 'N/A',
    repairTypeElectrical VARCHAR(50) DEFAULT 'N/A',
    repairTypeBrake VARCHAR(50) DEFAULT 'N/A',
    repairTypeSuspension VARCHAR(50) DEFAULT 'N/A',
    repairTypeTyre VARCHAR(50) DEFAULT 'N/A',
    repairTypeFrame VARCHAR(50) DEFAULT 'N/A',
    bikeTypeyamaha_r15 VARCHAR(50) DEFAULT 'N/A',
    bikeTypeyamaha_mt15 VARCHAR(50) DEFAULT 'N/A',
    bikeTypehonda_cb_hornet VARCHAR(50) DEFAULT 'N/A',
    bikeTypehonda_cbr_250r VARCHAR(50) DEFAULT 'N/A',
    bikeTypebajaj_pulsar_220 VARCHAR(50) DEFAULT 'N/A',
    bikeTypebajaj_dominar_400 VARCHAR(50) DEFAULT 'N/A',
    bikeTypere_classic_350 VARCHAR(50) DEFAULT 'N/A',
    bikeTypere_himalayan VARCHAR(50) DEFAULT 'N/A',
    bikeTypektm_duke_200 VARCHAR(50) DEFAULT 'N/A',
    bikeTypektm_rc_390 VARCHAR(50) DEFAULT 'N/A',
    bikeTypetvs_apache_rtr_160 VARCHAR(50) DEFAULT 'N/A',
    bikeTypetvs_apache_rr_310 VARCHAR(50) DEFAULT 'N/A',
    bikeTypesuzuki_gixxer_sf VARCHAR(50) DEFAULT 'N/A',
    bikeTypesuzuki_intruder VARCHAR(50) DEFAULT 'N/A',
    otherBikeType VARCHAR(50) DEFAULT 'N/A',
    username VARCHAR(100) NOT NULL references mechanic(UserName)
);

create table booking(
customer varchar(20) references customer(UserName),
cfname varchar(20),
clname varchar(20),
mechanic varchar(20) references mechanic(UserName),
mfname varchar(20),
mlname varchar(20),
cmobile varchar(20),
cemail varchar(30),
mmobile varchar(20),
memail varchar(30),
booktype varchar(50),
bike varchar(50),
bookingdate date
);
use bikebuddy;
select * from customer;
select * from mechanic;
select * from bike;
select * from booking;
select * from parts;
select * from specializations;

create table partsorders(
username varchar(20) references mechanic(username),
partid varchar(20),
partname varchar(20),
partmodel varchar(30),
customer varchar(20) references customer(UserName)
);

