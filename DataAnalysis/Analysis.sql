/* Analysis 1 actuarial value*/
select state_code ,avg(ISSUER_ACTUARIAL_VALUE) from Plans_NY_MA group by 1;
/* for NY */
select issuer_actuarial_value,substr(issuer_actuarial_value,1,instr(issuer_actuarial_value,'%')-1),
state_code , plan_type , metal_level 
 from t_plans
 where trim(issuer_actuarial_value) != ''
 and substr(issuer_actuarial_value,1,instr(issuer_actuarial_value,'%')-1)  < 70
 and state_code = 'NY'
 group by  issuer_actuarial_value,state_code , plan_type , metal_level 
 order by issuer_actuarial_value;
 
 /* for MA */
 select issuer_actuarial_value,substr(issuer_actuarial_value,1,instr(issuer_actuarial_value,'%')-1),
state_code , plan_type , metal_level 
 from t_plans
 where  trim(issuer_actuarial_value) != '' 
  and substr(issuer_actuarial_value,1,instr(issuer_actuarial_value,'%')-1)  < 70 
 and state_code = 'MA'
 group by  issuer_actuarial_value , state_code,plan_type , metal_level 
 order by issuer_actuarial_value;

/* MOOP analysis */

select  STATE_CODE, Plan_Type, metal_level , min(TEHB_INN_TIER_1_INDIVIDUAL_MOOP) as Minimum_MOOP
    ,avg(TEHB_INN_TIER_1_INDIVIDUAL_MOOP) as Average_MOOP
    ,max(TEHB_INN_TIER_1_INDIVIDUAL_MOOP) as Maximum_MOOP
 from t_plans
 where plan_type in ('HMO' ,'PPO')
 group by   State_Code, metal_level ,plan_type
 order by  plan_type,metal_level;

SELECT  STATE_CODE as State, COUNT(distinct PLAN_MARKETING_NAME) AS NumberOptions
FROM Plans_NY_MA
GROUP BY STATE_CODE;




