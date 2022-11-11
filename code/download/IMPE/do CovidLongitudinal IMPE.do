
clear all

cd "$pathCovidLongitudinal/download/IMPE"

***************************************************************************
* This is "do CovidLongitudinal IMPE.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         

* Objective: Download estimates files for IMPE model                                                                  
***************************************************************************


* download estimates files - in 3 parts (2020, 2021, 2022)
* input data files: csv files on web site
* output data files: "IMPE `update'.dta" 
*                    "IMPE countries.dta"
*                    "IMPE countries long.dta"




* Download estimates files for IMPE model, part 1 of 3, for 2000
do "do CovidLongitudinal IMPE 1.do"


* Download estimates files for IMPE model, part 2 of 3, for 2001
do "do CovidLongitudinal IMPE 2.do"


* Download estimates files for IMPE model, part 3 of 3, for 2002
do "do CovidLongitudinal IMPE 3.do"

