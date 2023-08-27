
clear all

cd "$pathCovidLongitudinal/countries/Kyrgyzstan"




***************************************************************************
* This is "do CovidLongitudinal Kyrgyzstan.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Kyrgyzstan <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Kyrgyzstan ?.do" files


do "do CovidLongitudinal Kyrgyzstan 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Kyrgyzstan not included in DELP
do "do CovidLongitudinal Kyrgyzstan 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


do "do CovidLongitudinal Kyrgyzstan 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **


do "do CovidLongitudinal Kyrgyzstan 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Kyrgyzstan 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Kyrgyzstan 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Kyrgyzstan not included in UCLA
do "do CovidLongitudinal Kyrgyzstan 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Kyrgyzstan not included in YYGU
do "do CovidLongitudinal Kyrgyzstan 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Kyrgyzstan 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



