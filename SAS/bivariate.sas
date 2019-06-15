
proc print data=stats2_proj ;
run;

ods graphics on;
ods trace on;

proc corr data=refined_data rank PEARSON
plots (maxpoints = 40000)  = all;
var full_all male_f full_sq work_all work_male work_female 	;
with price_doc;
title Analyss ;
run;

proc glm  data=refined_data;
class Build_year;
model price_doc = full_all  full_sq work_all work_male work_female Build_year;
run;

proc reg data=housing.clean_modeling;
model price_doc = full_sq/r;
output out = demo1 student= studresids;
run;


proc univariate data= housing.clean_modeling; 
	var build_year; 	histogram / normal lognormal kernel; 	
	output out=Parameters mean=mean std=std; 
	qqplot / normal(mu=est sigma=est); run;
 
proc print data = demo1;
run;