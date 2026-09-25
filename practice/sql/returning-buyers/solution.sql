with cte as (
select * from transactions )

select distinct user_id from (
-- select *, row_number() over(order by transaction_date desc) as rn from (
select *, lag(transaction_date,1) over(partition by user_id order by transaction_date desc ) as rnk from cte
)a where 
date_diff(a.rnk, transaction_date)<=7
 -- )b where
-- rn<=7 order by user_id;
