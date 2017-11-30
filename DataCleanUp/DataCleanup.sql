use mysql;
update Plans_NY_MA set ISSUER_ACTUARIAL_VALUE = '61.99%' where ISSUER_ACTUARIAL_VALUE = '6199%';
/* Finding the grain of the data set */
select plan_id,count(*) from Plans_NY_MA group by 1 having count(*) > 1;
select * from Plans_NY_MA where plan_id in (
'73331MA0640001-00'
,'73331MA0640001-01'
,'88806MA0030003-01'
,'88806MA0030003-02'
,'88806MA0030003-03'
,'88806MA0030006-01'
,'88806MA0030006-02'
,'88806MA0030006-03'
,'88806MA0030006-04'
,'88806MA0030006-05'
,'88806MA0030006-06') order by plan_id;
select plan_id,BENEFIT_PACKAGE_ID,count(*) from Plans_NY_MA group by 1,2 having count(*) > 1;
select * from Plans_NY_MA where plan_id in (
'88806MA0030003-01'
,'88806MA0030003-02'
,'88806MA0030003-03'
,'88806MA0030006-01'
,'88806MA0030006-02'
,'88806MA0030006-03'
,'88806MA0030006-04'
,'88806MA0030006-05'
,'88806MA0030006-06') order by plan_id;
/* De-duping */
