
/*Counts of Plan Options by State */
SELECT  STATE_CODE as State, COUNT(distinct PLAN_MARKETING_NAME) AS NumberOptions
FROM Plans_NY_MA
GROUP BY STATE_CODE;


/*Average Deductible for Delivery between both states */
SELECT STATE_CODE AS State
	,avg(SBC_HAVING_A_BABY_DEDUCTIBLE) as Avg_Baby_d
FROM Insurance.Plans_NY_MA
where SBC_HAVING_A_BABY_DEDUCTIBLE not in ('0')
group by state_code; 


/*Actuarial Value for NY */
select issuer_actuarial_value,substr(issuer_actuarial_value,1,instr(issuer_actuarial_value,'%')-1),
state_code , plan_type , metal_level 
 from t_plans
 where trim(issuer_actuarial_value) != ''
 and substr(issuer_actuarial_value,1,instr(issuer_actuarial_value,'%')-1)  < 70
 and state_code = 'NY'
 group by  issuer_actuarial_value,state_code , plan_type , metal_level ;

/*Actuarial Value for MA */
 select issuer_actuarial_value,substr(issuer_actuarial_value,1,instr(issuer_actuarial_value,'%')-1),
plan_id , plan_type , metal_level 
 from t_plans
 where trim(issuer_actuarial_value) != ''
 and substr(issuer_actuarial_value,1,instr(issuer_actuarial_value,'%')-1)  < 70
 and state_code = 'MA'
 group by  issuer_actuarial_value , plan_id,plan_type , metal_level ;

/*See Min and Max Total Out Of Pocket for HMO and PPO plans in NY */
select  plan_type,metal_level , min(TEHB_INN_TIER_1_INDIVIDUAL_MOOP),max(TEHB_INN_TIER_1_INDIVIDUAL_MOOP)
 from t_plans
 where state_code = 'NY' and plan_type in ('HMO' ,'PPO')
 group by   metal_level ,plan_type
 order by plan_type,metal_level,min(TEHB_INN_TIER_1_INDIVIDUAL_MOOP),max(TEHB_INN_TIER_1_INDIVIDUAL_MOOP);

/*See Min and Max Total Out Of Pocket for HMO and PPO plans in MA */
select  plan_type,metal_level , min(TEHB_INN_TIER_1_INDIVIDUAL_MOOP),max(TEHB_INN_TIER_1_INDIVIDUAL_MOOP)
 from t_plans
 where state_code = 'MA' and plan_type in ('HMO' ,'PPO')
 group by   metal_level ,plan_type
 order by plan_type,metal_level,min(TEHB_INN_TIER_1_INDIVIDUAL_MOOP),max(TEHB_INN_TIER_1_INDIVIDUAL_MOOP);


/*Summary Table of Min, Avg and Max Total Out Of Pocket for HMO and PPO plans in Both States */
select  STATE_CODE, Plan_Type, metal_level , min(TEHB_INN_TIER_1_INDIVIDUAL_MOOP) as Minimum_MOOP
	,avg(TEHB_INN_TIER_1_INDIVIDUAL_MOOP) as Average_MOOP
	,max(TEHB_INN_TIER_1_INDIVIDUAL_MOOP) as Maximum_MOOP
 from t_plans
 where plan_type in ('HMO' ,'PPO')
 group by   State_Code, metal_level ,plan_type
 order by  plan_type,metal_level;