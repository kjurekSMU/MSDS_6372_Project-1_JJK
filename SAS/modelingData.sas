
/* Backward selection. */



proc glmselect data=housing.merged_data;
class  life_sq floor max_floor material build_year num_room 
	kitch_sq state product_type sub_area area_m raion_popul green_zone_part 
	indust_part children_preschool preschool_quota 
	children_school school_quota school_education_centers_raion 
	hospital_beds_raion healthcare_centers_raion university_top_20_raion 
	sport_objects_raion additional_education_raion culture_objects_top_25 
	culture_objects_top_25_raion shopping_centers_raion office_raion 
	thermal_power_plant_raion incineration_raion oil_chemistry_raion 
	radiation_raion railroad_terminal_raion big_market_raion nuclear_reactor_raion 
	detention_facility_raion;
model price_doc = full_sq life_sq floor max_floor material build_year num_room 
	kitch_sq state product_type sub_area area_m raion_popul green_zone_part 
	indust_part children_preschool preschool_quota 
	children_school school_quota school_education_centers_raion 
	hospital_beds_raion healthcare_centers_raion university_top_20_raion 
	sport_objects_raion additional_education_raion culture_objects_top_25 
	culture_objects_top_25_raion shopping_centers_raion office_raion 
	thermal_power_plant_raion incineration_raion oil_chemistry_raion 
	radiation_raion railroad_terminal_raion big_market_raion nuclear_reactor_raion 
	detention_facility_raion
/ selection=Backward(stop=CV) cvmethod=random(5) stats=adjrsq;
output out = results  p = predict ; 	
run;


 data result_backward_selection ;
set results;
price_doc = predict;
if missing(predict) then price_doc = 140000;
keep id  price_doc;
where idd > 28000;

proc export data=result_backward_selection dbms=csv
outfile="/folders/myfolders/stats2_hw/term_proj1/output/result_backward_selection.csv"
replace;
run;

proc print data = result_Backward_selection;
run;

/* Stepwise. */
proc glmselect data=housing.merged_data;
class  life_sq floor max_floor material build_year num_room 
	kitch_sq state product_type sub_area area_m raion_popul green_zone_part 
	indust_part children_preschool preschool_quota 
	children_school school_quota school_education_centers_raion 
	hospital_beds_raion healthcare_centers_raion university_top_20_raion 
	sport_objects_raion additional_education_raion culture_objects_top_25 
	culture_objects_top_25_raion shopping_centers_raion office_raion 
	thermal_power_plant_raion incineration_raion oil_chemistry_raion 
	radiation_raion railroad_terminal_raion big_market_raion nuclear_reactor_raion 
	detention_facility_raion;	
model price_doc = full_sq   life_sq floor max_floor material build_year num_room 
	kitch_sq state product_type sub_area area_m raion_popul green_zone_part 
	indust_part children_preschool preschool_quota 
	children_school school_quota school_education_centers_raion 
	hospital_beds_raion healthcare_centers_raion university_top_20_raion 
	sport_objects_raion additional_education_raion culture_objects_top_25 
	culture_objects_top_25_raion shopping_centers_raion office_raion 
	thermal_power_plant_raion incineration_raion oil_chemistry_raion 
	radiation_raion railroad_terminal_raion big_market_raion nuclear_reactor_raion 
	detention_facility_raion
	/ selection=Stepwise(stop=CV) cvmethod=random(5) stats=adjrsq;
output out = results  p = predict ; 	
run;

data result_stepwise_selection ;
set results;
price_doc = predict;
if missing(predict) then price_doc = 140000;
keep id  price_doc;
where idd > 28000;

proc export data=result_stepwise_selection dbms=csv
outfile="/folders/myfolders/stats2_hw/term_proj1/output/result_stepwise_selection.csv"
replace;
run;


proc print data = result_Stepwise_selection;
run;

 
proc glmselect data= housing.merged_data ;
 class   floor max_floor material build_year num_room 
	kitch_sq state product_type sub_area area_m raion_popul green_zone_part 
	indust_part children_preschool preschool_quota 
	children_school school_quota school_education_centers_raion 
	hospital_beds_raion healthcare_centers_raion university_top_20_raion 
	sport_objects_raion additional_education_raion culture_objects_top_25 
	culture_objects_top_25_raion shopping_centers_raion office_raion 
	thermal_power_plant_raion incineration_raion oil_chemistry_raion 
	radiation_raion railroad_terminal_raion big_market_raion nuclear_reactor_raion 
	detention_facility_raion;
model  price_doc =  full_sq life_sq floor max_floor material build_year num_room 
	kitch_sq state product_type sub_area area_m raion_popul green_zone_part 
	indust_part children_preschool preschool_quota 
	children_school school_quota school_education_centers_raion 
	hospital_beds_raion healthcare_centers_raion university_top_20_raion 
	sport_objects_raion additional_education_raion culture_objects_top_25 
	culture_objects_top_25_raion shopping_centers_raion office_raion 
	thermal_power_plant_raion incineration_raion oil_chemistry_raion 
	radiation_raion railroad_terminal_raion big_market_raion nuclear_reactor_raion 
	detention_facility_raion  / selection=Forward(stop=CV) cvmethod=random(5) 
	stats=adjrsq details=summary;
	output out = results  p = predict ; 	
run;

data result_forward_selection ;
set results;
price_doc = predict;
if missing(predict) then price_doc = 140000;
keep id  price_doc;
where idd > 28000;


proc print data = result_forward_selection;
run;
 

/* LASSO */
 
proc glmselect data= housing.merged_data;
class full_sq life_sq floor max_floor material build_year num_room 
	kitch_sq state product_type sub_area area_m raion_popul green_zone_part 
	indust_part children_preschool preschool_quota 
	children_school school_quota school_education_centers_raion 
	hospital_beds_raion healthcare_centers_raion university_top_20_raion 
	sport_objects_raion additional_education_raion culture_objects_top_25 
	culture_objects_top_25_raion shopping_centers_raion office_raion 
	thermal_power_plant_raion incineration_raion oil_chemistry_raion 
	radiation_raion railroad_terminal_raion big_market_raion nuclear_reactor_raion 
	detention_facility_raion;	
model price_doc = full_sq -- detention_facility_raion 
	/ selection=LASSO(choose=CV stop=CV) CVdetails;
		output out = results  p = predict ; 	
run;


 data result_LASSO_selection ;
set results;
price_doc = predict;
if missing(predict) then price_doc = 140000;
keep id  price_doc;
where idd > 28000;


proc print data = result_LASSO_selection;
run;
