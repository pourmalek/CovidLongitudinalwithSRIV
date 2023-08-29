
clear all

cd "$pathCovidLongitudinal/download/IMPE"

capture log close 

log using "log CovidLongitudinal IMPE 3.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE 3.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         

* Objective: Download estimates files for IMPE model, part 3 of 3                                                                   
***************************************************************************


* download estimates files - part 3 of 3 - 2022 (from 2020, 2021, 2022)
* input data files: csv files on web site
* output data files: "IMPE `update'.dta" 
*                    "IMPE countries.dta"
*                    "IMPE countries long.dta"


/*

An additional issue that will occur with downloading the IMPE estimates files:

Is described below. 

The more recent updates are stored on the following web page (ONE):

https://github.com/mrc-ide/global-lmic-reports/tree/master/data

And some of the older updates in the above web page are periodically moved (for backup) to the following web page (TWO):

https://mrcdata.dide.ic.ac.uk/global-lmic-reports/

Once some files are moved from the web page (TWO) to the web page (ONE), the Stata codes in
the Stata codes in the do file "$pathCovidLongitudinal/download/IMPE/do CovidLongitudinal IMPE 3.do" 
will need to be adapted for such changes of the web pages which store the IMPE model update files. 


*/



/*

* IMPE updates all 


*** web page (TWO): https://mrcdata.dide.ic.ac.uk/global-lmic-reports/ ***


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




*** web page (ONE): https://github.com/mrc-ide/global-lmic-reports/tree/master/data ***

copy https://raw.githubusercontent.com/mrc-ide/global-lmic-reports/master/data/2022-??-??_v*.csv.zip


2022-06-20_v9.csv.zip
2022-07-03_v9.csv.zip
2022-07-12_v9.csv.zip
2022-07-28_v9.csv.zip
2022-08-08_v9.csv.zip
2022-09-01_v10.csv.zip
2022-12-25_v10.csv.zip


*/








*

* update 2022-01-02 20220102

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2022-01-02_v9.csv.zip 2022-01-02_v9.csv.zip
unzipfile 2022-01-02_v9.csv.zip, replace
erase 2022-01-02_v9.csv.zip


 
******************************

* import csv file

import delimited "2022-01-02_v9.csv", clear varnames(1) 



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

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"

 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20220102

qui compress 

save "IMPE 20220102.dta", replace


shell rm -r "2022-01-02_v9.csv.zip" 

******

*










*

* update 2022-01-20 20220120

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2022-01-20_v9.csv.zip 2022-01-20_v9.csv.zip
unzipfile 2022-01-20_v9.csv.zip, replace
erase 2022-01-20_v9.csv.zip


 
******************************

* import csv file

import delimited "2022-01-20_v9.csv", clear varnames(1) 



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

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"

 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20220120

qui compress 

save "IMPE 20220120.dta", replace


shell rm -r "2022-01-20_v9.csv.zip" 

******

*









*

* update 2022-01-31 20220131

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2022-01-31_v9.csv.zip 2022-01-31_v9.csv.zip
unzipfile 2022-01-31_v9.csv.zip, replace
erase 2022-01-31_v9.csv.zip


 
******************************

* import csv file

import delimited "2022-01-31_v9.csv", clear varnames(1) 



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

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"



drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20220131

qui compress 

save "IMPE 20220131.dta", replace


shell rm -r "2022-01-31_v9.csv.zip" 

******

*

















*

* update 2022-03-15 20220315

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2022-03-15_v9.csv.zip 2022-03-15_v9.csv.zip
unzipfile 2022-03-15_v9.csv.zip, replace
erase 2022-03-15_v9.csv.zip


 
******************************

* import csv file

import delimited "2022-03-15_v9.csv", clear varnames(1) 



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

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"



drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20220315

qui compress 

save "IMPE 20220315.dta", replace


shell rm -r "2022-03-15_v9.csv.zip" 

******

*









*

* update 2022-05-30 20220530

******************************

* get csv file

clear all

copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/2022-05-30_v9.csv.zip 2022-05-30_v9.csv.zip
unzipfile 2022-05-30_v9.csv.zip, replace
erase 2022-05-30_v9.csv.zip


 
******************************

* import csv file

import delimited "2022-05-30_v9.csv", clear varnames(1) 



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

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"



drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20220530

qui compress 

save "IMPE 20220530.dta", replace


shell rm -r "2022-05-30_v9.csv.zip" 

******

*









*

* update 2022-06-20 20220620

******************************

* get csv file

clear all

copy https://raw.githubusercontent.com/mrc-ide/global-lmic-reports/master/data/2022-06-20_v9.csv.zip 2022-06-20_v9.csv.zip
unzipfile 2022-06-20_v9.csv.zip, replace
erase 2022-06-20_v9.csv.zip


 
******************************

* import csv file

import delimited "2022-06-20_v9.csv", clear varnames(1) 



keep if scenario == "Central" // "Maintain Status Quo" has been renamd to "Central"

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

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"



drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20220620

qui compress 

save "IMPE 20220620.dta", replace


shell rm -r "2022-06-20_v9.csv.zip" 

******

*









*

* update 2022-07-03 20220703

******************************

* get csv file

clear all

copy https://raw.githubusercontent.com/mrc-ide/global-lmic-reports/master/data/2022-07-03_v9.csv.zip 2022-07-03_v9.csv.zip
unzipfile 2022-07-03_v9.csv.zip, replace
erase 2022-07-03_v9.csv.zip


 
******************************

* import csv file

import delimited "2022-07-03_v9.csv", clear varnames(1) 



keep if scenario == "Central" // "Maintain Status Quo" has been renamd to "Central"

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

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"



drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20220703

qui compress 

save "IMPE 20220703.dta", replace


shell rm -r "2022-07-03_v9.csv.zip" 

******

*










*

* update 2022-07-12 20220712

******************************

* get csv file

clear all

copy https://raw.githubusercontent.com/mrc-ide/global-lmic-reports/master/data/2022-07-12_v9.csv.zip 2022-07-12_v9.csv.zip
unzipfile 2022-07-12_v9.csv.zip, replace
erase 2022-07-12_v9.csv.zip


 
******************************

* import csv file

import delimited "2022-07-12_v9.csv", clear varnames(1) 



keep if scenario == "Central" // "Maintain Status Quo" has been renamd to "Central"

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

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"



drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20220712

qui compress 

save "IMPE 20220712.dta", replace


shell rm -r "2022-07-12_v9.csv.zip" 

******

*









*

* update 2022-07-28 20220728

******************************

* get csv file

clear all

copy https://raw.githubusercontent.com/mrc-ide/global-lmic-reports/master/data/2022-07-28_v9.csv.zip 2022-07-28_v9.csv.zip
unzipfile 2022-07-28_v9.csv.zip, replace
erase 2022-07-28_v9.csv.zip


 
******************************

* import csv file

import delimited "2022-07-28_v9.csv", clear varnames(1) 



keep if scenario == "Central" // "Maintain Status Quo" has been renamd to "Central"

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

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"



drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20220728

qui compress 

save "IMPE 20220728.dta", replace


shell rm -r "2022-07-28_v9.csv.zip" 

******

*










*

* update 2022-08-08 20220808

******************************

* get csv file

clear all

copy https://raw.githubusercontent.com/mrc-ide/global-lmic-reports/master/data/2022-08-08_v9.csv.zip 2022-08-08_v9.csv.zip
unzipfile 2022-08-08_v9.csv.zip, replace
erase 2022-08-08_v9.csv.zip


 
******************************

* import csv file

import delimited "2022-08-08_v9.csv", clear varnames(1) 



keep if scenario == "Central" // "Maintain Status Quo" has been renamd to "Central"

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

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"



drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20220808

qui compress 

save "IMPE 20220808.dta", replace


shell rm -r "2022-08-08_v9.csv.zip" 

******

*






*

* update 2022-09-01 20220901

******************************

* get csv file

clear all

copy https://raw.githubusercontent.com/mrc-ide/global-lmic-reports/master/data/2022-09-01_v10.csv.zip 2022-09-01_v10.csv.zip
unzipfile 2022-09-01_v10.csv.zip, replace
erase 2022-09-01_v10.csv.zip


 
******************************

* import csv file

import delimited "2022-09-01_v10.csv", clear varnames(1) 



// keep if scenario == "Central" // "Maintain Status Quo" has been renamd to "Central"

* The variable scenario is not available. 

* Variable fit_type is available with values Excess Mortality and Reported Deaths


keep if fit_type == "Reported Deaths"


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

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"

 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20220901

qui compress 

save "IMPE 20220901.dta", replace


shell rm -r "2022-09-01_v10.csv.zip" 

******

*








*

* update 2022-12-25 20221225

******************************

* get csv file

clear all

copy https://raw.githubusercontent.com/mrc-ide/global-lmic-reports/master/data/2022-12-25_v10.csv.zip 2022-12-25_v10.csv.zip
unzipfile 2022-12-25_v10.csv.zip, replace
erase 2022-12-25_v10.csv.zip


 
******************************

* import csv file

import delimited "2022-12-25_v10.csv", clear varnames(1) 



// keep if scenario == "Central" // "Maintain Status Quo" has been renamd to "Central"

* The variable scenario is not available. 

* Variable fit_type is available with values Excess Mortality and Reported Deaths


keep if fit_type == "Reported Deaths"


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

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"

 

drop iso3c report_date version

rename y_mean DayDeaMeRaIMPES02

order loc_grand_name date DayDeaMeRaIMPES02

rename DayDeaMeRaIMPES02 DayDeaMeRaIMPE20221225

qui compress 

save "IMPE 20221225.dta", replace


shell rm -r "2022-12-25_v10.csv.zip" 

******

*







**********************************************
**********************************************

**********************************************
**********************************************

* gen list of countries and update dates


local list ///
20200428 ///
20200429 ///
20200430 ///
20200501 ///
20200502 ///
20200503 ///
20200504 ///
20200505 ///
20200506 ///
20200507 ///
20200508 ///
20200509 ///
20200510 ///
20200511 ///
20200512 ///
20200513 ///
20200514 ///
20200515 ///
20200516 ///
20200517 ///
20200519 ///
20200520 ///
20200521 ///
20200522 ///
20200523 ///
20200524 ///
20200525 ///
20200526 ///
20200527 ///
20200528 ///
20200529 ///
20200530 ///
20200531 ///
20200601 ///
20200602 ///
20200603 ///
20200604 ///
20200606 ///
20200609 ///
20200614 ///
20200616 ///
20200619 ///
20200621 ///
20200623 ///
20200626 ///
20200628 ///
20200702 ///
20200703 ///
20200704 ///
20200707 ///
20200711 ///
20200714 ///
20200715 ///
20200718 ///
20200720 ///
20200722 ///
20200725 ///
20200727 ///
20200731 ///
20200808 ///
20200810 ///
20200811 ///
20200813 ///
20200814 ///
20200817 ///
20200823 ///
20200825 ///
20200827 ///
20200831 ///
20200902 ///
20200906 ///
20200908 ///
20200912 ///
20200915 ///
20200919 ///
20200923 ///
20200925 ///
20201003 ///
20201006 ///
20201012 ///
20201019 ///
20201025 ///
20201028 ///
20201101 ///
20201110 ///
20201114 ///
20201118 ///
20201123 ///
20201129 ///
20201204 ///
20201212 ///
20201220 ///
20201226 ///
20210104 ///
20210110 ///
20210112 ///
20210118 ///
20210124 ///
20210130 ///
20210203 ///
20210210 ///
20210217 ///
20210226 ///
20210305 ///
20210312 ///
20210319 ///
20210329 ///
20210406 ///
20210417 ///
20210424 ///
20210510 ///
20210516 ///
20210522 ///
20210527 ///
20210604 ///
20210611 ///
20210618 ///
20210626 ///
20210702 ///
20210709 ///
20210719 ///
20210806 ///
20210819 ///
20210825 ///
20210909 ///
20210924 ///
20211006 ///
20211021 ///
20211027 ///
20211103 ///
20211115 ///
20211121 ///
20211129 ///
20211205 ///
20211213 ///
20211226 ///
20220102 ///
20220120 ///
20220131 ///
20220315 ///
20220530 ///
20220620 ///
20220703 ///
20220712 ///
20220728 ///
20220808 ///
20220901 ///
20221225



foreach update of local list {

	use "IMPE `update'.dta", clear
		
	contract loc_grand_name
	
	drop _freq
		
	rename loc_grand_name loc_grand_name`update'
	
	gen counter = _n
	
	save "IMPE `update' countries.dta", replace

}
*



use "IMPE 20200428 countries.dta" 


foreach update of local list {

	merge m:m counter using "IMPE `update' countries.dta"
	
	drop _merge

}
*


order counter

qui compress 

save "IMPE countries.dta", replace


*





* determine earliest date each country was present (date_present_first) 
* dates on which each country was absent (after their first presence)(date_absent_1*)

use "IMPE countries.dta", clear 

rename counter obs_no

rename (loc_grand_name*) (countries*)

* use -fillin- in a long file:

* https://www.statalist.org/forums/forum/general-stata-discussion/general/1687043-how-to-rearrange-the-values-of-string-variables-according-to-a-criterion

reshape long countries, i(obs_no) j(str_date) string
gen int real_date = daily(str_date, "YMD")
assert missing(str_date) == missing(real_date)
format real_date %td
drop str_date

rename countries country
drop if missing(country)
fillin country real_date
rename _fillin absent
drop obs_no

by country (real_date), sort: egen date_present_first = min(cond(!absent, real_date, .))
format date_present_first %td

by country (real_date): gen absent_dates = ///
    cond(absent, string(real_date, "%tdCCYYNNDD"), "") if _n == 1
by country (real_date): replace absent_dates = ///
    absent_dates[_n-1] + cond(absent, " " + string(real_date, "%tdCCYYNNDD"), "") ///
    if _n > 1
by country (real_date): replace absent_dates = absent_dates[_N]
split absent_dates, gen(date_absent)
drop absent_dates
isid country real_date, sort

* 


gen year = year(real_date)
gen month = month(real_date)
gen day = day(real_date)
tostring year month day, replace
replace month = "01" if month == "1"
replace month = "02" if month == "2"
replace month = "03" if month == "3"
replace month = "04" if month == "4"
replace month = "05" if month == "5"
replace month = "06" if month == "6"
replace month = "07" if month == "7"
replace month = "08" if month == "8"
replace month = "09" if month == "9"
replace day = "01" if day == "1"
replace day = "02" if day == "2"
replace day = "03" if day == "3"
replace day = "04" if day == "4"
replace day = "05" if day == "5"
replace day = "06" if day == "6"
replace day = "07" if day == "7"
replace day = "08" if day == "8"
replace day = "09" if day == "9"

gen blockdate_string = year + month + day
destring blockdate_string, gen(blockdate)
drop year month day blockdate_string
order blockdate, before(real_date)

rename blockdate update_date_block
rename real_date update_date_real







gen year = year(date_present_first)
gen month = month(date_present_first)
gen day = day(date_present_first)
tostring year month day, replace
replace month = "01" if month == "1"
replace month = "02" if month == "2"
replace month = "03" if month == "3"
replace month = "04" if month == "4"
replace month = "05" if month == "5"
replace month = "06" if month == "6"
replace month = "07" if month == "7"
replace month = "08" if month == "8"
replace month = "09" if month == "9"
replace day = "01" if day == "1"
replace day = "02" if day == "2"
replace day = "03" if day == "3"
replace day = "04" if day == "4"
replace day = "05" if day == "5"
replace day = "06" if day == "6"
replace day = "07" if day == "7"
replace day = "08" if day == "8"
replace day = "09" if day == "9"

gen date_present_first_block = year + month + day
destring date_present_first_block, replace
drop year month day 
order date_present_first_block, before(date_present_first)
rename date_present_first date_present_first_real

rename country loc_grand_name 

*


**********************************************
**********************************************
* country names to loc_grand_name

replace loc_grand_name = "Brunei" if loc_grand_name == "Brunei Darussalam"
replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of the Congo"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of Congo"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "North Korea"
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
replace loc_grand_name = "Kyrgyzstan" if loc_grand_name == "Kyrgyz Republic"
replace loc_grand_name = "Laos" if loc_grand_name == "Lao PDR"
replace loc_grand_name = "Palestine" if loc_grand_name == "State of Palestine"
replace loc_grand_name = "Saint Lucia" if loc_grand_name == "St. Lucia"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "United States"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"


                                                   
                                 


isid loc_grand_name update_date_block, sort


qui compress

save "IMPE countries long.dta", replace












*

view "log CovidLongitudinal IMPE 3.smcl"

log close
