#WHERE Clause:
#-------------
#The WHERE clause is used to filter records (rows of data)

#It's going to extract only those records that fulfill a specified condition.

# So basically if we say "Where name is = 'Alex' - only rows were the name = 'Alex' will return
# So this is only effecting the rows, not the columns

-- 名字匹配
select * 
from employee_salary
where first_name="Leslie";


#Let's take a look at how this looks
-- 漏掉了正好5W的 
SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT *
FROM employee_salary
WHERE salary >= 50000;
-- <=5W 

SELECT *
FROM employee_demographics
WHERE gender = 'Female';


#We can also return rows that do have not "Scranton"
SELECT *
FROM employee_demographics
WHERE gender != 'Female';


#We can use WHERE clause with date value also
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';


-- and条件语句，要求同时满足
 
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01' 
and gender="male";

-- or条件语句，满足其一即可
 
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01' 
or gender="male";

-- 括号，要求指定条件的内容作为一个整体，满足其一即可
 
SELECT *
FROM employee_demographics
WHERE (first_name="Leslie" and age=44)
or age >55;

-- Here '1990-01-01' is the default data formate in MySQL.
-- There are other date formats as well that we will talk about in a later lesson.


# LIKE STATEMENT（不区分大小写）

-- two special characters a % and a _

-- % means anything，要求为a开头的任意长度字符（%和_可以出现在任意位置)
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';

-- _ means a specific value，要求为a开头，长度为3的单词
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__';


-- 要求为a开头，长度至少为4的单词 
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';













