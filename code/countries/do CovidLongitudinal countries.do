
clear all

cd "$pathCovidLongitudinal/countries"


***************************************************************************
* This is "do CovidLongitudinal countries.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process estimates for countries                                                                    
***************************************************************************




local list `" "Afghanistan" "Albania" "Algeria" "Argentina" "Iran" "United States of America" "'


foreach country of local list {

	do "$pathCovidLongitudinal/countries/`country'/do CovidLongitudinal `country'.do"

}
*

