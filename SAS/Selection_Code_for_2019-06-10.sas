
proc import datafile='/folders/myfolders/stats2_hw/term_proj1/modelingData.csv'
	out=train2
	dbms=csv;
run;

data train2;
	set train2;
	region=compress(sub_area,"'");
run;

proc print data=train2 (obs=10); run;

/* Forward selection. */
proc glmselect data=train2;
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
/ selection=Forward(stop=CV) cvmethod=random(5) stats=adjrsq;
run;


/* Backward selection. */
proc glmselect data=train2;
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
/ selection=Backward(stop=CV) cvmethod=random(5) stats=adjrsq;
run;

/* Stepwise. */
proc glmselect data=train2;
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
	/ selection=Stepwise(stop=CV) cvmethod=random(5) stats=adjrsq;
run;

