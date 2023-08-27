
clear all

cd "$pathCovidLongitudinal/countries/Vanuatu"




***************************************************************************
* This is "do CovidLongitudinal Vanuatu.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Vanuatu <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Vanuatu ?.do" files


do "do CovidLongitudinal Vanuatu 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Vanuatu not included in DELP
do "do CovidLongitudinal Vanuatu 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Vanuatu not included in IHME
do "do CovidLongitudinal Vanuatu 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Vanuatu 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


/* Vanuatu not included in LANL
do "do CovidLongitudinal Vanuatu 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **/


/* Vanuatu not included in SRIV
do "do CovidLongitudinal Vanuatu 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **/

/* Vanuatu not included in UCLA
do "do CovidLongitudinal Vanuatu 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Vanuatu not included in YYGU
do "do CovidLongitudinal Vanuatu 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Vanuatu 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



