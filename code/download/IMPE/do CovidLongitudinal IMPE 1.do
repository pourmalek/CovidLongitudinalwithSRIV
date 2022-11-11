
clear all

cd "$pathCovidLongitudinal/download/IMPE"

capture log close 

log using "log CovidLongitudinal IMPE 1.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE 1.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         

* Objective: Download estimates files for IMPE model, part 1 of 3                                                                   
***************************************************************************


* download estimates files - part 1 of 3 - 2020 (from 2020, 2021, 2022)
* input data files: csv files on web site
* output data files: "IMPE `update'.dta" 





/*

History of existence of | sun.security.validator | error while downloading IMPE estimates files from web page https://mrcdata.dide.ic.ac.uk/global-lmic-reports/

(1) Before October 2022, there was no such | sun.security.validator | error

(2) In October 2022, the | sun.security.validator | error occurred. There is a BYPASS REMEDY for that explained below. 

(3) On November 4, 2022, the | sun.security.validator | error does not occur. Therefore, the BYPASS REMEDY is turned off below in the code. 

(4) In case the | sun.security.validator | error occurs again, reverting back to the BYPASS REMEDY should be able to get rid of the consequences of the error. 

*/






/*

 *** BYPASS REMEDY for | sun.security.validator | error while downloading IMPE estimates files from web page 
 *** from web page https://mrcdata.dide.ic.ac.uk/global-lmic-reports/
 
The Stata command -copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/202?-??-??_v?.csv.zip 202?-??-??_v?.csv.zip- 

worked without error before October 2022, but as of October 2022, it returns the following error:


sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderEx
> ception: unable to find valid certification path to requested target
r(5100);

*

* -set sslrelax on- is mentioned by Stata here:
https://www.statalist.org/forums/forum/general-stata-discussion/general/1625838-pkix-path-building-failed-error-message

but does not work with Stata SE 14.2 on Mac OS Monterey version 12.6 (21G115) on October 19, 2022.

-set sslrelax- not allowed; 'sslrelax' not recognized

*

I do not seem to be able to get past this download error, so I manually download the estimates’ zip files 
from https://mrcdata.dide.ic.ac.uk/global-lmic-reports/ and save them in 
CovidLongitudinal-main/code/download/IMPE


* The BYPASS REMEDY is downloading the csv file and putting it in the directory "$pathCovidLongitudinal/download/IMPE"
* to be used in this code here, plus /*commenting out*/ the code blocks for downloading and using the IMPE estimates: 

/*
copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-04-28_v1.csv.zip 2020-04-28_v1.csv.zip
unzipfile 2020-04-28_v1.csv.zip, replace
erase 2020-04-28_v1.csv.zip
*/


*/



/*

* Turning off the BYPASS REMEDY is removing the  /*commented out*/ code blocks for downloading and using the IMPE estimates: 

From:

/*
copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-04-28_v1.csv.zip 2020-04-28_v1.csv.zip
unzipfile 2020-04-28_v1.csv.zip, replace
erase 2020-04-28_v1.csv.zip
*/


To:

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-04-28_v1.csv.zip 2020-04-28_v1.csv.zip
unzipfile 2020-04-28_v1.csv.zip, replace
erase 2020-04-28_v1.csv.zip



* Also:

From:

shell rm -r "2020-04-28_v1.csv" 


To:

shell rm -r "2020-04-28_v1.csv" 


*/










****************************************************
****************************************************
****************************************************


 
/*

* IMPE updates all 


copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/202?-??-??_v?.csv.zip 202?-??-??_v?.csv.zip


2020-04-28_v1.csv.zip
2020-04-29_v1.csv.zip
2020-04-30_v1.csv.zip
2020-05-01_v1.csv.zip
2020-05-02_v1.csv.zip
2020-05-03_v1.csv.zip
2020-05-04_v1.csv.zip
2020-05-05_v1.csv.zip
2020-05-06_v1.csv.zip
2020-05-07_v1.csv.zip
2020-05-08_v1.csv.zip
2020-05-09_v1.csv.zip
2020-05-10_v1.csv.zip
2020-05-11_v1.csv.zip
2020-05-12_v1.csv.zip
2020-05-13_v1.csv.zip
2020-05-14_v1.csv.zip
2020-05-15_v1.csv.zip
2020-05-16_v1.csv.zip
2020-05-17_v1.csv.zip
2020-05-19_v1.csv.zip
2020-05-20_v1.csv.zip
2020-05-21_v1.csv.zip
2020-05-22_v1.csv.zip
2020-05-23_v1.csv.zip
2020-05-24_v1.csv.zip
2020-05-25_v1.csv.zip
2020-05-26_v1.csv.zip
2020-05-27_v1.csv.zip
2020-05-28_v1.csv.zip
2020-05-29_v1.csv.zip
2020-05-30_v1.csv.zip
2020-05-31_v2.csv.zip
2020-06-01_v2.csv.zip
2020-06-02_v2.csv.zip
2020-06-03_v2.csv.zip
2020-06-04_v2.csv.zip
2020-06-06_v2.csv.zip
2020-06-09_v2.csv.zip
2020-06-14_v4.csv.zip
2020-06-16_v4.csv.zip
2020-06-19_v4.csv.zip
2020-06-21_v4.csv.zip
2020-06-23_v4.csv.zip
2020-06-26_v4.csv.zip
2020-06-28_v4.csv.zip
2020-07-02_v4.csv.zip
2020-07-03_v4.csv.zip
2020-07-04_v4.csv.zip
2020-07-07_v4.csv.zip
2020-07-11_v4.csv.zip
2020-07-14_v4.csv.zip
2020-07-15_v4.csv.zip
2020-07-18_v4.csv.zip
2020-07-20_v4.csv.zip
2020-07-22_v4.csv.zip
2020-07-25_v4.csv.zip
2020-07-27_v4.csv.zip
2020-07-31_v4.csv.zip
2020-08-08_v5.csv.zip
2020-08-10_v5.csv.zip
2020-08-11_v5.csv.zip
2020-08-13_v5.csv.zip
2020-08-14_v5.csv.zip
2020-08-17_v5.csv.zip
2020-08-23_v5.csv.zip
2020-08-25_v5.csv.zip
2020-08-27_v5.csv.zip
2020-08-31_v5.csv.zip
2020-09-02_v5.csv.zip
2020-09-06_v5.csv.zip
2020-09-08_v5.csv.zip
2020-09-12_v5.csv.zip
2020-09-15_v5.csv.zip
2020-09-19_v5.csv.zip
2020-09-23_v5.csv.zip
2020-09-25_v5.csv.zip
2020-10-03_v5.csv.zip
2020-10-06_v5.csv.zip
2020-10-12_v5.csv.zip
2020-10-19_v5.csv.zip
2020-10-25_v5.csv.zip
2020-10-28_v5.csv.zip
2020-11-01_v5.csv.zip
2020-11-10_v6.csv.zip
2020-11-14_v6.csv.zip
2020-11-18_v6.csv.zip
2020-11-23_v6.csv.zip
2020-11-29_v6.csv.zip
2020-12-04_v6.csv.zip
2020-12-12_v6.csv.zip
2020-12-20_v6.csv.zip
2020-12-26_v6.csv.zip



2021-01-04_v6.csv.zip
2021-01-10_v6.csv.zip
2021-01-12_v6.csv.zip
2021-01-18_v7.csv.zip
2021-01-24_v7.csv.zip
2021-01-30_v7.csv.zip
2021-02-03_v7.csv.zip
2021-02-10_v7.csv.zip
2021-02-17_v7.csv.zip
2021-02-26_v7.csv.zip
2021-03-05_v7.csv.zip
2021-03-12_v7.csv.zip
2021-03-19_v7.csv.zip
2021-03-29_v7.csv.zip
2021-04-06_v7.csv.zip
2021-04-17_v7.csv.zip
2021-04-24_v7.csv.zip
2021-05-10_v8.csv.zip
2021-05-16_v8.csv.zip
2021-05-22_v8.csv.zip
2021-05-27_v8.csv.zip
2021-06-04_v8.csv.zip
2021-06-11_v8.csv.zip
2021-06-18_v8.csv.zip
2021-06-26_v8.csv.zip
2021-07-02_v8.csv.zip
2021-07-09_v8.csv.zip
2021-07-19_v8.csv.zip
2021-08-06_v8.csv.zip
2021-08-19_v8.csv.zip
2021-08-25_v8.csv.zip
2021-09-09_v8.csv.zip
2021-09-24_v8.csv.zip
2021-10-06_v8.csv.zip
2021-10-21_v8.csv.zip
2021-10-27_v8.csv.zip
2021-11-03_v9.csv.zip
2021-11-15_v9.csv.zip
2021-11-21_v9.csv.zip
2021-11-29_v9.csv.zip
2021-12-05_v9.csv.zip
2021-12-13_v9.csv.zip
2021-12-26_v9.csv.zip


2022-01-02_v9.csv.zip
2022-01-20_v9.csv.zip
2022-01-31_v9.csv.zip
2022-03-15_v9.csv.zip
2022-05-30_v9.csv.zip



https://github.com/mrc-ide/global-lmic-reports/tree/master/data


2022-06-20_v9.csv.zip
2022-07-03_v9.csv.zip
2022-07-12_v9.csv.zip
2022-07-28_v9.csv.zip
2022-08-08_v9.csv.zip
2022-09-01_v10.csv.zip


*/




* update 2020-04-28 20200428

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-04-28_v1.csv.zip 2020-04-28_v1.csv.zip
unzipfile 2020-04-28_v1.csv.zip, replace
erase 2020-04-28_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-04-28_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200428

qui compress 

save "IMPE 20200428.dta", replace


shell rm -r "2020-04-28_v1.csv" 

******

*







* update 2020-04-29 20200429

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-04-29_v1.csv.zip 2020-04-29_v1.csv.zip
unzipfile 2020-04-29_v1.csv.zip, replace
erase 2020-04-29_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-04-29_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200429

qui compress 

save "IMPE 20200429.dta", replace


shell rm -r "2020-04-29_v1.csv" 

******

*







* update 2020-04-30 20200430

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-04-30_v1.csv.zip 2020-04-30_v1.csv.zip
unzipfile 2020-04-30_v1.csv.zip, replace
erase 2020-04-30_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-04-30_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200430

qui compress 

save "IMPE 20200430.dta", replace


shell rm -r "2020-04-30_v1.csv" 

******

*






* update 2020-05-01 20200501

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-01_v1.csv.zip 2020-05-01_v1.csv.zip
unzipfile 2020-05-01_v1.csv.zip, replace
erase 2020-05-01_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-01_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200501

qui compress 

save "IMPE 20200501.dta", replace


shell rm -r "2020-05-01_v1.csv" 

******

*






* update 2020-05-02 20200502

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-02_v1.csv.zip 2020-05-02_v1.csv.zip
unzipfile 2020-05-02_v1.csv.zip, replace
erase 2020-05-02_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-02_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200502

qui compress 

save "IMPE 20200502.dta", replace


shell rm -r "2020-05-02_v1.csv" 

******

*






* update 2020-05-03 20200503

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-03_v1.csv.zip 2020-05-03_v1.csv.zip
unzipfile 2020-05-03_v1.csv.zip, replace
erase 2020-05-03_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-03_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200503

qui compress 

save "IMPE 20200503.dta", replace


shell rm -r "2020-05-03_v1.csv" 

******

*







* update 2020-05-04 20200504

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-04_v1.csv.zip 2020-05-04_v1.csv.zip
unzipfile 2020-05-04_v1.csv.zip, replace
erase 2020-05-04_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-04_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200504

qui compress 

save "IMPE 20200504.dta", replace


shell rm -r "2020-05-04_v1.csv" 

******

*







* update 2020-05-05 20200505

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-05_v1.csv.zip 2020-05-05_v1.csv.zip
unzipfile 2020-05-05_v1.csv.zip, replace
erase 2020-05-05_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-05_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200505

qui compress 

save "IMPE 20200505.dta", replace


shell rm -r "2020-05-05_v1.csv" 

******

*






* update 2020-05-06 20200506

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-06_v1.csv.zip 2020-05-06_v1.csv.zip
unzipfile 2020-05-06_v1.csv.zip, replace
erase 2020-05-06_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-06_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200506

qui compress 

save "IMPE 20200506.dta", replace


shell rm -r "2020-05-06_v1.csv" 

******

*






* update 2020-05-07 20200507

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-07_v1.csv.zip 2020-05-07_v1.csv.zip
unzipfile 2020-05-07_v1.csv.zip, replace
erase 2020-05-07_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-07_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200507

qui compress 

save "IMPE 20200507.dta", replace


shell rm -r "2020-05-07_v1.csv" 

******

*






* update 2020-05-08 20200508

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-08_v1.csv.zip 2020-05-08_v1.csv.zip
unzipfile 2020-05-08_v1.csv.zip, replace
erase 2020-05-08_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-08_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200508

qui compress 

save "IMPE 20200508.dta", replace


shell rm -r "2020-05-08_v1.csv" 

******

*






* update 2020-05-09 20200509

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-09_v1.csv.zip 2020-05-09_v1.csv.zip
unzipfile 2020-05-09_v1.csv.zip, replace
erase 2020-05-09_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-09_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200509

qui compress 

save "IMPE 20200509.dta", replace


shell rm -r "2020-05-09_v1.csv" 

******

*







* update 2020-05-10 20200510

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-10_v1.csv.zip 2020-05-10_v1.csv.zip
unzipfile 2020-05-10_v1.csv.zip, replace
erase 2020-05-10_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-10_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200510

qui compress 

save "IMPE 20200510.dta", replace


shell rm -r "2020-05-10_v1.csv" 

******

*






* update 2020-05-11 20200511

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-11_v1.csv.zip 2020-05-11_v1.csv.zip
unzipfile 2020-05-11_v1.csv.zip, replace
erase 2020-05-11_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-11_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200511

qui compress 

save "IMPE 20200511.dta", replace


shell rm -r "2020-05-11_v1.csv" 

******

*






* update 2020-05-12 20200512

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-12_v1.csv.zip 2020-05-12_v1.csv.zip
unzipfile 2020-05-12_v1.csv.zip, replace
erase 2020-05-12_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-12_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200512

qui compress 

save "IMPE 20200512.dta", replace


shell rm -r "2020-05-12_v1.csv" 

******

*






* update 2020-05-13 20200513

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-13_v1.csv.zip 2020-05-13_v1.csv.zip
unzipfile 2020-05-13_v1.csv.zip, replace
erase 2020-05-13_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-13_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200513

qui compress 

save "IMPE 20200513.dta", replace


shell rm -r "2020-05-13_v1.csv" 

******

*





* update 2020-05-14 20200514

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-14_v1.csv.zip 2020-05-14_v1.csv.zip
unzipfile 2020-05-14_v1.csv.zip, replace
erase 2020-05-14_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-14_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200514

qui compress 

save "IMPE 20200514.dta", replace


shell rm -r "2020-05-14_v1.csv" 

******

*





* update 2020-05-15 20200515

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-15_v1.csv.zip 2020-05-15_v1.csv.zip
unzipfile 2020-05-15_v1.csv.zip, replace
erase 2020-05-15_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-15_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200515

qui compress 

save "IMPE 20200515.dta", replace


shell rm -r "2020-05-15_v1.csv" 

******

*





* update 2020-05-16 20200516

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-16_v1.csv.zip 2020-05-16_v1.csv.zip
unzipfile 2020-05-16_v1.csv.zip, replace
erase 2020-05-16_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-16_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200516

qui compress 

save "IMPE 20200516.dta", replace


shell rm -r "2020-05-16_v1.csv" 

******

*





* update 2020-05-17 20200517

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-17_v1.csv.zip 2020-05-17_v1.csv.zip
unzipfile 2020-05-17_v1.csv.zip, replace
erase 2020-05-17_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-17_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200517

qui compress 

save "IMPE 20200517.dta", replace


shell rm -r "2020-05-17_v1.csv" 

******

*





* update 2020-05-19 20200519

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-19_v1.csv.zip 2020-05-19_v1.csv.zip
unzipfile 2020-05-19_v1.csv.zip, replace
erase 2020-05-19_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-19_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200519

qui compress 

save "IMPE 20200519.dta", replace


shell rm -r "2020-05-19_v1.csv" 

******

*







* update 2020-05-20 20200520

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-20_v1.csv.zip 2020-05-20_v1.csv.zip
unzipfile 2020-05-20_v1.csv.zip, replace
erase 2020-05-20_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-20_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200520

qui compress 

save "IMPE 20200520.dta", replace


shell rm -r "2020-05-20_v1.csv" 

******

*





* update 2020-05-21 20200521

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-21_v1.csv.zip 2020-05-21_v1.csv.zip
unzipfile 2020-05-21_v1.csv.zip, replace
erase 2020-05-21_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-21_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200521

qui compress 

save "IMPE 20200521.dta", replace


shell rm -r "2020-05-21_v1.csv" 

******

*




* update 2020-05-22 20200522

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-22_v1.csv.zip 2020-05-22_v1.csv.zip
unzipfile 2020-05-22_v1.csv.zip, replace
erase 2020-05-22_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-22_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200522

qui compress 

save "IMPE 20200522.dta", replace


shell rm -r "2020-05-22_v1.csv" 

******

*






* update 2020-05-23 20200523

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-23_v1.csv.zip 2020-05-23_v1.csv.zip
unzipfile 2020-05-23_v1.csv.zip, replace
erase 2020-05-23_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-23_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200523

qui compress 

save "IMPE 20200523.dta", replace


shell rm -r "2020-05-23_v1.csv" 

******

*






* update 2020-05-24 20200524

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-24_v1.csv.zip 2020-05-24_v1.csv.zip
unzipfile 2020-05-24_v1.csv.zip, replace
erase 2020-05-24_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-24_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200524

qui compress 

save "IMPE 20200524.dta", replace


shell rm -r "2020-05-24_v1.csv" 

******

*






* update 2020-05-25 20200525

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-25_v1.csv.zip 2020-05-25_v1.csv.zip
unzipfile 2020-05-25_v1.csv.zip, replace
erase 2020-05-25_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-25_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200525

qui compress 

save "IMPE 20200525.dta", replace


shell rm -r "2020-05-25_v1.csv" 

******

*






* update 2020-05-26 20200526

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-26_v1.csv.zip 2020-05-26_v1.csv.zip
unzipfile 2020-05-26_v1.csv.zip, replace
erase 2020-05-26_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-26_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200526

qui compress 

save "IMPE 20200526.dta", replace


shell rm -r "2020-05-26_v1.csv" 

******

*





* update 2020-05-27 20200527

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-27_v1.csv.zip 2020-05-27_v1.csv.zip
unzipfile 2020-05-27_v1.csv.zip, replace
erase 2020-05-27_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-27_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200527

qui compress 

save "IMPE 20200527.dta", replace


shell rm -r "2020-05-27_v1.csv" 

******

*






* update 2020-05-28 20200528

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-28_v1.csv.zip 2020-05-28_v1.csv.zip
unzipfile 2020-05-28_v1.csv.zip, replace
erase 2020-05-28_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-28_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200528

qui compress 

save "IMPE 20200528.dta", replace


shell rm -r "2020-05-28_v1.csv" 

******

*





* update 2020-05-29 20200529

******************************



* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-29_v1.csv.zip 2020-05-29_v1.csv.zip
unzipfile 2020-05-29_v1.csv.zip, replace
erase 2020-05-29_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-29_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200529

qui compress 

save "IMPE 20200529.dta", replace


shell rm -r "2020-05-29_v1.csv" 

******

*








* update 2020-05-30 20200530

******************************



* get csv file 

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-30_v1.csv.zip 2020-05-30_v1.csv.zip
unzipfile 2020-05-30_v1.csv.zip, replace
erase 2020-05-30_v1.csv.zip


 
******************************

* import csv file

import delimited "2020-05-30_v1.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200530

qui compress 

save "IMPE 20200530.dta", replace


shell rm -r "2020-05-30_v1.csv" 

******

*







* update 2020-05-31 20200531

******************************



* get csv file 

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-05-31_v2.csv.zip 2020-05-31_v2.csv.zip
unzipfile 2020-05-31_v2.csv.zip, replace
erase 2020-05-31_v2.csv.zip


 
******************************

* import csv file

import delimited "2020-05-31_v2.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200531

qui compress 

save "IMPE 20200531.dta", replace


shell rm -r "2020-05-31_v2.csv" 

******

*







* update 2020-06-01 20200601

******************************



* get csv file 

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-01_v2.csv.zip 2020-06-01_v2.csv.zip
unzipfile 2020-06-01_v2.csv.zip, replace
erase 2020-06-01_v2.csv.zip


 
******************************

* import csv file

import delimited "2020-06-01_v2.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200601

qui compress 

save "IMPE 20200601.dta", replace


shell rm -r "2020-06-01_v2.csv" 

******

*






* update 2020-06-02 20200602

******************************



* get csv file 

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-02_v2.csv.zip 2020-06-02_v2.csv.zip
unzipfile 2020-06-02_v2.csv.zip, replace
erase 2020-06-02_v2.csv.zip


 
******************************

* import csv file

import delimited "2020-06-02_v2.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200602

qui compress 

save "IMPE 20200602.dta", replace


shell rm -r "2020-06-02_v2.csv" 

******

*







* update 2020-06-03 20200603

******************************



* get csv file 

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-03_v2.csv.zip 2020-06-03_v2.csv.zip
unzipfile 2020-06-03_v2.csv.zip, replace
erase 2020-06-03_v2.csv.zip


 
******************************

* import csv file

import delimited "2020-06-03_v2.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200603

qui compress 

save "IMPE 20200603.dta", replace


shell rm -r "2020-06-03_v2.csv" 

******

*






* update 2020-06-04 20200604

******************************



* get csv file 

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-04_v2.csv.zip 2020-06-04_v2.csv.zip
unzipfile 2020-06-04_v2.csv.zip, replace
erase 2020-06-04_v2.csv.zip


 
******************************

* import csv file

import delimited "2020-06-04_v2.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200604

qui compress 

save "IMPE 20200604.dta", replace


shell rm -r "2020-06-04_v2.csv" 

******

*






* update 2020-06-06 20200606

******************************



* get csv file 

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-06_v2.csv.zip 2020-06-06_v2.csv.zip
unzipfile 2020-06-06_v2.csv.zip, replace
erase 2020-06-06_v2.csv.zip


 
******************************

* import csv file

import delimited "2020-06-06_v2.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200606

qui compress 

save "IMPE 20200606.dta", replace


shell rm -r "2020-06-06_v2.csv" 

******

*





* update 2020-06-09 20200609

******************************



* get csv file 

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-09_v2.csv.zip 2020-06-09_v2.csv.zip
unzipfile 2020-06-09_v2.csv.zip, replace
erase 2020-06-09_v2.csv.zip


 
******************************

* import csv file

import delimited "2020-06-09_v2.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200609

qui compress 

save "IMPE 20200609.dta", replace


shell rm -r "2020-06-09_v2.csv" 

******

*







* update 2020-06-14 20200614

******************************


* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-14_v4.csv.zip 2020-06-14_v4.csv.zip
unzipfile 2020-06-14_v4.csv.zip, replace
erase 2020-06-14_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-06-14_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200614

qui compress 

save "IMPE 20200614.dta", replace


shell rm -r "2020-06-14_v4.csv" 

******

*




 
* update 2020-06-16 20200616

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-16_v4.csv.zip 2020-06-16_v4.csv.zip
unzipfile 2020-06-16_v4.csv.zip, replace
erase 2020-06-16_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-06-16_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200616

qui compress 

save "IMPE 20200616.dta", replace


shell rm -r "2020-06-16_v4.csv" 

******

*





*

* update 2020-06-19 20200619

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-19_v4.csv.zip 2020-06-19_v4.csv.zip
unzipfile 2020-06-19_v4.csv.zip, replace
erase 2020-06-19_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-06-19_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200619

qui compress 

save "IMPE 20200619.dta", replace


shell rm -r "2020-06-19_v4.csv" 

******

*





*

* update 2020-06-21 20200621

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-21_v4.csv.zip 2020-06-21_v4.csv.zip
unzipfile 2020-06-21_v4.csv.zip, replace
erase 2020-06-21_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-06-21_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200621

qui compress 

save "IMPE 20200621.dta", replace


shell rm -r "2020-06-21_v4.csv.zip" 

******

*








*

* update 2020-06-23 20200623

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-23_v4.csv.zip 2020-06-23_v4.csv.zip
unzipfile 2020-06-23_v4.csv.zip, replace
erase 2020-06-23_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-06-23_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200623

qui compress 

save "IMPE 20200623.dta", replace


shell rm -r "2020-06-23_v4.csv" 

******







*

* update 2020-06-26 20200626

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-26_v4.csv.zip 2020-06-26_v4.csv.zip
unzipfile 2020-06-26_v4.csv.zip, replace
erase 2020-06-26_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-06-26_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200626

qui compress 

save "IMPE 20200626.dta", replace


shell rm -r "2020-06-26_v4.csv.zip" 

******

*








*

* update 2020-06-28 20200628

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-28_v4.csv.zip 2020-06-28_v4.csv.zip
unzipfile 2020-06-28_v4.csv.zip, replace
erase 2020-06-28_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-06-28_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200628

qui compress 

save "IMPE 20200628.dta", replace


shell rm -r "2020-06-28_v4.csv.zip" 

******

*











* update 2020-07-02 20200702

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-02_v4.csv.zip 2020-07-02_v4.csv.zip
unzipfile 2020-07-02_v4.csv.zip, replace
erase 2020-07-02_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-02_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200702

qui compress 

save "IMPE 20200702.dta", replace


shell rm -r "2020-07-02_v4.csv" 

******



* update 2020-07-03 20200703

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-03_v4.csv.zip 2020-07-03_v4.csv.zip
unzipfile 2020-07-03_v4.csv.zip, replace
erase 2020-07-03_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-03_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200703

qui compress 

save "IMPE 20200703.dta", replace


shell rm -r "2020-07-03_v4.csv" 

******



* update 2020-07-04 20200704

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-04_v4.csv.zip 2020-07-04_v4.csv.zip
unzipfile 2020-07-04_v4.csv.zip, replace
erase 2020-07-04_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-04_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200704

qui compress 

save "IMPE 20200704.dta", replace


shell rm -r "2020-07-04_v4.csv" 

******



* update 2020-07-07 20200707

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-07_v4.csv.zip 2020-07-07_v4.csv.zip
unzipfile 2020-07-07_v4.csv.zip, replace
erase 2020-07-07_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-07_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200707

qui compress 

save "IMPE 20200707.dta", replace


shell rm -r "2020-07-04.csv" 

******



* update 2020-07-11 20200711

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-11_v4.csv.zip 2020-07-11_v4.csv.zip
unzipfile 2020-07-11_v4.csv.zip, replace
erase 2020-07-11_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-11_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200711

qui compress 

save "IMPE 20200711.dta", replace


shell rm -r "2020-07-11_v4.csv" 

******



* update 2020-07-14 20200714

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-14_v4.csv.zip 2020-07-14_v4.csv.zip
unzipfile 2020-07-14_v4.csv.zip, replace
erase 2020-07-14_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-14_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200714

qui compress 

save "IMPE 20200714.dta", replace


shell rm -r "2020-07-14_v4.csv" 

******



* update 2020-07-15 20200715

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-15_v4.csv.zip 2020-07-15_v4.csv.zip
unzipfile 2020-07-15_v4.csv.zip, replace
erase 2020-07-15_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-15_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200715

qui compress 

save "IMPE 20200715.dta", replace


shell rm -r "2020-07-15_v4.csv" 

******



* update 2020-07-18 20200718

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-18_v4.csv.zip 2020-07-18_v4.csv.zip
unzipfile 2020-07-18_v4.csv.zip, replace
erase 2020-07-18_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-18_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200718

qui compress 

save "IMPE 20200718.dta", replace


shell rm -r "2020-07-18_v4.csv" 

******



* update 2020-07-20 20200720

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-20_v4.csv.zip 2020-07-20_v4.csv.zip
unzipfile 2020-07-20_v4.csv.zip, replace
erase 2020-07-20_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-20_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200720

qui compress 

save "IMPE 20200720.dta", replace


shell rm -r "2020-07-20_v4.csv" 

******



* update 2020-07-22 20200722

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-22_v4.csv.zip 2020-07-22_v4.csv.zip
unzipfile 2020-07-22_v4.csv.zip, replace
erase 2020-07-22_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-22_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200722

qui compress 

save "IMPE 20200722.dta", replace


shell rm -r "2020-07-22_v4.csv" 

******



* update 2020-07-25 20200725

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-25_v4.csv.zip 2020-07-25_v4.csv.zip
unzipfile 2020-07-25_v4.csv.zip, replace
erase 2020-07-25_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-25_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200725

qui compress 

save "IMPE 20200725.dta", replace


shell rm -r "2020-07-25_v4.csv" 

******



* update 2020-07-27 20200727

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-27_v4.csv.zip 2020-07-27_v4.csv.zip
unzipfile 2020-07-27_v4.csv.zip, replace
erase 2020-07-27_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-27_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200727

qui compress 

save "IMPE 20200727.dta", replace


shell rm -r "2020-07-27_v4.csv" 

******



* update 2020-07-31 20200731

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-07-31_v4.csv.zip 2020-07-31_v4.csv.zip
unzipfile 2020-07-31_v4.csv.zip, replace
erase 2020-07-31_v4.csv.zip


 
******************************

* import csv file

import delimited "2020-07-31_v4.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200731

qui compress 

save "IMPE 20200731.dta", replace


shell rm -r "2020-07-31_v4.csv" 

******



* update 2020-08-08 20200808

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-08-08_v5.csv.zip 2020-08-08_v5.csv.zip
unzipfile 2020-08-08_v5.csv.zip, replace
erase 2020-08-08_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-08-08_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200808

qui compress 

save "IMPE 20200808.dta", replace


shell rm -r "2020-08-08_v5.csv" 

******



* update 2020-08-10 20200810

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-08-10_v5.csv.zip 2020-08-10_v5.csv.zip
unzipfile 2020-08-10_v5.csv.zip, replace
erase 2020-08-10_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-08-10_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200810

qui compress 

save "IMPE 20200810.dta", replace


shell rm -r "2020-08-10_v5.csv" 

******



* update 2020-08-11 20200811

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-08-11_v5.csv.zip 2020-08-11_v5.csv.zip
unzipfile 2020-08-11_v5.csv.zip, replace
erase 2020-08-11_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-08-11_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200811

qui compress 

save "IMPE 20200811.dta", replace


shell rm -r "2020-08-11_v5.csv" 

******



* update 2020-08-13 20200813

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-08-13_v5.csv.zip 2020-08-13_v5.csv.zip
unzipfile 2020-08-13_v5.csv.zip, replace
erase 2020-08-13_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-08-13_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200813

qui compress 

save "IMPE 20200813.dta", replace


shell rm -r "2020-08-13_v5.csv" 

******



* update 2020-08-14 20200814

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-08-14_v5.csv.zip 2020-08-14_v5.csv.zip
unzipfile 2020-08-14_v5.csv.zip, replace
erase 2020-08-14_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-08-14_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200814

qui compress 

save "IMPE 20200814.dta", replace


shell rm -r "2020-08-14_v5.csv" 

******



* update 2020-08-17 20200817

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-08-17_v5.csv.zip 2020-08-17_v5.csv.zip
unzipfile 2020-08-17_v5.csv.zip, replace
erase 2020-08-17_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-08-17_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200817

qui compress 

save "IMPE 20200817.dta", replace


shell rm -r "2020-08-17_v5.csv" 

******



* update 2020-08-23 20200823

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-08-23_v5.csv.zip 2020-08-23_v5.csv.zip
unzipfile 2020-08-23_v5.csv.zip, replace
erase 2020-08-23_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-08-23_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200823

qui compress 

save "IMPE 20200823.dta", replace


shell rm -r "2020-08-23_v5.csv" 

******



* update 2020-08-25 20200825

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-08-25_v5.csv.zip 2020-08-25_v5.csv.zip
unzipfile 2020-08-25_v5.csv.zip, replace
erase 2020-08-25_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-08-25_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200825

qui compress 

save "IMPE 20200825.dta", replace


shell rm -r "2020-08-25_v5.csv" 

******



* update 2020-08-27 20200827

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-08-27_v5.csv.zip 2020-08-27_v5.csv.zip
unzipfile 2020-08-27_v5.csv.zip, replace
erase 2020-08-27_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-08-27_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200827

qui compress 

save "IMPE 20200827.dta", replace


shell rm -r "2020-08-27_v5.csv" 

******



* update 2020-08-31 20200831

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-08-31_v5.csv.zip 2020-08-31_v5.csv.zip
unzipfile 2020-08-31_v5.csv.zip, replace
erase 2020-08-31_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-08-31_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200831

qui compress 

save "IMPE 20200831.dta", replace


shell rm -r "2020-08-31_v5.csv" 

******



* update 2020-09-02 20200902

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-09-02_v5.csv.zip 2020-09-02_v5.csv.zip
unzipfile 2020-09-02_v5.csv.zip, replace
erase 2020-09-02_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-09-02_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200902

qui compress 

save "IMPE 20200902.dta", replace


shell rm -r "2020-09-02_v5.csv" 

******



* update 2020-09-06 20200906

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-09-06_v5.csv.zip 2020-09-06_v5.csv.zip
unzipfile 2020-09-06_v5.csv.zip, replace
erase 2020-09-06_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-09-06_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200906

qui compress 

save "IMPE 20200906.dta", replace


shell rm -r "2020-09-06_v5.csv" 

******



* update 2020-09-08 20200908

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-09-08_v5.csv.zip 2020-09-08_v5.csv.zip
unzipfile 2020-09-08_v5.csv.zip, replace
erase 2020-09-08_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-09-08_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200908

qui compress 

save "IMPE 20200908.dta", replace


shell rm -r "2020-09-08_v5.csv" 

******



* update 2020-09-12 20200912

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-09-12_v5.csv.zip 2020-09-12_v5.csv.zip
unzipfile 2020-09-12_v5.csv.zip, replace
erase 2020-09-12_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-09-12_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200912

qui compress 

save "IMPE 20200912.dta", replace


shell rm -r "2020-09-12_v5.csv" 

******



* update 2020-09-15 20200915

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-09-15_v5.csv.zip 2020-09-15_v5.csv.zip
unzipfile 2020-09-15_v5.csv.zip, replace
erase 2020-09-15_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-09-15_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200915

qui compress 

save "IMPE 20200915.dta", replace


shell rm -r "2020-09-15_v5.csv" 

******



* update 2020-09-19 20200919

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-09-19_v5.csv.zip 2020-09-19_v5.csv.zip
unzipfile 2020-09-19_v5.csv.zip, replace
erase 2020-09-19_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-09-19_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200919

qui compress 

save "IMPE 20200919.dta", replace


shell rm -r "2020-09-19_v5.csv" 

******



* update 2020-09-23 20200923

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-09-23_v5.csv.zip 2020-09-23_v5.csv.zip
unzipfile 2020-09-23_v5.csv.zip, replace
erase 2020-09-23_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-09-23_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200923

qui compress 

save "IMPE 20200923.dta", replace


shell rm -r "2020-09-23_v5.csv" 

******



* update 2020-09-25 20200925

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-09-25_v5.csv.zip 2020-09-25_v5.csv.zip
unzipfile 2020-09-25_v5.csv.zip, replace
erase 2020-09-25_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-09-25_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20200925

qui compress 

save "IMPE 20200925.dta", replace


shell rm -r "2020-09-25_v5.csv" 

******



* update 2020-10-03 20201003

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-10-03_v5.csv.zip 2020-10-03_v5.csv.zip
unzipfile 2020-10-03_v5.csv.zip, replace
erase 2020-10-03_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-10-03_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201003

qui compress 

save "IMPE 20201003.dta", replace


shell rm -r "2020-10-03_v5.csv" 

******



* update 2020-10-06 20201006

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-10-06_v5.csv.zip 2020-10-06_v5.csv.zip
unzipfile 2020-10-06_v5.csv.zip, replace
erase 2020-10-06_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-10-06_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201006

qui compress 

save "IMPE 20201006.dta", replace


shell rm -r "2020-10-06_v5.csv" 

******



* update 2020-10-12 20201012

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-10-12_v5.csv.zip 2020-10-12_v5.csv.zip
unzipfile 2020-10-12_v5.csv.zip, replace
erase 2020-10-12_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-10-12_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201012

qui compress 

save "IMPE 20201012.dta", replace


shell rm -r "2020-10-12_v5.csv" 

******



* update 2020-10-19 20201019

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-10-19_v5.csv.zip 2020-10-19_v5.csv.zip
unzipfile 2020-10-19_v5.csv.zip, replace
erase 2020-10-19_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-10-19_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201019

qui compress 

save "IMPE 20201019.dta", replace


shell rm -r "2020-10-19_v5.csv" 

******



* update 2020-10-25 20201025

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-10-25_v5.csv.zip 2020-10-25_v5.csv.zip
unzipfile 2020-10-25_v5.csv.zip, replace
erase 2020-10-25_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-10-25_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201025

qui compress 

save "IMPE 20201025.dta", replace


shell rm -r "2020-10-25_v5.csv" 

******



* update 2020-10-28 20201028

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-10-28_v5.csv.zip 2020-10-28_v5.csv.zip
unzipfile 2020-10-28_v5.csv.zip, replace
erase 2020-10-28_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-10-28_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201028

qui compress 

save "IMPE 20201028.dta", replace


shell rm -r "2020-10-28_v5.csv" 

******



* update 2020-11-01 20201101

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-11-01_v5.csv.zip 2020-11-01_v5.csv.zip
unzipfile 2020-11-01_v5.csv.zip, replace
erase 2020-11-01_v5.csv.zip


 
******************************

* import csv file

import delimited "2020-11-01_v5.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201101

qui compress 

save "IMPE 20201101.dta", replace


shell rm -r "2020-11-01_v5.csv" 

******



* update 2020-11-10 20201110

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-11-10_v6.csv.zip 2020-11-10_v6.csv.zip
unzipfile 2020-11-10_v6.csv.zip, replace
erase 2020-11-10_v6.csv.zip


 
******************************

* import csv file

import delimited "2020-11-10_v6.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201110

qui compress 

save "IMPE 20201110.dta", replace


shell rm -r "2020-11-10_v6.csv" 

******



* update 2020-11-14 20201114

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-11-14_v6.csv.zip 2020-11-14_v6.csv.zip
unzipfile 2020-11-14_v6.csv.zip, replace
erase 2020-11-14_v6.csv.zip


 
******************************

* import csv file

import delimited "2020-11-14_v6.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201114

qui compress 

save "IMPE 20201114.dta", replace


shell rm -r "2020-11-14_v6.csv" 

******



* update 2020-11-18 20201118

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-11-18_v6.csv.zip 2020-11-18_v6.csv.zip
unzipfile 2020-11-18_v6.csv.zip, replace
erase 2020-11-18_v6.csv.zip


 
******************************

* import csv file

import delimited "2020-11-18_v6.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201118

qui compress 

save "IMPE 20201118.dta", replace


shell rm -r "2020-11-18_v6.csv" 

******



* update 2020-11-23 20201123

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-11-23_v6.csv.zip 2020-11-23_v6.csv.zip
unzipfile 2020-11-23_v6.csv.zip, replace
erase 2020-11-23_v6.csv.zip


 
******************************

* import csv file

import delimited "2020-11-23_v6.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201123

qui compress 

save "IMPE 20201123.dta", replace


shell rm -r "2020-11-23_v6.csv" 

******



* update 2020-11-29 20201129

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-11-29_v6.csv.zip 2020-11-29_v6.csv.zip
unzipfile 2020-11-29_v6.csv.zip, replace
erase 2020-11-29_v6.csv.zip


 
******************************

* import csv file

import delimited "2020-11-29_v6.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201129

qui compress 

save "IMPE 20201129.dta", replace


shell rm -r "2020-11-29_v6.csv" 

******



* update 2020-12-04 20201204

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-12-04_v6.csv.zip 2020-12-04_v6.csv.zip
unzipfile 2020-12-04_v6.csv.zip, replace
erase 2020-12-04_v6.csv.zip


 
******************************

* import csv file

import delimited "2020-12-04_v6.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201204

qui compress 

save "IMPE 20201204.dta", replace


shell rm -r "2020-12-04_v6.csv" 

******



* update 2020-12-12 20201212

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-12-12_v6.csv.zip 2020-12-12_v6.csv.zip
unzipfile 2020-12-12_v6.csv.zip, replace
erase 2020-12-12_v6.csv.zip


 
******************************

* import csv file

import delimited "2020-12-12_v6.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201212

qui compress 

save "IMPE 20201212.dta", replace


shell rm -r "2020-12-12_v6.csv" 

******



* update 2020-12-20 20201220

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-12-20_v6.csv.zip 2020-12-20_v6.csv.zip
unzipfile 2020-12-20_v6.csv.zip, replace
erase 2020-12-20_v6.csv.zip


 
******************************

* import csv file

import delimited "2020-12-20_v6.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201220

qui compress 

save "IMPE 20201220.dta", replace


shell rm -r "2020-12-20_v6.csv" 

******



* update 2020-12-26 20201226

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-12-26_v6.csv.zip 2020-12-26_v6.csv.zip
unzipfile 2020-12-26_v6.csv.zip, replace
erase 2020-12-26_v6.csv.zip


 
******************************

* import csv file

import delimited "2020-12-26_v6.csv", clear varnames(1) 



keep if scenario == "Maintain Status Quo"

drop scenario

keep if compartment == "deaths"

drop compartment

drop y_025 y_25 y_median y_75 y_975 // keeps y_mean




* gen date 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


rename country loc_grand_name 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20201226

qui compress 

save "IMPE 20201226.dta", replace


shell rm -r "2020-12-26_v6.csv" 

******






*

view "log CovidLongitudinal IMPE 1.smcl"

log close

