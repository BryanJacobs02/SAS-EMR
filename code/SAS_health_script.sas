/*---------------------------------------------------------
Project: SAS-based Analysis of Hospital Length of Stay Across Insurance Groups
Dataset: MIMIC-IV Admissions
Author: Bryan Jacobs
Date: 11-03-2025
Purpose:
Analyze whether hospital length of stay differs by insurance type
using EHR-style data (MIMIC-IV) in SAS.
----------------------------------------------------------*/


* SETUP;
libname mydata '/home/u64383960';

proc import datafile = '/home/u64383960/admissions.csv'
	out = mydata.admissions
	dbms = csv
	replace;
	guessingrows = max;
run;


* DATA CLEANING AND FEATURE CREATION;
data mydata.admissions_clean;
    set mydata.admissions;

    /* Calculate length of stay in days directly */
    length_of_stay = (dischtime - admittime) / 86400; /* 86400 seconds in a day */

    /* Keep only meaningful rows */
    if length_of_stay > 0;

    keep subject_id hadm_id admittime dischtime insurance admission_type marital_status race length_of_stay hospital_expire_flag;
run;


* DESCRIPTIVE STATISTICS;
title "Frequency Tables for Key Variables";
proc freq data = mydata.admissions_clean;
	tables insurance admission_type marital_status race;
run;

title "Mean Length of Stay by Insurance Type";
proc means data = mydata.admissions_clean mean std min max;
	var length_of_stay;
	class insurance;
run;


* VISUALIZATION;
title "Length of Stay by Insurance Type";
proc sgplot data = mydata.admissions_clean;
	vbox length_of_stay / category = insurance;
	yaxis min=0 max=30 label="Length of Stay (days)";
run;


* REGRESSION MODEL;
title "Adjusted Model: Length of Stay by Insurance Type";
proc glm data = mydata.admissions_clean;
	class insurance(ref = 'Private') admission_type marital_status race;
	model length_of_stay = insurance admission_type marital_status race / solution;
run;