/* set data file location as a separate path */ 
FILENAME REFFILE '/home/shawnj0/sasuser.v94/AppliedStat/goal2data.csv';

/* load the goal2 data */ 
PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT= GOAL2;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=GOAL2; RUN;

PROC PRINT DATA=GOAL2;

/* plot the data  */
PROC PLOT DATA=GOAL2;
	PLOT AVGPRICE*MONTH; 
RUN;

/* Y-W estimate without lag */
PROC AUTOREG DATA=GOAL2;
	MODEL AVGPRICE = MONTH / DWPROB;
RUN;

/* Y-W estimate with lag 1 */
PROC AUTOREG DATA=GOAL2;
	MODEL AVGPRICE = MONTH / NLAG= 1 DWPROB;
RUN;
