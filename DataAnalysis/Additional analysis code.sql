USE Insurance ; 
SELECT  STATE_CODE as State
, COUNT(distinct PLAN_MARKETING_NAME) AS NumberOptions
 FROM Insurance.Plans_NY_MA
 GROUP BY STATE_CODE;

 select distinct DISEASE_MANAGEMENT_PROGRAMS_OFFERED
 FROM Insurance.Plans_NY_MA ;
 
 
 SELECT STATE_CODE AS State
	, avg(SBC_HAVING_A_BABY_DEDUCTIBLE) as Avg_Baby_d
FROM Insurance.Plans_NY_MA
where SBC_HAVING_A_BABY_DEDUCTIBLE not in ('0')
 group by state_code; 
 
  SELECT STATE_CODE AS State
	, count(SBC_HAVING_A_BABY_DEDUCTIBLE) as count_Baby_d
FROM Insurance.Plans_NY_MA
where SBC_HAVING_A_BABY_DEDUCTIBLE in ('0')
 group by state_code; 
 

 SELECT STATE_CODE AS State
	, count(SBC_HAVING_A_BABY_DEDUCTIBLE) as count_Baby_d
FROM Insurance.Plans_NY_MA
where SBC_HAVING_A_BABY_DEDUCTIBLE in ('0')
 group by state_code;
SELECT STATE_CODE AS State
	, max(SBC_HAVING_A_BABY_DEDUCTIBLE) as Baby_max
    , min(SBC_HAVING_A_BABY_DEDUCTIBLE) as Baby_min
    , METAL_LEVEL 
FROM Insurance.Plans_NY_MA
group by METAL_LEVEL, state_code

select a.state_code as State
, count( a.issuer_actuarial_value) as Count_AV
from (
	select state_code, 
	issuer_actuarial_value
	from Insurance.Plans_NY_MA
	where issuer_actuarial_value > .7
) a
group by state_code;