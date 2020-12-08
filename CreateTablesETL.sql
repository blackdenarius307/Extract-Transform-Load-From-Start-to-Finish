 /*create table sql uesd to set up initila tables for the raw data*/
create table accident_df (
ID varchar(10) Primary Key,
Start_Time date,
City varchar (55),
County varchar(55),
State varchar(2),
Zipcode varchar(10)

);


create table covid_df (
date  date,
County varchar(55),
State varchar(30),
cases int,
deaths int )

create table covid_by_day
(Date date,
 Value int,
 seven_day_average int,
 parts_per_million int
)

 
 
create table coviddays(

date date,
county varchar (60),
state2 varchar(2),
deaths int,
newdeaths int)

