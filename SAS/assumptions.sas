proc corr data=housing.clean_modeling rank PEARSON
plots (maxpoints = 40000)= scatter(alpha=.05 );
var  full_sq life_sq floor max_floor material;
with  		price_doc	;
title Analyss ;
run;


proc corr data=housing.clean_modeling rank PEARSON
plots (maxpoints = 40000)= all;
var  full_sq;
with  		price_doc	;
title Analyss ;
run;


proc corr data= housing.clean_modeling rank PEARSON
plots (maxpoints = 40000)= scatter(alpha=.05 );
var    build_year num_room 
	kitch_sq state   area_m 
	   ;
with  		price_doc	;
title Analyss ;
run;



proc corr data=work.refined_data rank PEARSON
plots (maxpoints = 40000)= scatter(alpha=.05 );
var      raion_popul green_zone_part 
	indust_part children_preschool preschool_quota 
	children_school  
	   ;
with  		price_doc	;
title Analyss ;
run;



proc corr data=work.refined_data rank PEARSON
plots (maxpoints = 40000)= scatter(alpha=.05 );
var      
	children_school school_quota school_education_centers_raion 
	hospital_beds_raion healthcare_centers_raion 
	   ;
with  		price_doc	;
title Analyss ;
run;



proc corr data=work.refined_data rank PEARSON
plots (maxpoints = 40000)= scatter(alpha=.05 );
var      university_top_20_raion 
	sport_objects_raion additional_education_raion  
	culture_objects_top_25_raion shopping_centers_raion 
	   ;
with  		price_doc	;
title Analyss ;
run;


