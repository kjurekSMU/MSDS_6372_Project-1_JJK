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

/* 3. plot the data  */
PROC SGPLOT DATA=GOAL2;
	SERIESE X = MONTH Y= AVGPRICE; 
RUN;

/* 4.a Fit a simple lineare regression  */
PROC GLM DATA=GOAL2 PLOT=ALL ;
	MODEL AVGPRICE = MONTH /SOLUTION;
RUN;

/* 4.b obtain residuals and plot them */
PROC REG DATA=GOAL2;
	MODEL AVGPRICE = MONTH / R ;
	OUTPUT OUT=GOAL2RESID R=RESID ;
RUN;

PROC SGPLOT DATA=GOAL2RESID;
	SERIESE X = MONTH Y= RESID; 
RUN;
 
/* 4.c Autocorrelation on residuals */
PROC AUTOREG DATA=GOAL2RESID; /* without any lag */
	MODEL RESID = MONTH / DWPROB;
RUN;

PROC AUTOREG DATA=GOAL2RESID; /* try lag 1 */
	MODEL RESID = MONTH / NLAG = (1) DWPROB;
RUN;

/* 4.d Prediction of residuals */
DATA FORPRED; /* prepare data for prediction */
INPUT monthYear $ month @@ ; cards;
201507 49
201508 50
201509 51
201510 52
201511 53
201512 54
201601 55
201602 56
201603 57
201604 58
201605 59
201606 60
;
RUN;

DATA GOAL2RESID_PRED; /*combine two sets */
SET GOAL2RESID FORPRED;
RUN;

PROC AUTOREG DATA=GOAL2RESID_PRED PLOTS(UNPACK); /* running prediction */
MODEL RESID = MONTH / NLAG = (1) DWPROB;
OUTPUT OUT = PREDS_RESID P = PREDICTIONS LCL = LOWER UCL = UPPER PM = YTREND;
RUN;

PROC SGPLOT DATA = PREDS; 
BAND X = MONTH UPPER = UPPER LOWER = LOWER;
SCATTER X = MONTH Y = RESID;
SERIESE X = MONTH Y = PREDICTIONS;
SERIES X = MONTH Y = YTREND / LINEATTRS= (COLOR=BLACK);
RUN;

/* 5. forecating July 2015 to June 2016 */
PROC GLM DATA=goal2resid_pred ;
	MODEL AVGPRICE = MONTH /SOLUTION;
	OUTPUT OUT = PREDS_PRICE P=PREDICTIONS;
RUN;
PROC PRINT DATA=PREDS_PRICE;RUN;

DATA KEPT_PRICE; /* processing predicted price trend */
SET PREDS_PRICE;
AVGPRICE = PREDICTIONS;
KEEP MONTH MONTHYEAR AVGPRICE;
WHERE MONTH > 47;
;

DATA KEPT_RESIDUAL; /* processing predicted residual */
SET PREDS_RESID;
RESID = PREDICTIONS;
KEEP MONTH MONTHYEAR RESID;
WHERE MONTH > 47;
;

DATA FORCAST_PRICE; /* estimate price + residual */
MERGE KEPT_PRICE KEPT_RESIDUAL;
FORECASTPRICE = AVGPRICE + RESID;
;

/* confidence interval with forcasted error term */
/* not yet finished */

