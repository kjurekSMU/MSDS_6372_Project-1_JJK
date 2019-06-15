%web_drop_table(housing.modeling);


FILENAME REFFILE '/folders/myfolders/stats2_hw/term_proj1/data/modellingData1.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT= housing.modeling;
	GETNAMES=YES;
	guessingrows=12200;
RUN;

PROC CONTENTS DATA=housing.modeling; RUN;


%web_open_table(housing.modeling);

%web_drop_table(housing.projection);


FILENAME REFFILE '/folders/myfolders/stats2_hw/term_proj1/data/projectionData1.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT= housing.projection;
	GETNAMES=YES;
	guessingrows= max;
RUN;

PROC CONTENTS DATA=housing.projection; RUN;
%web_open_table(housing.projection);
