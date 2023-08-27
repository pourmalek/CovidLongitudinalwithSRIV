
clear all

cd "$pathCovidLongitudinal/countries/Saint Vincent and the Grenadines"




***************************************************************************
* This is "do CovidLongitudinal Saint Vincent and the Grenadines.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Saint Vincent and the Grenadines <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Saint Vincent and the Grenadines ?.do" files


do "do CovidLongitudinal Saint Vincent and the Grenadines 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Saint Vincent and the Grenadines not included in DELP
do "do CovidLongitudinal Saint Vincent and the Grenadines 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Saint Vincent and the Grenadines not included in IHME
do "do CovidLongitudinal Saint Vincent and the Grenadines 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Saint Vincent and the Grenadines 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


/* Saint Vincent and the Grenadines not included in LANL
do "do CovidLongitudinal Saint Vincent and the Grenadines 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **/


do "do CovidLongitudinal Saint Vincent and the Grenadines 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Saint Vincent and the Grenadines not included in UCLA
do "do CovidLongitudinal Saint Vincent and the Grenadines 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Saint Vincent and the Grenadines not included in YYGU
do "do CovidLongitudinal Saint Vincent and the Grenadines 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Saint Vincent and the Grenadines 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



