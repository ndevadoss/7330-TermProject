# 7330-TermProject
Health Plan Analysis

## Introduction:
This project is to analyze the plan data for the state of MA and NY . The source data is from CMS .Please find the link in Source Data Section.

Folder structure is as follows:
1. DataFiles
2. DataDictionary
3. DataMerge
4. DataCleanUp
5. DataAnalysis
6. Graphs

### DataFiles:
Data Files has the raw data files and the merged data files of both NY and MA. We used the merged datafile to import to MySQL.

### DataDictinary:
This folder has the datadictionary and the link is also posted in the read me file.

### DataMerge:
This folder has sqls for table creation. Plans_NY_MA is the stage table where we load the raw file . After data cleanup , we load the clean data to t_plans table.

### DataCleanUp:
This folder has the data clean up sqls . After initial stage table creation , execute the clean up scripts. After cleaning the data , create the final table t_plans.

### DataAnalysis:
This folder has the sqls for the analysis done on the data.


## Tools and Hardware :
 Analysis is done in IBM Bluemix - MySQL . The hardware specification is as follows with the free account : 102MB RAM and 1GB Storage. 
 
## Source Data:
The Centers for Medicare & Medicaid Services (CMS)
https://www.cms.gov/CCIIO/Resources/Data-Resources/sbm-puf.html . The data file name is PUFPLAN_NY_MA.csv
The file size is approx 4MB

## Data Dictionary:
Data dictionary is provided in the link below. 

https://www.cms.gov/CCIIO/Resources/Data-Resources/Downloads/Plan-Attributes-Data-Dictionary.pdf 

## Data insert Execution order:
1. First execute 7330-TermProject\DataMerge\Plans_NY_MA.sql
2. Second execute 7330-TermProject\DataCleanUp\DataCleanup.sql
3. Next execute 7330-TermProject\DataMerge\t_plan.sql

## Analysis:
1. Actuarial Value between MA and NY.
2. In network and Out of network for HMO and PPO plans , Individual Vs Family for Tier1 Total essential Health Benefits Member Out of Pocket comparison.
3. The sqls are available in 7330-TermProject\DataAnalysis\Analysis.sql

## Conclusion:
Based on our analysis we see that in 2016 there were 4 plans which has a actuarian value less than 70% for the state of MA and 17 for the state of NY
Similarly from our second analysis we see that there is no PPO option with silver and there is no HMO with low metal option.
The average min member out of pocket of the HMO plan in MA is a bit lower compared to the state of NY. Our third analysis of average having a baby deductible is lower for MA Vs NY. From all these analysis we observe that health plans in MA is better to that of NY.


