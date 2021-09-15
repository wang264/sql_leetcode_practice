-- 197. Rising Temperature
-- Easy

-- Table: Weather

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
-- id is the primary key for this table.
-- This table contains information about the temperature in a certain day.
--  

-- Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).

-- Return the result table in any order.

-- The query result format is in the following example:

-- Weather
-- +----+------------+-------------+
-- | id | recordDate | Temperature |
-- +----+------------+-------------+
-- | 1  | 2015-01-01 | 10          |
-- | 2  | 2015-01-02 | 25          |
-- | 3  | 2015-01-03 | 20          |
-- | 4  | 2015-01-04 | 30          |
-- +----+------------+-------------+

-- Result table:
-- +----+
-- | id |
-- +----+
-- | 2  |
-- | 4  |
-- +----+
-- In 2015-01-02, temperature was higher than the previous day (10 -> 25).
-- In 2015-01-04, temperature was higher than the previous day (20 -> 30).



-- Create table If Not Exists Weather (Id int, RecordDate date, Temperature int);
-- Truncate table Weather;
-- insert into Weather (Id, RecordDate, Temperature) values ('1', '2015-01-01', '10');
-- insert into Weather (Id, RecordDate, Temperature) values ('2', '2015-01-02', '25');
-- insert into Weather (Id, RecordDate, Temperature) values ('3', '2015-01-03', '20');
-- insert into Weather (Id, RecordDate, Temperature) values ('4', '2015-01-04', '30');


-- this answer is wrong, because we can not use lag, the date has gap. The previous date
-- of 2020-12-16 is 2020-12-15, if the 2020-12-15 not in the DB then we will fail. 
With t As(
	SELECT *,
	LAG(Temperature, 1) OVER (ORDER BY recordDate) prevTemperature,
	LAG(recordDate, 1) OVER (ORDER BY recordDate) prevRecordDate
	FROM Weather)
Select t.Id
From t
Where Temperature > prevTemperature;


Select curr.Id
From Weather curr, Weather pre_v
Where DATE_SUB(curr.recorddate,INTERVAL 1 DAY)=pre_v.recorddate
And curr.Temperature > pre_v.Temperature;