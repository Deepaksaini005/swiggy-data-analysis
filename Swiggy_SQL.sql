create database swiggy_analysis;
use swiggy_analysis;

CREATE TABLE Swiggy (
    id INT PRIMARY KEY,
    area VARCHAR(100),
    city VARCHAR(100),
    restaurant VARCHAR(255),
    price INT,
    avg_ratings DECIMAL(2,1),
    total_ratings INT,
    food_type VARCHAR(255),
    address VARCHAR(255),
    delivery_time INT
);

select *  from Swiggy;

-- Area in swiggy--
select distinct Area from Swiggy ; 
select count(distinct Area) from Swiggy;

-- Unique  Cities 
select distinct City from Swiggy ;
select count(distinct City) from Swiggy ;

-- Restaurants 
select count(Restaurant) from Swiggy;

-- Unique Useres on the data
select count(distinct ID) from Swiggy;



--  Total Price 
select sum(Price) from Swiggy;

-- Highest Price and Lowest Price By order
Select min(price) from Swiggy;
select max(price) from Swiggy;

-- Average of the  total Price 
select Avg(Price) as AVG_PRICE from Swiggy;

select *  from Swiggy;


-- Avvg of the total Ratings 
SELECT AVG(`Total ratings`) AS Avg_Total_Ratings FROM Swiggy;

SELECT AVG(`Avg ratings`) FROM Swiggy;


-- Food Type 
select count(distinct `Food type`) from swiggy;

--  Highest sale food 
SELECT `Food type`, SUM(Price) AS Total_Sales FROM Swiggy GROUP BY `Food type`
ORDER BY Total_Sales DESC LIMIT 10;

--  Lowest sales food 
SELECT `Food type`, SUM(Price) AS Total_Sales FROM Swiggy GROUP BY `Food type`
ORDER BY Total_Sales asc LIMIT 5;


-- Total Delivery Time 
select sum(`Delivery time`) as total_Delivery_time from swiggy;
select avg(`Delivery time`) from swiggy;

-- fastest delivery time 
select  min(`Delivery time`)  as Fastest_Delivery from swiggy;

-- late delivery  
select  max(`Delivery time`)  as Late_Delivery from swiggy;

-- TOP  Fast deliveries 
SELECT Restaurant, `Delivery time` FROM Swiggy  WHERE `Delivery time` <= 30
ORDER BY `Delivery time` ASC;


-- Top Rated Restaurants
select Restaurant, `Avg ratings`  from swiggy order by `Avg ratings` desc limit 10;

-- City With Highest Orders
select city , count(*) as total_orders from swiggy group by city order by total_orders desc ;

-- Most Expensive Restaurants
select  Restaurant from swiggy  order by price desc limit 10;

-- Cheapest Restaurants
SELECT Restaurant, Price  FROM Swiggy ORDER BY Price ASC
LIMIT 10;


-- Restaurants With Fast Delivery + High Ratings
SELECT Restaurant, `Delivery time` FROM Swiggy  WHERE `Delivery time` <= 30
AND `Avg ratings` >= 4.0
ORDER BY `Avg ratings` DESC;

-- Best Food Category By Ratings
SELECT `Food type`, AVG(`Avg ratings`) AS Avg_Rating FROM Swiggy  group by `Food type`  order by Avg_Rating DESC;

-- Distribution price
SELECT Restaurant, Price,
CASE
           WHEN Price < 200 THEN 'Cheap'
           WHEN Price BETWEEN 200 AND 500 THEN 'Moderate'
           ELSE 'Expensive'
END AS Price_Category FROM Swiggy;

-- Create a View
CREATE VIEW Fast_Delivery AS
SELECT Restaurant, City, `Delivery time`
FROM Swiggy
WHERE `Delivery time` <= 30;

SELECT Restaurant,
       City,
       Price,
       RANK() OVER(ORDER BY Price DESC) AS Price_Rank
FROM Swiggy;



-- Final Analysis from this SQL Quaries 

-- 1. Bengaluru has the highest number of restaurants
-- 2. Pizza and North Indian food are most common
-- 3. Average delivery time is 35 minutes
-- 4. Premium restaurants have higher ratings
-- 5. Fast delivery restaurants get better customer reviews