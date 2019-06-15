
proc univariate data= stats2_proj; 
	var kitch_sq; 	histogram / normal lognormal kernel; 	
	output out=Parameters mean=mean std=std; 
	qqplot / normal(mu=est sigma=est); run;


proc univariate data= stats2_proj; 
	var price_doc; 	histogram / normal lognormal kernel; 	
	output out=Parameters mean=mean std=std; 
	qqplot / normal(mu=est sigma=est); run;



proc glm data= work.stats2_proj;
