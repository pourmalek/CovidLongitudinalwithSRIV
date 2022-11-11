
clear all

cd "$pathCovidLongitudinal"


***************************************************************************
* This is "do CovidLongitudinal SRIV 1.do"

* Project: Longitudinal assessment of COVID-19 models

* Objective: Run the do files in located in /download/SRIV/ directory                                                                        
***************************************************************************



* Download estimates files for SRIV model, part 1 of 2
do "$pathCovidLongitudinal/download/SRIV/do CovidLongitudinal SRIV 1.do"


* Download estimates files for SRIV model, part 2 of 2
do "$pathCovidLongitudinal/download/SRIV/do CovidLongitudinal SRIV 2.do"
