-- Having vs Where

-- Both were created to filter rows of data, but they filter 2 separate things
-- Where is going to filters rows based off columns of data
-- Having is going to filter rows based off aggregated columns when grouped

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;


-- let's try to filter on the avg age using where
-- having 需要在order by之后，因为这个案例中还有没完成分组
-- 另外，where中不支持聚合函数，如果要使用聚合函数，应该放在having中，且having再group by之后
SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40
GROUP BY gender
;

SELECT gender, AVG(age)
FROM employee_demographics
where age>40
GROUP BY gender;


-- this doesn't work because of order of operations. On the backend Where comes before the group by. So you can't filter on data that hasn't been grouped yet
-- this is why Having was created

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

SELECT gender, AVG(age) as AVG_age
FROM employee_demographics
GROUP BY gender
HAVING AVG_age > 40
;

select occupation, AVG(salary)
from employee_salary
group by occupation
having occupation like 'D%';


-- having对聚合函数进行限制，where对查询条件进行限制
select occupation, AVG(salary)
from employee_salary
where occupation like '%manager%'
group by occupation 
having AVG(salary) > 75000;
































