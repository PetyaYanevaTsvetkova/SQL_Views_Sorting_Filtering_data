## Project's Title:
	SQL: Views, Sorting and Filtering data

## Project Description:

	*Theory:
	Views;
	Sorting data with ORDER BY clause (sort the data by one or more columns in the ascending and/or descending order);
	Filtering Data
	SELECT DISTINCT
	LIMIT
	WHERE clause
	Comparision and logical operators
	AND, OR, NOT and IS NULL operators
	BETWEEN, IN, LIKE
	Wildcards

	*Practical tasks:
	Create table customers_addresses with primary key (auto increment) and:
	Address
	City - mandatory field
	Province
	State - for US addresses
	Postal code - a positive number, mandatory field
	Country - mandatory field
	Customers SQL Scripts 
	Create a view from customers_addresses: 
	Create a view bulgarian_customers_addresses which contains only addreses in Bulgaria;
	Filtering customers_addresses data:
	get a list of countries ordered alphabetically
	get a list of cities that start with a specific letter (for example cities that start with letter S will return Sofia, Sozopol etc)
	get 3 different random cities located in Bulgaria
	et a list of all addresses in Bulgaria outside of Sofia, Plovdiv, Varna
	get last 10 added customer addresses with a province and address filled, but without a state value
	get addresses that have 4-digit postal code that start with 3 and end with 7. Order the result alpabetically by country and city
	
	*Acceptance criteria:
	As a QA Automation trainee, I want to gain knowledge of how to:
	order and filter data
	use wildecards
	limit query output
	create and query views

## Table of Contents:
	Task.txt - description of the task;
	Theory.sql - theoretical examples;
	PracticalTask.sql - practical task;
	README.md file

## How to Install and Run the Project:
  Docker needed;
  PosgreSQL client needed
 
## How to Use the Project:
	You need to execute the scripts in PostgreSQL client environment

## Useful links:
https://www.tutorialspoint.com/postgresql/index.htm

## Add a License
	no needed


