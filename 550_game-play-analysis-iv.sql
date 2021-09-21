-- 550. Game Play Analysis IV
-- Medium

-- Table: Activity

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key of this table.
-- This table shows the activity of players of some game.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
--  

-- Write an SQL query that reports the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

-- The query result format is in the following example:

--  

-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-03-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+

-- Result table:
-- +-----------+
-- | fraction  |
-- +-----------+
-- | 0.33      |
-- +-----------+
-- Only the player with id 1 logged back in after the first day he had logged in so the answer is 1/3 = 0.33



-- Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int);
-- Truncate table Activity;
-- insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
-- insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6');
-- insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
-- insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
-- insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');

-- calculate the first login date. 
WITH cte AS
 (
	SELECT player_id, MIN(event_date) as first_login
	FROM Activity
	GROUP BY player_id
)

SELECT ROUND(SUM(CASE WHEN DATEDIFF(event_date, first_login)=1 THEN 1 ELSE 0  END) / COUNT(DISTINCT cte.player_id), 2) as fraction
FROM Activity as a
JOIN cte 
ON a.player_id = cte.player_id;




-- Solution 2 

-- join the cte with original activity table, to select the column when player have log-in activity after the first log-in date. 
WITH numerator AS
(
	-- cte select the first log-in date for each player. 
	WITH cte AS 
    (
		SELECT
			player_id,
			MIN(event_date) AS first_login
		FROM
			Activity
		GROUP BY
			player_id
	)

	SELECT a.player_id
	FROM Activity As a , cte
	where a.player_id = cte.player_id
	and DATEDIFF(a.event_date, cte.first_login)=1

)
-- calculate the fraction. 
SELECT ROUND(COUNT(DISTINCT(numerator.player_id)) / COUNT(DISTINCT(t.player_id)),2) as fraction
From numerator, Activity t;






