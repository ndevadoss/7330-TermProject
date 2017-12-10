use mysql;
update Plans_NY_MA set ISSUER_ACTUARIAL_VALUE = '61.99%' where ISSUER_ACTUARIAL_VALUE = '6199%';


update Plans_NY_MA set plan_expiration_date = '2016-12-31' where plan_expiration_date<> '2016-12-31';

select plan_id,count(*) from t_plans group by plan_id having count(*) > 1;

delete from t_plans where plan_id in (
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
,'88806MA0030006-06') ;