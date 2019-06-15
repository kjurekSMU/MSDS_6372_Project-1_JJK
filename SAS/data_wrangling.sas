
data housing.clean_modeling ;
set housing.modeling;
region=compress(sub_area,"'");
if full_sq = 5326 then delete;
if missing(full_sq)  then full_sq = 54.3;
if full_sq >200  then delete;
if full_sq <2  then full_sq = 54.3;

if missing(build_year) then   build_year = 1985;
if build_year = 4965 then   build_year = 1965;
if build_year = 20052009 then   build_year = 2007;
if build_year = 71 then   build_year = 1971;
if build_year < 220 then   delete;

if state = 33 then   state = 3;
if missing(state)  then   state = 5;

if kitch_sq > 500 then   delete;
if missing(num_room)  then   num_room=2;
if missing(floor)  then   floor=8;
if floor = 0 then floor =1;
if missing(max_floor)  then   max_floor=floor;
if max_floor = 0 then max_floor =floor;
if missing(material) then material =1;
log_full_sq= log(full_sq);
idd = input(VAR1, 8.);
run;



data housing.clean_projection ;
set housing.projection;
if missing(state)  then   state = 5;
if missing(material) then material =1;
if build_year = 71 then   build_year = 1971;
idd = input(VAR1, 8.);
if missing(num_room)  then   num_room=2;
if missing(state)  then   state = 5;
if kitch_sq > 500 then   delete;
if missing(num_room)  then   num_room=2;
if missing(floor)  then   floor=8;
if floor = 0 then floor =1;
if missing(max_floor)  then   max_floor=floor;
if max_floor = 0 then max_floor =floor;
idd= idd+28000;
run;

 data housing.merged_data;
set housing.clean_modeling housing.clean_projection;
 

