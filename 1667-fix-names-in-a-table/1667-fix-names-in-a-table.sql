# Write your MySQL query statement below
select user_id,concat(upper(substring(name,1,1)),lower(substring(name,2))) as name from users
order by user_id

-- substring(name,1,1) it will extract the first character of of name with lenght 1 
-- then upper(substring(name,1,1,)) it will convert the first letter to upper case 
-- then substring(name,2) it will extract the rest of the string except the first character then we will conver them using lower 
-- then we will concat them using concat 