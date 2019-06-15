
 


proc corr data= housing.clean_modeling;
var full_sq life_sq floor max_floor material build_year num_room 
	kitch_sq state   area_m raion_popul green_zone_part 
	indust_part children_preschool preschool_quota 
	children_school school_quota school_education_centers_raion 
	hospital_beds_raion healthcare_centers_raion university_top_20_raion 
	sport_objects_raion additional_education_raion  
	culture_objects_top_25_raion shopping_centers_raion ;
run;



proc glm data=housing.clean_modeling;
class preschool_quota	children_school	school_quota;
model price_doc = full_sq raion_popul life_sq	 preschool_quota	children_school	school_quota;
run;