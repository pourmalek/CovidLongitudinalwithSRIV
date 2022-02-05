
clear all

cd "$pathCovidLongitudinal"

cd IMPE

capture log close 

log using "log CovidLongitudinal IMPE.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* download files





/*

IMPE file names

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

NO - 2020-06-14_v3.csv.zip

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

*/










* v1

local list1 ///
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
20200530 



foreach update of local list1 {

clear

di in red "This is update " `update'

set obs 1
gen this = `"`update'"'

gen year = substr(this,1,4)
gen month = substr(this,5,2)
gen day = substr(this,7,2)
gen dash = "-"
gen endpart = "_v1.csv.zip"
gen that = year + dash + month + dash + day + endpart

local filename = that
 
copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/`filename' `filename'
unzipfile `filename', replace
erase `filename'

gen endpart2 = "_v1"
gen theother = year + dash + month + dash + day + endpart2
local theother = theother

import delimited "`theother'.csv", clear varnames(1)


gen year = substr(report_date,1,4)
gen month = substr(report_date,6,2)
gen day = substr(report_date,9,2)

gen thelastone = year + month + day
local thelastone = thelastone


save "IMPE `thelastone'.dta", replace


gen dash = "-"
gen thelastpart3 = "_v1.csv"

gen thelastsecond = year + dash + month + dash + day + thelastpart3
local thelastsecond = thelastsecond

shell mv -f "`thelastsecond'"  

}
*






* v2

local list2 ///
20200531 ///
20200601 ///
20200602 ///
20200603 ///
20200604 ///
20200606 ///
20200609 





foreach update of local list2 {

clear

di in red "This is update " `update'

set obs 1
gen this = `"`update'"'

gen year = substr(this,1,4)
gen month = substr(this,5,2)
gen day = substr(this,7,2)
gen dash = "-"
gen endpart = "_v2.csv.zip"
gen that = year + dash + month + dash + day + endpart

local filename = that
 
copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/`filename' `filename'
unzipfile `filename', replace
erase `filename'

gen endpart2 = "_v2"
gen theother = year + dash + month + dash + day + endpart2
local theother = theother

import delimited "`theother'.csv", clear varnames(1)


gen year = substr(report_date,1,4)
gen month = substr(report_date,6,2)
gen day = substr(report_date,9,2)

gen thelastone = year + month + day
local thelastone = thelastone


save "IMPE `thelastone'.dta", replace


gen dash = "-"
gen thelastpart3 = "_v2.csv"

gen thelastsecond = year + dash + month + dash + day + thelastpart3
local thelastsecond = thelastsecond

shell mv -f "`thelastsecond'"  

}
*











* v4

local list4 ///
20200614 ///
20200616 ///
20200616 ///
20200619 ///
20200619 ///
20200621 ///
20200621 ///
20200623 ///
20200623 ///
20200626 ///
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
20200731 




foreach update of local list4 {

clear

di in red "This is update " `update'

set obs 1
gen this = `"`update'"'

gen year = substr(this,1,4)
gen month = substr(this,5,2)
gen day = substr(this,7,2)
gen dash = "-"
gen endpart = "_v4.csv.zip"
gen that = year + dash + month + dash + day + endpart

local filename = that
 
copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/`filename' `filename'
unzipfile `filename', replace
erase `filename'

gen endpart2 = "_v4"
gen theother = year + dash + month + dash + day + endpart2
local theother = theother

import delimited "`theother'.csv", clear varnames(1)


gen year = substr(report_date,1,4)
gen month = substr(report_date,6,2)
gen day = substr(report_date,9,2)

gen thelastone = year + month + day
local thelastone = thelastone


save "IMPE `thelastone'.dta", replace


gen dash = "-"
gen thelastpart3 = "_v4.csv"

gen thelastsecond = year + dash + month + dash + day + thelastpart3
local thelastsecond = thelastsecond

shell mv -f "`thelastsecond'"  

}
*









* v5

local list5 /// 
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
20201101 



foreach update of local list5 {

clear

di in red "This is update " `update'

set obs 1
gen this = `"`update'"'

gen year = substr(this,1,4)
gen month = substr(this,5,2)
gen day = substr(this,7,2)
gen dash = "-"
gen endpart = "_v5.csv.zip"
gen that = year + dash + month + dash + day + endpart

local filename = that
 
copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/`filename' `filename'
unzipfile `filename', replace
erase `filename'

gen endpart2 = "_v5"
gen theother = year + dash + month + dash + day + endpart2
local theother = theother

import delimited "`theother'.csv", clear varnames(1)


gen year = substr(report_date,1,4)
gen month = substr(report_date,6,2)
gen day = substr(report_date,9,2)

gen thelastone = year + month + day
local thelastone = thelastone


save "IMPE `thelastone'.dta", replace


gen dash = "-"
gen thelastpart3 = "_v5.csv"

gen thelastsecond = year + dash + month + dash + day + thelastpart3
local thelastsecond = thelastsecond

shell mv -f "`thelastsecond'"  

}
*










* v6

local list6 ///
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
20210112 




foreach update of local list6 {

clear

di in red "This is update " `update'

set obs 1
gen this = `"`update'"'

gen year = substr(this,1,4)
gen month = substr(this,5,2)
gen day = substr(this,7,2)
gen dash = "-"
gen endpart = "_v6.csv.zip"
gen that = year + dash + month + dash + day + endpart

local filename = that
 
copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/`filename' `filename'
unzipfile `filename', replace
erase `filename'

gen endpart2 = "_v6"
gen theother = year + dash + month + dash + day + endpart2
local theother = theother

import delimited "`theother'.csv", clear varnames(1)


gen year = substr(report_date,1,4)
gen month = substr(report_date,6,2)
gen day = substr(report_date,9,2)

gen thelastone = year + month + day
local thelastone = thelastone


save "IMPE `thelastone'.dta", replace


gen dash = "-"
gen thelastpart3 = "_v6.csv"

gen thelastsecond = year + dash + month + dash + day + thelastpart3
local thelastsecond = thelastsecond

shell mv -f "`thelastsecond'"  

}
*









* v7

local list7 ///
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
20210424



foreach update of local list7 {

clear

di in red "This is update " `update'

set obs 1
gen this = `"`update'"'

gen year = substr(this,1,4)
gen month = substr(this,5,2)
gen day = substr(this,7,2)
gen dash = "-"
gen endpart = "_v7.csv.zip"
gen that = year + dash + month + dash + day + endpart

local filename = that
 
copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/`filename' `filename'
unzipfile `filename', replace
erase `filename'

gen endpart2 = "_v7"
gen theother = year + dash + month + dash + day + endpart2
local theother = theother

import delimited "`theother'.csv", clear varnames(1)


gen year = substr(report_date,1,4)
gen month = substr(report_date,6,2)
gen day = substr(report_date,9,2)

gen thelastone = year + month + day
local thelastone = thelastone


save "IMPE `thelastone'.dta", replace


gen dash = "-"
gen thelastpart3 = "_v7.csv"

gen thelastsecond = year + dash + month + dash + day + thelastpart3
local thelastsecond = thelastsecond

shell mv -f "`thelastsecond'"  

}
*









* v8

local list8 ///
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
20211027

/*

20210510 ///
20210516 ///
20210522 ///
20210527 ///
20210604 ///

*/



foreach update of local list8 {

clear

di in red "This is update " `update'

set obs 1
gen this = `"`update'"'

gen year = substr(this,1,4)
gen month = substr(this,5,2)
gen day = substr(this,7,2)
gen dash = "-"
gen endpart = "_v8.csv.zip"
gen that = year + dash + month + dash + day + endpart

local filename = that
 
copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/`filename' `filename'
unzipfile `filename', replace
erase `filename'

gen endpart2 = "_v8"
gen theother = year + dash + month + dash + day + endpart2
local theother = theother

import delimited "`theother'.csv", clear varnames(1)


gen year = substr(report_date,1,4)
gen month = substr(report_date,6,2)
gen day = substr(report_date,9,2)

gen thelastone = year + month + day
local thelastone = thelastone


save "IMPE `thelastone'.dta", replace


gen dash = "-"
gen thelastpart3 = "_v8.csv"

gen thelastsecond = year + dash + month + dash + day + thelastpart3
local thelastsecond = thelastsecond

shell mv -f "`thelastsecond'"  

}
*









* v9

local list9 ///
20211103 ///
20211115 ///
20211121





foreach update of local list9 {

clear

di in red "This is update " `update'

set obs 1
gen this = `"`update'"'

gen year = substr(this,1,4)
gen month = substr(this,5,2)
gen day = substr(this,7,2)
gen dash = "-"
gen endpart = "_v9.csv.zip"
gen that = year + dash + month + dash + day + endpart

local filename = that
 
copy https://mrcdata.dide.ic.ac.uk/global-lmic-reports/`filename' `filename'
unzipfile `filename', replace
erase `filename'

gen endpart2 = "_v9"
gen theother = year + dash + month + dash + day + endpart2
local theother = theother

import delimited "`theother'.csv", clear varnames(1)


gen year = substr(report_date,1,4)
gen month = substr(report_date,6,2)
gen day = substr(report_date,9,2)

gen thelastone = year + month + day
local thelastone = thelastone


save "IMPE `thelastone'.dta", replace


gen dash = "-"
gen thelastpart3 = "_v9.csv"

gen thelastsecond = year + dash + month + dash + day + thelastpart3
local thelastsecond = thelastsecond

shell mv -f "`thelastsecond'"  

}
*












view "log CovidLongitudinal IMPE.smcl"

log close

exit, clear
