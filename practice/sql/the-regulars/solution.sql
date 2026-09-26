WITH cte AS(
select distinct user_id ,
 extract(year FROM session_start) * 100 + extract(month FROM session_start) AS year_mon
  FROM user_sessions )


 
  select distinct user_id from (
 select *, row_number() over(partition by user_id order by year_mon desc) as rnk from cte
)a where rnk>=3 order by user_id;
