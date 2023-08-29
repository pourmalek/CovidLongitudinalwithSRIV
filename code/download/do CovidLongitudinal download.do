
clear all

cd "$pathCovidLongitudinal"

***************************************************************************
* This is "do CovidLongitudinal download.do"

* Project: Longitudinal assessment of COVID-19 models    

* Objective: Run the do files in located in /download/ directory 
*            To download estimated deaths by models                                                         
***************************************************************************




* Download reported deaths from JOHN
do "$pathCovidLongitudinal/download/JOHN/do CovidLongitudinal JOHN.do"


* Download estimated deaths by DELP
do "$pathCovidLongitudinal/download/DELP/do CovidLongitudinal DELP.do"


* Download estimated deaths by IHME
do "$pathCovidLongitudinal/download/IHME/do CovidLongitudinal IHME.do"


* Download estimated deaths by IMPE
do "$pathCovidLongitudinal/download/IMPE/do CovidLongitudinal IMPE.do"


* Download estimated deaths by LANL
do "$pathCovidLongitudinal/download/LANL/do CovidLongitudinal LANL.do"


* Download estimated deaths by SRIV
do "$pathCovidLongitudinal/download/SRIV/do CovidLongitudinal SRIV.do"


* Download estimated deaths by UCLA
do "$pathCovidLongitudinal/download/UCLA/do CovidLongitudinal UCLA.do"


* Download estimated deaths by YYGU
do "$pathCovidLongitudinal/download/YYGU/do CovidLongitudinal YYGU.do"







