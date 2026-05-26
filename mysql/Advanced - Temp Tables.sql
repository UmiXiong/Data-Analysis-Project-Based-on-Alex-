-- Using Temporary Tables
-- Temporary tables are tables that are only visible to the session that created them. 
-- They can be used to store intermediate results for complex queries or to manipulate data before inserting it into a permanent table.

-- There's 2 ways to create temp tables:
-- 1. This is the less commonly used way - which is to build it exactly like a real table and insert data into it

-- 临时表仅在会话框中存在，一旦退出，就不再存在（如果没有temporary，那么表会在右侧存在）
-- 使用了temporaray之后，表格不会在tables中显示
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

-- if we execute this it gets created and we can actualyl query it.

SELECT *
FROM temp_table;
-- notice that if we refresh out tables it isn't there. It isn't an actual table. It's just a table in memory.

-- now obviously it's balnk so we would need to insert data into it like this:
-- 但是我们依然可以往里面加入数据
INSERT INTO temp_table
VALUES ('Alex','Freberg','Lord of the Rings: The Twin Towers');

-- now when we run it and execute it again we have our data
SELECT *
FROM temp_table;

-- the second way is much faster and my preferred method
-- 2. Build it by inserting data into it - easier and faster
-- 与select语句结合，我们可以让查询结果变成一个表，而不是只能使用一次
CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary > 50000;

-- if we run this query we get our output
SELECT *
FROM temp_table_2;

-- this is the primary way I've used temp tables especially if I'm just querying data and have some complex data I want to put into boxes or these temp tables to use later
-- it helps me kind of categorize and separate it out

-- In the next lesson we will look at the Temp Tables vs CTEs

-- 如果我不退出sql，那么这个表格我在任意的查询中都能查到，一旦我退出再进入，就查不到了
SELECT *
FROM salary_over_50k;



































































