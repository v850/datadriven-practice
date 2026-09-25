select distinct user_id from (
select *, lag(transaction_date,1) over(partition by user_id order by transaction_date desc ) as rnk 
from transactions )a where 
date_diff(a.rnk, transaction_date)<=7
