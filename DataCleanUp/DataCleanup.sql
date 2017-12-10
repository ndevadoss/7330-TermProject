use mysql;
update Plans_NY_MA set ISSUER_ACTUARIAL_VALUE = '61.99%' where ISSUER_ACTUARIAL_VALUE = '6199%';


update Plans_NY_MA set plan_expiration_date = '2016-12-31' where plan_expiration_date<> '2016-12-31';