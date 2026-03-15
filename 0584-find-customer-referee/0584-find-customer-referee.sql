# Write your MySQL query statement below
select name from customer where referee_id!=2 or referee_id is null
-- Referred by someone other than customer 2Not referred by anyone Since either condition is acceptable, we combine them with OR.