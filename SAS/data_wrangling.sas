/* MODELING DATA CLEANING */
data WORK.CLEAN_MODELING ;
	set WORK.MODELING;
	region=compress(sub_area,"'");
	if full_sq = 5326 then delete;
	if full_sq >200 then delete;
	if full_sq <2 then full_sq = 54.3;
	if missing(full_sq) then full_sq = 54.3;

	if floor = 0 then floor =1;
	if missing(floor) then floor = 8;	
	
	if max_floor = 0 then max_floor =floor;
	if missing(max_floor) then max_floor=floor;
	
	if missing(material) then material = 1;
	
	if build_year = 4965 then build_year = 1965;
	if build_year = 1691 then build_year = 1991;
	if build_year = 20052009 then build_year = 2007;
	if build_year = 71 then build_year = 1971;
	if build_year < 220 then delete;
	if missing(build_year) then build_year = 1985;

	if num_rooms = 0 then num_rooms = 1;
	if missing(num_rooms) then num_rooms = 2;
	
	if kitch_sq = 1974 then kitch_sq = 1;
	if kitch_sq = 2013 then kitch_sq = 1;
	if kitch_sq = 2014 then kitch_sq = 1;
	if kitch_sq > 500 then delete;
	if missing(kitch_sq) then kitch_sq = 6;
	
	if state = 33 then state = 3;
	if missing(state) then state = 2;

	if missing(preschool_quota) then preschool_quota = 3273.8;
	
	if missing(school_quota) then school_quota = 1194.8;
	
	if missing(raion_build_count_with_material_) then raion_build_count_with_material_ = 328.2;
	
	if missing(build_cont_wood) then build_cont_wood = 50.2;
	
	if missing(build_count_frame) then build_count_frame = 40.3;
	
	if missing(build_count_brick) then build_count_brick = 108.1;
	
	if missing(build_count_monolith) then build_count_monolith = 12.0;
	
	if missing(build_count_panel) then build_count_panel = 107.5;
	
	if missing(build_count_foam) then build_count_foam = 0.2;
	
	if missing(build_count_slag) then build_count_slag = 4.5;
	
	if missing(build_count_mix) then build_count_mix = 0.6;
	
	if missing(raion_build_count_with_builddate) then raion_build_count_with_builddate = 327.9;
	
	if missing(build_count_before_1920) then build_count_before_1920 = 18.8;
	
	if missing(build_count_1921_1945) then build_count_1921_1945 = 26.6;
	
	if missing(build_count_1946_1970) then build_count_1946_1970 = 141.0;
	
	if missing(build_count_1971_1995) then build_count_1971_1995 = 80.4;
	
	if missing(build_count_after_1995) then build_count_after_1995 = 61.1;
	
	if missing(metro_min_walk) then metro_min_walk = 42.8;
	
	if missing(metro_km_walk) then metro_km_walk = 5.5;
	
	if missing(railroad_station_walk_km) then railroad_station_walk_km = 4.4;
	
	if missing(railroad_station_walk_min) then railroad_station_walk_min = 52.7;
	
	if missing(ID_railroad_station_walk) then ID_railroad_station_walk = 38.9;
	
	if missing(cafe_sum_500_min_price_avg) then cafe_sum_500_min_price_avg = 740.3;
	if missing(cafe_sum_500_max_price_avg) then cafe_sum_500_max_price_avg = 1245.6;
	if missing(cafe_avg_price_500) then cafe_avg_price_500 = 993.0;

	if missing(cafe_sum_1000_min_price_avg) then cafe_sum_1000_min_price_avg = 710.1;
	if missing(cafe_sum_1000_max_price_avg) then cafe_sum_1000_max_price_avg = 1205.4;
	if missing(cafe_avg_price_1000) then cafe_avg_price_1000 = 957.7;
	
	if missing(cafe_sum_1500_min_price_avg) then cafe_sum_1500_min_price_avg = 713.2;
	if missing(cafe_sum_1500_max_price_avg) then cafe_sum_1500_max_price_avg = 1204.7;
	if missing(cafe_avg_price_1500) then cafe_avg_price_1500 = 958.9;
	
	if missing(cafe_sum_2000_min_price_avg) then cafe_sum_2000_min_price_avg = 719.8;
	if missing(cafe_sum_2000_max_price_avg) then cafe_sum_2000_max_price_avg = 1210.8;
	if missing(cafe_avg_price_2000) then cafe_avg_price_2000 = 965.3;
	
	if missing(cafe_sum_3000_min_price_avg) then cafe_sum_3000_min_price_avg = 765.7;
	if missing(cafe_sum_3000_max_price_avg) then cafe_sum_3000_max_price_avg = 1283.1;
	if missing(cafe_avg_price_3000) then cafe_avg_price_3000 = 1024.4;
	
	if missing(prom_part_5000) then prom_part_5000 = 10.3;
	
	if missing(cafe_sum_5000_min_price_avg) then cafe_sum_5000_min_price_avg = 765.5;
	if missing(cafe_sum_5000_max_price_avg) then cafe_sum_5000_max_price_avg = 1278.9;
	if missing(cafe_avg_price_5000) then cafe_avg_price_5000 = 1022.2;	
	
	idd = input(VAR1, 8.);
run;

/* proc print data=WORK.CLEAN_MODELING (obs=10); run; */

/* PROJECTION DATA CLEANING */
data WORK.CLEAN_PROJECTION ;
	set WORK.PROJECTION;
	region=compress(sub_area,"'");
	if full_sq = 5326 then delete;
	if full_sq >200 then delete;
	if full_sq <2 then full_sq = 54.3;
	if missing(full_sq) then full_sq = 54.3;

	if floor = 0 then floor =1;
	if missing(floor) then floor = 8;	
	
	if max_floor = 0 then max_floor =floor;
	if missing(max_floor) then max_floor=floor;
	
	if missing(material) then material = 1;
	
	if build_year = 4965 then build_year = 1965;
	if build_year = 1691 then build_year = 1991;
	if build_year = 20052009 then build_year = 2007;
	if build_year = 71 then build_year = 1971;
	if build_year < 220 then delete;
	if missing(build_year) then build_year = 1985;

	if num_rooms = 0 then num_rooms = 1;
	if missing(num_rooms) then num_rooms = 2;
	
	if kitch_sq = 1974 then kitch_sq = 1;
	if kitch_sq = 2013 then kitch_sq = 1;
	if kitch_sq = 2014 then kitch_sq = 1;
	if kitch_sq > 500 then delete;
	if missing(kitch_sq) then kitch_sq = 6;
	
	if state = 33 then state = 3;
	if missing(state) then state = 2;

	if missing(preschool_quota) then preschool_quota = 3273.8;
	
	if missing(school_quota) then school_quota = 1194.8;
	
	if missing(raion_build_count_with_material_) then raion_build_count_with_material_ = 328.2;
	
	if missing(build_cont_wood) then build_cont_wood = 50.2;
	
	if missing(build_count_frame) then build_count_frame = 40.3;
	
	if missing(build_count_brick) then build_count_brick = 108.1;
	
	if missing(build_count_monolith) then build_count_monolith = 12.0;
	
	if missing(build_count_panel) then build_count_panel = 107.5;
	
	if missing(build_count_foam) then build_count_foam = 0.2;
	
	if missing(build_count_slag) then build_count_slag = 4.5;
	
	if missing(build_count_mix) then build_count_mix = 0.6;
	
	if missing(raion_build_count_with_builddate) then raion_build_count_with_builddate = 327.9;
	
	if missing(build_count_before_1920) then build_count_before_1920 = 18.8;
	
	if missing(build_count_1921_1945) then build_count_1921_1945 = 26.6;
	
	if missing(build_count_1946_1970) then build_count_1946_1970 = 141.0;
	
	if missing(build_count_1971_1995) then build_count_1971_1995 = 80.4;
	
	if missing(build_count_after_1995) then build_count_after_1995 = 61.1;
	
	if missing(metro_min_walk) then metro_min_walk = 42.8;
	
	if missing(metro_km_walk) then metro_km_walk = 5.5;
	
	if missing(railroad_station_walk_km) then railroad_station_walk_km = 4.4;
	
	if missing(railroad_station_walk_min) then railroad_station_walk_min = 52.7;
	
	if missing(ID_railroad_station_walk) then ID_railroad_station_walk = 38.9;
	
	if missing(cafe_sum_500_min_price_avg) then cafe_sum_500_min_price_avg = 740.3;
	if missing(cafe_sum_500_max_price_avg) then cafe_sum_500_max_price_avg = 1245.6;
	if missing(cafe_avg_price_500) then cafe_avg_price_500 = 993.0;

	if missing(cafe_sum_1000_min_price_avg) then cafe_sum_1000_min_price_avg = 710.1;
	if missing(cafe_sum_1000_max_price_avg) then cafe_sum_1000_max_price_avg = 1205.4;
	if missing(cafe_avg_price_1000) then cafe_avg_price_1000 = 957.7;
	
	if missing(cafe_sum_1500_min_price_avg) then cafe_sum_1500_min_price_avg = 713.2;
	if missing(cafe_sum_1500_max_price_avg) then cafe_sum_1500_max_price_avg = 1204.7;
	if missing(cafe_avg_price_1500) then cafe_avg_price_1500 = 958.9;
	
	if missing(cafe_sum_2000_min_price_avg) then cafe_sum_2000_min_price_avg = 719.8;
	if missing(cafe_sum_2000_max_price_avg) then cafe_sum_2000_max_price_avg = 1210.8;
	if missing(cafe_avg_price_2000) then cafe_avg_price_2000 = 965.3;
	
	if missing(cafe_sum_3000_min_price_avg) then cafe_sum_3000_min_price_avg = 765.7;
	if missing(cafe_sum_3000_max_price_avg) then cafe_sum_3000_max_price_avg = 1283.1;
	if missing(cafe_avg_price_3000) then cafe_avg_price_3000 = 1024.4;
	
	if missing(prom_part_5000) then prom_part_5000 = 10.3;
	
	if missing(cafe_sum_5000_min_price_avg) then cafe_sum_5000_min_price_avg = 765.5;
	if missing(cafe_sum_5000_max_price_avg) then cafe_sum_5000_max_price_avg = 1278.9;
	if missing(cafe_avg_price_5000) then cafe_avg_price_5000 = 1022.2;	
	
	log_full_sq= log(full_sq);
	idd= idd+28000;
run;

/* proc print data=WORK.CLEAN_PROJECTION (obs=10); run; */

/* MERGED MODELING AND PROJECTION CLEAN DATA */
data WORK.MERGED_DATA;
set WORK.CLEAN_MODELING WORK.CLEAN_PROJECTION;

/* proc print data=WORK.MERGED_DATA (obs=10); run; */