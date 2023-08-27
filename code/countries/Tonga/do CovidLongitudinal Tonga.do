
clear all

cd "$pathCovidLongitudinal/countries/Tonga"




***************************************************************************
* This is "do CovidLongitudinal Tonga.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Tonga <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Tonga ?.do" files


do "do CovidLongitudinal Tonga 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Tonga not included in DELP
do "do CovidLongitudinal Tonga 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Tonga not included in IHME
do "do CovidLongitudinal Tonga 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Tonga 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


/* Tonga not included in LANL
do "do CovidLongitudinal Tonga 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **/


/* Tonga not included in SRIV
do "do CovidLongitudinal Tonga 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **/


/* Tonga not included in UCLA
do "do CovidLongitudinal Tonga 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Tonga not included in YYGU
do "do CovidLongitudinal Tonga 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Tonga 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



