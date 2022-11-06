/* Generated Code (IMPORT) */
/* Source File: Baldy.csv */
/* Source Path: /folders/myfolders/MT5763_2_200028225 */
/* Code generated on: 10/22/20, 4:48 PM */

%web_drop_table(DATA.BALDY);

FILENAME REFFILE '/folders/myfolders/Baldy.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=DATA.BALDY;
	GETNAMES=YES;
RUN;

/* View the basic details of dataset */
PROC CONTENTS DATA=DATA.BALDY; 
RUN;

/* Disply the dataset in table format */
%web_open_table(DATA.BALDY);


/* Creating the copy of existing dataset*/
DATA DATA.COPY_DATASET;
SET DATA.BALDY;
RUN;

/*----------------------- SUMMIRINZING DATASET --------------------------------*/

/* Summirizing the numeric variables of different treatments*/
PROC UNIVARIATE DATA= DATA.COPY_DATASET;
VAR LUXURIANT PLACEBO BALDBEGONE SKINHEADNOMORE;
RUN;


/* Summirizing the numeric variables of age when treatment was done*/
PROC UNIVARIATE DATA= DATA.COPY_DATASET;
VAR AGELUXURIANT AGEPLACEBO AGEBALDBEGONE AGESKINHEADNOMORE;
RUN;


/*---------------- CONVERTING THE DATASET TO THREE COLUMNS AGE, HAIR GROWTH VALUE, TREATMENT*/

/* CHANGE DATASET TRANSPOSE WIDE TO LONG  */

/* Creating the seprate dataset of Luxuriant treatment*/
DATA DATA.DATA_LUXURIANT; 
	SET DATA.COPY_DATASET ;
	Treatment = "Luxuriant";
	RENAME AgeLuxuriant = Age;
	RENAME LUXURIANT = HairGrowthValue;
	KEEP AgeLuxuriant LUXURIANT Treatment;
RUN;

PROC UNIVARIATE DATA= DATA.DATA_LUXURIANT;
VAR AGE HAIRGROWTHVALUE;
RUN;

/* Creating the seprate dataset of Placebo treatment*/
DATA DATA.DATA_PLACEBO; 
	SET DATA.COPY_DATASET ;
	Treatment = "Placebo";
	RENAME AGEPLACEBO = Age;
	RENAME PLACEBO = HairGrowthValue;
	KEEP AGEPLACEBO PLACEBO Treatment; 
RUN;
PROC UNIVARIATE DATA= DATA.DATA_PLACEBO;
VAR AGE HAIRGROWTHVALUE;
RUN;


/* Creating the seprate dataset of BaldBeGone treatment*/
DATA DATA.DATA_BALDBEGONE; 
	SET DATA.COPY_DATASET ;
	Treatment = "BaldBeGone";
	length Treatment $ 20;
	RENAME AGEBALDBEGONE = Age;
	RENAME BALDBEGONE = HairGrowthValue;
	KEEP AGEBALDBEGONE BALDBEGONE Treatment; 
RUN;

PROC UNIVARIATE DATA= DATA.DATA_BALDBEGONE;
VAR AGE HAIRGROWTHVALUE;
RUN;

/* Creating the seprate dataset of SkinheadNoMore treatment*/
DATA DATA.DATA_SKINHEADNOMORE; 
	SET DATA.COPY_DATASET ;
	Treatment = "SkinheadNoMore";
	length Treatment $ 20;
	RENAME AGESKINHEADNOMORE = Age;
	RENAME SKINHEADNOMORE = HairGrowthValue;
	KEEP AGESKINHEADNOMORE SKINHEADNOMORE Treatment; 
RUN;

PROC UNIVARIATE DATA= DATA.DATA_SKINHEADNOMORE;
VAR AGE HAIRGROWTHVALUE;
RUN;

/* Merging all above 4 datasets*/
DATA DATA.TIDY_DATASET;
	length Treatment $ 20;
    SET DATA.DATA_LUXURIANT DATA.DATA_PLACEBO DATA.DATA_BALDBEGONE DATA.DATA_SKINHEADNOMORE ;
RUN;

/* CHANGE HAIR GROTH VALUES(INCHES) TO MILIMIITER*/
DATA DATA.TIDY_DATASET;
	SET DATA.TIDY_DATASET;
	HairGrowthValue = HairGrowthValue * 25.4;
RUN;

/* FREQUENCY TABLES of summery for tidy dataset*/
PROC FREQ DATA=DATA.TIDY_DATASET;
    TABLE Age*HairGrowthValue / CHISQ;
RUN;

/* summerizing tidy dataset */
PROC CONTENTS DATA=DATA.TIDY_DATASET; 
RUN;

/* Basic statistical summery for numeric data */
PROC UNIVARIATE DATA= DATA.TIDY_DATASET;
VAR Age HairGrowthValue;
RUN;

/* ------------- Question 1 ------------- */
/* creating a new dataset for Luxuriant and Placebo Treatments*/
DATA DATA.DATA_q1; 
	SET DATA.TIDY_DATASET;
	WHERE Treatment = "Luxuriant" OR Treatment = "Placebo";
RUN;

/* statistical summery of above dataset */
PROC UNIVARIATE DATA= DATA.DATA_q1;
VAR AGE HAIRGROWTHVALUE;
RUN;

/*Creating a series plot of hair growth for luxuriant treatment and placbo treatment*/
proc template; 
define statgraph sgdesign;
dynamic _AGE _HAIRGROWTHVALUE _TREATMENT _TREATMENT2;
begingraph;
  /* entrytitle halign=center 'Graph: 1 Effect of luxuriant treatment over the placbo treatment';*/
   layout lattice / rowdatarange=data columndatarange=data rowgutter=10 columngutter=10;
      layout overlay;
         seriesplot x=_AGE y=_HAIRGROWTHVALUE / group=_TREATMENT curvelabel=_TREATMENT2 name='series' connectorder=xaxis;
      endlayout;
   endlayout;
endgraph;
end;
run;

/* Displaying the above graph */
proc sgrender data=DATA.DATA_q1 template=sgdesign;
dynamic _AGE="AGE" _HAIRGROWTHVALUE="HAIRGROWTHVALUE" _TREATMENT="TREATMENT" _TREATMENT2="TREATMENT";
run;

/* ------------- Question 2 ------------- */

/*Creating a box plot of hair growth for all treatments*/
proc template;
define statgraph sgdesign;
dynamic _HAIRGROWTHVALUE _TREATMENT _TREATMENT2;
begingraph;
  /* entrytitle halign=center 'Graph: 2 Hair growth effects of different treatments';*/
   layout lattice / rowdatarange=data columndatarange=data rowgutter=10 columngutter=10;
      layout overlay / xaxisopts=( discreteopts=( tickvaluefitpolicy=splitrotate));
         boxplot x=_TREATMENT y=_HAIRGROWTHVALUE / group=_TREATMENT2 name='box' groupdisplay=Cluster;
      endlayout;
   endlayout;
endgraph;
end;
run;

/* Displying above graph */
proc sgrender data=DATA.TIDY_DATASET template=sgdesign;
dynamic _HAIRGROWTHVALUE="HAIRGROWTHVALUE" _TREATMENT="TREATMENT" _TREATMENT2="TREATMENT";
run;

/* ------------- Question 3 ------------- */
/* graph of age vs different traetments */
proc template;
define statgraph sgdesign;
dynamic _AGE _TREATMENT;
begingraph;
   entrytitle halign=center 'Graph 3: Age over different treatments ';
   layout lattice / rowdatarange=data columndatarange=data rowgutter=10 columngutter=10;
      layout overlay / xaxisopts=( discreteopts=( tickvaluefitpolicy=splitrotate));
         boxplot x=_TREATMENT y=_AGE / name='box' groupdisplay=Cluster;
      endlayout;
   endlayout;
endgraph;
end;
run;

/* Displying above graph */
proc sgrender data=DATA.TIDY_DATASET template=sgdesign;
dynamic _AGE="AGE" _TREATMENT="TREATMENT";
run;

/* fit the model with whole dataset - General Linear model */
PROC GLM data=DATA.TIDY_DATASET outstat=outStat plots=diagnostics;
  CLASS age;
  MODEL HAIRGROWTHVALUE = age / solution clparm;
  ODS output fFitStatistics = modelFit ParameterEstimates =parEsts;
RUN;
Quit;

/* for above dataset: scatter plot with fitted linear regression with prediction interval(CLI) and  confidence interval(CLM)*/
PROC sgplot data=DATA.TIDY_DATASET;
reg x= HAIRGROWTHVALUE y = age/CLM CLI;
scatter x= HAIRGROWTHVALUE y = age ;
RUN;

/* Assumption for whole dataset*/

PROC GLM data=DATA.TIDY_DATASET;
  CLASS age;
  MODEL HAIRGROWTHVALUE = age;
  OUTPUT out=DATA.obsOut p=yhat r=resid lclm= lowerCI uclm = upperCI;
RUN;
Quit;

PROC UNIVARIATE data=DATA.obsOut normaltest;
var resid;
QQPLOT resid/normal (mu=est sigma=est);
RUN;


/*-------------Fit the model with Luxuriant treatment-------------*/
/* creating the dataset for Luxuriant treatment*/
DATA DATA.DATA_Luxuriant; 
	SET DATA.TIDY_DATASET;
	WHERE Treatment = "Luxuriant";
RUN;

/* fit the model with Luxuriant dataset - General Linear model */
PROC GLM data=DATA.DATA_Luxuriant outstat=outStat_Luxuriant plots=diagnostics;
  CLASS age;
  MODEL HAIRGROWTHVALUE = age / solution clparm;
  ODS output fFitStatistics = modelFit ParameterEstimates =parEsts;
RUN;
Quit;

/* for above dataset: scatter plot with fitted linear regression with prediction interval(CLI) and  confidence interval(CLM)*/
PROC sgplot data=DATA.DATA_Luxuriant;;
reg x= HAIRGROWTHVALUE y = age/CLM CLI;
scatter x= HAIRGROWTHVALUE y = age ;
RUN;

/* Assumption for Luxuriant treatment*/
PROC GLM data=DATA.DATA_Luxuriant;
  CLASS age;
  MODEL HAIRGROWTHVALUE = age;
  OUTPUT out=DATA.obsOut_Luxuriant p=yhat_l r=resid_l lclm= lowerCI_l uclm = upperCI_l;
RUN;
Quit;

PROC UNIVARIATE data=DATA.obsOut_Luxuriant normaltest;
var resid_l;
QQPLOT resid_l/normal (mu=est sigma=est);
RUN;


/*-------------Fit the model with Placebo treatment-------------*/
/* creating the dataset for Placebo treatment*/
DATA DATA.DATA_Placebo; 
	SET DATA.TIDY_DATASET;
	WHERE Treatment = "Placebo";
RUN;

/* fit the model with Placebo dataset - General Linear model */
PROC GLM data=DATA.DATA_Placebo outstat=outStat_Placebo plots=diagnostics;
  CLASS age;
  MODEL HAIRGROWTHVALUE = age / solution clparm;
  ODS output fFitStatistics = modelFit ParameterEstimates =parEsts;
RUN;
Quit;

/* for above dataset: scatter plot with fitted linear regression with prediction interval(CLI) and  confidence interval(CLM)*/
PROC sgplot data=DATA.DATA_Placebo;
reg x= HAIRGROWTHVALUE y = age/CLM CLI;
scatter x= HAIRGROWTHVALUE y = age ;
RUN;

/* Assumption for Placebo treatment*/
PROC GLM data=DATA.DATA_Placebo;
  CLASS age;
  MODEL HAIRGROWTHVALUE = age;
  OUTPUT out=DATA.obsOut_Placebo p=yhat_p r=resid_p lclm= lowerCI_p uclm = upperCI_p;
RUN;
Quit;

PROC UNIVARIATE data=DATA.obsOut_Placebo normaltest;
var resid_p;
QQPLOT resid_p/normal (mu=est sigma=est);
RUN;


/*-------------Fit the model with BaldBeGone treatment-------------*/
/* creating the dataset for BaldBeGone treatment*/
DATA DATA.DATA_BaldBeGone; 
	SET DATA.TIDY_DATASET;
	WHERE Treatment = "BaldBeGone";
RUN;

/* fit the model with BaldBeGone dataset - General Linear model */
PROC GLM data=DATA.DATA_BaldBeGone outstat=outStat_BaldBeGone plots=diagnostics;
  CLASS age;
  MODEL HAIRGROWTHVALUE = age / solution clparm;
  ODS output fFitStatistics = modelFit ParameterEstimates =parEsts;
RUN;
Quit;

/* for above dataset: scatter plot with fitted linear regression with prediction interval(CLI) and  confidence interval(CLM)*/
PROC sgplot data=DATA.DATA_BaldBeGone;
reg x= HAIRGROWTHVALUE y = age/CLM CLI;
scatter x= HAIRGROWTHVALUE y = age ;
RUN;

/* Assumption for BaldBeGone treatment*/
PROC GLM data=DATA.DATA_BaldBeGone;
  CLASS age;
  MODEL HAIRGROWTHVALUE = age;
  OUTPUT out=DATA.obsOut_BaldBeGone p=yhat_b r=resid_b lclm= lowerCI_b uclm = upperCI_b;
RUN;
Quit;

PROC UNIVARIATE data=DATA.obsOut_BaldBeGone normaltest;
var resid_b;
QQPLOT resid_b/normal (mu=est sigma=est);
RUN;

/*-------------Fit the model with SkinheadNoMore treatment-------------*/
/* creating the dataset for SkinheadNoMore treatment*/
DATA DATA.DATA_SkinheadNoMore; 
	SET DATA.TIDY_DATASET;
	WHERE Treatment = "SkinheadNoMore";
RUN;

/* fit the model with SkinheadNoMore dataset - General Linear model */
PROC GLM data=DATA.DATA_SkinheadNoMore outstat=outStat_SkinheadNoMore plots=diagnostics;
  CLASS age;
  MODEL HAIRGROWTHVALUE = age / solution clparm;
  ODS output fFitStatistics = modelFit ParameterEstimates =parEsts;
RUN;
Quit;

/* for above dataset: scatter plot with fitted linear regression with prediction interval(CLI) and  confidence interval(CLM)*/
PROC sgplot data=DATA.DATA_SkinheadNoMore ;
reg x= HAIRGROWTHVALUE y = age/CLM CLI;
scatter x= HAIRGROWTHVALUE y = age ;
RUN;

/* Assumption for SkinheadNoMore treatment*/
PROC GLM data=DATA.DATA_SkinheadNoMore;
  CLASS age;
  MODEL HAIRGROWTHVALUE = age;
  OUTPUT out=DATA.obsOut_SkinheadNoMore p=yhat_s r=resid_s lclm= lowerCI_s uclm = upperCI;_s
RUN;
Quit;

PROC UNIVARIATE data=DATA.obsOut_SkinheadNoMore normaltest;
var resid_s;
QQPLOT resid_s/normal (mu=est sigma=est);
RUN;












