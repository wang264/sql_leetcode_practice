-- 578. Get Highest Answer Rate Question
-- Medium
-- SQL Schema
-- Get the highest answer rate question from a table survey_log with these columns: id, action, question_id, answer_id, q_num, timestamp.
-- id means user id; action has these kind of values: "show", "answer", "skip"; answer_id is not null when action column is "answer", while is 
-- null for "show" and "skip"; q_num is the numeral order of the question in current session.
-- Write a sql query to identify the question which has the highest answer rate.

-- Example:

-- Input:
-- +------+-----------+--------------+------------+-----------+------------+
-- | id   | action    | question_id  | answer_id  | q_num     | timestamp  |
-- +------+-----------+--------------+------------+-----------+------------+
-- | 5    | show      | 285            | null              | 1         | 123        |
-- | 5    | answer    | 285          | 124124         | 1         | 124        |
-- | 5    | show      | 369            | null               | 2         | 125        |
-- | 5    | skip        | 369            | null               | 2         | 126        |
-- +------+-----------+--------------+------------+-----------+------------+
-- Output:
-- +-------------+
-- | survey_log  |
-- +-------------+
-- |    285      |
-- +-------------+
-- Explanation:
-- question 285 has answer rate 1/1, while question 369 has 0/1 answer rate, so output 285.
--  

-- Note: The highest answer rate meaning is: answer number's ratio in show number in the same question.


-- Create table If Not Exists survey_log (id int, action varchar(255), question_id int, answer_id int, q_num int, timestamp int);
-- Truncate table survey_log;
-- insert into survey_log (id, action, question_id, answer_id, q_num, timestamp) values ('5', 'show', '285', null, '1', '123');
-- insert into survey_log (id, action, question_id, answer_id, q_num, timestamp) values ('5', 'answer', '285', '124124', '1', '124');
-- insert into survey_log (id, action, question_id, answer_id, q_num, timestamp) values ('5', 'show', '369', null, '2', '125');
-- insert into survey_log (id, action, question_id, answer_id, q_num, timestamp) values ('5', 'skip', '369', null, '2', '126');

select * from survey_log;

with t as 
(
	select s.question_id, 
				sum(case when s.action = 'answer' Then 1 else 0 End)/ sum(case when s.action = 'show' Then 1 else 0 End) as answer_rate
	from survey_log s
	group by s.question_id
	order by answer_rate desc
)
select t.question_id as survey_log
from t
limit 1;