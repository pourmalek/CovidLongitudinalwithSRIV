
clear all

cd "$pathCovidLongitudinal"

cd IMPE

capture log close 

log using "log CovidLongitudinal IMPE 1a.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE 1a.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* download estimates files - part 1 of 2 - 2020 (from 2020 and 2021)
* input data files: csv files on web site
* output data files: "IMPE `update'.dta" 




/*

94 updates (2020 and 2021)


copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2020-06-14_v4.csv.zip 2020-06-14_v4.csv.zip

list1 ///
2020-06-14_v4.csv.zip
2020-06-16_v4.csv.zip ///
2020-06-19_v4.csv.zip ///
2020-06-23_v4.csv.zip ///
2020-07-02_v4.csv.zip ///
2020-07-03_v4.csv.zip ///
2020-07-04_v4.csv.zip ///
2020-07-07_v4.csv.zip ///
2020-07-11_v4.csv.zip ///
2020-07-14_v4.csv.zip ///
2020-07-15_v4.csv.zip ///
2020-07-18_v4.csv.zip ///
2020-07-20_v4.csv.zip ///
2020-07-22_v4.csv.zip ///
2020-07-25_v4.csv.zip ///
2020-07-27_v4.csv.zip ///
2020-07-31_v4.csv.zip ///
2020-08-08_v5.csv.zip ///
2020-08-10_v5.csv.zip ///
2020-08-11_v5.csv.zip ///
2020-08-13_v5.csv.zip ///
2020-08-14_v5.csv.zip ///
2020-08-17_v5.csv.zip ///
2020-08-23_v5.csv.zip ///
2020-08-25_v5.csv.zip ///
2020-08-27_v5.csv.zip ///
2020-08-31_v5.csv.zip ///
2020-09-02_v5.csv.zip ///
2020-09-06_v5.csv.zip ///
2020-09-08_v5.csv.zip ///
2020-09-12_v5.csv.zip ///
2020-09-15_v5.csv.zip ///
2020-09-19_v5.csv.zip ///
2020-09-23_v5.csv.zip ///
2020-09-25_v5.csv.zip ///
2020-10-03_v5.csv.zip ///
2020-10-06_v5.csv.zip ///
2020-10-12_v5.csv.zip ///
2020-10-19_v5.csv.zip ///
2020-10-25_v5.csv.zip ///
2020-10-28_v5.csv.zip ///
2020-11-01_v5.csv.zip ///
2020-11-10_v6.csv.zip ///
2020-11-14_v6.csv.zip ///
2020-11-18_v6.csv.zip ///
2020-11-23_v6.csv.zip ///
2020-11-29_v6.csv.zip ///
2020-12-04_v6.csv.zip ///
2020-12-12_v6.csv.zip ///
2020-12-20_v6.csv.zip ///
2020-12-26_v6.csv.zip ///

2021-01-04_v6.csv.zip ///
2021-01-10_v6.csv.zip ///
2021-01-12_v6.csv.zip ///
2021-01-18_v7.csv.zip ///
2021-01-24_v7.csv.zip ///
2021-01-30_v7.csv.zip ///
2021-02-03_v7.csv.zip ///
2021-02-10_v7.csv.zip ///
2021-02-17_v7.csv.zip ///
2021-02-26_v7.csv.zip ///
2021-03-05_v7.csv.zip ///
2021-03-12_v7.csv.zip ///
2021-03-19_v7.csv.zip ///
2021-03-29_v7.csv.zip ///
2021-04-06_v7.csv.zip ///
2021-04-17_v7.csv.zip ///
2021-04-24_v7.csv.zip ///
2021-05-10_v8.csv.zip ///
2021-05-16_v8.csv.zip ///
2021-05-22_v8.csv.zip ///
2021-05-27_v8.csv.zip ///
2021-06-04_v8.csv.zip ///
2021-06-11_v8.csv.zip ///
2021-06-18_v8.csv.zip ///
2021-06-26_v8.csv.zip ///
2021-07-02_v8.csv.zip ///
2021-07-09_v8.csv.zip ///
2021-07-19_v8.csv.zip ///
2021-08-06_v8.csv.zip ///
2021-08-19_v8.csv.zip ///
2021-08-25_v8.csv.zip ///
2021-09-09_v8.csv.zip ///
2021-09-24_v8.csv.zip ///
2021-10-06_v8.csv.zip ///
2021-10-21_v8.csv.zip ///
2021-10-27_v8.csv.zip ///
2021-11-03_v9.csv.zip ///
2021-11-15_v9.csv.zip ///
2021-11-21_v9.csv.zip ///
2021-11-29_v9.csv.zip ///
2021-12-05_v9.csv.zip ///
2021-12-13_v9.csv.zip ///
2021-12-26_v9.csv.zip 


*/


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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200614

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200616

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200619

qui compress 

save "IMPE 20200619.dta", replace


shell rm -r "2020-06-19_v4.csv" 

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200623

qui compress 

save "IMPE 20200623.dta", replace


shell rm -r "2020-06-23_v4.csv" 

******



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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200702

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200703

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200704

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200707

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200711

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200714

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200715

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200718

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200720

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200722

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200725

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200727

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200731

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200808

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200810

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200811

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200813

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200814

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200817

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200823

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200825

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200827

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200831

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200902

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200906

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200908

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200912

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200915

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200919

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200923

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320200925

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201003

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201006

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201012

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201019

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201025

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201028

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201101

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201110

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201114

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201118

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201123

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201129

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201204

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201212

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201220

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

keep if country == "$country"

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

rename y_mean DayDeaMeRaA03S02

order loc_grand_name date DayDeaMeRaA03S02

rename DayDeaMeRaA03S02 DayDeaMeRaA0320201226

qui compress 

save "IMPE 20201226.dta", replace


shell rm -r "2020-12-26_v6.csv" 

******






*

view "log CovidLongitudinal IMPE 1a.smcl"

log close

