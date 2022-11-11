
clear all

cd "$pathCovidLongitudinal/download/IMPE"

capture log close 

log using "log CovidLongitudinal IMPE 2.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE 2.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         

* Objective: Download estimates files for IMPE model, part 2 of 3                                                                   
***************************************************************************


* download estimates files - part 2 of 3 - 2021 (from 2020, 2021, 2022)
* input data files: csv files on web site
* output data files: "IMPE `update'.dta" 





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







* update 2021-01-04 20210104

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-01-04_v6.csv.zip 2021-01-04_v6.csv.zip
unzipfile 2021-01-04_v6.csv.zip, replace
erase 2021-01-04_v6.csv.zip


 
******************************

* import csv file

import delimited "2021-01-04_v6.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210104

qui compress 

save "IMPE 20210104.dta", replace


shell rm -r "2021-01-04_v6.csv" 

******





* update 2021-01-10 20210110

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-01-10_v6.csv.zip 2021-01-10_v6.csv.zip
unzipfile 2021-01-10_v6.csv.zip, replace
erase 2021-01-10_v6.csv.zip


 
******************************

* import csv file

import delimited "2021-01-10_v6.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210110

qui compress 

save "IMPE 20210110.dta", replace


shell rm -r "2021-01-10_v6.csv" 

******



* update 2021-01-12 20210112

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-01-12_v6.csv.zip 2021-01-12_v6.csv.zip
unzipfile 2021-01-12_v6.csv.zip, replace
erase 2021-01-12_v6.csv.zip


 
******************************

* import csv file

import delimited "2021-01-12_v6.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210112

qui compress 

save "IMPE 20210112.dta", replace


shell rm -r "2021-01-12_v6.csv" 

******



* update 2021-01-18 20210118

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-01-18_v7.csv.zip 2021-01-18_v7.csv.zip
unzipfile 2021-01-18_v7.csv.zip, replace
erase 2021-01-18_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-01-18_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210118

qui compress 

save "IMPE 20210118.dta", replace


shell rm -r "2021-01-18_v7.csv" 

******



* update 2021-01-24 20210124

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-01-24_v7.csv.zip 2021-01-24_v7.csv.zip
unzipfile 2021-01-24_v7.csv.zip, replace
erase 2021-01-24_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-01-24_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210124

qui compress 

save "IMPE 20210124.dta", replace


shell rm -r "2021-01-24_v7.csv" 

******



* update 2021-01-30 20210130

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-01-30_v7.csv.zip 2021-01-30_v7.csv.zip
unzipfile 2021-01-30_v7.csv.zip, replace
erase 2021-01-30_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-01-30_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210130

qui compress 

save "IMPE 20210130.dta", replace


shell rm -r "2021-01-30_v7.csv" 

******



* update 2021-02-03 20210203

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-02-03_v7.csv.zip 2021-02-03_v7.csv.zip
unzipfile 2021-02-03_v7.csv.zip, replace
erase 2021-02-03_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-02-03_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210203

qui compress 

save "IMPE 20210203.dta", replace


shell rm -r "2021-02-03_v7.csv" 

******



* update 2021-02-10 20210210

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-02-10_v7.csv.zip 2021-02-10_v7.csv.zip
unzipfile 2021-02-10_v7.csv.zip, replace
erase 2021-02-10_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-02-10_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210210

qui compress 

save "IMPE 20210210.dta", replace


shell rm -r "2021-02-10_v7.csv" 

******






* update 2021-02-17 20210217

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-02-17_v7.csv.zip 2021-02-17_v7.csv.zip
unzipfile 2021-02-17_v7.csv.zip, replace
erase 2021-02-17_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-02-17_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210217

qui compress 

save "IMPE 20210217.dta", replace


shell rm -r "2021-02-17_v7.csv" 

******









* update 2021-02-26 20210226

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-02-26_v7.csv.zip 2021-02-26_v7.csv.zip
unzipfile 2021-02-26_v7.csv.zip, replace
erase 2021-02-26_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-02-26_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210226

qui compress 

save "IMPE 20210226.dta", replace


shell rm -r "2021-02-26_v7.csv" 

******



* update 2021-03-05 20210305

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-03-05_v7.csv.zip 2021-03-05_v7.csv.zip
unzipfile 2021-03-05_v7.csv.zip, replace
erase 2021-03-05_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-03-05_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210305

qui compress 

save "IMPE 20210305.dta", replace


shell rm -r "2021-03-05_v7.csv" 

******



* update 2021-03-12 20210312

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-03-12_v7.csv.zip 2021-03-12_v7.csv.zip
unzipfile 2021-03-12_v7.csv.zip, replace
erase 2021-03-12_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-03-12_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210312

qui compress 

save "IMPE 20210312.dta", replace


shell rm -r "2021-03-12_v7.csv" 

******



* update 2021-03-19 20210319

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-03-19_v7.csv.zip 2021-03-19_v7.csv.zip
unzipfile 2021-03-19_v7.csv.zip, replace
erase 2021-03-19_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-03-19_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210319

qui compress 

save "IMPE 20210319.dta", replace


shell rm -r "2021-03-19_v7.csv" 

******



* update 2021-03-29 20210329

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-03-29_v7.csv.zip 2021-03-29_v7.csv.zip
unzipfile 2021-03-29_v7.csv.zip, replace
erase 2021-03-29_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-03-29_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210329

qui compress 

save "IMPE 20210329.dta", replace


shell rm -r "2021-03-29_v7.csv" 

******



* update 2021-04-06 20210406

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-04-06_v7.csv.zip 2021-04-06_v7.csv.zip
unzipfile 2021-04-06_v7.csv.zip, replace
erase 2021-04-06_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-04-06_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210406

qui compress 

save "IMPE 20210406.dta", replace


shell rm -r "2021-04-06_v7.csv" 

******



* update 2021-04-17 20210417

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-04-17_v7.csv.zip 2021-04-17_v7.csv.zip
unzipfile 2021-04-17_v7.csv.zip, replace
erase 2021-04-17_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-04-17_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210417

qui compress 

save "IMPE 20210417.dta", replace


shell rm -r "2021-04-17_v7.csv" 

******



* update 2021-04-24 20210424

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-04-24_v7.csv.zip 2021-04-24_v7.csv.zip
unzipfile 2021-04-24_v7.csv.zip, replace
erase 2021-04-24_v7.csv.zip


 
******************************

* import csv file

import delimited "2021-04-24_v7.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210424

qui compress 

save "IMPE 20210424.dta", replace


shell rm -r "2021-04-24_v7.csv" 

******



* update 2021-05-10 20210510

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-05-10_v8.csv.zip 2021-05-10_v8.csv.zip
unzipfile 2021-05-10_v8.csv.zip, replace
erase 2021-05-10_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-05-10_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210510

qui compress 

save "IMPE 20210510.dta", replace


shell rm -r "2021-05-10_v8.csv" 

******



* update 2021-05-16 20210516

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-05-16_v8.csv.zip 2021-05-16_v8.csv.zip
unzipfile 2021-05-16_v8.csv.zip, replace
erase 2021-05-16_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-05-16_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210516

qui compress 

save "IMPE 20210516.dta", replace


shell rm -r "2021-05-16_v8.csv" 

******



* update 2021-05-22 20210522

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-05-22_v8.csv.zip 2021-05-22_v8.csv.zip
unzipfile 2021-05-22_v8.csv.zip, replace
erase 2021-05-22_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-05-22_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210522

qui compress 

save "IMPE 20210522.dta", replace


shell rm -r "2021-05-22_v8.csv" 

******



* update 2021-05-27 20210527

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-05-27_v8.csv.zip 2021-05-27_v8.csv.zip
unzipfile 2021-05-27_v8.csv.zip, replace
erase 2021-05-27_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-05-27_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210527

qui compress 

save "IMPE 20210527.dta", replace


shell rm -r "2021-05-27_v8.csv" 

******



* update 2021-06-04 20210604

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-06-04_v8.csv.zip 2021-06-04_v8.csv.zip
unzipfile 2021-06-04_v8.csv.zip, replace
erase 2021-06-04_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-06-04_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210604

qui compress 

save "IMPE 20210604.dta", replace


shell rm -r "2021-06-04_v8.csv" 

******



* update 2021-06-11 20210611

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-06-11_v8.csv.zip 2021-06-11_v8.csv.zip
unzipfile 2021-06-11_v8.csv.zip, replace
erase 2021-06-11_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-06-11_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210611

qui compress 

save "IMPE 20210611.dta", replace


shell rm -r "2021-06-11_v8.csv" 

******



* update 2021-06-18 20210618

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-06-18_v8.csv.zip 2021-06-18_v8.csv.zip
unzipfile 2021-06-18_v8.csv.zip, replace
erase 2021-06-18_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-06-18_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210618

qui compress 

save "IMPE 20210618.dta", replace


shell rm -r "2021-06-18_v8.csv" 

******



* update 2021-06-26 20210626

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-06-26_v8.csv.zip 2021-06-26_v8.csv.zip
unzipfile 2021-06-26_v8.csv.zip, replace
erase 2021-06-26_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-06-26_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210626

qui compress 

save "IMPE 20210626.dta", replace


shell rm -r "2021-06-26_v8.csv" 

******



* update 2021-07-02 20210702

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-07-02_v8.csv.zip 2021-07-02_v8.csv.zip
unzipfile 2021-07-02_v8.csv.zip, replace
erase 2021-07-02_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-07-02_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210702

qui compress 

save "IMPE 20210702.dta", replace


shell rm -r "2021-07-02_v8.csv" 

******



* update 2021-07-09 20210709

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-07-09_v8.csv.zip 2021-07-09_v8.csv.zip
unzipfile 2021-07-09_v8.csv.zip, replace
erase 2021-07-09_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-07-09_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210709

qui compress 

save "IMPE 20210709.dta", replace


shell rm -r "2021-07-09_v8.csv" 

******



* update 2021-07-19 20210719

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-07-19_v8.csv.zip 2021-07-19_v8.csv.zip
unzipfile 2021-07-19_v8.csv.zip, replace
erase 2021-07-19_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-07-19_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210719

qui compress 

save "IMPE 20210719.dta", replace


shell rm -r "2021-07-19_v8.csv" 

******



* update 2021-08-06 20210806

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-08-06_v8.csv.zip 2021-08-06_v8.csv.zip
unzipfile 2021-08-06_v8.csv.zip, replace
erase 2021-08-06_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-08-06_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210806

qui compress 

save "IMPE 20210806.dta", replace


shell rm -r "2021-08-06_v8.csv" 

******



* update 2021-08-19 20210819

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-08-19_v8.csv.zip 2021-08-19_v8.csv.zip
unzipfile 2021-08-19_v8.csv.zip, replace
erase 2021-08-19_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-08-19_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210819

qui compress 

save "IMPE 20210819.dta", replace


shell rm -r "2021-08-19_v8.csv" 

******



* update 2021-08-25 20210825

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-08-25_v8.csv.zip 2021-08-25_v8.csv.zip
unzipfile 2021-08-25_v8.csv.zip, replace
erase 2021-08-25_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-08-25_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210825

qui compress 

save "IMPE 20210825.dta", replace


shell rm -r "2021-08-25_v8.csv" 

******



* update 2021-09-09 20210909

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-09-09_v8.csv.zip 2021-09-09_v8.csv.zip
unzipfile 2021-09-09_v8.csv.zip, replace
erase 2021-09-09_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-09-09_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210909

qui compress 

save "IMPE 20210909.dta", replace


shell rm -r "2021-09-09_v8.csv" 

******



* update 2021-09-24 20210924

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-09-24_v8.csv.zip 2021-09-24_v8.csv.zip
unzipfile 2021-09-24_v8.csv.zip, replace
erase 2021-09-24_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-09-24_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20210924

qui compress 

save "IMPE 20210924.dta", replace


shell rm -r "2021-09-24_v8.csv" 

******



* update 2021-10-06 20211006

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-10-06_v8.csv.zip 2021-10-06_v8.csv.zip
unzipfile 2021-10-06_v8.csv.zip, replace
erase 2021-10-06_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-10-06_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20211006

qui compress 

save "IMPE 20211006.dta", replace


shell rm -r "2021-10-06_v8.csv" 

******



* update 2021-10-21 20211021

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-10-21_v8.csv.zip 2021-10-21_v8.csv.zip
unzipfile 2021-10-21_v8.csv.zip, replace
erase 2021-10-21_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-10-21_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20211021

qui compress 

save "IMPE 20211021.dta", replace


shell rm -r "2021-10-21_v8.csv" 

******



* update 2021-10-27 20211027

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-10-27_v8.csv.zip 2021-10-27_v8.csv.zip
unzipfile 2021-10-27_v8.csv.zip, replace
erase 2021-10-27_v8.csv.zip


 
******************************

* import csv file

import delimited "2021-10-27_v8.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20211027

qui compress 

save "IMPE 20211027.dta", replace


shell rm -r "2021-10-27_v8.csv" 

******




* update 2021-11-03 20211103

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-11-03_v9.csv.zip 2021-11-03_v9.csv.zip
unzipfile 2021-11-03_v9.csv.zip, replace
erase 2021-11-03_v9.csv.zip


 
******************************

* import csv file

import delimited "2021-11-03_v9.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20211103

qui compress 

save "IMPE 20211103.dta", replace


shell rm -r "2021-11-03_v9.csv" 

******



* update 2021-11-15 20211115

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-11-15_v9.csv.zip 2021-11-15_v9.csv.zip
unzipfile 2021-11-15_v9.csv.zip, replace
erase 2021-11-15_v9.csv.zip


 
******************************

* import csv file

import delimited "2021-11-15_v9.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20211115

qui compress 

save "IMPE 20211115.dta", replace


shell rm -r "2021-11-15_v9.csv" 

******



* update 2021-11-21 20211121

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-11-21_v9.csv.zip 2021-11-21_v9.csv.zip
unzipfile 2021-11-21_v9.csv.zip, replace
erase 2021-11-21_v9.csv.zip



 
******************************

* import csv file

import delimited "2021-11-21_v9.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20211121

qui compress 

save "IMPE 20211121.dta", replace


shell rm -r "2021-11-21_v9.csv" 

******




* update 2021-11-29 20211129

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-11-29_v9.csv.zip 2021-11-29_v9.csv.zip
unzipfile 2021-11-29_v9.csv.zip, replace
erase 2021-11-29_v9.csv.zip

 
******************************

* import csv file

import delimited "2021-11-29_v9.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20211129

qui compress 

save "IMPE 20211129.dta", replace


shell rm -r "2021-11-29_v9.csv" 

******






* update 2021-12-05 20211205

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-12-05_v9.csv.zip 2021-12-05_v9.csv.zip
unzipfile 2021-12-05_v9.csv.zip, replace
erase 2021-12-05_v9.csv.zip

 
******************************

* import csv file

import delimited "2021-12-05_v9.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20211205

qui compress 

save "IMPE 20211205.dta", replace


shell rm -r "2021-12-05_v9.csv" 

******




* update 2021-12-13 20211213

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-12-13_v9.csv.zip 2021-12-13_v9.csv.zip
unzipfile 2021-12-13_v9.csv.zip, replace
erase 2021-12-13_v9.csv.zip


 
******************************

* import csv file

import delimited "2021-12-13_v9.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20211213

qui compress 

save "IMPE 20211213.dta", replace


shell rm -r "2021-12-13_v9.csv" 

******




* update 2021-12-26 20211226

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2021-12-26_v9.csv.zip 2021-12-26_v9.csv.zip
unzipfile 2021-12-26_v9.csv.zip, replace
erase 2021-12-26_v9.csv.zip


 
******************************

* import csv file

import delimited "2021-12-26_v9.csv", clear varnames(1) 



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

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20211226

qui compress 

save "IMPE 20211226.dta", replace


shell rm -r "2021-12-26_v9.csv" 

******

*









*

view "log CovidLongitudinal IMPE 2.smcl"

log close


