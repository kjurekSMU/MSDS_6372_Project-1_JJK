/* ---------------------------------------------------------
 * MSDS 6372 - Project#1 - Goal 2
 * 
 * Part B - Time Seriese Analysis of Average House Price 
 * Pankaj Kumar, Shawn Jung, Karl Jurek 
 * --------------------------------------------------------- */

/* set data file location as a separate path */ 
FILENAME REFILL '/home/shawnj0/sasuser.v94/AppliedStat/goal2data.csv';

/* load the wrangled data as GOAL2 */ 
PROC IMPORT DATAFILE=REFILL
	DBMS=CSV
	OUT= GOAL2;
	GETNAMES=YES;
RUN;

/* inspect if the data is ok */
PROC CONTENTS DATA=GOAL2; RUN;
PROC PRINT DATA=GOAL2;RUN;

/* visually inspect the data  */
PROC SGPLOT DATA=GOAL2;
	SERIESE X = MONTH Y= AVGPRICE; 
RUN;

/* Fit a simple lineare regression  */
PROC GLM DATA=GOAL2 PLOT=ALL ;
	MODEL AVGPRICE = MONTH /SOLUTION;
RUN;

/* obtain residuals and plot them */
PROC REG DATA=GOAL2;
	MODEL AVGPRICE = MONTH / R ;
	OUTPUT OUT=GOAL2RESID R=RESID ;
RUN;

PROC SGPLOT DATA=GOAL2RESID;
	SERIESE X = MONTH Y= RESID; 
RUN;
 
/* Check autocorrelation on residuals */
PROC AUTOREG DATA=GOAL2RESID; /* without any lag */
	MODEL RESID = MONTH / DWPROB;
RUN;

PROC AUTOREG DATA=GOAL2RESID; /* try lag 1 */
	MODEL RESID = MONTH / NLAG = (1) DWPROB;
RUN;
 

/* Prediction of residuals - prepare data */
DATA FORPRED; 
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

DATA GOAL2_PRED; /*combine two sets */
SET GOAL2 FORPRED;
RUN;

/* running prediction */
PROC AUTOREG DATA=GOAL2_PRED ; 
MODEL AVGPRICE = MONTH / NLAG = (1) DWPROB;
OUTPUT OUT = PREDS_PRICE P = PREDICTIONS LCL = LOWER UCL = UPPER PM = YTREND;
RUN;

PROC SGPLOT DATA = PREDS_PRICE; 
BAND X = MONTH UPPER = UPPER LOWER = LOWER;
SCATTER X = MONTH Y = AVGPRICE;
SERIES X = MONTH Y = PREDICTIONS;
SERIES X = MONTH Y = YTREND / LINEATTRS= (COLOR=BLACK);
RUN;

PROC PRINT DATA=PREDS_PRICE;RUN;

/* forecating July 2015 to June 2016 */

DATA FORCASTED_PRICE; 
SET PREDS_PRICE;
KEEP MONTH MONTHYEAR PREDICTIONS LOWER UPPER;
WHERE MONTH > 47;
;

PROC PRINT DATA=FORCASTED_PRICE;RUN;
