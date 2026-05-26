-- Window Functions

-- windows functions are really powerful and are somewhat like a group by - except they don't roll everything up into 1 row when grouping. 
-- windows functions allow us to look at a partition or a group, but they each keep their own unique rows in the output
-- we will also look at things like Row Numbers, rank, and dense rank

SELECT * 
FROM employee_demographics;

-- first let's look at group by
SELECT gender, ROUND(AVG(salary),1)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

-- now let's try doing something similar with a window function
-- 此处over会有参数，默认为查看所有参数的内容（如这里查看所有数据的平均值）
SELECT dem.employee_id, dem.first_name, gender, salary,
AVG(salary) OVER()
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- now we can add any columns and it works. We could get this exact same output with a subquery in the select statement, 
-- but window functions have a lot more functionality, let's take a look


-- if we use partition it's kind of like the group by except it doesn't roll up - it just partitions or breaks based on a column when doing the calculation
-- partition by表示根据指定字段分组，如此处的geneder，省去了group by的内容(等效于group by）
-- 效果类似于group by，但是over函数允许展示那些既没有使用聚合函数的参数，也没有被用作分组的参数
SELECT dem.employee_id, dem.first_name, gender, salary,
AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;
-- 使用了group by的sql语句在select中仅支持聚合函数项和分类项目
SELECT gender, AVG(salary) 
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
group by gender
;



-- 查看收入总和
SELECT dem.employee_id, dem.first_name, gender, salary,
sum(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
; 


-- now if we wanted to see what the salaries were for genders we could do that by using sum, but also we could use order by to get a rolling total
-- 相比较于直接by gender和前面的sum(xxx)，这里还增加了一个累加和的过程 
SELECT dem.employee_id, dem.first_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY employee_id)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


-- Let's look at row_number rank and dense rank now
-- row number表示累计计数，结合over使用 

SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- let's  try ordering by salary so we can see the order of highest paid employees by gender
-- 同样在over内，把order by放到  over内（group by）
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary desc)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- let's compare this to rank
-- rownumber 给每行标号
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary desc) row_num,
Rank() OVER(PARTITION BY gender ORDER BY salary desc) rank_1 
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- notice rank repeats on tom ad jerry at 5, but then skips 6 to go to 7 -- this goes based off positional rank


-- let's compare this to dense rank
-- rank更加正式，如果出现相同值，则并列 
-- denserank要求排名更加密集，如rank的并列5完了之后是7，而denserank为6 
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary desc) row_num,
Rank() OVER(PARTITION BY gender ORDER BY salary desc) rank_1,
dense_rank() OVER(PARTITION BY gender ORDER BY salary desc) dense_rank_2 -- this is numerically ordered instead of positional like rank
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

















