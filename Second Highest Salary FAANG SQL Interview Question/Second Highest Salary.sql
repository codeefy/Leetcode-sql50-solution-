select distinct salary as second_highest_salary from employee
order by salary DESC
limit 1 offset 1

-- offset is used  to skip the first row and FETCH to pick the next one.
