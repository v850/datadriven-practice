WITH cte AS(SELECT DISTINCT endpoint FROM api_calls UNION SELECT DISTINCT b.endpoint FROM rate_limits b)


,cte3 as (
SELECT 
   CASE WHEN SUBSTR(endpoint,  1,  12) = '/api/v1/auth' THEN '/api/v1/auth' 
WHEN SUBSTR(endpoint,1,12) = '/api/v2/auth' THEN '/api/v2/auth' else endpoint end as endpoint,
 Case when
SUBSTR(endpoint, 1,  12) = '/api/v1/auth' THEN '/api/v1/auth' 
WHEN SUBSTR(endpoint,1,12) = '/api/v2/auth' THEN '/api/v2/auth'
WHEN SUBSTR(endpoint,1,8) = '/api/v1/' THEN concat('v1',replace(endpoint,'/api/v1/',''))
 WHEN SUBSTR(endpoint,1,8) = '/api/v2/' THEN concat('v2',replace(endpoint,'/api/v2/','')) 
 end AS api1
FROM cte )
-- ORDER BY api1 ASC ;

select distinct case when substr(endpoint,len(endpoint))='/' then substr(endpoint,1,len(endpoint)-1)
else endpoint end as endpoint  from cte3 order by api1 asc;
