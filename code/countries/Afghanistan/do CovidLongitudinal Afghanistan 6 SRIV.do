
clear all

cd "$pathCovidLongitudinal/countries/Afghanistan"

capture log close 

log using "log CovidLongitudinal Afghanistan 6 SRIV.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Afghanistan 6 SRIV.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Run calculations for error measures
	* for each country ---->> Afghanistan <<----                                                                 
***************************************************************************


** model = SRIV ** <<-- modify 1 
* lcolor green

* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together

* input data files: "SRIV Afghanistan.dta"
* output data files: "SRIV Afghanistan error.dta" (with error measures saved)

* output data dictionary files: "SRIV Afghanistan error data dictionary.csv"


* graph 03 Error
* graph 04 Absolute Error
* graph 05 Percent Error
* graph 06 Absolute Percent Error

* graph 07 mean over updates of median error by calendar months
* graph 08 Daily deaths, mean over updates of median absolute error by calendar months
* graph 09 Daily deaths, mean over updates of median % error by calendar months
* graph 10 Daily deaths, mean over updates of median absolute % error by calendar months

* graph 11 Daily deaths, Average MAPE over updates and calendar months




** graphs:
* "graph 03 Afghanistan SRIV C19 daily deaths error.pdf"
* "graph 04 Afghanistan SRIV C19 daily deaths absolute error.pdf"
* "graph 05 Afghanistan SRIV C19 daily deaths percent error.pdf"
* "graph 06 Afghanistan SRIV C19 daily deaths absolute percent error.pdf"

* "graph 07 Afghanistan SRIV C19 daily deaths average median error.pdf"
* "graph 08 Afghanistan SRIV C19 daily deaths average median absolute error.pdf"
* "graph 09 Afghanistan SRIV C19 daily deaths average median percent error.pdf"
* "graph 10 Afghanistan SRIV C19 daily deaths average median absolute percent error.pdf"

* "graph 11 Afghanistan SRIV C19 daily deaths Average MAPE over updates and calendar months

*********************

/*


CALCULATIONS:

Error = minus (Reference minus Model) 

Absolute error = | minus (Reference minus Model) |

Percent error = 100 * (minus (Reference minus Model)) / Reference

Absolute percent error = 100 * | minus (Reference minus Model) | / Reference




Error = - (Reference - Model)

Absolute error = | - (Reference - Model) |

Percent error = 100 * (- (Reference - Model)) / Reference

Absolute percent error = 100 * | - (Reference - Model)| / Reference

*/







use "SRIV Afghanistan.dta", clear 




* gen months time bin


gen month = month(date)

gen monthstr = ""
replace monthstr = "01" if month == 1
replace monthstr = "02" if month == 2
replace monthstr = "03" if month == 3

replace monthstr = "04" if month == 4
replace monthstr = "05" if month == 5
replace monthstr = "06" if month == 6

replace monthstr = "07" if month == 7
replace monthstr = "08" if month == 8
replace monthstr = "09" if month == 9

replace monthstr = "10" if month == 10
replace monthstr = "11" if month == 11
replace monthstr = "12" if month == 12



gen year = year(date)

gen yearstr = ""
replace yearstr = "2020" if year == 2020
replace yearstr = "2021" if year == 2021
replace yearstr = "2022" if year == 2022
replace yearstr = "2023" if year == 2023


egen yearmonth = concat(yearstr monthstr), p(m)

replace yearmonth = "" if yearmonth == "2023m01"

sort date yearmonth 

isid date

label var month "calendar month"

label var monthstr "calendar month string"

label var year "calendar year"

label var yearstr "calendar year string" 

label var yearmonth "calendar year and month"

*


// <<-- modify 2

local list ///
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
20200518 ///
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
20200605 ///
20200606 ///
20200607 ///
20200608 ///
20200609 ///
20200610 ///
20200611 ///
20200612 ///
20200613 ///
20200614 ///
20200615 ///
20200616 ///
20200617 ///
20200618 ///
20200619 ///
20200620 ///
20200621 ///
20200622 ///
20200623 ///
20200624 ///
20200625 ///
20200626 ///
20200627 ///
20200628 ///
20200629 ///
20200630 ///
20200701 ///
20200702 ///
20200703 ///
20200704 ///
20200705 ///
20200706 ///
20200707 ///
20200708 ///
20200709 ///
20200710 ///
20200711 ///
20200712 ///
20200713 ///
20200714 ///
20200715 ///
20200716 ///
20200717 ///
20200718 ///
20200719 ///
20200720 ///
20200721 ///
20200722 ///
20200723 ///
20200724 ///
20200725 ///
20200726 ///
20200727 ///
20200728 ///
20200729 ///
20200730 ///
20200731 ///
20200801 ///
20200802 ///
20200803 ///
20200804 ///
20200805 ///
20200806 ///
20200807 ///
20200808 ///
20200809 ///
20200810 ///
20200811 ///
20200812 ///
20200813 ///
20200814 ///
20200815 ///
20200816 ///
20200817 ///
20200818 ///
20200819 ///
20200820 ///
20200821 ///
20200822 ///
20200823 ///
20200824 ///
20200825 ///
20200826 ///
20200827 ///
20200828 ///
20200829 ///
20200830 ///
20200831 ///
20200901 ///
20200902 ///
20200903 ///
20200904 ///
20200905 ///
20200906 ///
20200907 ///
20200908 ///
20200909 ///
20200910 ///
20200911 ///
20200912 ///
20200913 ///
20200914 ///
20200915 ///
20200916 ///
20200917 ///
20200918 ///
20200919 ///
20200920 ///
20200921 ///
20200922 ///
20200923 ///
20200924 ///
20200925 ///
20200926 ///
20200927 ///
20200928 ///
20200929 ///
20200930 ///
20201001 ///
20201002 ///
20201003 ///
20201004 ///
20201006 ///
20201007 ///
20201008 ///
20201009 ///
20201010 ///
20201011 ///
20201012 ///
20201013 ///
20201014 ///
20201015 ///
20201016 ///
20201017 ///
20201018 ///
20201019 ///
20201020 ///
20201021 ///
20201022 ///
20201023 ///
20201024 ///
20201025 ///
20201026 ///
20201027 ///
20201028 ///
20201029 ///
20201030 ///
20201031 ///
20201101 ///
20201102 ///
20201103 ///
20201104 ///
20201105 ///
20201106 ///
20201107 ///
20201108 ///
20201109 ///
20201110 ///
20201111 ///
20201112 ///
20201113 ///
20201114 ///
20201115 ///
20201116 ///
20201117 ///
20201118 ///
20201119 ///
20201120 ///
20201121 ///
20201122 ///
20201123 ///
20201124 ///
20201125 ///
20201126 ///
20201127 ///
20201128 ///
20201129 ///
20201130 ///
20201201 ///
20201202 ///
20201203 ///
20201204 ///
20201205 ///
20201206 ///
20201207 ///
20201208 ///
20201209 ///
20201210 ///
20201211 ///
20201212 ///
20201213 ///
20201214 ///
20201216 ///
20201217 ///
20201218 ///
20201219 ///
20201220 ///
20201221 ///
20201222 ///
20201223 ///
20201224 ///
20201225 ///
20201226 ///
20201227 ///
20201229 ///
20201230 ///
20201231 ///
20210101 ///
20210103 ///
20210104 ///
20210105 ///
20210106 ///
20210107 ///
20210108 ///
20210109 ///
20210110 ///
20210111 ///
20210112 ///
20210113 ///
20210114 ///
20210115 ///
20210116 ///
20210117 ///
20210118 ///
20210119 ///
20210120 ///
20210121 ///
20210122 ///
20210123 ///
20210124 ///
20210125 ///
20210126 ///
20210127 ///
20210128 ///
20210129 ///
20210130 ///
20210131 ///
20210201 ///
20210202 ///
20210203 ///
20210204 ///
20210205 ///
20210206 ///
20210207 ///
20210208 ///
20210209 ///
20210210 ///
20210211 ///
20210212 ///
20210213 ///
20210214 ///
20210215 ///
20210216 ///
20210217 ///
20210218 ///
20210219 ///
20210220 ///
20210221 ///
20210222 ///
20210223 ///
20210224 ///
20210225 ///
20210226 ///
20210227 ///
20210228 ///
20210301 ///
20210302 ///
20210303 ///
20210304 ///
20210305 ///
20210306 ///
20210307 ///
20210308 ///
20210309 ///
20210310 ///
20210311 ///
20210312 ///
20210313 ///
20210314 ///
20210315 ///
20210316 ///
20210317 ///
20210318 ///
20210319 ///
20210320 ///
20210321 ///
20210322 ///
20210323 ///
20210324 ///
20210325 ///
20210326 ///
20210327 ///
20210328 ///
20210329 ///
20210330 ///
20210331 ///
20210401 ///
20210402 ///
20210403 ///
20210404 ///
20210405 ///
20210406 ///
20210407 ///
20210408 ///
20210409 ///
20210410 ///
20210411 ///
20210412 ///
20210413 ///
20210414 ///
20210415 ///
20210416 ///
20210417 ///
20210418 ///
20210419 ///
20210420 ///
20210421 ///
20210422 ///
20210423 ///
20210424 ///
20210425 ///
20210426 ///
20210427 ///
20210428 ///
20210429 ///
20210430 ///
20210501 ///
20210502 ///
20210503 ///
20210504 ///
20210505 ///
20210506 ///
20210507 ///
20210508 ///
20210509 ///
20210510 ///
20210511 ///
20210512 ///
20210513 ///
20210514 ///
20210515 ///
20210516 ///
20210517 ///
20210518 ///
20210519 ///
20210520 ///
20210521 ///
20210522 ///
20210523 ///
20210524 ///
20210525 ///
20210526 ///
20210527 ///
20210528 ///
20210529 ///
20210530 ///
20210531 ///
20210601 ///
20210602 ///
20210603 ///
20210604 ///
20210605 ///
20210606 ///
20210607 ///
20210608 ///
20210609 ///
20210610 ///
20210611 ///
20210612 ///
20210613 ///
20210614 ///
20210615 ///
20210616 ///
20210617 ///
20210618 ///
20210619 ///
20210620 ///
20210621 ///
20210622 ///
20210623 ///
20210624 ///
20210627 ///
20210630 ///
20210703 ///
20210704 ///
20210705 ///
20210706 ///
20210707 ///
20210708 ///
20210709 ///
20210710 ///
20210711 ///
20210712 ///
20210713 ///
20210714 ///
20210715 ///
20210716 ///
20210717 ///
20210718 ///
20210719 ///
20210720 ///
20210721 ///
20210722 ///
20210723 ///
20210724 ///
20210725 ///
20210726 ///
20210727 ///
20210728 ///
20210729 ///
20210730 ///
20210731 ///
20210801 ///
20210808 ///
20210809 ///
20210810 ///
20210811 ///
20210813 ///
20210814 ///
20210815 ///
20210816 ///
20210817 ///
20210818 ///
20210819 ///
20210820 ///
20210821 ///
20210822 ///
20210823 ///
20210824 ///
20210825 ///
20210826 ///
20210827 ///
20210828 ///
20210829 ///
20210830 ///
20210831 ///
20210901 ///
20210902 ///
20210903 ///
20210904 ///
20210905 ///
20210906 ///
20210907 ///
20210908 ///
20210909 ///
20210910 ///
20210911 ///
20210912 ///
20210913 ///
20210914 ///
20210915 ///
20210916 ///
20210917 ///
20210918 ///
20210919 ///
20210920 ///
20210921 ///
20210922 ///
20210923 ///
20210924 ///
20210925 ///
20210926 ///
20210927 ///
20210928 ///
20210929 ///
20210930 ///
20211001 ///
20211002 ///
20211003 ///
20211004 ///
20211005 ///
20211006 ///
20211007 ///
20211008 ///
20211009 ///
20211010 ///
20211011 ///
20211012 ///
20211013 ///
20211014 ///
20211015 ///
20211016 ///
20211017 ///
20211024 ///
20211025 ///
20211026 ///
20211027 ///
20211028 ///
20211029 ///
20211030 ///
20211031 ///
20211101 ///
20211102 ///
20211103 ///
20211104 ///
20211105 ///
20211106 ///
20211107 ///
20211108 ///
20211109 ///
20211110 ///
20211111 ///
20211112 ///
20211114 ///
20211115 ///
20211116 ///
20211117 ///
20211118 ///
20211119 ///
20211120 ///
20211121 ///
20211122 ///
20211124 ///
20211126 ///
20211127 ///
20211128 ///
20211129 ///
20211130 ///
20211201 ///
20211202 ///
20211203 ///
20211205 ///
20211207 ///
20211208 ///
20211209 ///
20211210 ///
20211211 ///
20211212 ///
20211213 ///
20211214 ///
20211215 ///
20211216 ///
20211217 ///
20211218 ///
20211219 ///
20211222 ///
20211223 ///
20211226 ///
20211227 ///
20220101 ///
20220102 ///
20220103 ///
20220104 ///
20220105 ///
20220106 ///
20220108 ///
20220109 ///
20220110 ///
20220111 ///
20220112 ///
20220113 ///
20220115 ///
20220116 ///
20220117 ///
20220118 ///
20220119 ///
20220120 ///
20220122 ///
20220123 ///
20220124 ///
20220125 ///
20220126 ///
20220127 ///
20220129 ///
20220130 ///
20220204 ///
20220205 ///
20220206 ///
20220207 ///
20220208 ///
20220209 ///
20220210 ///
20220211 ///
20220212 ///
20220213 ///
20220214 ///
20220215 ///
20220216 ///
20220217 ///
20220218 ///
20220219 ///
20220220 ///
20220221 ///
20220222 ///
20220223 ///
20220224 ///
20220225 ///
20220226 ///
20220227 ///
20220228 ///
20220301 ///
20220305 ///
20220306 ///
20220307 ///
20220308 ///
20220309 ///
20220310 ///
20220311 ///
20220312 ///
20220313 ///
20220314 ///
20220315 ///
20220316 ///
20220317 ///
20220318 ///
20220319 ///
20220320 ///
20220321 ///
20220322 ///
20220323 ///
20220324 ///
20220325 ///
20220326 ///
20220327 ///
20220328 ///
20220329 ///
20220330 ///
20220331 ///
20220401 ///
20220402 ///
20220403 ///
20220404 ///
20220405 ///
20220406 ///
20220407 ///
20220408 ///
20220409 ///
20220410 ///
20220411 ///
20220413 ///
20220417 ///
20220418 ///
20220419 ///
20220420 ///
20220421 ///
20220422 ///
20220423 ///
20220424 ///
20220425 ///
20220426 ///
20220427 ///
20220428 ///
20220429 ///
20220430 ///
20220501 ///
20220502 ///
20220508 ///
20220515 ///
20220516 ///
20220517 ///
20220518 ///
20220519 ///
20220520 ///
20220521 ///
20220522 ///
20220602 ///
20220603 ///
20220605 ///
20220606 ///
20220607 ///
20220608 ///
20220609 ///
20220610 ///
20220611 ///
20220612 ///
20220614 ///
20220615 ///
20220617 ///
20220618 ///
20220619 ///
20220620 ///
20220621 ///
20220622 ///
20220623 ///
20220624 ///
20220625 ///
20220626 ///
20220627 ///
20220628 ///
20220629 ///
20220630 ///
20220701 ///
20220702 ///
20220703 ///
20220704 ///
20220705 ///
20220706 ///
20220707 ///
20220708 ///
20220709 ///
20220710 ///
20220711 ///
20220712 ///
20220713 ///
20220714 ///
20220715 ///
20220716 ///
20220717 ///
20220718 ///
20220719 ///
20220720 ///
20220721 ///
20220722 ///
20220723 ///
20220724 ///
20220725 ///
20220726 ///
20220727 ///
20220728 ///
20220813 ///
20220814 ///
20220815 ///
20220816 ///
20220817 ///
20220818 ///
20220819 ///
20220820 ///
20220821 ///
20220822 ///
20220823 ///
20220824 ///
20220826 ///
20220827 ///
20220828 ///
20220830 ///
20220831 ///
20220901 ///
20220907 ///
20220911 ///
20220913 ///
20220914 ///
20220916 ///
20220917 ///
20220918 ///
20220919 ///
20220920 ///
20220921 ///
20220922 ///
20220923 ///
20220924 ///
20220925 ///
20220926 ///
20220927 ///
20220928 ///
20220929 ///
20220930 ///
20221001 ///
20221002 ///
20221003 ///
20221004 ///
20221005 ///
20221006 ///
20221007 ///
20221008 ///
20221009 ///
20221010 ///
20221011 ///
20221012 ///
20221013 ///
20221014 ///
20221015 ///
20221016 ///
20221017 ///
20221018 ///
20221019 ///
20221020 ///
20221021 ///
20221022 ///
20221023 ///
20221024 ///
20221025 ///
20221026 ///
20221027 ///
20221028 ///
20221029 ///
20221030 ///
20221031 ///
20221101 ///
20221102 ///
20221114 ///
20221115 ///
20221117 ///
20221118 ///
20221119 ///
20221120 ///
20221121 ///
20221122 ///
20221123 ///
20221124 ///
20221125 ///
20221126 ///
20221127 ///
20221128 ///
20221129 ///
20221130 ///
20221201 ///
20221202 ///
20221203 ///
20221204 ///
20221205 ///
20221206 ///
20221207 ///
20221208 ///
20221209 ///
20221210 ///
20221211 ///
20221212 ///
20221213 ///
20221214 ///
20221215 ///
20221216 ///
20221217 ///
20221218 ///
20221219 ///
20221220 ///
20221221 ///
20221222 ///
20221223 ///
20221224 ///
20221225 ///
20221226 ///
20221227 ///
20221228 ///
20221229 ///
20221230 ///
20221231



sort date


* (1) gen error TYPES by calendar months and model updates

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 

capture drop DDErrorSRIV`update'
gen DDErrorSRIV`update' = - (DayDeaMeSmJOHN - DayDeaMeFoSRIV`update')
label var DDErrorSRIV`update' "DayDeaMeFoSRIV`update' error"
qui replace DDErrorSRIV`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorSRIV`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorSRIV`update' = . if date < td(02may2020) // 02may2020 is the earliest date of SRIV forecasts for Afghanistan
                                                            // <<-- modify 3
capture drop DDAbsErrSRIV`update'
gen DDAbsErrSRIV`update' = abs(- (DayDeaMeSmJOHN - DayDeaMeFoSRIV`update'))
label var DDAbsErrSRIV`update' "DayDeaMeFoSRIV`update' absolute error"
qui replace DDAbsErrSRIV`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrSRIV`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrSRIV`update' = . if date < td(02may2020) // 02may2020 is the earliest date of SRIV forecasts for Afghanistan

capture drop DDPerErrSRIV`update'
gen DDPerErrSRIV`update' = (100 * (- (DayDeaMeSmJOHN - DayDeaMeFoSRIV`update'))) / DayDeaMeSmJOHN
label var DDPerErrSRIV`update' "DayDeaMeFoSRIV`update' percent error"
qui replace DDPerErrSRIV`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrSRIV`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrSRIV`update' = . if date < td(02may2020) // 02may2020 is the earliest date of SRIV forecasts for Afghanistan

capture drop DDAbPeErSRIV`update'
gen DDAbPeErSRIV`update' = (100 * abs(- (DayDeaMeSmJOHN - DayDeaMeFoSRIV`update'))) / DayDeaMeSmJOHN
label var DDAbPeErSRIV`update' "DayDeaMeFoSRIV`update' absolute percent error" 
qui replace DDAbPeErSRIV`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErSRIV`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErSRIV`update' = . if date < td(02may2020) // 02may2020 is the earliest date of SRIV forecasts for Afghanistan

}
*





* (2) gen MEDIAN of error types by calendar months and updates = _Med1

* Wait note: wait ...

foreach update of local list {
		
capture drop DDErrorSRIV`update'_Med1
bysort yearmonth : egen DDErrorSRIV`update'_Med1 = median(DDErrorSRIV`update')
label var DDErrorSRIV`update'_Med1 "DayDeaSRIV median error by calendar months and updates"
qui replace DDErrorSRIV`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorSRIV`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorSRIV`update'_Med1 = . if date < td(02may2020) // 02may2020 is the earliest date of SRIV forecasts for Afghanistan

capture drop DDAbsErrSRIV`update'_Med1
bysort yearmonth : egen DDAbsErrSRIV`update'_Med1 = median(DDAbsErrSRIV`update')
label var DDAbsErrSRIV`update'_Med1 "DayDeaSRIV median absolute error by calendar months and updates"
qui replace DDAbsErrSRIV`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrSRIV`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrSRIV`update'_Med1 = . if date < td(02may2020) // 02may2020 is the earliest date of SRIV forecasts for Afghanistan

capture drop DDPerErrSRIV`update'_Med1
bysort yearmonth : egen DDPerErrSRIV`update'_Med1 = median(DDPerErrSRIV`update')
label var DDPerErrSRIV`update'_Med1 "DayDeaSRIV median % error by calendar months and updates"
qui replace DDPerErrSRIV`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrSRIV`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrSRIV`update'_Med1 = . if date < td(02may2020) // 02may2020 is the earliest date of SRIV forecasts for Afghanistan

capture drop DDAbPeErSRIV`update'_Med1
bysort yearmonth : egen DDAbPeErSRIV`update'_Med1 = median(DDAbPeErSRIV`update')
label var DDAbPeErSRIV`update'_Med1 "DayDeaSRIV median absolute % error by calendar months and updates" 
qui replace DDAbPeErSRIV`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErSRIV`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErSRIV`update'_Med1 = . if date < td(02may2020) // 02may2020 is the earliest date of SRIV forecasts for Afghanistan

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1

* Wait note: wait ...



* gen DDErrorSRIV_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 4
 
order DDErrorSRIV20200502_Med1
order DDErrorSRIV20200503_Med1
order DDErrorSRIV20200504_Med1
order DDErrorSRIV20200505_Med1
order DDErrorSRIV20200506_Med1
order DDErrorSRIV20200507_Med1
order DDErrorSRIV20200508_Med1
order DDErrorSRIV20200509_Med1
order DDErrorSRIV20200510_Med1
order DDErrorSRIV20200511_Med1
order DDErrorSRIV20200512_Med1
order DDErrorSRIV20200513_Med1
order DDErrorSRIV20200514_Med1
order DDErrorSRIV20200515_Med1
order DDErrorSRIV20200516_Med1
order DDErrorSRIV20200517_Med1
order DDErrorSRIV20200518_Med1
order DDErrorSRIV20200519_Med1
order DDErrorSRIV20200520_Med1
order DDErrorSRIV20200521_Med1
order DDErrorSRIV20200522_Med1
order DDErrorSRIV20200523_Med1
order DDErrorSRIV20200524_Med1
order DDErrorSRIV20200525_Med1
order DDErrorSRIV20200526_Med1
order DDErrorSRIV20200527_Med1
order DDErrorSRIV20200528_Med1
order DDErrorSRIV20200529_Med1
order DDErrorSRIV20200530_Med1
order DDErrorSRIV20200531_Med1
order DDErrorSRIV20200601_Med1
order DDErrorSRIV20200602_Med1
order DDErrorSRIV20200603_Med1
order DDErrorSRIV20200604_Med1
order DDErrorSRIV20200605_Med1
order DDErrorSRIV20200606_Med1
order DDErrorSRIV20200607_Med1
order DDErrorSRIV20200608_Med1
order DDErrorSRIV20200609_Med1
order DDErrorSRIV20200610_Med1
order DDErrorSRIV20200611_Med1
order DDErrorSRIV20200612_Med1
order DDErrorSRIV20200613_Med1
order DDErrorSRIV20200614_Med1
order DDErrorSRIV20200615_Med1
order DDErrorSRIV20200616_Med1
order DDErrorSRIV20200617_Med1
order DDErrorSRIV20200618_Med1
order DDErrorSRIV20200619_Med1
order DDErrorSRIV20200620_Med1
order DDErrorSRIV20200621_Med1
order DDErrorSRIV20200622_Med1
order DDErrorSRIV20200623_Med1
order DDErrorSRIV20200624_Med1
order DDErrorSRIV20200625_Med1
order DDErrorSRIV20200626_Med1
order DDErrorSRIV20200627_Med1
order DDErrorSRIV20200628_Med1
order DDErrorSRIV20200629_Med1
order DDErrorSRIV20200630_Med1
order DDErrorSRIV20200701_Med1
order DDErrorSRIV20200702_Med1
order DDErrorSRIV20200703_Med1
order DDErrorSRIV20200704_Med1
order DDErrorSRIV20200705_Med1
order DDErrorSRIV20200706_Med1
order DDErrorSRIV20200707_Med1
order DDErrorSRIV20200708_Med1
order DDErrorSRIV20200709_Med1
order DDErrorSRIV20200710_Med1
order DDErrorSRIV20200711_Med1
order DDErrorSRIV20200712_Med1
order DDErrorSRIV20200713_Med1
order DDErrorSRIV20200714_Med1
order DDErrorSRIV20200715_Med1
order DDErrorSRIV20200716_Med1
order DDErrorSRIV20200717_Med1
order DDErrorSRIV20200718_Med1
order DDErrorSRIV20200719_Med1
order DDErrorSRIV20200720_Med1
order DDErrorSRIV20200721_Med1
order DDErrorSRIV20200722_Med1
order DDErrorSRIV20200723_Med1
order DDErrorSRIV20200724_Med1
order DDErrorSRIV20200725_Med1
order DDErrorSRIV20200726_Med1
order DDErrorSRIV20200727_Med1
order DDErrorSRIV20200728_Med1
order DDErrorSRIV20200729_Med1
order DDErrorSRIV20200730_Med1
order DDErrorSRIV20200731_Med1
order DDErrorSRIV20200801_Med1
order DDErrorSRIV20200802_Med1
order DDErrorSRIV20200803_Med1
order DDErrorSRIV20200804_Med1
order DDErrorSRIV20200805_Med1
order DDErrorSRIV20200806_Med1
order DDErrorSRIV20200807_Med1
order DDErrorSRIV20200808_Med1
order DDErrorSRIV20200809_Med1
order DDErrorSRIV20200810_Med1
order DDErrorSRIV20200811_Med1
order DDErrorSRIV20200812_Med1
order DDErrorSRIV20200813_Med1
order DDErrorSRIV20200814_Med1
order DDErrorSRIV20200815_Med1
order DDErrorSRIV20200816_Med1
order DDErrorSRIV20200817_Med1
order DDErrorSRIV20200818_Med1
order DDErrorSRIV20200819_Med1
order DDErrorSRIV20200820_Med1
order DDErrorSRIV20200821_Med1
order DDErrorSRIV20200822_Med1
order DDErrorSRIV20200823_Med1
order DDErrorSRIV20200824_Med1
order DDErrorSRIV20200825_Med1
order DDErrorSRIV20200826_Med1
order DDErrorSRIV20200827_Med1
order DDErrorSRIV20200828_Med1
order DDErrorSRIV20200829_Med1
order DDErrorSRIV20200830_Med1
order DDErrorSRIV20200831_Med1
order DDErrorSRIV20200901_Med1
order DDErrorSRIV20200902_Med1
order DDErrorSRIV20200903_Med1
order DDErrorSRIV20200904_Med1
order DDErrorSRIV20200905_Med1
order DDErrorSRIV20200906_Med1
order DDErrorSRIV20200907_Med1
order DDErrorSRIV20200908_Med1
order DDErrorSRIV20200909_Med1
order DDErrorSRIV20200910_Med1
order DDErrorSRIV20200911_Med1
order DDErrorSRIV20200912_Med1
order DDErrorSRIV20200913_Med1
order DDErrorSRIV20200914_Med1
order DDErrorSRIV20200915_Med1
order DDErrorSRIV20200916_Med1
order DDErrorSRIV20200917_Med1
order DDErrorSRIV20200918_Med1
order DDErrorSRIV20200919_Med1
order DDErrorSRIV20200920_Med1
order DDErrorSRIV20200921_Med1
order DDErrorSRIV20200922_Med1
order DDErrorSRIV20200923_Med1
order DDErrorSRIV20200924_Med1
order DDErrorSRIV20200925_Med1
order DDErrorSRIV20200926_Med1
order DDErrorSRIV20200927_Med1
order DDErrorSRIV20200928_Med1
order DDErrorSRIV20200929_Med1
order DDErrorSRIV20200930_Med1
order DDErrorSRIV20201001_Med1
order DDErrorSRIV20201002_Med1
order DDErrorSRIV20201003_Med1
order DDErrorSRIV20201004_Med1
order DDErrorSRIV20201006_Med1
order DDErrorSRIV20201007_Med1
order DDErrorSRIV20201008_Med1
order DDErrorSRIV20201009_Med1
order DDErrorSRIV20201010_Med1
order DDErrorSRIV20201011_Med1
order DDErrorSRIV20201012_Med1
order DDErrorSRIV20201013_Med1
order DDErrorSRIV20201014_Med1
order DDErrorSRIV20201015_Med1
order DDErrorSRIV20201016_Med1
order DDErrorSRIV20201017_Med1
order DDErrorSRIV20201018_Med1
order DDErrorSRIV20201019_Med1
order DDErrorSRIV20201020_Med1
order DDErrorSRIV20201021_Med1
order DDErrorSRIV20201022_Med1
order DDErrorSRIV20201023_Med1
order DDErrorSRIV20201024_Med1
order DDErrorSRIV20201025_Med1
order DDErrorSRIV20201026_Med1
order DDErrorSRIV20201027_Med1
order DDErrorSRIV20201028_Med1
order DDErrorSRIV20201029_Med1
order DDErrorSRIV20201030_Med1
order DDErrorSRIV20201031_Med1
order DDErrorSRIV20201101_Med1
order DDErrorSRIV20201102_Med1
order DDErrorSRIV20201103_Med1
order DDErrorSRIV20201104_Med1
order DDErrorSRIV20201105_Med1
order DDErrorSRIV20201106_Med1
order DDErrorSRIV20201107_Med1
order DDErrorSRIV20201108_Med1
order DDErrorSRIV20201109_Med1
order DDErrorSRIV20201110_Med1
order DDErrorSRIV20201111_Med1
order DDErrorSRIV20201112_Med1
order DDErrorSRIV20201113_Med1
order DDErrorSRIV20201114_Med1
order DDErrorSRIV20201115_Med1
order DDErrorSRIV20201116_Med1
order DDErrorSRIV20201117_Med1
order DDErrorSRIV20201118_Med1
order DDErrorSRIV20201119_Med1
order DDErrorSRIV20201120_Med1
order DDErrorSRIV20201121_Med1
order DDErrorSRIV20201122_Med1
order DDErrorSRIV20201123_Med1
order DDErrorSRIV20201124_Med1
order DDErrorSRIV20201125_Med1
order DDErrorSRIV20201126_Med1
order DDErrorSRIV20201127_Med1
order DDErrorSRIV20201128_Med1
order DDErrorSRIV20201129_Med1
order DDErrorSRIV20201130_Med1
order DDErrorSRIV20201201_Med1
order DDErrorSRIV20201202_Med1
order DDErrorSRIV20201203_Med1
order DDErrorSRIV20201204_Med1
order DDErrorSRIV20201205_Med1
order DDErrorSRIV20201206_Med1
order DDErrorSRIV20201207_Med1
order DDErrorSRIV20201208_Med1
order DDErrorSRIV20201209_Med1
order DDErrorSRIV20201210_Med1
order DDErrorSRIV20201211_Med1
order DDErrorSRIV20201212_Med1
order DDErrorSRIV20201213_Med1
order DDErrorSRIV20201214_Med1
order DDErrorSRIV20201216_Med1
order DDErrorSRIV20201217_Med1
order DDErrorSRIV20201218_Med1
order DDErrorSRIV20201219_Med1
order DDErrorSRIV20201220_Med1
order DDErrorSRIV20201221_Med1
order DDErrorSRIV20201222_Med1
order DDErrorSRIV20201223_Med1
order DDErrorSRIV20201224_Med1
order DDErrorSRIV20201225_Med1
order DDErrorSRIV20201226_Med1
order DDErrorSRIV20201227_Med1
order DDErrorSRIV20201229_Med1
order DDErrorSRIV20201230_Med1
order DDErrorSRIV20201231_Med1
order DDErrorSRIV20210101_Med1
order DDErrorSRIV20210103_Med1
order DDErrorSRIV20210104_Med1
order DDErrorSRIV20210105_Med1
order DDErrorSRIV20210106_Med1
order DDErrorSRIV20210107_Med1
order DDErrorSRIV20210108_Med1
order DDErrorSRIV20210109_Med1
order DDErrorSRIV20210110_Med1
order DDErrorSRIV20210111_Med1
order DDErrorSRIV20210112_Med1
order DDErrorSRIV20210113_Med1
order DDErrorSRIV20210114_Med1
order DDErrorSRIV20210115_Med1
order DDErrorSRIV20210116_Med1
order DDErrorSRIV20210117_Med1
order DDErrorSRIV20210118_Med1
order DDErrorSRIV20210119_Med1
order DDErrorSRIV20210120_Med1
order DDErrorSRIV20210121_Med1
order DDErrorSRIV20210122_Med1
order DDErrorSRIV20210123_Med1
order DDErrorSRIV20210124_Med1
order DDErrorSRIV20210125_Med1
order DDErrorSRIV20210126_Med1
order DDErrorSRIV20210127_Med1
order DDErrorSRIV20210128_Med1
order DDErrorSRIV20210129_Med1
order DDErrorSRIV20210130_Med1
order DDErrorSRIV20210131_Med1
order DDErrorSRIV20210201_Med1
order DDErrorSRIV20210202_Med1
order DDErrorSRIV20210203_Med1
order DDErrorSRIV20210204_Med1
order DDErrorSRIV20210205_Med1
order DDErrorSRIV20210206_Med1
order DDErrorSRIV20210207_Med1
order DDErrorSRIV20210208_Med1
order DDErrorSRIV20210209_Med1
order DDErrorSRIV20210210_Med1
order DDErrorSRIV20210211_Med1
order DDErrorSRIV20210212_Med1
order DDErrorSRIV20210213_Med1
order DDErrorSRIV20210214_Med1
order DDErrorSRIV20210215_Med1
order DDErrorSRIV20210216_Med1
order DDErrorSRIV20210217_Med1
order DDErrorSRIV20210218_Med1
order DDErrorSRIV20210219_Med1
order DDErrorSRIV20210220_Med1
order DDErrorSRIV20210221_Med1
order DDErrorSRIV20210222_Med1
order DDErrorSRIV20210223_Med1
order DDErrorSRIV20210224_Med1
order DDErrorSRIV20210225_Med1
order DDErrorSRIV20210226_Med1
order DDErrorSRIV20210227_Med1
order DDErrorSRIV20210228_Med1
order DDErrorSRIV20210301_Med1
order DDErrorSRIV20210302_Med1
order DDErrorSRIV20210303_Med1
order DDErrorSRIV20210304_Med1
order DDErrorSRIV20210305_Med1
order DDErrorSRIV20210306_Med1
order DDErrorSRIV20210307_Med1
order DDErrorSRIV20210308_Med1
order DDErrorSRIV20210309_Med1
order DDErrorSRIV20210310_Med1
order DDErrorSRIV20210311_Med1
order DDErrorSRIV20210312_Med1
order DDErrorSRIV20210313_Med1
order DDErrorSRIV20210314_Med1
order DDErrorSRIV20210315_Med1
order DDErrorSRIV20210316_Med1
order DDErrorSRIV20210317_Med1
order DDErrorSRIV20210318_Med1
order DDErrorSRIV20210319_Med1
order DDErrorSRIV20210320_Med1
order DDErrorSRIV20210321_Med1
order DDErrorSRIV20210322_Med1
order DDErrorSRIV20210323_Med1
order DDErrorSRIV20210324_Med1
order DDErrorSRIV20210325_Med1
order DDErrorSRIV20210326_Med1
order DDErrorSRIV20210327_Med1
order DDErrorSRIV20210328_Med1
order DDErrorSRIV20210329_Med1
order DDErrorSRIV20210330_Med1
order DDErrorSRIV20210331_Med1
order DDErrorSRIV20210401_Med1
order DDErrorSRIV20210402_Med1
order DDErrorSRIV20210403_Med1
order DDErrorSRIV20210404_Med1
order DDErrorSRIV20210405_Med1
order DDErrorSRIV20210406_Med1
order DDErrorSRIV20210407_Med1
order DDErrorSRIV20210408_Med1
order DDErrorSRIV20210409_Med1
order DDErrorSRIV20210410_Med1
order DDErrorSRIV20210411_Med1
order DDErrorSRIV20210412_Med1
order DDErrorSRIV20210413_Med1
order DDErrorSRIV20210414_Med1
order DDErrorSRIV20210415_Med1
order DDErrorSRIV20210416_Med1
order DDErrorSRIV20210417_Med1
order DDErrorSRIV20210418_Med1
order DDErrorSRIV20210419_Med1
order DDErrorSRIV20210420_Med1
order DDErrorSRIV20210421_Med1
order DDErrorSRIV20210422_Med1
order DDErrorSRIV20210423_Med1
order DDErrorSRIV20210424_Med1
order DDErrorSRIV20210425_Med1
order DDErrorSRIV20210426_Med1
order DDErrorSRIV20210427_Med1
order DDErrorSRIV20210428_Med1
order DDErrorSRIV20210429_Med1
order DDErrorSRIV20210430_Med1
order DDErrorSRIV20210501_Med1
order DDErrorSRIV20210502_Med1
order DDErrorSRIV20210503_Med1
order DDErrorSRIV20210504_Med1
order DDErrorSRIV20210505_Med1
order DDErrorSRIV20210506_Med1
order DDErrorSRIV20210507_Med1
order DDErrorSRIV20210508_Med1
order DDErrorSRIV20210509_Med1
order DDErrorSRIV20210510_Med1
order DDErrorSRIV20210511_Med1
order DDErrorSRIV20210512_Med1
order DDErrorSRIV20210513_Med1
order DDErrorSRIV20210514_Med1
order DDErrorSRIV20210515_Med1
order DDErrorSRIV20210516_Med1
order DDErrorSRIV20210517_Med1
order DDErrorSRIV20210518_Med1
order DDErrorSRIV20210519_Med1
order DDErrorSRIV20210520_Med1
order DDErrorSRIV20210521_Med1
order DDErrorSRIV20210522_Med1
order DDErrorSRIV20210523_Med1
order DDErrorSRIV20210524_Med1
order DDErrorSRIV20210525_Med1
order DDErrorSRIV20210526_Med1
order DDErrorSRIV20210527_Med1
order DDErrorSRIV20210528_Med1
order DDErrorSRIV20210529_Med1
order DDErrorSRIV20210530_Med1
order DDErrorSRIV20210531_Med1
order DDErrorSRIV20210601_Med1
order DDErrorSRIV20210602_Med1
order DDErrorSRIV20210603_Med1
order DDErrorSRIV20210604_Med1
order DDErrorSRIV20210605_Med1
order DDErrorSRIV20210606_Med1
order DDErrorSRIV20210607_Med1
order DDErrorSRIV20210608_Med1
order DDErrorSRIV20210609_Med1
order DDErrorSRIV20210610_Med1
order DDErrorSRIV20210611_Med1
order DDErrorSRIV20210612_Med1
order DDErrorSRIV20210613_Med1
order DDErrorSRIV20210614_Med1
order DDErrorSRIV20210615_Med1
order DDErrorSRIV20210616_Med1
order DDErrorSRIV20210617_Med1
order DDErrorSRIV20210618_Med1
order DDErrorSRIV20210619_Med1
order DDErrorSRIV20210620_Med1
order DDErrorSRIV20210621_Med1
order DDErrorSRIV20210622_Med1
order DDErrorSRIV20210623_Med1
order DDErrorSRIV20210624_Med1
order DDErrorSRIV20210627_Med1
order DDErrorSRIV20210630_Med1
order DDErrorSRIV20210703_Med1
order DDErrorSRIV20210704_Med1
order DDErrorSRIV20210705_Med1
order DDErrorSRIV20210706_Med1
order DDErrorSRIV20210707_Med1
order DDErrorSRIV20210708_Med1
order DDErrorSRIV20210709_Med1
order DDErrorSRIV20210710_Med1
order DDErrorSRIV20210711_Med1
order DDErrorSRIV20210712_Med1
order DDErrorSRIV20210713_Med1
order DDErrorSRIV20210714_Med1
order DDErrorSRIV20210715_Med1
order DDErrorSRIV20210716_Med1
order DDErrorSRIV20210717_Med1
order DDErrorSRIV20210718_Med1
order DDErrorSRIV20210719_Med1
order DDErrorSRIV20210720_Med1
order DDErrorSRIV20210721_Med1
order DDErrorSRIV20210722_Med1
order DDErrorSRIV20210723_Med1
order DDErrorSRIV20210724_Med1
order DDErrorSRIV20210725_Med1
order DDErrorSRIV20210726_Med1
order DDErrorSRIV20210727_Med1
order DDErrorSRIV20210728_Med1
order DDErrorSRIV20210729_Med1
order DDErrorSRIV20210730_Med1
order DDErrorSRIV20210731_Med1
order DDErrorSRIV20210801_Med1
order DDErrorSRIV20210808_Med1
order DDErrorSRIV20210809_Med1
order DDErrorSRIV20210810_Med1
order DDErrorSRIV20210811_Med1
order DDErrorSRIV20210813_Med1
order DDErrorSRIV20210814_Med1
order DDErrorSRIV20210815_Med1
order DDErrorSRIV20210816_Med1
order DDErrorSRIV20210817_Med1
order DDErrorSRIV20210818_Med1
order DDErrorSRIV20210819_Med1
order DDErrorSRIV20210820_Med1
order DDErrorSRIV20210821_Med1
order DDErrorSRIV20210822_Med1
order DDErrorSRIV20210823_Med1
order DDErrorSRIV20210824_Med1
order DDErrorSRIV20210825_Med1
order DDErrorSRIV20210826_Med1
order DDErrorSRIV20210827_Med1
order DDErrorSRIV20210828_Med1
order DDErrorSRIV20210829_Med1
order DDErrorSRIV20210830_Med1
order DDErrorSRIV20210831_Med1
order DDErrorSRIV20210901_Med1
order DDErrorSRIV20210902_Med1
order DDErrorSRIV20210903_Med1
order DDErrorSRIV20210904_Med1
order DDErrorSRIV20210905_Med1
order DDErrorSRIV20210906_Med1
order DDErrorSRIV20210907_Med1
order DDErrorSRIV20210908_Med1
order DDErrorSRIV20210909_Med1
order DDErrorSRIV20210910_Med1
order DDErrorSRIV20210911_Med1
order DDErrorSRIV20210912_Med1
order DDErrorSRIV20210913_Med1
order DDErrorSRIV20210914_Med1
order DDErrorSRIV20210915_Med1
order DDErrorSRIV20210916_Med1
order DDErrorSRIV20210917_Med1
order DDErrorSRIV20210918_Med1
order DDErrorSRIV20210919_Med1
order DDErrorSRIV20210920_Med1
order DDErrorSRIV20210921_Med1
order DDErrorSRIV20210922_Med1
order DDErrorSRIV20210923_Med1
order DDErrorSRIV20210924_Med1
order DDErrorSRIV20210925_Med1
order DDErrorSRIV20210926_Med1
order DDErrorSRIV20210927_Med1
order DDErrorSRIV20210928_Med1
order DDErrorSRIV20210929_Med1
order DDErrorSRIV20210930_Med1
order DDErrorSRIV20211001_Med1
order DDErrorSRIV20211002_Med1
order DDErrorSRIV20211003_Med1
order DDErrorSRIV20211004_Med1
order DDErrorSRIV20211005_Med1
order DDErrorSRIV20211006_Med1
order DDErrorSRIV20211007_Med1
order DDErrorSRIV20211008_Med1
order DDErrorSRIV20211009_Med1
order DDErrorSRIV20211010_Med1
order DDErrorSRIV20211011_Med1
order DDErrorSRIV20211012_Med1
order DDErrorSRIV20211013_Med1
order DDErrorSRIV20211014_Med1
order DDErrorSRIV20211015_Med1
order DDErrorSRIV20211016_Med1
order DDErrorSRIV20211017_Med1
order DDErrorSRIV20211024_Med1
order DDErrorSRIV20211025_Med1
order DDErrorSRIV20211026_Med1
order DDErrorSRIV20211027_Med1
order DDErrorSRIV20211028_Med1
order DDErrorSRIV20211029_Med1
order DDErrorSRIV20211030_Med1
order DDErrorSRIV20211031_Med1
order DDErrorSRIV20211101_Med1
order DDErrorSRIV20211102_Med1
order DDErrorSRIV20211103_Med1
order DDErrorSRIV20211104_Med1
order DDErrorSRIV20211105_Med1
order DDErrorSRIV20211106_Med1
order DDErrorSRIV20211107_Med1
order DDErrorSRIV20211108_Med1
order DDErrorSRIV20211109_Med1
order DDErrorSRIV20211110_Med1
order DDErrorSRIV20211111_Med1
order DDErrorSRIV20211112_Med1
order DDErrorSRIV20211114_Med1
order DDErrorSRIV20211115_Med1
order DDErrorSRIV20211116_Med1
order DDErrorSRIV20211117_Med1
order DDErrorSRIV20211118_Med1
order DDErrorSRIV20211119_Med1
order DDErrorSRIV20211120_Med1
order DDErrorSRIV20211121_Med1
order DDErrorSRIV20211122_Med1
order DDErrorSRIV20211124_Med1
order DDErrorSRIV20211126_Med1
order DDErrorSRIV20211127_Med1
order DDErrorSRIV20211128_Med1
order DDErrorSRIV20211129_Med1
order DDErrorSRIV20211130_Med1
order DDErrorSRIV20211201_Med1
order DDErrorSRIV20211202_Med1
order DDErrorSRIV20211203_Med1
order DDErrorSRIV20211205_Med1
order DDErrorSRIV20211207_Med1
order DDErrorSRIV20211208_Med1
order DDErrorSRIV20211209_Med1
order DDErrorSRIV20211210_Med1
order DDErrorSRIV20211211_Med1
order DDErrorSRIV20211212_Med1
order DDErrorSRIV20211213_Med1
order DDErrorSRIV20211214_Med1
order DDErrorSRIV20211215_Med1
order DDErrorSRIV20211216_Med1
order DDErrorSRIV20211217_Med1
order DDErrorSRIV20211218_Med1
order DDErrorSRIV20211219_Med1
order DDErrorSRIV20211222_Med1
order DDErrorSRIV20211223_Med1
order DDErrorSRIV20211226_Med1
order DDErrorSRIV20211227_Med1
order DDErrorSRIV20220101_Med1
order DDErrorSRIV20220102_Med1
order DDErrorSRIV20220103_Med1
order DDErrorSRIV20220104_Med1
order DDErrorSRIV20220105_Med1
order DDErrorSRIV20220106_Med1
order DDErrorSRIV20220108_Med1
order DDErrorSRIV20220109_Med1
order DDErrorSRIV20220110_Med1
order DDErrorSRIV20220111_Med1
order DDErrorSRIV20220112_Med1
order DDErrorSRIV20220113_Med1
order DDErrorSRIV20220115_Med1
order DDErrorSRIV20220116_Med1
order DDErrorSRIV20220117_Med1
order DDErrorSRIV20220118_Med1
order DDErrorSRIV20220119_Med1
order DDErrorSRIV20220120_Med1
order DDErrorSRIV20220122_Med1
order DDErrorSRIV20220123_Med1
order DDErrorSRIV20220124_Med1
order DDErrorSRIV20220125_Med1
order DDErrorSRIV20220126_Med1
order DDErrorSRIV20220127_Med1
order DDErrorSRIV20220129_Med1
order DDErrorSRIV20220130_Med1
order DDErrorSRIV20220204_Med1
order DDErrorSRIV20220205_Med1
order DDErrorSRIV20220206_Med1
order DDErrorSRIV20220207_Med1
order DDErrorSRIV20220208_Med1
order DDErrorSRIV20220209_Med1
order DDErrorSRIV20220210_Med1
order DDErrorSRIV20220211_Med1
order DDErrorSRIV20220212_Med1
order DDErrorSRIV20220213_Med1
order DDErrorSRIV20220214_Med1
order DDErrorSRIV20220215_Med1
order DDErrorSRIV20220216_Med1
order DDErrorSRIV20220217_Med1
order DDErrorSRIV20220218_Med1
order DDErrorSRIV20220219_Med1
order DDErrorSRIV20220220_Med1
order DDErrorSRIV20220221_Med1
order DDErrorSRIV20220222_Med1
order DDErrorSRIV20220223_Med1
order DDErrorSRIV20220224_Med1
order DDErrorSRIV20220225_Med1
order DDErrorSRIV20220226_Med1
order DDErrorSRIV20220227_Med1
order DDErrorSRIV20220228_Med1
order DDErrorSRIV20220301_Med1
order DDErrorSRIV20220305_Med1
order DDErrorSRIV20220306_Med1
order DDErrorSRIV20220307_Med1
order DDErrorSRIV20220308_Med1
order DDErrorSRIV20220309_Med1
order DDErrorSRIV20220310_Med1
order DDErrorSRIV20220311_Med1
order DDErrorSRIV20220312_Med1
order DDErrorSRIV20220313_Med1
order DDErrorSRIV20220314_Med1
order DDErrorSRIV20220315_Med1
order DDErrorSRIV20220316_Med1
order DDErrorSRIV20220317_Med1
order DDErrorSRIV20220318_Med1
order DDErrorSRIV20220319_Med1
order DDErrorSRIV20220320_Med1
order DDErrorSRIV20220321_Med1
order DDErrorSRIV20220322_Med1
order DDErrorSRIV20220323_Med1
order DDErrorSRIV20220324_Med1
order DDErrorSRIV20220325_Med1
order DDErrorSRIV20220326_Med1
order DDErrorSRIV20220327_Med1
order DDErrorSRIV20220328_Med1
order DDErrorSRIV20220329_Med1
order DDErrorSRIV20220330_Med1
order DDErrorSRIV20220331_Med1
order DDErrorSRIV20220401_Med1
order DDErrorSRIV20220402_Med1
order DDErrorSRIV20220403_Med1
order DDErrorSRIV20220404_Med1
order DDErrorSRIV20220405_Med1
order DDErrorSRIV20220406_Med1
order DDErrorSRIV20220407_Med1
order DDErrorSRIV20220408_Med1
order DDErrorSRIV20220409_Med1
order DDErrorSRIV20220410_Med1
order DDErrorSRIV20220411_Med1
order DDErrorSRIV20220413_Med1
order DDErrorSRIV20220417_Med1
order DDErrorSRIV20220418_Med1
order DDErrorSRIV20220419_Med1
order DDErrorSRIV20220420_Med1
order DDErrorSRIV20220421_Med1
order DDErrorSRIV20220422_Med1
order DDErrorSRIV20220423_Med1
order DDErrorSRIV20220424_Med1
order DDErrorSRIV20220425_Med1
order DDErrorSRIV20220426_Med1
order DDErrorSRIV20220427_Med1
order DDErrorSRIV20220428_Med1
order DDErrorSRIV20220429_Med1
order DDErrorSRIV20220430_Med1
order DDErrorSRIV20220501_Med1
order DDErrorSRIV20220502_Med1
order DDErrorSRIV20220508_Med1
order DDErrorSRIV20220515_Med1
order DDErrorSRIV20220516_Med1
order DDErrorSRIV20220517_Med1
order DDErrorSRIV20220518_Med1
order DDErrorSRIV20220519_Med1
order DDErrorSRIV20220520_Med1
order DDErrorSRIV20220521_Med1
order DDErrorSRIV20220522_Med1
order DDErrorSRIV20220602_Med1
order DDErrorSRIV20220603_Med1
order DDErrorSRIV20220605_Med1
order DDErrorSRIV20220606_Med1
order DDErrorSRIV20220607_Med1
order DDErrorSRIV20220608_Med1
order DDErrorSRIV20220609_Med1
order DDErrorSRIV20220610_Med1
order DDErrorSRIV20220611_Med1
order DDErrorSRIV20220612_Med1
order DDErrorSRIV20220614_Med1
order DDErrorSRIV20220615_Med1
order DDErrorSRIV20220617_Med1
order DDErrorSRIV20220618_Med1
order DDErrorSRIV20220619_Med1
order DDErrorSRIV20220620_Med1
order DDErrorSRIV20220621_Med1
order DDErrorSRIV20220622_Med1
order DDErrorSRIV20220623_Med1
order DDErrorSRIV20220624_Med1
order DDErrorSRIV20220625_Med1
order DDErrorSRIV20220626_Med1
order DDErrorSRIV20220627_Med1
order DDErrorSRIV20220628_Med1
order DDErrorSRIV20220629_Med1
order DDErrorSRIV20220630_Med1
order DDErrorSRIV20220701_Med1
order DDErrorSRIV20220702_Med1
order DDErrorSRIV20220703_Med1
order DDErrorSRIV20220704_Med1
order DDErrorSRIV20220705_Med1
order DDErrorSRIV20220706_Med1
order DDErrorSRIV20220707_Med1
order DDErrorSRIV20220708_Med1
order DDErrorSRIV20220709_Med1
order DDErrorSRIV20220710_Med1
order DDErrorSRIV20220711_Med1
order DDErrorSRIV20220712_Med1
order DDErrorSRIV20220713_Med1
order DDErrorSRIV20220714_Med1
order DDErrorSRIV20220715_Med1
order DDErrorSRIV20220716_Med1
order DDErrorSRIV20220717_Med1
order DDErrorSRIV20220718_Med1
order DDErrorSRIV20220719_Med1
order DDErrorSRIV20220720_Med1
order DDErrorSRIV20220721_Med1
order DDErrorSRIV20220722_Med1
order DDErrorSRIV20220723_Med1
order DDErrorSRIV20220724_Med1
order DDErrorSRIV20220725_Med1
order DDErrorSRIV20220726_Med1
order DDErrorSRIV20220727_Med1
order DDErrorSRIV20220728_Med1
order DDErrorSRIV20220813_Med1
order DDErrorSRIV20220814_Med1
order DDErrorSRIV20220815_Med1
order DDErrorSRIV20220816_Med1
order DDErrorSRIV20220817_Med1
order DDErrorSRIV20220818_Med1
order DDErrorSRIV20220819_Med1
order DDErrorSRIV20220820_Med1
order DDErrorSRIV20220821_Med1
order DDErrorSRIV20220822_Med1
order DDErrorSRIV20220823_Med1
order DDErrorSRIV20220824_Med1
order DDErrorSRIV20220826_Med1
order DDErrorSRIV20220827_Med1
order DDErrorSRIV20220828_Med1
order DDErrorSRIV20220830_Med1
order DDErrorSRIV20220831_Med1
order DDErrorSRIV20220901_Med1
order DDErrorSRIV20220907_Med1
order DDErrorSRIV20220911_Med1
order DDErrorSRIV20220913_Med1
order DDErrorSRIV20220914_Med1
order DDErrorSRIV20220916_Med1
order DDErrorSRIV20220917_Med1
order DDErrorSRIV20220918_Med1
order DDErrorSRIV20220919_Med1
order DDErrorSRIV20220920_Med1
order DDErrorSRIV20220921_Med1
order DDErrorSRIV20220922_Med1
order DDErrorSRIV20220923_Med1
order DDErrorSRIV20220924_Med1
order DDErrorSRIV20220925_Med1
order DDErrorSRIV20220926_Med1
order DDErrorSRIV20220927_Med1
order DDErrorSRIV20220928_Med1
order DDErrorSRIV20220929_Med1
order DDErrorSRIV20220930_Med1
order DDErrorSRIV20221001_Med1
order DDErrorSRIV20221002_Med1
order DDErrorSRIV20221003_Med1
order DDErrorSRIV20221004_Med1
order DDErrorSRIV20221005_Med1
order DDErrorSRIV20221006_Med1
order DDErrorSRIV20221007_Med1
order DDErrorSRIV20221008_Med1
order DDErrorSRIV20221009_Med1
order DDErrorSRIV20221010_Med1
order DDErrorSRIV20221011_Med1
order DDErrorSRIV20221012_Med1
order DDErrorSRIV20221013_Med1
order DDErrorSRIV20221014_Med1
order DDErrorSRIV20221015_Med1
order DDErrorSRIV20221016_Med1
order DDErrorSRIV20221017_Med1
order DDErrorSRIV20221018_Med1
order DDErrorSRIV20221019_Med1
order DDErrorSRIV20221020_Med1
order DDErrorSRIV20221021_Med1
order DDErrorSRIV20221022_Med1
order DDErrorSRIV20221023_Med1
order DDErrorSRIV20221024_Med1
order DDErrorSRIV20221025_Med1
order DDErrorSRIV20221026_Med1
order DDErrorSRIV20221027_Med1
order DDErrorSRIV20221028_Med1
order DDErrorSRIV20221029_Med1
order DDErrorSRIV20221030_Med1
order DDErrorSRIV20221031_Med1
order DDErrorSRIV20221101_Med1
order DDErrorSRIV20221102_Med1
order DDErrorSRIV20221114_Med1
order DDErrorSRIV20221115_Med1
order DDErrorSRIV20221117_Med1
order DDErrorSRIV20221118_Med1
order DDErrorSRIV20221119_Med1
order DDErrorSRIV20221120_Med1
order DDErrorSRIV20221121_Med1
order DDErrorSRIV20221122_Med1
order DDErrorSRIV20221123_Med1
order DDErrorSRIV20221124_Med1
order DDErrorSRIV20221125_Med1
order DDErrorSRIV20221126_Med1
order DDErrorSRIV20221127_Med1
order DDErrorSRIV20221128_Med1
order DDErrorSRIV20221129_Med1
order DDErrorSRIV20221130_Med1
order DDErrorSRIV20221201_Med1
order DDErrorSRIV20221202_Med1
order DDErrorSRIV20221203_Med1
order DDErrorSRIV20221204_Med1
order DDErrorSRIV20221205_Med1
order DDErrorSRIV20221206_Med1
order DDErrorSRIV20221207_Med1
order DDErrorSRIV20221208_Med1
order DDErrorSRIV20221209_Med1
order DDErrorSRIV20221210_Med1
order DDErrorSRIV20221211_Med1
order DDErrorSRIV20221212_Med1
order DDErrorSRIV20221213_Med1
order DDErrorSRIV20221214_Med1
order DDErrorSRIV20221215_Med1
order DDErrorSRIV20221216_Med1
order DDErrorSRIV20221217_Med1
order DDErrorSRIV20221218_Med1
order DDErrorSRIV20221219_Med1
order DDErrorSRIV20221220_Med1
order DDErrorSRIV20221221_Med1
order DDErrorSRIV20221222_Med1
order DDErrorSRIV20221223_Med1
order DDErrorSRIV20221224_Med1
order DDErrorSRIV20221225_Med1
order DDErrorSRIV20221226_Med1
order DDErrorSRIV20221227_Med1
order DDErrorSRIV20221228_Med1
order DDErrorSRIV20221229_Med1
order DDErrorSRIV20221230_Med1
order DDErrorSRIV20221231_Med1
		
capture drop DDErrorSRIV_Mean1 // "DDErrorSRIV mean over updates of median error by calendar months"
egen DDErrorSRIV_Mean1 = rowmean(DDErrorSRIV20221231_Med1-DDErrorSRIV20200502_Med1) // <<-- modify 5
label var DDErrorSRIV_Mean1 "DDErrorSRIV mean over updates of median error by calendar months"
qui replace DDErrorSRIV_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorSRIV_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorSRIV_Mean1 = . if date < td(02may2020) // 02may2020 is the earliest date of SRIV forecasts for Afghanistan






* gen DDAbsErrSRIV_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 6
 
order DDAbsErrSRIV20200502_Med1
order DDAbsErrSRIV20200503_Med1
order DDAbsErrSRIV20200504_Med1
order DDAbsErrSRIV20200505_Med1
order DDAbsErrSRIV20200506_Med1
order DDAbsErrSRIV20200507_Med1
order DDAbsErrSRIV20200508_Med1
order DDAbsErrSRIV20200509_Med1
order DDAbsErrSRIV20200510_Med1
order DDAbsErrSRIV20200511_Med1
order DDAbsErrSRIV20200512_Med1
order DDAbsErrSRIV20200513_Med1
order DDAbsErrSRIV20200514_Med1
order DDAbsErrSRIV20200515_Med1
order DDAbsErrSRIV20200516_Med1
order DDAbsErrSRIV20200517_Med1
order DDAbsErrSRIV20200518_Med1
order DDAbsErrSRIV20200519_Med1
order DDAbsErrSRIV20200520_Med1
order DDAbsErrSRIV20200521_Med1
order DDAbsErrSRIV20200522_Med1
order DDAbsErrSRIV20200523_Med1
order DDAbsErrSRIV20200524_Med1
order DDAbsErrSRIV20200525_Med1
order DDAbsErrSRIV20200526_Med1
order DDAbsErrSRIV20200527_Med1
order DDAbsErrSRIV20200528_Med1
order DDAbsErrSRIV20200529_Med1
order DDAbsErrSRIV20200530_Med1
order DDAbsErrSRIV20200531_Med1
order DDAbsErrSRIV20200601_Med1
order DDAbsErrSRIV20200602_Med1
order DDAbsErrSRIV20200603_Med1
order DDAbsErrSRIV20200604_Med1
order DDAbsErrSRIV20200605_Med1
order DDAbsErrSRIV20200606_Med1
order DDAbsErrSRIV20200607_Med1
order DDAbsErrSRIV20200608_Med1
order DDAbsErrSRIV20200609_Med1
order DDAbsErrSRIV20200610_Med1
order DDAbsErrSRIV20200611_Med1
order DDAbsErrSRIV20200612_Med1
order DDAbsErrSRIV20200613_Med1
order DDAbsErrSRIV20200614_Med1
order DDAbsErrSRIV20200615_Med1
order DDAbsErrSRIV20200616_Med1
order DDAbsErrSRIV20200617_Med1
order DDAbsErrSRIV20200618_Med1
order DDAbsErrSRIV20200619_Med1
order DDAbsErrSRIV20200620_Med1
order DDAbsErrSRIV20200621_Med1
order DDAbsErrSRIV20200622_Med1
order DDAbsErrSRIV20200623_Med1
order DDAbsErrSRIV20200624_Med1
order DDAbsErrSRIV20200625_Med1
order DDAbsErrSRIV20200626_Med1
order DDAbsErrSRIV20200627_Med1
order DDAbsErrSRIV20200628_Med1
order DDAbsErrSRIV20200629_Med1
order DDAbsErrSRIV20200630_Med1
order DDAbsErrSRIV20200701_Med1
order DDAbsErrSRIV20200702_Med1
order DDAbsErrSRIV20200703_Med1
order DDAbsErrSRIV20200704_Med1
order DDAbsErrSRIV20200705_Med1
order DDAbsErrSRIV20200706_Med1
order DDAbsErrSRIV20200707_Med1
order DDAbsErrSRIV20200708_Med1
order DDAbsErrSRIV20200709_Med1
order DDAbsErrSRIV20200710_Med1
order DDAbsErrSRIV20200711_Med1
order DDAbsErrSRIV20200712_Med1
order DDAbsErrSRIV20200713_Med1
order DDAbsErrSRIV20200714_Med1
order DDAbsErrSRIV20200715_Med1
order DDAbsErrSRIV20200716_Med1
order DDAbsErrSRIV20200717_Med1
order DDAbsErrSRIV20200718_Med1
order DDAbsErrSRIV20200719_Med1
order DDAbsErrSRIV20200720_Med1
order DDAbsErrSRIV20200721_Med1
order DDAbsErrSRIV20200722_Med1
order DDAbsErrSRIV20200723_Med1
order DDAbsErrSRIV20200724_Med1
order DDAbsErrSRIV20200725_Med1
order DDAbsErrSRIV20200726_Med1
order DDAbsErrSRIV20200727_Med1
order DDAbsErrSRIV20200728_Med1
order DDAbsErrSRIV20200729_Med1
order DDAbsErrSRIV20200730_Med1
order DDAbsErrSRIV20200731_Med1
order DDAbsErrSRIV20200801_Med1
order DDAbsErrSRIV20200802_Med1
order DDAbsErrSRIV20200803_Med1
order DDAbsErrSRIV20200804_Med1
order DDAbsErrSRIV20200805_Med1
order DDAbsErrSRIV20200806_Med1
order DDAbsErrSRIV20200807_Med1
order DDAbsErrSRIV20200808_Med1
order DDAbsErrSRIV20200809_Med1
order DDAbsErrSRIV20200810_Med1
order DDAbsErrSRIV20200811_Med1
order DDAbsErrSRIV20200812_Med1
order DDAbsErrSRIV20200813_Med1
order DDAbsErrSRIV20200814_Med1
order DDAbsErrSRIV20200815_Med1
order DDAbsErrSRIV20200816_Med1
order DDAbsErrSRIV20200817_Med1
order DDAbsErrSRIV20200818_Med1
order DDAbsErrSRIV20200819_Med1
order DDAbsErrSRIV20200820_Med1
order DDAbsErrSRIV20200821_Med1
order DDAbsErrSRIV20200822_Med1
order DDAbsErrSRIV20200823_Med1
order DDAbsErrSRIV20200824_Med1
order DDAbsErrSRIV20200825_Med1
order DDAbsErrSRIV20200826_Med1
order DDAbsErrSRIV20200827_Med1
order DDAbsErrSRIV20200828_Med1
order DDAbsErrSRIV20200829_Med1
order DDAbsErrSRIV20200830_Med1
order DDAbsErrSRIV20200831_Med1
order DDAbsErrSRIV20200901_Med1
order DDAbsErrSRIV20200902_Med1
order DDAbsErrSRIV20200903_Med1
order DDAbsErrSRIV20200904_Med1
order DDAbsErrSRIV20200905_Med1
order DDAbsErrSRIV20200906_Med1
order DDAbsErrSRIV20200907_Med1
order DDAbsErrSRIV20200908_Med1
order DDAbsErrSRIV20200909_Med1
order DDAbsErrSRIV20200910_Med1
order DDAbsErrSRIV20200911_Med1
order DDAbsErrSRIV20200912_Med1
order DDAbsErrSRIV20200913_Med1
order DDAbsErrSRIV20200914_Med1
order DDAbsErrSRIV20200915_Med1
order DDAbsErrSRIV20200916_Med1
order DDAbsErrSRIV20200917_Med1
order DDAbsErrSRIV20200918_Med1
order DDAbsErrSRIV20200919_Med1
order DDAbsErrSRIV20200920_Med1
order DDAbsErrSRIV20200921_Med1
order DDAbsErrSRIV20200922_Med1
order DDAbsErrSRIV20200923_Med1
order DDAbsErrSRIV20200924_Med1
order DDAbsErrSRIV20200925_Med1
order DDAbsErrSRIV20200926_Med1
order DDAbsErrSRIV20200927_Med1
order DDAbsErrSRIV20200928_Med1
order DDAbsErrSRIV20200929_Med1
order DDAbsErrSRIV20200930_Med1
order DDAbsErrSRIV20201001_Med1
order DDAbsErrSRIV20201002_Med1
order DDAbsErrSRIV20201003_Med1
order DDAbsErrSRIV20201004_Med1
order DDAbsErrSRIV20201006_Med1
order DDAbsErrSRIV20201007_Med1
order DDAbsErrSRIV20201008_Med1
order DDAbsErrSRIV20201009_Med1
order DDAbsErrSRIV20201010_Med1
order DDAbsErrSRIV20201011_Med1
order DDAbsErrSRIV20201012_Med1
order DDAbsErrSRIV20201013_Med1
order DDAbsErrSRIV20201014_Med1
order DDAbsErrSRIV20201015_Med1
order DDAbsErrSRIV20201016_Med1
order DDAbsErrSRIV20201017_Med1
order DDAbsErrSRIV20201018_Med1
order DDAbsErrSRIV20201019_Med1
order DDAbsErrSRIV20201020_Med1
order DDAbsErrSRIV20201021_Med1
order DDAbsErrSRIV20201022_Med1
order DDAbsErrSRIV20201023_Med1
order DDAbsErrSRIV20201024_Med1
order DDAbsErrSRIV20201025_Med1
order DDAbsErrSRIV20201026_Med1
order DDAbsErrSRIV20201027_Med1
order DDAbsErrSRIV20201028_Med1
order DDAbsErrSRIV20201029_Med1
order DDAbsErrSRIV20201030_Med1
order DDAbsErrSRIV20201031_Med1
order DDAbsErrSRIV20201101_Med1
order DDAbsErrSRIV20201102_Med1
order DDAbsErrSRIV20201103_Med1
order DDAbsErrSRIV20201104_Med1
order DDAbsErrSRIV20201105_Med1
order DDAbsErrSRIV20201106_Med1
order DDAbsErrSRIV20201107_Med1
order DDAbsErrSRIV20201108_Med1
order DDAbsErrSRIV20201109_Med1
order DDAbsErrSRIV20201110_Med1
order DDAbsErrSRIV20201111_Med1
order DDAbsErrSRIV20201112_Med1
order DDAbsErrSRIV20201113_Med1
order DDAbsErrSRIV20201114_Med1
order DDAbsErrSRIV20201115_Med1
order DDAbsErrSRIV20201116_Med1
order DDAbsErrSRIV20201117_Med1
order DDAbsErrSRIV20201118_Med1
order DDAbsErrSRIV20201119_Med1
order DDAbsErrSRIV20201120_Med1
order DDAbsErrSRIV20201121_Med1
order DDAbsErrSRIV20201122_Med1
order DDAbsErrSRIV20201123_Med1
order DDAbsErrSRIV20201124_Med1
order DDAbsErrSRIV20201125_Med1
order DDAbsErrSRIV20201126_Med1
order DDAbsErrSRIV20201127_Med1
order DDAbsErrSRIV20201128_Med1
order DDAbsErrSRIV20201129_Med1
order DDAbsErrSRIV20201130_Med1
order DDAbsErrSRIV20201201_Med1
order DDAbsErrSRIV20201202_Med1
order DDAbsErrSRIV20201203_Med1
order DDAbsErrSRIV20201204_Med1
order DDAbsErrSRIV20201205_Med1
order DDAbsErrSRIV20201206_Med1
order DDAbsErrSRIV20201207_Med1
order DDAbsErrSRIV20201208_Med1
order DDAbsErrSRIV20201209_Med1
order DDAbsErrSRIV20201210_Med1
order DDAbsErrSRIV20201211_Med1
order DDAbsErrSRIV20201212_Med1
order DDAbsErrSRIV20201213_Med1
order DDAbsErrSRIV20201214_Med1
order DDAbsErrSRIV20201216_Med1
order DDAbsErrSRIV20201217_Med1
order DDAbsErrSRIV20201218_Med1
order DDAbsErrSRIV20201219_Med1
order DDAbsErrSRIV20201220_Med1
order DDAbsErrSRIV20201221_Med1
order DDAbsErrSRIV20201222_Med1
order DDAbsErrSRIV20201223_Med1
order DDAbsErrSRIV20201224_Med1
order DDAbsErrSRIV20201225_Med1
order DDAbsErrSRIV20201226_Med1
order DDAbsErrSRIV20201227_Med1
order DDAbsErrSRIV20201229_Med1
order DDAbsErrSRIV20201230_Med1
order DDAbsErrSRIV20201231_Med1
order DDAbsErrSRIV20210101_Med1
order DDAbsErrSRIV20210103_Med1
order DDAbsErrSRIV20210104_Med1
order DDAbsErrSRIV20210105_Med1
order DDAbsErrSRIV20210106_Med1
order DDAbsErrSRIV20210107_Med1
order DDAbsErrSRIV20210108_Med1
order DDAbsErrSRIV20210109_Med1
order DDAbsErrSRIV20210110_Med1
order DDAbsErrSRIV20210111_Med1
order DDAbsErrSRIV20210112_Med1
order DDAbsErrSRIV20210113_Med1
order DDAbsErrSRIV20210114_Med1
order DDAbsErrSRIV20210115_Med1
order DDAbsErrSRIV20210116_Med1
order DDAbsErrSRIV20210117_Med1
order DDAbsErrSRIV20210118_Med1
order DDAbsErrSRIV20210119_Med1
order DDAbsErrSRIV20210120_Med1
order DDAbsErrSRIV20210121_Med1
order DDAbsErrSRIV20210122_Med1
order DDAbsErrSRIV20210123_Med1
order DDAbsErrSRIV20210124_Med1
order DDAbsErrSRIV20210125_Med1
order DDAbsErrSRIV20210126_Med1
order DDAbsErrSRIV20210127_Med1
order DDAbsErrSRIV20210128_Med1
order DDAbsErrSRIV20210129_Med1
order DDAbsErrSRIV20210130_Med1
order DDAbsErrSRIV20210131_Med1
order DDAbsErrSRIV20210201_Med1
order DDAbsErrSRIV20210202_Med1
order DDAbsErrSRIV20210203_Med1
order DDAbsErrSRIV20210204_Med1
order DDAbsErrSRIV20210205_Med1
order DDAbsErrSRIV20210206_Med1
order DDAbsErrSRIV20210207_Med1
order DDAbsErrSRIV20210208_Med1
order DDAbsErrSRIV20210209_Med1
order DDAbsErrSRIV20210210_Med1
order DDAbsErrSRIV20210211_Med1
order DDAbsErrSRIV20210212_Med1
order DDAbsErrSRIV20210213_Med1
order DDAbsErrSRIV20210214_Med1
order DDAbsErrSRIV20210215_Med1
order DDAbsErrSRIV20210216_Med1
order DDAbsErrSRIV20210217_Med1
order DDAbsErrSRIV20210218_Med1
order DDAbsErrSRIV20210219_Med1
order DDAbsErrSRIV20210220_Med1
order DDAbsErrSRIV20210221_Med1
order DDAbsErrSRIV20210222_Med1
order DDAbsErrSRIV20210223_Med1
order DDAbsErrSRIV20210224_Med1
order DDAbsErrSRIV20210225_Med1
order DDAbsErrSRIV20210226_Med1
order DDAbsErrSRIV20210227_Med1
order DDAbsErrSRIV20210228_Med1
order DDAbsErrSRIV20210301_Med1
order DDAbsErrSRIV20210302_Med1
order DDAbsErrSRIV20210303_Med1
order DDAbsErrSRIV20210304_Med1
order DDAbsErrSRIV20210305_Med1
order DDAbsErrSRIV20210306_Med1
order DDAbsErrSRIV20210307_Med1
order DDAbsErrSRIV20210308_Med1
order DDAbsErrSRIV20210309_Med1
order DDAbsErrSRIV20210310_Med1
order DDAbsErrSRIV20210311_Med1
order DDAbsErrSRIV20210312_Med1
order DDAbsErrSRIV20210313_Med1
order DDAbsErrSRIV20210314_Med1
order DDAbsErrSRIV20210315_Med1
order DDAbsErrSRIV20210316_Med1
order DDAbsErrSRIV20210317_Med1
order DDAbsErrSRIV20210318_Med1
order DDAbsErrSRIV20210319_Med1
order DDAbsErrSRIV20210320_Med1
order DDAbsErrSRIV20210321_Med1
order DDAbsErrSRIV20210322_Med1
order DDAbsErrSRIV20210323_Med1
order DDAbsErrSRIV20210324_Med1
order DDAbsErrSRIV20210325_Med1
order DDAbsErrSRIV20210326_Med1
order DDAbsErrSRIV20210327_Med1
order DDAbsErrSRIV20210328_Med1
order DDAbsErrSRIV20210329_Med1
order DDAbsErrSRIV20210330_Med1
order DDAbsErrSRIV20210331_Med1
order DDAbsErrSRIV20210401_Med1
order DDAbsErrSRIV20210402_Med1
order DDAbsErrSRIV20210403_Med1
order DDAbsErrSRIV20210404_Med1
order DDAbsErrSRIV20210405_Med1
order DDAbsErrSRIV20210406_Med1
order DDAbsErrSRIV20210407_Med1
order DDAbsErrSRIV20210408_Med1
order DDAbsErrSRIV20210409_Med1
order DDAbsErrSRIV20210410_Med1
order DDAbsErrSRIV20210411_Med1
order DDAbsErrSRIV20210412_Med1
order DDAbsErrSRIV20210413_Med1
order DDAbsErrSRIV20210414_Med1
order DDAbsErrSRIV20210415_Med1
order DDAbsErrSRIV20210416_Med1
order DDAbsErrSRIV20210417_Med1
order DDAbsErrSRIV20210418_Med1
order DDAbsErrSRIV20210419_Med1
order DDAbsErrSRIV20210420_Med1
order DDAbsErrSRIV20210421_Med1
order DDAbsErrSRIV20210422_Med1
order DDAbsErrSRIV20210423_Med1
order DDAbsErrSRIV20210424_Med1
order DDAbsErrSRIV20210425_Med1
order DDAbsErrSRIV20210426_Med1
order DDAbsErrSRIV20210427_Med1
order DDAbsErrSRIV20210428_Med1
order DDAbsErrSRIV20210429_Med1
order DDAbsErrSRIV20210430_Med1
order DDAbsErrSRIV20210501_Med1
order DDAbsErrSRIV20210502_Med1
order DDAbsErrSRIV20210503_Med1
order DDAbsErrSRIV20210504_Med1
order DDAbsErrSRIV20210505_Med1
order DDAbsErrSRIV20210506_Med1
order DDAbsErrSRIV20210507_Med1
order DDAbsErrSRIV20210508_Med1
order DDAbsErrSRIV20210509_Med1
order DDAbsErrSRIV20210510_Med1
order DDAbsErrSRIV20210511_Med1
order DDAbsErrSRIV20210512_Med1
order DDAbsErrSRIV20210513_Med1
order DDAbsErrSRIV20210514_Med1
order DDAbsErrSRIV20210515_Med1
order DDAbsErrSRIV20210516_Med1
order DDAbsErrSRIV20210517_Med1
order DDAbsErrSRIV20210518_Med1
order DDAbsErrSRIV20210519_Med1
order DDAbsErrSRIV20210520_Med1
order DDAbsErrSRIV20210521_Med1
order DDAbsErrSRIV20210522_Med1
order DDAbsErrSRIV20210523_Med1
order DDAbsErrSRIV20210524_Med1
order DDAbsErrSRIV20210525_Med1
order DDAbsErrSRIV20210526_Med1
order DDAbsErrSRIV20210527_Med1
order DDAbsErrSRIV20210528_Med1
order DDAbsErrSRIV20210529_Med1
order DDAbsErrSRIV20210530_Med1
order DDAbsErrSRIV20210531_Med1
order DDAbsErrSRIV20210601_Med1
order DDAbsErrSRIV20210602_Med1
order DDAbsErrSRIV20210603_Med1
order DDAbsErrSRIV20210604_Med1
order DDAbsErrSRIV20210605_Med1
order DDAbsErrSRIV20210606_Med1
order DDAbsErrSRIV20210607_Med1
order DDAbsErrSRIV20210608_Med1
order DDAbsErrSRIV20210609_Med1
order DDAbsErrSRIV20210610_Med1
order DDAbsErrSRIV20210611_Med1
order DDAbsErrSRIV20210612_Med1
order DDAbsErrSRIV20210613_Med1
order DDAbsErrSRIV20210614_Med1
order DDAbsErrSRIV20210615_Med1
order DDAbsErrSRIV20210616_Med1
order DDAbsErrSRIV20210617_Med1
order DDAbsErrSRIV20210618_Med1
order DDAbsErrSRIV20210619_Med1
order DDAbsErrSRIV20210620_Med1
order DDAbsErrSRIV20210621_Med1
order DDAbsErrSRIV20210622_Med1
order DDAbsErrSRIV20210623_Med1
order DDAbsErrSRIV20210624_Med1
order DDAbsErrSRIV20210627_Med1
order DDAbsErrSRIV20210630_Med1
order DDAbsErrSRIV20210703_Med1
order DDAbsErrSRIV20210704_Med1
order DDAbsErrSRIV20210705_Med1
order DDAbsErrSRIV20210706_Med1
order DDAbsErrSRIV20210707_Med1
order DDAbsErrSRIV20210708_Med1
order DDAbsErrSRIV20210709_Med1
order DDAbsErrSRIV20210710_Med1
order DDAbsErrSRIV20210711_Med1
order DDAbsErrSRIV20210712_Med1
order DDAbsErrSRIV20210713_Med1
order DDAbsErrSRIV20210714_Med1
order DDAbsErrSRIV20210715_Med1
order DDAbsErrSRIV20210716_Med1
order DDAbsErrSRIV20210717_Med1
order DDAbsErrSRIV20210718_Med1
order DDAbsErrSRIV20210719_Med1
order DDAbsErrSRIV20210720_Med1
order DDAbsErrSRIV20210721_Med1
order DDAbsErrSRIV20210722_Med1
order DDAbsErrSRIV20210723_Med1
order DDAbsErrSRIV20210724_Med1
order DDAbsErrSRIV20210725_Med1
order DDAbsErrSRIV20210726_Med1
order DDAbsErrSRIV20210727_Med1
order DDAbsErrSRIV20210728_Med1
order DDAbsErrSRIV20210729_Med1
order DDAbsErrSRIV20210730_Med1
order DDAbsErrSRIV20210731_Med1
order DDAbsErrSRIV20210801_Med1
order DDAbsErrSRIV20210808_Med1
order DDAbsErrSRIV20210809_Med1
order DDAbsErrSRIV20210810_Med1
order DDAbsErrSRIV20210811_Med1
order DDAbsErrSRIV20210813_Med1
order DDAbsErrSRIV20210814_Med1
order DDAbsErrSRIV20210815_Med1
order DDAbsErrSRIV20210816_Med1
order DDAbsErrSRIV20210817_Med1
order DDAbsErrSRIV20210818_Med1
order DDAbsErrSRIV20210819_Med1
order DDAbsErrSRIV20210820_Med1
order DDAbsErrSRIV20210821_Med1
order DDAbsErrSRIV20210822_Med1
order DDAbsErrSRIV20210823_Med1
order DDAbsErrSRIV20210824_Med1
order DDAbsErrSRIV20210825_Med1
order DDAbsErrSRIV20210826_Med1
order DDAbsErrSRIV20210827_Med1
order DDAbsErrSRIV20210828_Med1
order DDAbsErrSRIV20210829_Med1
order DDAbsErrSRIV20210830_Med1
order DDAbsErrSRIV20210831_Med1
order DDAbsErrSRIV20210901_Med1
order DDAbsErrSRIV20210902_Med1
order DDAbsErrSRIV20210903_Med1
order DDAbsErrSRIV20210904_Med1
order DDAbsErrSRIV20210905_Med1
order DDAbsErrSRIV20210906_Med1
order DDAbsErrSRIV20210907_Med1
order DDAbsErrSRIV20210908_Med1
order DDAbsErrSRIV20210909_Med1
order DDAbsErrSRIV20210910_Med1
order DDAbsErrSRIV20210911_Med1
order DDAbsErrSRIV20210912_Med1
order DDAbsErrSRIV20210913_Med1
order DDAbsErrSRIV20210914_Med1
order DDAbsErrSRIV20210915_Med1
order DDAbsErrSRIV20210916_Med1
order DDAbsErrSRIV20210917_Med1
order DDAbsErrSRIV20210918_Med1
order DDAbsErrSRIV20210919_Med1
order DDAbsErrSRIV20210920_Med1
order DDAbsErrSRIV20210921_Med1
order DDAbsErrSRIV20210922_Med1
order DDAbsErrSRIV20210923_Med1
order DDAbsErrSRIV20210924_Med1
order DDAbsErrSRIV20210925_Med1
order DDAbsErrSRIV20210926_Med1
order DDAbsErrSRIV20210927_Med1
order DDAbsErrSRIV20210928_Med1
order DDAbsErrSRIV20210929_Med1
order DDAbsErrSRIV20210930_Med1
order DDAbsErrSRIV20211001_Med1
order DDAbsErrSRIV20211002_Med1
order DDAbsErrSRIV20211003_Med1
order DDAbsErrSRIV20211004_Med1
order DDAbsErrSRIV20211005_Med1
order DDAbsErrSRIV20211006_Med1
order DDAbsErrSRIV20211007_Med1
order DDAbsErrSRIV20211008_Med1
order DDAbsErrSRIV20211009_Med1
order DDAbsErrSRIV20211010_Med1
order DDAbsErrSRIV20211011_Med1
order DDAbsErrSRIV20211012_Med1
order DDAbsErrSRIV20211013_Med1
order DDAbsErrSRIV20211014_Med1
order DDAbsErrSRIV20211015_Med1
order DDAbsErrSRIV20211016_Med1
order DDAbsErrSRIV20211017_Med1
order DDAbsErrSRIV20211024_Med1
order DDAbsErrSRIV20211025_Med1
order DDAbsErrSRIV20211026_Med1
order DDAbsErrSRIV20211027_Med1
order DDAbsErrSRIV20211028_Med1
order DDAbsErrSRIV20211029_Med1
order DDAbsErrSRIV20211030_Med1
order DDAbsErrSRIV20211031_Med1
order DDAbsErrSRIV20211101_Med1
order DDAbsErrSRIV20211102_Med1
order DDAbsErrSRIV20211103_Med1
order DDAbsErrSRIV20211104_Med1
order DDAbsErrSRIV20211105_Med1
order DDAbsErrSRIV20211106_Med1
order DDAbsErrSRIV20211107_Med1
order DDAbsErrSRIV20211108_Med1
order DDAbsErrSRIV20211109_Med1
order DDAbsErrSRIV20211110_Med1
order DDAbsErrSRIV20211111_Med1
order DDAbsErrSRIV20211112_Med1
order DDAbsErrSRIV20211114_Med1
order DDAbsErrSRIV20211115_Med1
order DDAbsErrSRIV20211116_Med1
order DDAbsErrSRIV20211117_Med1
order DDAbsErrSRIV20211118_Med1
order DDAbsErrSRIV20211119_Med1
order DDAbsErrSRIV20211120_Med1
order DDAbsErrSRIV20211121_Med1
order DDAbsErrSRIV20211122_Med1
order DDAbsErrSRIV20211124_Med1
order DDAbsErrSRIV20211126_Med1
order DDAbsErrSRIV20211127_Med1
order DDAbsErrSRIV20211128_Med1
order DDAbsErrSRIV20211129_Med1
order DDAbsErrSRIV20211130_Med1
order DDAbsErrSRIV20211201_Med1
order DDAbsErrSRIV20211202_Med1
order DDAbsErrSRIV20211203_Med1
order DDAbsErrSRIV20211205_Med1
order DDAbsErrSRIV20211207_Med1
order DDAbsErrSRIV20211208_Med1
order DDAbsErrSRIV20211209_Med1
order DDAbsErrSRIV20211210_Med1
order DDAbsErrSRIV20211211_Med1
order DDAbsErrSRIV20211212_Med1
order DDAbsErrSRIV20211213_Med1
order DDAbsErrSRIV20211214_Med1
order DDAbsErrSRIV20211215_Med1
order DDAbsErrSRIV20211216_Med1
order DDAbsErrSRIV20211217_Med1
order DDAbsErrSRIV20211218_Med1
order DDAbsErrSRIV20211219_Med1
order DDAbsErrSRIV20211222_Med1
order DDAbsErrSRIV20211223_Med1
order DDAbsErrSRIV20211226_Med1
order DDAbsErrSRIV20211227_Med1
order DDAbsErrSRIV20220101_Med1
order DDAbsErrSRIV20220102_Med1
order DDAbsErrSRIV20220103_Med1
order DDAbsErrSRIV20220104_Med1
order DDAbsErrSRIV20220105_Med1
order DDAbsErrSRIV20220106_Med1
order DDAbsErrSRIV20220108_Med1
order DDAbsErrSRIV20220109_Med1
order DDAbsErrSRIV20220110_Med1
order DDAbsErrSRIV20220111_Med1
order DDAbsErrSRIV20220112_Med1
order DDAbsErrSRIV20220113_Med1
order DDAbsErrSRIV20220115_Med1
order DDAbsErrSRIV20220116_Med1
order DDAbsErrSRIV20220117_Med1
order DDAbsErrSRIV20220118_Med1
order DDAbsErrSRIV20220119_Med1
order DDAbsErrSRIV20220120_Med1
order DDAbsErrSRIV20220122_Med1
order DDAbsErrSRIV20220123_Med1
order DDAbsErrSRIV20220124_Med1
order DDAbsErrSRIV20220125_Med1
order DDAbsErrSRIV20220126_Med1
order DDAbsErrSRIV20220127_Med1
order DDAbsErrSRIV20220129_Med1
order DDAbsErrSRIV20220130_Med1
order DDAbsErrSRIV20220204_Med1
order DDAbsErrSRIV20220205_Med1
order DDAbsErrSRIV20220206_Med1
order DDAbsErrSRIV20220207_Med1
order DDAbsErrSRIV20220208_Med1
order DDAbsErrSRIV20220209_Med1
order DDAbsErrSRIV20220210_Med1
order DDAbsErrSRIV20220211_Med1
order DDAbsErrSRIV20220212_Med1
order DDAbsErrSRIV20220213_Med1
order DDAbsErrSRIV20220214_Med1
order DDAbsErrSRIV20220215_Med1
order DDAbsErrSRIV20220216_Med1
order DDAbsErrSRIV20220217_Med1
order DDAbsErrSRIV20220218_Med1
order DDAbsErrSRIV20220219_Med1
order DDAbsErrSRIV20220220_Med1
order DDAbsErrSRIV20220221_Med1
order DDAbsErrSRIV20220222_Med1
order DDAbsErrSRIV20220223_Med1
order DDAbsErrSRIV20220224_Med1
order DDAbsErrSRIV20220225_Med1
order DDAbsErrSRIV20220226_Med1
order DDAbsErrSRIV20220227_Med1
order DDAbsErrSRIV20220228_Med1
order DDAbsErrSRIV20220301_Med1
order DDAbsErrSRIV20220305_Med1
order DDAbsErrSRIV20220306_Med1
order DDAbsErrSRIV20220307_Med1
order DDAbsErrSRIV20220308_Med1
order DDAbsErrSRIV20220309_Med1
order DDAbsErrSRIV20220310_Med1
order DDAbsErrSRIV20220311_Med1
order DDAbsErrSRIV20220312_Med1
order DDAbsErrSRIV20220313_Med1
order DDAbsErrSRIV20220314_Med1
order DDAbsErrSRIV20220315_Med1
order DDAbsErrSRIV20220316_Med1
order DDAbsErrSRIV20220317_Med1
order DDAbsErrSRIV20220318_Med1
order DDAbsErrSRIV20220319_Med1
order DDAbsErrSRIV20220320_Med1
order DDAbsErrSRIV20220321_Med1
order DDAbsErrSRIV20220322_Med1
order DDAbsErrSRIV20220323_Med1
order DDAbsErrSRIV20220324_Med1
order DDAbsErrSRIV20220325_Med1
order DDAbsErrSRIV20220326_Med1
order DDAbsErrSRIV20220327_Med1
order DDAbsErrSRIV20220328_Med1
order DDAbsErrSRIV20220329_Med1
order DDAbsErrSRIV20220330_Med1
order DDAbsErrSRIV20220331_Med1
order DDAbsErrSRIV20220401_Med1
order DDAbsErrSRIV20220402_Med1
order DDAbsErrSRIV20220403_Med1
order DDAbsErrSRIV20220404_Med1
order DDAbsErrSRIV20220405_Med1
order DDAbsErrSRIV20220406_Med1
order DDAbsErrSRIV20220407_Med1
order DDAbsErrSRIV20220408_Med1
order DDAbsErrSRIV20220409_Med1
order DDAbsErrSRIV20220410_Med1
order DDAbsErrSRIV20220411_Med1
order DDAbsErrSRIV20220413_Med1
order DDAbsErrSRIV20220417_Med1
order DDAbsErrSRIV20220418_Med1
order DDAbsErrSRIV20220419_Med1
order DDAbsErrSRIV20220420_Med1
order DDAbsErrSRIV20220421_Med1
order DDAbsErrSRIV20220422_Med1
order DDAbsErrSRIV20220423_Med1
order DDAbsErrSRIV20220424_Med1
order DDAbsErrSRIV20220425_Med1
order DDAbsErrSRIV20220426_Med1
order DDAbsErrSRIV20220427_Med1
order DDAbsErrSRIV20220428_Med1
order DDAbsErrSRIV20220429_Med1
order DDAbsErrSRIV20220430_Med1
order DDAbsErrSRIV20220501_Med1
order DDAbsErrSRIV20220502_Med1
order DDAbsErrSRIV20220508_Med1
order DDAbsErrSRIV20220515_Med1
order DDAbsErrSRIV20220516_Med1
order DDAbsErrSRIV20220517_Med1
order DDAbsErrSRIV20220518_Med1
order DDAbsErrSRIV20220519_Med1
order DDAbsErrSRIV20220520_Med1
order DDAbsErrSRIV20220521_Med1
order DDAbsErrSRIV20220522_Med1
order DDAbsErrSRIV20220602_Med1
order DDAbsErrSRIV20220603_Med1
order DDAbsErrSRIV20220605_Med1
order DDAbsErrSRIV20220606_Med1
order DDAbsErrSRIV20220607_Med1
order DDAbsErrSRIV20220608_Med1
order DDAbsErrSRIV20220609_Med1
order DDAbsErrSRIV20220610_Med1
order DDAbsErrSRIV20220611_Med1
order DDAbsErrSRIV20220612_Med1
order DDAbsErrSRIV20220614_Med1
order DDAbsErrSRIV20220615_Med1
order DDAbsErrSRIV20220617_Med1
order DDAbsErrSRIV20220618_Med1
order DDAbsErrSRIV20220619_Med1
order DDAbsErrSRIV20220620_Med1
order DDAbsErrSRIV20220621_Med1
order DDAbsErrSRIV20220622_Med1
order DDAbsErrSRIV20220623_Med1
order DDAbsErrSRIV20220624_Med1
order DDAbsErrSRIV20220625_Med1
order DDAbsErrSRIV20220626_Med1
order DDAbsErrSRIV20220627_Med1
order DDAbsErrSRIV20220628_Med1
order DDAbsErrSRIV20220629_Med1
order DDAbsErrSRIV20220630_Med1
order DDAbsErrSRIV20220701_Med1
order DDAbsErrSRIV20220702_Med1
order DDAbsErrSRIV20220703_Med1
order DDAbsErrSRIV20220704_Med1
order DDAbsErrSRIV20220705_Med1
order DDAbsErrSRIV20220706_Med1
order DDAbsErrSRIV20220707_Med1
order DDAbsErrSRIV20220708_Med1
order DDAbsErrSRIV20220709_Med1
order DDAbsErrSRIV20220710_Med1
order DDAbsErrSRIV20220711_Med1
order DDAbsErrSRIV20220712_Med1
order DDAbsErrSRIV20220713_Med1
order DDAbsErrSRIV20220714_Med1
order DDAbsErrSRIV20220715_Med1
order DDAbsErrSRIV20220716_Med1
order DDAbsErrSRIV20220717_Med1
order DDAbsErrSRIV20220718_Med1
order DDAbsErrSRIV20220719_Med1
order DDAbsErrSRIV20220720_Med1
order DDAbsErrSRIV20220721_Med1
order DDAbsErrSRIV20220722_Med1
order DDAbsErrSRIV20220723_Med1
order DDAbsErrSRIV20220724_Med1
order DDAbsErrSRIV20220725_Med1
order DDAbsErrSRIV20220726_Med1
order DDAbsErrSRIV20220727_Med1
order DDAbsErrSRIV20220728_Med1
order DDAbsErrSRIV20220813_Med1
order DDAbsErrSRIV20220814_Med1
order DDAbsErrSRIV20220815_Med1
order DDAbsErrSRIV20220816_Med1
order DDAbsErrSRIV20220817_Med1
order DDAbsErrSRIV20220818_Med1
order DDAbsErrSRIV20220819_Med1
order DDAbsErrSRIV20220820_Med1
order DDAbsErrSRIV20220821_Med1
order DDAbsErrSRIV20220822_Med1
order DDAbsErrSRIV20220823_Med1
order DDAbsErrSRIV20220824_Med1
order DDAbsErrSRIV20220826_Med1
order DDAbsErrSRIV20220827_Med1
order DDAbsErrSRIV20220828_Med1
order DDAbsErrSRIV20220830_Med1
order DDAbsErrSRIV20220831_Med1
order DDAbsErrSRIV20220901_Med1
order DDAbsErrSRIV20220907_Med1
order DDAbsErrSRIV20220911_Med1
order DDAbsErrSRIV20220913_Med1
order DDAbsErrSRIV20220914_Med1
order DDAbsErrSRIV20220916_Med1
order DDAbsErrSRIV20220917_Med1
order DDAbsErrSRIV20220918_Med1
order DDAbsErrSRIV20220919_Med1
order DDAbsErrSRIV20220920_Med1
order DDAbsErrSRIV20220921_Med1
order DDAbsErrSRIV20220922_Med1
order DDAbsErrSRIV20220923_Med1
order DDAbsErrSRIV20220924_Med1
order DDAbsErrSRIV20220925_Med1
order DDAbsErrSRIV20220926_Med1
order DDAbsErrSRIV20220927_Med1
order DDAbsErrSRIV20220928_Med1
order DDAbsErrSRIV20220929_Med1
order DDAbsErrSRIV20220930_Med1
order DDAbsErrSRIV20221001_Med1
order DDAbsErrSRIV20221002_Med1
order DDAbsErrSRIV20221003_Med1
order DDAbsErrSRIV20221004_Med1
order DDAbsErrSRIV20221005_Med1
order DDAbsErrSRIV20221006_Med1
order DDAbsErrSRIV20221007_Med1
order DDAbsErrSRIV20221008_Med1
order DDAbsErrSRIV20221009_Med1
order DDAbsErrSRIV20221010_Med1
order DDAbsErrSRIV20221011_Med1
order DDAbsErrSRIV20221012_Med1
order DDAbsErrSRIV20221013_Med1
order DDAbsErrSRIV20221014_Med1
order DDAbsErrSRIV20221015_Med1
order DDAbsErrSRIV20221016_Med1
order DDAbsErrSRIV20221017_Med1
order DDAbsErrSRIV20221018_Med1
order DDAbsErrSRIV20221019_Med1
order DDAbsErrSRIV20221020_Med1
order DDAbsErrSRIV20221021_Med1
order DDAbsErrSRIV20221022_Med1
order DDAbsErrSRIV20221023_Med1
order DDAbsErrSRIV20221024_Med1
order DDAbsErrSRIV20221025_Med1
order DDAbsErrSRIV20221026_Med1
order DDAbsErrSRIV20221027_Med1
order DDAbsErrSRIV20221028_Med1
order DDAbsErrSRIV20221029_Med1
order DDAbsErrSRIV20221030_Med1
order DDAbsErrSRIV20221031_Med1
order DDAbsErrSRIV20221101_Med1
order DDAbsErrSRIV20221102_Med1
order DDAbsErrSRIV20221114_Med1
order DDAbsErrSRIV20221115_Med1
order DDAbsErrSRIV20221117_Med1
order DDAbsErrSRIV20221118_Med1
order DDAbsErrSRIV20221119_Med1
order DDAbsErrSRIV20221120_Med1
order DDAbsErrSRIV20221121_Med1
order DDAbsErrSRIV20221122_Med1
order DDAbsErrSRIV20221123_Med1
order DDAbsErrSRIV20221124_Med1
order DDAbsErrSRIV20221125_Med1
order DDAbsErrSRIV20221126_Med1
order DDAbsErrSRIV20221127_Med1
order DDAbsErrSRIV20221128_Med1
order DDAbsErrSRIV20221129_Med1
order DDAbsErrSRIV20221130_Med1
order DDAbsErrSRIV20221201_Med1
order DDAbsErrSRIV20221202_Med1
order DDAbsErrSRIV20221203_Med1
order DDAbsErrSRIV20221204_Med1
order DDAbsErrSRIV20221205_Med1
order DDAbsErrSRIV20221206_Med1
order DDAbsErrSRIV20221207_Med1
order DDAbsErrSRIV20221208_Med1
order DDAbsErrSRIV20221209_Med1
order DDAbsErrSRIV20221210_Med1
order DDAbsErrSRIV20221211_Med1
order DDAbsErrSRIV20221212_Med1
order DDAbsErrSRIV20221213_Med1
order DDAbsErrSRIV20221214_Med1
order DDAbsErrSRIV20221215_Med1
order DDAbsErrSRIV20221216_Med1
order DDAbsErrSRIV20221217_Med1
order DDAbsErrSRIV20221218_Med1
order DDAbsErrSRIV20221219_Med1
order DDAbsErrSRIV20221220_Med1
order DDAbsErrSRIV20221221_Med1
order DDAbsErrSRIV20221222_Med1
order DDAbsErrSRIV20221223_Med1
order DDAbsErrSRIV20221224_Med1
order DDAbsErrSRIV20221225_Med1
order DDAbsErrSRIV20221226_Med1
order DDAbsErrSRIV20221227_Med1
order DDAbsErrSRIV20221228_Med1
order DDAbsErrSRIV20221229_Med1
order DDAbsErrSRIV20221230_Med1
order DDAbsErrSRIV20221231_Med1


capture drop DDAbsErrSRIV_Mean1 // "DDAbsErrSRIV mean over updates of median absolute error by calendar months"
egen DDAbsErrSRIV_Mean1 = rowmean(DDAbsErrSRIV20221231_Med1-DDAbsErrSRIV20200502_Med1) // <<-- modify 7
label var DDAbsErrSRIV_Mean1 "DDAbsErrSRIV mean over updates of median absolute error by calendar months"
qui replace DDAbsErrSRIV_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrSRIV_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrSRIV_Mean1 = . if date < td(02may2020) // 02may2020 is the earliest date of SRIV forecasts for Afghanistan







* gen DDPerErrSRIV_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

// <<-- modify 8

order DDPerErrSRIV20200502_Med1
order DDPerErrSRIV20200503_Med1
order DDPerErrSRIV20200504_Med1
order DDPerErrSRIV20200505_Med1
order DDPerErrSRIV20200506_Med1
order DDPerErrSRIV20200507_Med1
order DDPerErrSRIV20200508_Med1
order DDPerErrSRIV20200509_Med1
order DDPerErrSRIV20200510_Med1
order DDPerErrSRIV20200511_Med1
order DDPerErrSRIV20200512_Med1
order DDPerErrSRIV20200513_Med1
order DDPerErrSRIV20200514_Med1
order DDPerErrSRIV20200515_Med1
order DDPerErrSRIV20200516_Med1
order DDPerErrSRIV20200517_Med1
order DDPerErrSRIV20200518_Med1
order DDPerErrSRIV20200519_Med1
order DDPerErrSRIV20200520_Med1
order DDPerErrSRIV20200521_Med1
order DDPerErrSRIV20200522_Med1
order DDPerErrSRIV20200523_Med1
order DDPerErrSRIV20200524_Med1
order DDPerErrSRIV20200525_Med1
order DDPerErrSRIV20200526_Med1
order DDPerErrSRIV20200527_Med1
order DDPerErrSRIV20200528_Med1
order DDPerErrSRIV20200529_Med1
order DDPerErrSRIV20200530_Med1
order DDPerErrSRIV20200531_Med1
order DDPerErrSRIV20200601_Med1
order DDPerErrSRIV20200602_Med1
order DDPerErrSRIV20200603_Med1
order DDPerErrSRIV20200604_Med1
order DDPerErrSRIV20200605_Med1
order DDPerErrSRIV20200606_Med1
order DDPerErrSRIV20200607_Med1
order DDPerErrSRIV20200608_Med1
order DDPerErrSRIV20200609_Med1
order DDPerErrSRIV20200610_Med1
order DDPerErrSRIV20200611_Med1
order DDPerErrSRIV20200612_Med1
order DDPerErrSRIV20200613_Med1
order DDPerErrSRIV20200614_Med1
order DDPerErrSRIV20200615_Med1
order DDPerErrSRIV20200616_Med1
order DDPerErrSRIV20200617_Med1
order DDPerErrSRIV20200618_Med1
order DDPerErrSRIV20200619_Med1
order DDPerErrSRIV20200620_Med1
order DDPerErrSRIV20200621_Med1
order DDPerErrSRIV20200622_Med1
order DDPerErrSRIV20200623_Med1
order DDPerErrSRIV20200624_Med1
order DDPerErrSRIV20200625_Med1
order DDPerErrSRIV20200626_Med1
order DDPerErrSRIV20200627_Med1
order DDPerErrSRIV20200628_Med1
order DDPerErrSRIV20200629_Med1
order DDPerErrSRIV20200630_Med1
order DDPerErrSRIV20200701_Med1
order DDPerErrSRIV20200702_Med1
order DDPerErrSRIV20200703_Med1
order DDPerErrSRIV20200704_Med1
order DDPerErrSRIV20200705_Med1
order DDPerErrSRIV20200706_Med1
order DDPerErrSRIV20200707_Med1
order DDPerErrSRIV20200708_Med1
order DDPerErrSRIV20200709_Med1
order DDPerErrSRIV20200710_Med1
order DDPerErrSRIV20200711_Med1
order DDPerErrSRIV20200712_Med1
order DDPerErrSRIV20200713_Med1
order DDPerErrSRIV20200714_Med1
order DDPerErrSRIV20200715_Med1
order DDPerErrSRIV20200716_Med1
order DDPerErrSRIV20200717_Med1
order DDPerErrSRIV20200718_Med1
order DDPerErrSRIV20200719_Med1
order DDPerErrSRIV20200720_Med1
order DDPerErrSRIV20200721_Med1
order DDPerErrSRIV20200722_Med1
order DDPerErrSRIV20200723_Med1
order DDPerErrSRIV20200724_Med1
order DDPerErrSRIV20200725_Med1
order DDPerErrSRIV20200726_Med1
order DDPerErrSRIV20200727_Med1
order DDPerErrSRIV20200728_Med1
order DDPerErrSRIV20200729_Med1
order DDPerErrSRIV20200730_Med1
order DDPerErrSRIV20200731_Med1
order DDPerErrSRIV20200801_Med1
order DDPerErrSRIV20200802_Med1
order DDPerErrSRIV20200803_Med1
order DDPerErrSRIV20200804_Med1
order DDPerErrSRIV20200805_Med1
order DDPerErrSRIV20200806_Med1
order DDPerErrSRIV20200807_Med1
order DDPerErrSRIV20200808_Med1
order DDPerErrSRIV20200809_Med1
order DDPerErrSRIV20200810_Med1
order DDPerErrSRIV20200811_Med1
order DDPerErrSRIV20200812_Med1
order DDPerErrSRIV20200813_Med1
order DDPerErrSRIV20200814_Med1
order DDPerErrSRIV20200815_Med1
order DDPerErrSRIV20200816_Med1
order DDPerErrSRIV20200817_Med1
order DDPerErrSRIV20200818_Med1
order DDPerErrSRIV20200819_Med1
order DDPerErrSRIV20200820_Med1
order DDPerErrSRIV20200821_Med1
order DDPerErrSRIV20200822_Med1
order DDPerErrSRIV20200823_Med1
order DDPerErrSRIV20200824_Med1
order DDPerErrSRIV20200825_Med1
order DDPerErrSRIV20200826_Med1
order DDPerErrSRIV20200827_Med1
order DDPerErrSRIV20200828_Med1
order DDPerErrSRIV20200829_Med1
order DDPerErrSRIV20200830_Med1
order DDPerErrSRIV20200831_Med1
order DDPerErrSRIV20200901_Med1
order DDPerErrSRIV20200902_Med1
order DDPerErrSRIV20200903_Med1
order DDPerErrSRIV20200904_Med1
order DDPerErrSRIV20200905_Med1
order DDPerErrSRIV20200906_Med1
order DDPerErrSRIV20200907_Med1
order DDPerErrSRIV20200908_Med1
order DDPerErrSRIV20200909_Med1
order DDPerErrSRIV20200910_Med1
order DDPerErrSRIV20200911_Med1
order DDPerErrSRIV20200912_Med1
order DDPerErrSRIV20200913_Med1
order DDPerErrSRIV20200914_Med1
order DDPerErrSRIV20200915_Med1
order DDPerErrSRIV20200916_Med1
order DDPerErrSRIV20200917_Med1
order DDPerErrSRIV20200918_Med1
order DDPerErrSRIV20200919_Med1
order DDPerErrSRIV20200920_Med1
order DDPerErrSRIV20200921_Med1
order DDPerErrSRIV20200922_Med1
order DDPerErrSRIV20200923_Med1
order DDPerErrSRIV20200924_Med1
order DDPerErrSRIV20200925_Med1
order DDPerErrSRIV20200926_Med1
order DDPerErrSRIV20200927_Med1
order DDPerErrSRIV20200928_Med1
order DDPerErrSRIV20200929_Med1
order DDPerErrSRIV20200930_Med1
order DDPerErrSRIV20201001_Med1
order DDPerErrSRIV20201002_Med1
order DDPerErrSRIV20201003_Med1
order DDPerErrSRIV20201004_Med1
order DDPerErrSRIV20201006_Med1
order DDPerErrSRIV20201007_Med1
order DDPerErrSRIV20201008_Med1
order DDPerErrSRIV20201009_Med1
order DDPerErrSRIV20201010_Med1
order DDPerErrSRIV20201011_Med1
order DDPerErrSRIV20201012_Med1
order DDPerErrSRIV20201013_Med1
order DDPerErrSRIV20201014_Med1
order DDPerErrSRIV20201015_Med1
order DDPerErrSRIV20201016_Med1
order DDPerErrSRIV20201017_Med1
order DDPerErrSRIV20201018_Med1
order DDPerErrSRIV20201019_Med1
order DDPerErrSRIV20201020_Med1
order DDPerErrSRIV20201021_Med1
order DDPerErrSRIV20201022_Med1
order DDPerErrSRIV20201023_Med1
order DDPerErrSRIV20201024_Med1
order DDPerErrSRIV20201025_Med1
order DDPerErrSRIV20201026_Med1
order DDPerErrSRIV20201027_Med1
order DDPerErrSRIV20201028_Med1
order DDPerErrSRIV20201029_Med1
order DDPerErrSRIV20201030_Med1
order DDPerErrSRIV20201031_Med1
order DDPerErrSRIV20201101_Med1
order DDPerErrSRIV20201102_Med1
order DDPerErrSRIV20201103_Med1
order DDPerErrSRIV20201104_Med1
order DDPerErrSRIV20201105_Med1
order DDPerErrSRIV20201106_Med1
order DDPerErrSRIV20201107_Med1
order DDPerErrSRIV20201108_Med1
order DDPerErrSRIV20201109_Med1
order DDPerErrSRIV20201110_Med1
order DDPerErrSRIV20201111_Med1
order DDPerErrSRIV20201112_Med1
order DDPerErrSRIV20201113_Med1
order DDPerErrSRIV20201114_Med1
order DDPerErrSRIV20201115_Med1
order DDPerErrSRIV20201116_Med1
order DDPerErrSRIV20201117_Med1
order DDPerErrSRIV20201118_Med1
order DDPerErrSRIV20201119_Med1
order DDPerErrSRIV20201120_Med1
order DDPerErrSRIV20201121_Med1
order DDPerErrSRIV20201122_Med1
order DDPerErrSRIV20201123_Med1
order DDPerErrSRIV20201124_Med1
order DDPerErrSRIV20201125_Med1
order DDPerErrSRIV20201126_Med1
order DDPerErrSRIV20201127_Med1
order DDPerErrSRIV20201128_Med1
order DDPerErrSRIV20201129_Med1
order DDPerErrSRIV20201130_Med1
order DDPerErrSRIV20201201_Med1
order DDPerErrSRIV20201202_Med1
order DDPerErrSRIV20201203_Med1
order DDPerErrSRIV20201204_Med1
order DDPerErrSRIV20201205_Med1
order DDPerErrSRIV20201206_Med1
order DDPerErrSRIV20201207_Med1
order DDPerErrSRIV20201208_Med1
order DDPerErrSRIV20201209_Med1
order DDPerErrSRIV20201210_Med1
order DDPerErrSRIV20201211_Med1
order DDPerErrSRIV20201212_Med1
order DDPerErrSRIV20201213_Med1
order DDPerErrSRIV20201214_Med1
order DDPerErrSRIV20201216_Med1
order DDPerErrSRIV20201217_Med1
order DDPerErrSRIV20201218_Med1
order DDPerErrSRIV20201219_Med1
order DDPerErrSRIV20201220_Med1
order DDPerErrSRIV20201221_Med1
order DDPerErrSRIV20201222_Med1
order DDPerErrSRIV20201223_Med1
order DDPerErrSRIV20201224_Med1
order DDPerErrSRIV20201225_Med1
order DDPerErrSRIV20201226_Med1
order DDPerErrSRIV20201227_Med1
order DDPerErrSRIV20201229_Med1
order DDPerErrSRIV20201230_Med1
order DDPerErrSRIV20201231_Med1
order DDPerErrSRIV20210101_Med1
order DDPerErrSRIV20210103_Med1
order DDPerErrSRIV20210104_Med1
order DDPerErrSRIV20210105_Med1
order DDPerErrSRIV20210106_Med1
order DDPerErrSRIV20210107_Med1
order DDPerErrSRIV20210108_Med1
order DDPerErrSRIV20210109_Med1
order DDPerErrSRIV20210110_Med1
order DDPerErrSRIV20210111_Med1
order DDPerErrSRIV20210112_Med1
order DDPerErrSRIV20210113_Med1
order DDPerErrSRIV20210114_Med1
order DDPerErrSRIV20210115_Med1
order DDPerErrSRIV20210116_Med1
order DDPerErrSRIV20210117_Med1
order DDPerErrSRIV20210118_Med1
order DDPerErrSRIV20210119_Med1
order DDPerErrSRIV20210120_Med1
order DDPerErrSRIV20210121_Med1
order DDPerErrSRIV20210122_Med1
order DDPerErrSRIV20210123_Med1
order DDPerErrSRIV20210124_Med1
order DDPerErrSRIV20210125_Med1
order DDPerErrSRIV20210126_Med1
order DDPerErrSRIV20210127_Med1
order DDPerErrSRIV20210128_Med1
order DDPerErrSRIV20210129_Med1
order DDPerErrSRIV20210130_Med1
order DDPerErrSRIV20210131_Med1
order DDPerErrSRIV20210201_Med1
order DDPerErrSRIV20210202_Med1
order DDPerErrSRIV20210203_Med1
order DDPerErrSRIV20210204_Med1
order DDPerErrSRIV20210205_Med1
order DDPerErrSRIV20210206_Med1
order DDPerErrSRIV20210207_Med1
order DDPerErrSRIV20210208_Med1
order DDPerErrSRIV20210209_Med1
order DDPerErrSRIV20210210_Med1
order DDPerErrSRIV20210211_Med1
order DDPerErrSRIV20210212_Med1
order DDPerErrSRIV20210213_Med1
order DDPerErrSRIV20210214_Med1
order DDPerErrSRIV20210215_Med1
order DDPerErrSRIV20210216_Med1
order DDPerErrSRIV20210217_Med1
order DDPerErrSRIV20210218_Med1
order DDPerErrSRIV20210219_Med1
order DDPerErrSRIV20210220_Med1
order DDPerErrSRIV20210221_Med1
order DDPerErrSRIV20210222_Med1
order DDPerErrSRIV20210223_Med1
order DDPerErrSRIV20210224_Med1
order DDPerErrSRIV20210225_Med1
order DDPerErrSRIV20210226_Med1
order DDPerErrSRIV20210227_Med1
order DDPerErrSRIV20210228_Med1
order DDPerErrSRIV20210301_Med1
order DDPerErrSRIV20210302_Med1
order DDPerErrSRIV20210303_Med1
order DDPerErrSRIV20210304_Med1
order DDPerErrSRIV20210305_Med1
order DDPerErrSRIV20210306_Med1
order DDPerErrSRIV20210307_Med1
order DDPerErrSRIV20210308_Med1
order DDPerErrSRIV20210309_Med1
order DDPerErrSRIV20210310_Med1
order DDPerErrSRIV20210311_Med1
order DDPerErrSRIV20210312_Med1
order DDPerErrSRIV20210313_Med1
order DDPerErrSRIV20210314_Med1
order DDPerErrSRIV20210315_Med1
order DDPerErrSRIV20210316_Med1
order DDPerErrSRIV20210317_Med1
order DDPerErrSRIV20210318_Med1
order DDPerErrSRIV20210319_Med1
order DDPerErrSRIV20210320_Med1
order DDPerErrSRIV20210321_Med1
order DDPerErrSRIV20210322_Med1
order DDPerErrSRIV20210323_Med1
order DDPerErrSRIV20210324_Med1
order DDPerErrSRIV20210325_Med1
order DDPerErrSRIV20210326_Med1
order DDPerErrSRIV20210327_Med1
order DDPerErrSRIV20210328_Med1
order DDPerErrSRIV20210329_Med1
order DDPerErrSRIV20210330_Med1
order DDPerErrSRIV20210331_Med1
order DDPerErrSRIV20210401_Med1
order DDPerErrSRIV20210402_Med1
order DDPerErrSRIV20210403_Med1
order DDPerErrSRIV20210404_Med1
order DDPerErrSRIV20210405_Med1
order DDPerErrSRIV20210406_Med1
order DDPerErrSRIV20210407_Med1
order DDPerErrSRIV20210408_Med1
order DDPerErrSRIV20210409_Med1
order DDPerErrSRIV20210410_Med1
order DDPerErrSRIV20210411_Med1
order DDPerErrSRIV20210412_Med1
order DDPerErrSRIV20210413_Med1
order DDPerErrSRIV20210414_Med1
order DDPerErrSRIV20210415_Med1
order DDPerErrSRIV20210416_Med1
order DDPerErrSRIV20210417_Med1
order DDPerErrSRIV20210418_Med1
order DDPerErrSRIV20210419_Med1
order DDPerErrSRIV20210420_Med1
order DDPerErrSRIV20210421_Med1
order DDPerErrSRIV20210422_Med1
order DDPerErrSRIV20210423_Med1
order DDPerErrSRIV20210424_Med1
order DDPerErrSRIV20210425_Med1
order DDPerErrSRIV20210426_Med1
order DDPerErrSRIV20210427_Med1
order DDPerErrSRIV20210428_Med1
order DDPerErrSRIV20210429_Med1
order DDPerErrSRIV20210430_Med1
order DDPerErrSRIV20210501_Med1
order DDPerErrSRIV20210502_Med1
order DDPerErrSRIV20210503_Med1
order DDPerErrSRIV20210504_Med1
order DDPerErrSRIV20210505_Med1
order DDPerErrSRIV20210506_Med1
order DDPerErrSRIV20210507_Med1
order DDPerErrSRIV20210508_Med1
order DDPerErrSRIV20210509_Med1
order DDPerErrSRIV20210510_Med1
order DDPerErrSRIV20210511_Med1
order DDPerErrSRIV20210512_Med1
order DDPerErrSRIV20210513_Med1
order DDPerErrSRIV20210514_Med1
order DDPerErrSRIV20210515_Med1
order DDPerErrSRIV20210516_Med1
order DDPerErrSRIV20210517_Med1
order DDPerErrSRIV20210518_Med1
order DDPerErrSRIV20210519_Med1
order DDPerErrSRIV20210520_Med1
order DDPerErrSRIV20210521_Med1
order DDPerErrSRIV20210522_Med1
order DDPerErrSRIV20210523_Med1
order DDPerErrSRIV20210524_Med1
order DDPerErrSRIV20210525_Med1
order DDPerErrSRIV20210526_Med1
order DDPerErrSRIV20210527_Med1
order DDPerErrSRIV20210528_Med1
order DDPerErrSRIV20210529_Med1
order DDPerErrSRIV20210530_Med1
order DDPerErrSRIV20210531_Med1
order DDPerErrSRIV20210601_Med1
order DDPerErrSRIV20210602_Med1
order DDPerErrSRIV20210603_Med1
order DDPerErrSRIV20210604_Med1
order DDPerErrSRIV20210605_Med1
order DDPerErrSRIV20210606_Med1
order DDPerErrSRIV20210607_Med1
order DDPerErrSRIV20210608_Med1
order DDPerErrSRIV20210609_Med1
order DDPerErrSRIV20210610_Med1
order DDPerErrSRIV20210611_Med1
order DDPerErrSRIV20210612_Med1
order DDPerErrSRIV20210613_Med1
order DDPerErrSRIV20210614_Med1
order DDPerErrSRIV20210615_Med1
order DDPerErrSRIV20210616_Med1
order DDPerErrSRIV20210617_Med1
order DDPerErrSRIV20210618_Med1
order DDPerErrSRIV20210619_Med1
order DDPerErrSRIV20210620_Med1
order DDPerErrSRIV20210621_Med1
order DDPerErrSRIV20210622_Med1
order DDPerErrSRIV20210623_Med1
order DDPerErrSRIV20210624_Med1
order DDPerErrSRIV20210627_Med1
order DDPerErrSRIV20210630_Med1
order DDPerErrSRIV20210703_Med1
order DDPerErrSRIV20210704_Med1
order DDPerErrSRIV20210705_Med1
order DDPerErrSRIV20210706_Med1
order DDPerErrSRIV20210707_Med1
order DDPerErrSRIV20210708_Med1
order DDPerErrSRIV20210709_Med1
order DDPerErrSRIV20210710_Med1
order DDPerErrSRIV20210711_Med1
order DDPerErrSRIV20210712_Med1
order DDPerErrSRIV20210713_Med1
order DDPerErrSRIV20210714_Med1
order DDPerErrSRIV20210715_Med1
order DDPerErrSRIV20210716_Med1
order DDPerErrSRIV20210717_Med1
order DDPerErrSRIV20210718_Med1
order DDPerErrSRIV20210719_Med1
order DDPerErrSRIV20210720_Med1
order DDPerErrSRIV20210721_Med1
order DDPerErrSRIV20210722_Med1
order DDPerErrSRIV20210723_Med1
order DDPerErrSRIV20210724_Med1
order DDPerErrSRIV20210725_Med1
order DDPerErrSRIV20210726_Med1
order DDPerErrSRIV20210727_Med1
order DDPerErrSRIV20210728_Med1
order DDPerErrSRIV20210729_Med1
order DDPerErrSRIV20210730_Med1
order DDPerErrSRIV20210731_Med1
order DDPerErrSRIV20210801_Med1
order DDPerErrSRIV20210808_Med1
order DDPerErrSRIV20210809_Med1
order DDPerErrSRIV20210810_Med1
order DDPerErrSRIV20210811_Med1
order DDPerErrSRIV20210813_Med1
order DDPerErrSRIV20210814_Med1
order DDPerErrSRIV20210815_Med1
order DDPerErrSRIV20210816_Med1
order DDPerErrSRIV20210817_Med1
order DDPerErrSRIV20210818_Med1
order DDPerErrSRIV20210819_Med1
order DDPerErrSRIV20210820_Med1
order DDPerErrSRIV20210821_Med1
order DDPerErrSRIV20210822_Med1
order DDPerErrSRIV20210823_Med1
order DDPerErrSRIV20210824_Med1
order DDPerErrSRIV20210825_Med1
order DDPerErrSRIV20210826_Med1
order DDPerErrSRIV20210827_Med1
order DDPerErrSRIV20210828_Med1
order DDPerErrSRIV20210829_Med1
order DDPerErrSRIV20210830_Med1
order DDPerErrSRIV20210831_Med1
order DDPerErrSRIV20210901_Med1
order DDPerErrSRIV20210902_Med1
order DDPerErrSRIV20210903_Med1
order DDPerErrSRIV20210904_Med1
order DDPerErrSRIV20210905_Med1
order DDPerErrSRIV20210906_Med1
order DDPerErrSRIV20210907_Med1
order DDPerErrSRIV20210908_Med1
order DDPerErrSRIV20210909_Med1
order DDPerErrSRIV20210910_Med1
order DDPerErrSRIV20210911_Med1
order DDPerErrSRIV20210912_Med1
order DDPerErrSRIV20210913_Med1
order DDPerErrSRIV20210914_Med1
order DDPerErrSRIV20210915_Med1
order DDPerErrSRIV20210916_Med1
order DDPerErrSRIV20210917_Med1
order DDPerErrSRIV20210918_Med1
order DDPerErrSRIV20210919_Med1
order DDPerErrSRIV20210920_Med1
order DDPerErrSRIV20210921_Med1
order DDPerErrSRIV20210922_Med1
order DDPerErrSRIV20210923_Med1
order DDPerErrSRIV20210924_Med1
order DDPerErrSRIV20210925_Med1
order DDPerErrSRIV20210926_Med1
order DDPerErrSRIV20210927_Med1
order DDPerErrSRIV20210928_Med1
order DDPerErrSRIV20210929_Med1
order DDPerErrSRIV20210930_Med1
order DDPerErrSRIV20211001_Med1
order DDPerErrSRIV20211002_Med1
order DDPerErrSRIV20211003_Med1
order DDPerErrSRIV20211004_Med1
order DDPerErrSRIV20211005_Med1
order DDPerErrSRIV20211006_Med1
order DDPerErrSRIV20211007_Med1
order DDPerErrSRIV20211008_Med1
order DDPerErrSRIV20211009_Med1
order DDPerErrSRIV20211010_Med1
order DDPerErrSRIV20211011_Med1
order DDPerErrSRIV20211012_Med1
order DDPerErrSRIV20211013_Med1
order DDPerErrSRIV20211014_Med1
order DDPerErrSRIV20211015_Med1
order DDPerErrSRIV20211016_Med1
order DDPerErrSRIV20211017_Med1
order DDPerErrSRIV20211024_Med1
order DDPerErrSRIV20211025_Med1
order DDPerErrSRIV20211026_Med1
order DDPerErrSRIV20211027_Med1
order DDPerErrSRIV20211028_Med1
order DDPerErrSRIV20211029_Med1
order DDPerErrSRIV20211030_Med1
order DDPerErrSRIV20211031_Med1
order DDPerErrSRIV20211101_Med1
order DDPerErrSRIV20211102_Med1
order DDPerErrSRIV20211103_Med1
order DDPerErrSRIV20211104_Med1
order DDPerErrSRIV20211105_Med1
order DDPerErrSRIV20211106_Med1
order DDPerErrSRIV20211107_Med1
order DDPerErrSRIV20211108_Med1
order DDPerErrSRIV20211109_Med1
order DDPerErrSRIV20211110_Med1
order DDPerErrSRIV20211111_Med1
order DDPerErrSRIV20211112_Med1
order DDPerErrSRIV20211114_Med1
order DDPerErrSRIV20211115_Med1
order DDPerErrSRIV20211116_Med1
order DDPerErrSRIV20211117_Med1
order DDPerErrSRIV20211118_Med1
order DDPerErrSRIV20211119_Med1
order DDPerErrSRIV20211120_Med1
order DDPerErrSRIV20211121_Med1
order DDPerErrSRIV20211122_Med1
order DDPerErrSRIV20211124_Med1
order DDPerErrSRIV20211126_Med1
order DDPerErrSRIV20211127_Med1
order DDPerErrSRIV20211128_Med1
order DDPerErrSRIV20211129_Med1
order DDPerErrSRIV20211130_Med1
order DDPerErrSRIV20211201_Med1
order DDPerErrSRIV20211202_Med1
order DDPerErrSRIV20211203_Med1
order DDPerErrSRIV20211205_Med1
order DDPerErrSRIV20211207_Med1
order DDPerErrSRIV20211208_Med1
order DDPerErrSRIV20211209_Med1
order DDPerErrSRIV20211210_Med1
order DDPerErrSRIV20211211_Med1
order DDPerErrSRIV20211212_Med1
order DDPerErrSRIV20211213_Med1
order DDPerErrSRIV20211214_Med1
order DDPerErrSRIV20211215_Med1
order DDPerErrSRIV20211216_Med1
order DDPerErrSRIV20211217_Med1
order DDPerErrSRIV20211218_Med1
order DDPerErrSRIV20211219_Med1
order DDPerErrSRIV20211222_Med1
order DDPerErrSRIV20211223_Med1
order DDPerErrSRIV20211226_Med1
order DDPerErrSRIV20211227_Med1
order DDPerErrSRIV20220101_Med1
order DDPerErrSRIV20220102_Med1
order DDPerErrSRIV20220103_Med1
order DDPerErrSRIV20220104_Med1
order DDPerErrSRIV20220105_Med1
order DDPerErrSRIV20220106_Med1
order DDPerErrSRIV20220108_Med1
order DDPerErrSRIV20220109_Med1
order DDPerErrSRIV20220110_Med1
order DDPerErrSRIV20220111_Med1
order DDPerErrSRIV20220112_Med1
order DDPerErrSRIV20220113_Med1
order DDPerErrSRIV20220115_Med1
order DDPerErrSRIV20220116_Med1
order DDPerErrSRIV20220117_Med1
order DDPerErrSRIV20220118_Med1
order DDPerErrSRIV20220119_Med1
order DDPerErrSRIV20220120_Med1
order DDPerErrSRIV20220122_Med1
order DDPerErrSRIV20220123_Med1
order DDPerErrSRIV20220124_Med1
order DDPerErrSRIV20220125_Med1
order DDPerErrSRIV20220126_Med1
order DDPerErrSRIV20220127_Med1
order DDPerErrSRIV20220129_Med1
order DDPerErrSRIV20220130_Med1
order DDPerErrSRIV20220204_Med1
order DDPerErrSRIV20220205_Med1
order DDPerErrSRIV20220206_Med1
order DDPerErrSRIV20220207_Med1
order DDPerErrSRIV20220208_Med1
order DDPerErrSRIV20220209_Med1
order DDPerErrSRIV20220210_Med1
order DDPerErrSRIV20220211_Med1
order DDPerErrSRIV20220212_Med1
order DDPerErrSRIV20220213_Med1
order DDPerErrSRIV20220214_Med1
order DDPerErrSRIV20220215_Med1
order DDPerErrSRIV20220216_Med1
order DDPerErrSRIV20220217_Med1
order DDPerErrSRIV20220218_Med1
order DDPerErrSRIV20220219_Med1
order DDPerErrSRIV20220220_Med1
order DDPerErrSRIV20220221_Med1
order DDPerErrSRIV20220222_Med1
order DDPerErrSRIV20220223_Med1
order DDPerErrSRIV20220224_Med1
order DDPerErrSRIV20220225_Med1
order DDPerErrSRIV20220226_Med1
order DDPerErrSRIV20220227_Med1
order DDPerErrSRIV20220228_Med1
order DDPerErrSRIV20220301_Med1
order DDPerErrSRIV20220305_Med1
order DDPerErrSRIV20220306_Med1
order DDPerErrSRIV20220307_Med1
order DDPerErrSRIV20220308_Med1
order DDPerErrSRIV20220309_Med1
order DDPerErrSRIV20220310_Med1
order DDPerErrSRIV20220311_Med1
order DDPerErrSRIV20220312_Med1
order DDPerErrSRIV20220313_Med1
order DDPerErrSRIV20220314_Med1
order DDPerErrSRIV20220315_Med1
order DDPerErrSRIV20220316_Med1
order DDPerErrSRIV20220317_Med1
order DDPerErrSRIV20220318_Med1
order DDPerErrSRIV20220319_Med1
order DDPerErrSRIV20220320_Med1
order DDPerErrSRIV20220321_Med1
order DDPerErrSRIV20220322_Med1
order DDPerErrSRIV20220323_Med1
order DDPerErrSRIV20220324_Med1
order DDPerErrSRIV20220325_Med1
order DDPerErrSRIV20220326_Med1
order DDPerErrSRIV20220327_Med1
order DDPerErrSRIV20220328_Med1
order DDPerErrSRIV20220329_Med1
order DDPerErrSRIV20220330_Med1
order DDPerErrSRIV20220331_Med1
order DDPerErrSRIV20220401_Med1
order DDPerErrSRIV20220402_Med1
order DDPerErrSRIV20220403_Med1
order DDPerErrSRIV20220404_Med1
order DDPerErrSRIV20220405_Med1
order DDPerErrSRIV20220406_Med1
order DDPerErrSRIV20220407_Med1
order DDPerErrSRIV20220408_Med1
order DDPerErrSRIV20220409_Med1
order DDPerErrSRIV20220410_Med1
order DDPerErrSRIV20220411_Med1
order DDPerErrSRIV20220413_Med1
order DDPerErrSRIV20220417_Med1
order DDPerErrSRIV20220418_Med1
order DDPerErrSRIV20220419_Med1
order DDPerErrSRIV20220420_Med1
order DDPerErrSRIV20220421_Med1
order DDPerErrSRIV20220422_Med1
order DDPerErrSRIV20220423_Med1
order DDPerErrSRIV20220424_Med1
order DDPerErrSRIV20220425_Med1
order DDPerErrSRIV20220426_Med1
order DDPerErrSRIV20220427_Med1
order DDPerErrSRIV20220428_Med1
order DDPerErrSRIV20220429_Med1
order DDPerErrSRIV20220430_Med1
order DDPerErrSRIV20220501_Med1
order DDPerErrSRIV20220502_Med1
order DDPerErrSRIV20220508_Med1
order DDPerErrSRIV20220515_Med1
order DDPerErrSRIV20220516_Med1
order DDPerErrSRIV20220517_Med1
order DDPerErrSRIV20220518_Med1
order DDPerErrSRIV20220519_Med1
order DDPerErrSRIV20220520_Med1
order DDPerErrSRIV20220521_Med1
order DDPerErrSRIV20220522_Med1
order DDPerErrSRIV20220602_Med1
order DDPerErrSRIV20220603_Med1
order DDPerErrSRIV20220605_Med1
order DDPerErrSRIV20220606_Med1
order DDPerErrSRIV20220607_Med1
order DDPerErrSRIV20220608_Med1
order DDPerErrSRIV20220609_Med1
order DDPerErrSRIV20220610_Med1
order DDPerErrSRIV20220611_Med1
order DDPerErrSRIV20220612_Med1
order DDPerErrSRIV20220614_Med1
order DDPerErrSRIV20220615_Med1
order DDPerErrSRIV20220617_Med1
order DDPerErrSRIV20220618_Med1
order DDPerErrSRIV20220619_Med1
order DDPerErrSRIV20220620_Med1
order DDPerErrSRIV20220621_Med1
order DDPerErrSRIV20220622_Med1
order DDPerErrSRIV20220623_Med1
order DDPerErrSRIV20220624_Med1
order DDPerErrSRIV20220625_Med1
order DDPerErrSRIV20220626_Med1
order DDPerErrSRIV20220627_Med1
order DDPerErrSRIV20220628_Med1
order DDPerErrSRIV20220629_Med1
order DDPerErrSRIV20220630_Med1
order DDPerErrSRIV20220701_Med1
order DDPerErrSRIV20220702_Med1
order DDPerErrSRIV20220703_Med1
order DDPerErrSRIV20220704_Med1
order DDPerErrSRIV20220705_Med1
order DDPerErrSRIV20220706_Med1
order DDPerErrSRIV20220707_Med1
order DDPerErrSRIV20220708_Med1
order DDPerErrSRIV20220709_Med1
order DDPerErrSRIV20220710_Med1
order DDPerErrSRIV20220711_Med1
order DDPerErrSRIV20220712_Med1
order DDPerErrSRIV20220713_Med1
order DDPerErrSRIV20220714_Med1
order DDPerErrSRIV20220715_Med1
order DDPerErrSRIV20220716_Med1
order DDPerErrSRIV20220717_Med1
order DDPerErrSRIV20220718_Med1
order DDPerErrSRIV20220719_Med1
order DDPerErrSRIV20220720_Med1
order DDPerErrSRIV20220721_Med1
order DDPerErrSRIV20220722_Med1
order DDPerErrSRIV20220723_Med1
order DDPerErrSRIV20220724_Med1
order DDPerErrSRIV20220725_Med1
order DDPerErrSRIV20220726_Med1
order DDPerErrSRIV20220727_Med1
order DDPerErrSRIV20220728_Med1
order DDPerErrSRIV20220813_Med1
order DDPerErrSRIV20220814_Med1
order DDPerErrSRIV20220815_Med1
order DDPerErrSRIV20220816_Med1
order DDPerErrSRIV20220817_Med1
order DDPerErrSRIV20220818_Med1
order DDPerErrSRIV20220819_Med1
order DDPerErrSRIV20220820_Med1
order DDPerErrSRIV20220821_Med1
order DDPerErrSRIV20220822_Med1
order DDPerErrSRIV20220823_Med1
order DDPerErrSRIV20220824_Med1
order DDPerErrSRIV20220826_Med1
order DDPerErrSRIV20220827_Med1
order DDPerErrSRIV20220828_Med1
order DDPerErrSRIV20220830_Med1
order DDPerErrSRIV20220831_Med1
order DDPerErrSRIV20220901_Med1
order DDPerErrSRIV20220907_Med1
order DDPerErrSRIV20220911_Med1
order DDPerErrSRIV20220913_Med1
order DDPerErrSRIV20220914_Med1
order DDPerErrSRIV20220916_Med1
order DDPerErrSRIV20220917_Med1
order DDPerErrSRIV20220918_Med1
order DDPerErrSRIV20220919_Med1
order DDPerErrSRIV20220920_Med1
order DDPerErrSRIV20220921_Med1
order DDPerErrSRIV20220922_Med1
order DDPerErrSRIV20220923_Med1
order DDPerErrSRIV20220924_Med1
order DDPerErrSRIV20220925_Med1
order DDPerErrSRIV20220926_Med1
order DDPerErrSRIV20220927_Med1
order DDPerErrSRIV20220928_Med1
order DDPerErrSRIV20220929_Med1
order DDPerErrSRIV20220930_Med1
order DDPerErrSRIV20221001_Med1
order DDPerErrSRIV20221002_Med1
order DDPerErrSRIV20221003_Med1
order DDPerErrSRIV20221004_Med1
order DDPerErrSRIV20221005_Med1
order DDPerErrSRIV20221006_Med1
order DDPerErrSRIV20221007_Med1
order DDPerErrSRIV20221008_Med1
order DDPerErrSRIV20221009_Med1
order DDPerErrSRIV20221010_Med1
order DDPerErrSRIV20221011_Med1
order DDPerErrSRIV20221012_Med1
order DDPerErrSRIV20221013_Med1
order DDPerErrSRIV20221014_Med1
order DDPerErrSRIV20221015_Med1
order DDPerErrSRIV20221016_Med1
order DDPerErrSRIV20221017_Med1
order DDPerErrSRIV20221018_Med1
order DDPerErrSRIV20221019_Med1
order DDPerErrSRIV20221020_Med1
order DDPerErrSRIV20221021_Med1
order DDPerErrSRIV20221022_Med1
order DDPerErrSRIV20221023_Med1
order DDPerErrSRIV20221024_Med1
order DDPerErrSRIV20221025_Med1
order DDPerErrSRIV20221026_Med1
order DDPerErrSRIV20221027_Med1
order DDPerErrSRIV20221028_Med1
order DDPerErrSRIV20221029_Med1
order DDPerErrSRIV20221030_Med1
order DDPerErrSRIV20221031_Med1
order DDPerErrSRIV20221101_Med1
order DDPerErrSRIV20221102_Med1
order DDPerErrSRIV20221114_Med1
order DDPerErrSRIV20221115_Med1
order DDPerErrSRIV20221117_Med1
order DDPerErrSRIV20221118_Med1
order DDPerErrSRIV20221119_Med1
order DDPerErrSRIV20221120_Med1
order DDPerErrSRIV20221121_Med1
order DDPerErrSRIV20221122_Med1
order DDPerErrSRIV20221123_Med1
order DDPerErrSRIV20221124_Med1
order DDPerErrSRIV20221125_Med1
order DDPerErrSRIV20221126_Med1
order DDPerErrSRIV20221127_Med1
order DDPerErrSRIV20221128_Med1
order DDPerErrSRIV20221129_Med1
order DDPerErrSRIV20221130_Med1
order DDPerErrSRIV20221201_Med1
order DDPerErrSRIV20221202_Med1
order DDPerErrSRIV20221203_Med1
order DDPerErrSRIV20221204_Med1
order DDPerErrSRIV20221205_Med1
order DDPerErrSRIV20221206_Med1
order DDPerErrSRIV20221207_Med1
order DDPerErrSRIV20221208_Med1
order DDPerErrSRIV20221209_Med1
order DDPerErrSRIV20221210_Med1
order DDPerErrSRIV20221211_Med1
order DDPerErrSRIV20221212_Med1
order DDPerErrSRIV20221213_Med1
order DDPerErrSRIV20221214_Med1
order DDPerErrSRIV20221215_Med1
order DDPerErrSRIV20221216_Med1
order DDPerErrSRIV20221217_Med1
order DDPerErrSRIV20221218_Med1
order DDPerErrSRIV20221219_Med1
order DDPerErrSRIV20221220_Med1
order DDPerErrSRIV20221221_Med1
order DDPerErrSRIV20221222_Med1
order DDPerErrSRIV20221223_Med1
order DDPerErrSRIV20221224_Med1
order DDPerErrSRIV20221225_Med1
order DDPerErrSRIV20221226_Med1
order DDPerErrSRIV20221227_Med1
order DDPerErrSRIV20221228_Med1
order DDPerErrSRIV20221229_Med1
order DDPerErrSRIV20221230_Med1
order DDPerErrSRIV20221231_Med1


capture drop DDPerErrSRIV_Mean1 // "DDPerErrSRIV mean over updates of median absolute % error by calendar months"
egen DDPerErrSRIV_Mean1 = rowmean(DDPerErrSRIV20221231_Med1-DDPerErrSRIV20200502_Med1) // <<-- modify 9
label var DDPerErrSRIV_Mean1 "DDPerErrSRIV mean over updates of median % error by calendar months"
qui replace DDPerErrSRIV_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrSRIV_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrSRIV_Mean1 = . if date < td(02may2020) // 02may2020 is the earliest date of SRIV forecasts for Afghanistan

 
 
 

* gen DDAbPeErSRIV_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 10
 

order DDAbPeErSRIV20200502_Med1
order DDAbPeErSRIV20200503_Med1
order DDAbPeErSRIV20200504_Med1
order DDAbPeErSRIV20200505_Med1
order DDAbPeErSRIV20200506_Med1
order DDAbPeErSRIV20200507_Med1
order DDAbPeErSRIV20200508_Med1
order DDAbPeErSRIV20200509_Med1
order DDAbPeErSRIV20200510_Med1
order DDAbPeErSRIV20200511_Med1
order DDAbPeErSRIV20200512_Med1
order DDAbPeErSRIV20200513_Med1
order DDAbPeErSRIV20200514_Med1
order DDAbPeErSRIV20200515_Med1
order DDAbPeErSRIV20200516_Med1
order DDAbPeErSRIV20200517_Med1
order DDAbPeErSRIV20200518_Med1
order DDAbPeErSRIV20200519_Med1
order DDAbPeErSRIV20200520_Med1
order DDAbPeErSRIV20200521_Med1
order DDAbPeErSRIV20200522_Med1
order DDAbPeErSRIV20200523_Med1
order DDAbPeErSRIV20200524_Med1
order DDAbPeErSRIV20200525_Med1
order DDAbPeErSRIV20200526_Med1
order DDAbPeErSRIV20200527_Med1
order DDAbPeErSRIV20200528_Med1
order DDAbPeErSRIV20200529_Med1
order DDAbPeErSRIV20200530_Med1
order DDAbPeErSRIV20200531_Med1
order DDAbPeErSRIV20200601_Med1
order DDAbPeErSRIV20200602_Med1
order DDAbPeErSRIV20200603_Med1
order DDAbPeErSRIV20200604_Med1
order DDAbPeErSRIV20200605_Med1
order DDAbPeErSRIV20200606_Med1
order DDAbPeErSRIV20200607_Med1
order DDAbPeErSRIV20200608_Med1
order DDAbPeErSRIV20200609_Med1
order DDAbPeErSRIV20200610_Med1
order DDAbPeErSRIV20200611_Med1
order DDAbPeErSRIV20200612_Med1
order DDAbPeErSRIV20200613_Med1
order DDAbPeErSRIV20200614_Med1
order DDAbPeErSRIV20200615_Med1
order DDAbPeErSRIV20200616_Med1
order DDAbPeErSRIV20200617_Med1
order DDAbPeErSRIV20200618_Med1
order DDAbPeErSRIV20200619_Med1
order DDAbPeErSRIV20200620_Med1
order DDAbPeErSRIV20200621_Med1
order DDAbPeErSRIV20200622_Med1
order DDAbPeErSRIV20200623_Med1
order DDAbPeErSRIV20200624_Med1
order DDAbPeErSRIV20200625_Med1
order DDAbPeErSRIV20200626_Med1
order DDAbPeErSRIV20200627_Med1
order DDAbPeErSRIV20200628_Med1
order DDAbPeErSRIV20200629_Med1
order DDAbPeErSRIV20200630_Med1
order DDAbPeErSRIV20200701_Med1
order DDAbPeErSRIV20200702_Med1
order DDAbPeErSRIV20200703_Med1
order DDAbPeErSRIV20200704_Med1
order DDAbPeErSRIV20200705_Med1
order DDAbPeErSRIV20200706_Med1
order DDAbPeErSRIV20200707_Med1
order DDAbPeErSRIV20200708_Med1
order DDAbPeErSRIV20200709_Med1
order DDAbPeErSRIV20200710_Med1
order DDAbPeErSRIV20200711_Med1
order DDAbPeErSRIV20200712_Med1
order DDAbPeErSRIV20200713_Med1
order DDAbPeErSRIV20200714_Med1
order DDAbPeErSRIV20200715_Med1
order DDAbPeErSRIV20200716_Med1
order DDAbPeErSRIV20200717_Med1
order DDAbPeErSRIV20200718_Med1
order DDAbPeErSRIV20200719_Med1
order DDAbPeErSRIV20200720_Med1
order DDAbPeErSRIV20200721_Med1
order DDAbPeErSRIV20200722_Med1
order DDAbPeErSRIV20200723_Med1
order DDAbPeErSRIV20200724_Med1
order DDAbPeErSRIV20200725_Med1
order DDAbPeErSRIV20200726_Med1
order DDAbPeErSRIV20200727_Med1
order DDAbPeErSRIV20200728_Med1
order DDAbPeErSRIV20200729_Med1
order DDAbPeErSRIV20200730_Med1
order DDAbPeErSRIV20200731_Med1
order DDAbPeErSRIV20200801_Med1
order DDAbPeErSRIV20200802_Med1
order DDAbPeErSRIV20200803_Med1
order DDAbPeErSRIV20200804_Med1
order DDAbPeErSRIV20200805_Med1
order DDAbPeErSRIV20200806_Med1
order DDAbPeErSRIV20200807_Med1
order DDAbPeErSRIV20200808_Med1
order DDAbPeErSRIV20200809_Med1
order DDAbPeErSRIV20200810_Med1
order DDAbPeErSRIV20200811_Med1
order DDAbPeErSRIV20200812_Med1
order DDAbPeErSRIV20200813_Med1
order DDAbPeErSRIV20200814_Med1
order DDAbPeErSRIV20200815_Med1
order DDAbPeErSRIV20200816_Med1
order DDAbPeErSRIV20200817_Med1
order DDAbPeErSRIV20200818_Med1
order DDAbPeErSRIV20200819_Med1
order DDAbPeErSRIV20200820_Med1
order DDAbPeErSRIV20200821_Med1
order DDAbPeErSRIV20200822_Med1
order DDAbPeErSRIV20200823_Med1
order DDAbPeErSRIV20200824_Med1
order DDAbPeErSRIV20200825_Med1
order DDAbPeErSRIV20200826_Med1
order DDAbPeErSRIV20200827_Med1
order DDAbPeErSRIV20200828_Med1
order DDAbPeErSRIV20200829_Med1
order DDAbPeErSRIV20200830_Med1
order DDAbPeErSRIV20200831_Med1
order DDAbPeErSRIV20200901_Med1
order DDAbPeErSRIV20200902_Med1
order DDAbPeErSRIV20200903_Med1
order DDAbPeErSRIV20200904_Med1
order DDAbPeErSRIV20200905_Med1
order DDAbPeErSRIV20200906_Med1
order DDAbPeErSRIV20200907_Med1
order DDAbPeErSRIV20200908_Med1
order DDAbPeErSRIV20200909_Med1
order DDAbPeErSRIV20200910_Med1
order DDAbPeErSRIV20200911_Med1
order DDAbPeErSRIV20200912_Med1
order DDAbPeErSRIV20200913_Med1
order DDAbPeErSRIV20200914_Med1
order DDAbPeErSRIV20200915_Med1
order DDAbPeErSRIV20200916_Med1
order DDAbPeErSRIV20200917_Med1
order DDAbPeErSRIV20200918_Med1
order DDAbPeErSRIV20200919_Med1
order DDAbPeErSRIV20200920_Med1
order DDAbPeErSRIV20200921_Med1
order DDAbPeErSRIV20200922_Med1
order DDAbPeErSRIV20200923_Med1
order DDAbPeErSRIV20200924_Med1
order DDAbPeErSRIV20200925_Med1
order DDAbPeErSRIV20200926_Med1
order DDAbPeErSRIV20200927_Med1
order DDAbPeErSRIV20200928_Med1
order DDAbPeErSRIV20200929_Med1
order DDAbPeErSRIV20200930_Med1
order DDAbPeErSRIV20201001_Med1
order DDAbPeErSRIV20201002_Med1
order DDAbPeErSRIV20201003_Med1
order DDAbPeErSRIV20201004_Med1
order DDAbPeErSRIV20201006_Med1
order DDAbPeErSRIV20201007_Med1
order DDAbPeErSRIV20201008_Med1
order DDAbPeErSRIV20201009_Med1
order DDAbPeErSRIV20201010_Med1
order DDAbPeErSRIV20201011_Med1
order DDAbPeErSRIV20201012_Med1
order DDAbPeErSRIV20201013_Med1
order DDAbPeErSRIV20201014_Med1
order DDAbPeErSRIV20201015_Med1
order DDAbPeErSRIV20201016_Med1
order DDAbPeErSRIV20201017_Med1
order DDAbPeErSRIV20201018_Med1
order DDAbPeErSRIV20201019_Med1
order DDAbPeErSRIV20201020_Med1
order DDAbPeErSRIV20201021_Med1
order DDAbPeErSRIV20201022_Med1
order DDAbPeErSRIV20201023_Med1
order DDAbPeErSRIV20201024_Med1
order DDAbPeErSRIV20201025_Med1
order DDAbPeErSRIV20201026_Med1
order DDAbPeErSRIV20201027_Med1
order DDAbPeErSRIV20201028_Med1
order DDAbPeErSRIV20201029_Med1
order DDAbPeErSRIV20201030_Med1
order DDAbPeErSRIV20201031_Med1
order DDAbPeErSRIV20201101_Med1
order DDAbPeErSRIV20201102_Med1
order DDAbPeErSRIV20201103_Med1
order DDAbPeErSRIV20201104_Med1
order DDAbPeErSRIV20201105_Med1
order DDAbPeErSRIV20201106_Med1
order DDAbPeErSRIV20201107_Med1
order DDAbPeErSRIV20201108_Med1
order DDAbPeErSRIV20201109_Med1
order DDAbPeErSRIV20201110_Med1
order DDAbPeErSRIV20201111_Med1
order DDAbPeErSRIV20201112_Med1
order DDAbPeErSRIV20201113_Med1
order DDAbPeErSRIV20201114_Med1
order DDAbPeErSRIV20201115_Med1
order DDAbPeErSRIV20201116_Med1
order DDAbPeErSRIV20201117_Med1
order DDAbPeErSRIV20201118_Med1
order DDAbPeErSRIV20201119_Med1
order DDAbPeErSRIV20201120_Med1
order DDAbPeErSRIV20201121_Med1
order DDAbPeErSRIV20201122_Med1
order DDAbPeErSRIV20201123_Med1
order DDAbPeErSRIV20201124_Med1
order DDAbPeErSRIV20201125_Med1
order DDAbPeErSRIV20201126_Med1
order DDAbPeErSRIV20201127_Med1
order DDAbPeErSRIV20201128_Med1
order DDAbPeErSRIV20201129_Med1
order DDAbPeErSRIV20201130_Med1
order DDAbPeErSRIV20201201_Med1
order DDAbPeErSRIV20201202_Med1
order DDAbPeErSRIV20201203_Med1
order DDAbPeErSRIV20201204_Med1
order DDAbPeErSRIV20201205_Med1
order DDAbPeErSRIV20201206_Med1
order DDAbPeErSRIV20201207_Med1
order DDAbPeErSRIV20201208_Med1
order DDAbPeErSRIV20201209_Med1
order DDAbPeErSRIV20201210_Med1
order DDAbPeErSRIV20201211_Med1
order DDAbPeErSRIV20201212_Med1
order DDAbPeErSRIV20201213_Med1
order DDAbPeErSRIV20201214_Med1
order DDAbPeErSRIV20201216_Med1
order DDAbPeErSRIV20201217_Med1
order DDAbPeErSRIV20201218_Med1
order DDAbPeErSRIV20201219_Med1
order DDAbPeErSRIV20201220_Med1
order DDAbPeErSRIV20201221_Med1
order DDAbPeErSRIV20201222_Med1
order DDAbPeErSRIV20201223_Med1
order DDAbPeErSRIV20201224_Med1
order DDAbPeErSRIV20201225_Med1
order DDAbPeErSRIV20201226_Med1
order DDAbPeErSRIV20201227_Med1
order DDAbPeErSRIV20201229_Med1
order DDAbPeErSRIV20201230_Med1
order DDAbPeErSRIV20201231_Med1
order DDAbPeErSRIV20210101_Med1
order DDAbPeErSRIV20210103_Med1
order DDAbPeErSRIV20210104_Med1
order DDAbPeErSRIV20210105_Med1
order DDAbPeErSRIV20210106_Med1
order DDAbPeErSRIV20210107_Med1
order DDAbPeErSRIV20210108_Med1
order DDAbPeErSRIV20210109_Med1
order DDAbPeErSRIV20210110_Med1
order DDAbPeErSRIV20210111_Med1
order DDAbPeErSRIV20210112_Med1
order DDAbPeErSRIV20210113_Med1
order DDAbPeErSRIV20210114_Med1
order DDAbPeErSRIV20210115_Med1
order DDAbPeErSRIV20210116_Med1
order DDAbPeErSRIV20210117_Med1
order DDAbPeErSRIV20210118_Med1
order DDAbPeErSRIV20210119_Med1
order DDAbPeErSRIV20210120_Med1
order DDAbPeErSRIV20210121_Med1
order DDAbPeErSRIV20210122_Med1
order DDAbPeErSRIV20210123_Med1
order DDAbPeErSRIV20210124_Med1
order DDAbPeErSRIV20210125_Med1
order DDAbPeErSRIV20210126_Med1
order DDAbPeErSRIV20210127_Med1
order DDAbPeErSRIV20210128_Med1
order DDAbPeErSRIV20210129_Med1
order DDAbPeErSRIV20210130_Med1
order DDAbPeErSRIV20210131_Med1
order DDAbPeErSRIV20210201_Med1
order DDAbPeErSRIV20210202_Med1
order DDAbPeErSRIV20210203_Med1
order DDAbPeErSRIV20210204_Med1
order DDAbPeErSRIV20210205_Med1
order DDAbPeErSRIV20210206_Med1
order DDAbPeErSRIV20210207_Med1
order DDAbPeErSRIV20210208_Med1
order DDAbPeErSRIV20210209_Med1
order DDAbPeErSRIV20210210_Med1
order DDAbPeErSRIV20210211_Med1
order DDAbPeErSRIV20210212_Med1
order DDAbPeErSRIV20210213_Med1
order DDAbPeErSRIV20210214_Med1
order DDAbPeErSRIV20210215_Med1
order DDAbPeErSRIV20210216_Med1
order DDAbPeErSRIV20210217_Med1
order DDAbPeErSRIV20210218_Med1
order DDAbPeErSRIV20210219_Med1
order DDAbPeErSRIV20210220_Med1
order DDAbPeErSRIV20210221_Med1
order DDAbPeErSRIV20210222_Med1
order DDAbPeErSRIV20210223_Med1
order DDAbPeErSRIV20210224_Med1
order DDAbPeErSRIV20210225_Med1
order DDAbPeErSRIV20210226_Med1
order DDAbPeErSRIV20210227_Med1
order DDAbPeErSRIV20210228_Med1
order DDAbPeErSRIV20210301_Med1
order DDAbPeErSRIV20210302_Med1
order DDAbPeErSRIV20210303_Med1
order DDAbPeErSRIV20210304_Med1
order DDAbPeErSRIV20210305_Med1
order DDAbPeErSRIV20210306_Med1
order DDAbPeErSRIV20210307_Med1
order DDAbPeErSRIV20210308_Med1
order DDAbPeErSRIV20210309_Med1
order DDAbPeErSRIV20210310_Med1
order DDAbPeErSRIV20210311_Med1
order DDAbPeErSRIV20210312_Med1
order DDAbPeErSRIV20210313_Med1
order DDAbPeErSRIV20210314_Med1
order DDAbPeErSRIV20210315_Med1
order DDAbPeErSRIV20210316_Med1
order DDAbPeErSRIV20210317_Med1
order DDAbPeErSRIV20210318_Med1
order DDAbPeErSRIV20210319_Med1
order DDAbPeErSRIV20210320_Med1
order DDAbPeErSRIV20210321_Med1
order DDAbPeErSRIV20210322_Med1
order DDAbPeErSRIV20210323_Med1
order DDAbPeErSRIV20210324_Med1
order DDAbPeErSRIV20210325_Med1
order DDAbPeErSRIV20210326_Med1
order DDAbPeErSRIV20210327_Med1
order DDAbPeErSRIV20210328_Med1
order DDAbPeErSRIV20210329_Med1
order DDAbPeErSRIV20210330_Med1
order DDAbPeErSRIV20210331_Med1
order DDAbPeErSRIV20210401_Med1
order DDAbPeErSRIV20210402_Med1
order DDAbPeErSRIV20210403_Med1
order DDAbPeErSRIV20210404_Med1
order DDAbPeErSRIV20210405_Med1
order DDAbPeErSRIV20210406_Med1
order DDAbPeErSRIV20210407_Med1
order DDAbPeErSRIV20210408_Med1
order DDAbPeErSRIV20210409_Med1
order DDAbPeErSRIV20210410_Med1
order DDAbPeErSRIV20210411_Med1
order DDAbPeErSRIV20210412_Med1
order DDAbPeErSRIV20210413_Med1
order DDAbPeErSRIV20210414_Med1
order DDAbPeErSRIV20210415_Med1
order DDAbPeErSRIV20210416_Med1
order DDAbPeErSRIV20210417_Med1
order DDAbPeErSRIV20210418_Med1
order DDAbPeErSRIV20210419_Med1
order DDAbPeErSRIV20210420_Med1
order DDAbPeErSRIV20210421_Med1
order DDAbPeErSRIV20210422_Med1
order DDAbPeErSRIV20210423_Med1
order DDAbPeErSRIV20210424_Med1
order DDAbPeErSRIV20210425_Med1
order DDAbPeErSRIV20210426_Med1
order DDAbPeErSRIV20210427_Med1
order DDAbPeErSRIV20210428_Med1
order DDAbPeErSRIV20210429_Med1
order DDAbPeErSRIV20210430_Med1
order DDAbPeErSRIV20210501_Med1
order DDAbPeErSRIV20210502_Med1
order DDAbPeErSRIV20210503_Med1
order DDAbPeErSRIV20210504_Med1
order DDAbPeErSRIV20210505_Med1
order DDAbPeErSRIV20210506_Med1
order DDAbPeErSRIV20210507_Med1
order DDAbPeErSRIV20210508_Med1
order DDAbPeErSRIV20210509_Med1
order DDAbPeErSRIV20210510_Med1
order DDAbPeErSRIV20210511_Med1
order DDAbPeErSRIV20210512_Med1
order DDAbPeErSRIV20210513_Med1
order DDAbPeErSRIV20210514_Med1
order DDAbPeErSRIV20210515_Med1
order DDAbPeErSRIV20210516_Med1
order DDAbPeErSRIV20210517_Med1
order DDAbPeErSRIV20210518_Med1
order DDAbPeErSRIV20210519_Med1
order DDAbPeErSRIV20210520_Med1
order DDAbPeErSRIV20210521_Med1
order DDAbPeErSRIV20210522_Med1
order DDAbPeErSRIV20210523_Med1
order DDAbPeErSRIV20210524_Med1
order DDAbPeErSRIV20210525_Med1
order DDAbPeErSRIV20210526_Med1
order DDAbPeErSRIV20210527_Med1
order DDAbPeErSRIV20210528_Med1
order DDAbPeErSRIV20210529_Med1
order DDAbPeErSRIV20210530_Med1
order DDAbPeErSRIV20210531_Med1
order DDAbPeErSRIV20210601_Med1
order DDAbPeErSRIV20210602_Med1
order DDAbPeErSRIV20210603_Med1
order DDAbPeErSRIV20210604_Med1
order DDAbPeErSRIV20210605_Med1
order DDAbPeErSRIV20210606_Med1
order DDAbPeErSRIV20210607_Med1
order DDAbPeErSRIV20210608_Med1
order DDAbPeErSRIV20210609_Med1
order DDAbPeErSRIV20210610_Med1
order DDAbPeErSRIV20210611_Med1
order DDAbPeErSRIV20210612_Med1
order DDAbPeErSRIV20210613_Med1
order DDAbPeErSRIV20210614_Med1
order DDAbPeErSRIV20210615_Med1
order DDAbPeErSRIV20210616_Med1
order DDAbPeErSRIV20210617_Med1
order DDAbPeErSRIV20210618_Med1
order DDAbPeErSRIV20210619_Med1
order DDAbPeErSRIV20210620_Med1
order DDAbPeErSRIV20210621_Med1
order DDAbPeErSRIV20210622_Med1
order DDAbPeErSRIV20210623_Med1
order DDAbPeErSRIV20210624_Med1
order DDAbPeErSRIV20210627_Med1
order DDAbPeErSRIV20210630_Med1
order DDAbPeErSRIV20210703_Med1
order DDAbPeErSRIV20210704_Med1
order DDAbPeErSRIV20210705_Med1
order DDAbPeErSRIV20210706_Med1
order DDAbPeErSRIV20210707_Med1
order DDAbPeErSRIV20210708_Med1
order DDAbPeErSRIV20210709_Med1
order DDAbPeErSRIV20210710_Med1
order DDAbPeErSRIV20210711_Med1
order DDAbPeErSRIV20210712_Med1
order DDAbPeErSRIV20210713_Med1
order DDAbPeErSRIV20210714_Med1
order DDAbPeErSRIV20210715_Med1
order DDAbPeErSRIV20210716_Med1
order DDAbPeErSRIV20210717_Med1
order DDAbPeErSRIV20210718_Med1
order DDAbPeErSRIV20210719_Med1
order DDAbPeErSRIV20210720_Med1
order DDAbPeErSRIV20210721_Med1
order DDAbPeErSRIV20210722_Med1
order DDAbPeErSRIV20210723_Med1
order DDAbPeErSRIV20210724_Med1
order DDAbPeErSRIV20210725_Med1
order DDAbPeErSRIV20210726_Med1
order DDAbPeErSRIV20210727_Med1
order DDAbPeErSRIV20210728_Med1
order DDAbPeErSRIV20210729_Med1
order DDAbPeErSRIV20210730_Med1
order DDAbPeErSRIV20210731_Med1
order DDAbPeErSRIV20210801_Med1
order DDAbPeErSRIV20210808_Med1
order DDAbPeErSRIV20210809_Med1
order DDAbPeErSRIV20210810_Med1
order DDAbPeErSRIV20210811_Med1
order DDAbPeErSRIV20210813_Med1
order DDAbPeErSRIV20210814_Med1
order DDAbPeErSRIV20210815_Med1
order DDAbPeErSRIV20210816_Med1
order DDAbPeErSRIV20210817_Med1
order DDAbPeErSRIV20210818_Med1
order DDAbPeErSRIV20210819_Med1
order DDAbPeErSRIV20210820_Med1
order DDAbPeErSRIV20210821_Med1
order DDAbPeErSRIV20210822_Med1
order DDAbPeErSRIV20210823_Med1
order DDAbPeErSRIV20210824_Med1
order DDAbPeErSRIV20210825_Med1
order DDAbPeErSRIV20210826_Med1
order DDAbPeErSRIV20210827_Med1
order DDAbPeErSRIV20210828_Med1
order DDAbPeErSRIV20210829_Med1
order DDAbPeErSRIV20210830_Med1
order DDAbPeErSRIV20210831_Med1
order DDAbPeErSRIV20210901_Med1
order DDAbPeErSRIV20210902_Med1
order DDAbPeErSRIV20210903_Med1
order DDAbPeErSRIV20210904_Med1
order DDAbPeErSRIV20210905_Med1
order DDAbPeErSRIV20210906_Med1
order DDAbPeErSRIV20210907_Med1
order DDAbPeErSRIV20210908_Med1
order DDAbPeErSRIV20210909_Med1
order DDAbPeErSRIV20210910_Med1
order DDAbPeErSRIV20210911_Med1
order DDAbPeErSRIV20210912_Med1
order DDAbPeErSRIV20210913_Med1
order DDAbPeErSRIV20210914_Med1
order DDAbPeErSRIV20210915_Med1
order DDAbPeErSRIV20210916_Med1
order DDAbPeErSRIV20210917_Med1
order DDAbPeErSRIV20210918_Med1
order DDAbPeErSRIV20210919_Med1
order DDAbPeErSRIV20210920_Med1
order DDAbPeErSRIV20210921_Med1
order DDAbPeErSRIV20210922_Med1
order DDAbPeErSRIV20210923_Med1
order DDAbPeErSRIV20210924_Med1
order DDAbPeErSRIV20210925_Med1
order DDAbPeErSRIV20210926_Med1
order DDAbPeErSRIV20210927_Med1
order DDAbPeErSRIV20210928_Med1
order DDAbPeErSRIV20210929_Med1
order DDAbPeErSRIV20210930_Med1
order DDAbPeErSRIV20211001_Med1
order DDAbPeErSRIV20211002_Med1
order DDAbPeErSRIV20211003_Med1
order DDAbPeErSRIV20211004_Med1
order DDAbPeErSRIV20211005_Med1
order DDAbPeErSRIV20211006_Med1
order DDAbPeErSRIV20211007_Med1
order DDAbPeErSRIV20211008_Med1
order DDAbPeErSRIV20211009_Med1
order DDAbPeErSRIV20211010_Med1
order DDAbPeErSRIV20211011_Med1
order DDAbPeErSRIV20211012_Med1
order DDAbPeErSRIV20211013_Med1
order DDAbPeErSRIV20211014_Med1
order DDAbPeErSRIV20211015_Med1
order DDAbPeErSRIV20211016_Med1
order DDAbPeErSRIV20211017_Med1
order DDAbPeErSRIV20211024_Med1
order DDAbPeErSRIV20211025_Med1
order DDAbPeErSRIV20211026_Med1
order DDAbPeErSRIV20211027_Med1
order DDAbPeErSRIV20211028_Med1
order DDAbPeErSRIV20211029_Med1
order DDAbPeErSRIV20211030_Med1
order DDAbPeErSRIV20211031_Med1
order DDAbPeErSRIV20211101_Med1
order DDAbPeErSRIV20211102_Med1
order DDAbPeErSRIV20211103_Med1
order DDAbPeErSRIV20211104_Med1
order DDAbPeErSRIV20211105_Med1
order DDAbPeErSRIV20211106_Med1
order DDAbPeErSRIV20211107_Med1
order DDAbPeErSRIV20211108_Med1
order DDAbPeErSRIV20211109_Med1
order DDAbPeErSRIV20211110_Med1
order DDAbPeErSRIV20211111_Med1
order DDAbPeErSRIV20211112_Med1
order DDAbPeErSRIV20211114_Med1
order DDAbPeErSRIV20211115_Med1
order DDAbPeErSRIV20211116_Med1
order DDAbPeErSRIV20211117_Med1
order DDAbPeErSRIV20211118_Med1
order DDAbPeErSRIV20211119_Med1
order DDAbPeErSRIV20211120_Med1
order DDAbPeErSRIV20211121_Med1
order DDAbPeErSRIV20211122_Med1
order DDAbPeErSRIV20211124_Med1
order DDAbPeErSRIV20211126_Med1
order DDAbPeErSRIV20211127_Med1
order DDAbPeErSRIV20211128_Med1
order DDAbPeErSRIV20211129_Med1
order DDAbPeErSRIV20211130_Med1
order DDAbPeErSRIV20211201_Med1
order DDAbPeErSRIV20211202_Med1
order DDAbPeErSRIV20211203_Med1
order DDAbPeErSRIV20211205_Med1
order DDAbPeErSRIV20211207_Med1
order DDAbPeErSRIV20211208_Med1
order DDAbPeErSRIV20211209_Med1
order DDAbPeErSRIV20211210_Med1
order DDAbPeErSRIV20211211_Med1
order DDAbPeErSRIV20211212_Med1
order DDAbPeErSRIV20211213_Med1
order DDAbPeErSRIV20211214_Med1
order DDAbPeErSRIV20211215_Med1
order DDAbPeErSRIV20211216_Med1
order DDAbPeErSRIV20211217_Med1
order DDAbPeErSRIV20211218_Med1
order DDAbPeErSRIV20211219_Med1
order DDAbPeErSRIV20211222_Med1
order DDAbPeErSRIV20211223_Med1
order DDAbPeErSRIV20211226_Med1
order DDAbPeErSRIV20211227_Med1
order DDAbPeErSRIV20220101_Med1
order DDAbPeErSRIV20220102_Med1
order DDAbPeErSRIV20220103_Med1
order DDAbPeErSRIV20220104_Med1
order DDAbPeErSRIV20220105_Med1
order DDAbPeErSRIV20220106_Med1
order DDAbPeErSRIV20220108_Med1
order DDAbPeErSRIV20220109_Med1
order DDAbPeErSRIV20220110_Med1
order DDAbPeErSRIV20220111_Med1
order DDAbPeErSRIV20220112_Med1
order DDAbPeErSRIV20220113_Med1
order DDAbPeErSRIV20220115_Med1
order DDAbPeErSRIV20220116_Med1
order DDAbPeErSRIV20220117_Med1
order DDAbPeErSRIV20220118_Med1
order DDAbPeErSRIV20220119_Med1
order DDAbPeErSRIV20220120_Med1
order DDAbPeErSRIV20220122_Med1
order DDAbPeErSRIV20220123_Med1
order DDAbPeErSRIV20220124_Med1
order DDAbPeErSRIV20220125_Med1
order DDAbPeErSRIV20220126_Med1
order DDAbPeErSRIV20220127_Med1
order DDAbPeErSRIV20220129_Med1
order DDAbPeErSRIV20220130_Med1
order DDAbPeErSRIV20220204_Med1
order DDAbPeErSRIV20220205_Med1
order DDAbPeErSRIV20220206_Med1
order DDAbPeErSRIV20220207_Med1
order DDAbPeErSRIV20220208_Med1
order DDAbPeErSRIV20220209_Med1
order DDAbPeErSRIV20220210_Med1
order DDAbPeErSRIV20220211_Med1
order DDAbPeErSRIV20220212_Med1
order DDAbPeErSRIV20220213_Med1
order DDAbPeErSRIV20220214_Med1
order DDAbPeErSRIV20220215_Med1
order DDAbPeErSRIV20220216_Med1
order DDAbPeErSRIV20220217_Med1
order DDAbPeErSRIV20220218_Med1
order DDAbPeErSRIV20220219_Med1
order DDAbPeErSRIV20220220_Med1
order DDAbPeErSRIV20220221_Med1
order DDAbPeErSRIV20220222_Med1
order DDAbPeErSRIV20220223_Med1
order DDAbPeErSRIV20220224_Med1
order DDAbPeErSRIV20220225_Med1
order DDAbPeErSRIV20220226_Med1
order DDAbPeErSRIV20220227_Med1
order DDAbPeErSRIV20220228_Med1
order DDAbPeErSRIV20220301_Med1
order DDAbPeErSRIV20220305_Med1
order DDAbPeErSRIV20220306_Med1
order DDAbPeErSRIV20220307_Med1
order DDAbPeErSRIV20220308_Med1
order DDAbPeErSRIV20220309_Med1
order DDAbPeErSRIV20220310_Med1
order DDAbPeErSRIV20220311_Med1
order DDAbPeErSRIV20220312_Med1
order DDAbPeErSRIV20220313_Med1
order DDAbPeErSRIV20220314_Med1
order DDAbPeErSRIV20220315_Med1
order DDAbPeErSRIV20220316_Med1
order DDAbPeErSRIV20220317_Med1
order DDAbPeErSRIV20220318_Med1
order DDAbPeErSRIV20220319_Med1
order DDAbPeErSRIV20220320_Med1
order DDAbPeErSRIV20220321_Med1
order DDAbPeErSRIV20220322_Med1
order DDAbPeErSRIV20220323_Med1
order DDAbPeErSRIV20220324_Med1
order DDAbPeErSRIV20220325_Med1
order DDAbPeErSRIV20220326_Med1
order DDAbPeErSRIV20220327_Med1
order DDAbPeErSRIV20220328_Med1
order DDAbPeErSRIV20220329_Med1
order DDAbPeErSRIV20220330_Med1
order DDAbPeErSRIV20220331_Med1
order DDAbPeErSRIV20220401_Med1
order DDAbPeErSRIV20220402_Med1
order DDAbPeErSRIV20220403_Med1
order DDAbPeErSRIV20220404_Med1
order DDAbPeErSRIV20220405_Med1
order DDAbPeErSRIV20220406_Med1
order DDAbPeErSRIV20220407_Med1
order DDAbPeErSRIV20220408_Med1
order DDAbPeErSRIV20220409_Med1
order DDAbPeErSRIV20220410_Med1
order DDAbPeErSRIV20220411_Med1
order DDAbPeErSRIV20220413_Med1
order DDAbPeErSRIV20220417_Med1
order DDAbPeErSRIV20220418_Med1
order DDAbPeErSRIV20220419_Med1
order DDAbPeErSRIV20220420_Med1
order DDAbPeErSRIV20220421_Med1
order DDAbPeErSRIV20220422_Med1
order DDAbPeErSRIV20220423_Med1
order DDAbPeErSRIV20220424_Med1
order DDAbPeErSRIV20220425_Med1
order DDAbPeErSRIV20220426_Med1
order DDAbPeErSRIV20220427_Med1
order DDAbPeErSRIV20220428_Med1
order DDAbPeErSRIV20220429_Med1
order DDAbPeErSRIV20220430_Med1
order DDAbPeErSRIV20220501_Med1
order DDAbPeErSRIV20220502_Med1
order DDAbPeErSRIV20220508_Med1
order DDAbPeErSRIV20220515_Med1
order DDAbPeErSRIV20220516_Med1
order DDAbPeErSRIV20220517_Med1
order DDAbPeErSRIV20220518_Med1
order DDAbPeErSRIV20220519_Med1
order DDAbPeErSRIV20220520_Med1
order DDAbPeErSRIV20220521_Med1
order DDAbPeErSRIV20220522_Med1
order DDAbPeErSRIV20220602_Med1
order DDAbPeErSRIV20220603_Med1
order DDAbPeErSRIV20220605_Med1
order DDAbPeErSRIV20220606_Med1
order DDAbPeErSRIV20220607_Med1
order DDAbPeErSRIV20220608_Med1
order DDAbPeErSRIV20220609_Med1
order DDAbPeErSRIV20220610_Med1
order DDAbPeErSRIV20220611_Med1
order DDAbPeErSRIV20220612_Med1
order DDAbPeErSRIV20220614_Med1
order DDAbPeErSRIV20220615_Med1
order DDAbPeErSRIV20220617_Med1
order DDAbPeErSRIV20220618_Med1
order DDAbPeErSRIV20220619_Med1
order DDAbPeErSRIV20220620_Med1
order DDAbPeErSRIV20220621_Med1
order DDAbPeErSRIV20220622_Med1
order DDAbPeErSRIV20220623_Med1
order DDAbPeErSRIV20220624_Med1
order DDAbPeErSRIV20220625_Med1
order DDAbPeErSRIV20220626_Med1
order DDAbPeErSRIV20220627_Med1
order DDAbPeErSRIV20220628_Med1
order DDAbPeErSRIV20220629_Med1
order DDAbPeErSRIV20220630_Med1
order DDAbPeErSRIV20220701_Med1
order DDAbPeErSRIV20220702_Med1
order DDAbPeErSRIV20220703_Med1
order DDAbPeErSRIV20220704_Med1
order DDAbPeErSRIV20220705_Med1
order DDAbPeErSRIV20220706_Med1
order DDAbPeErSRIV20220707_Med1
order DDAbPeErSRIV20220708_Med1
order DDAbPeErSRIV20220709_Med1
order DDAbPeErSRIV20220710_Med1
order DDAbPeErSRIV20220711_Med1
order DDAbPeErSRIV20220712_Med1
order DDAbPeErSRIV20220713_Med1
order DDAbPeErSRIV20220714_Med1
order DDAbPeErSRIV20220715_Med1
order DDAbPeErSRIV20220716_Med1
order DDAbPeErSRIV20220717_Med1
order DDAbPeErSRIV20220718_Med1
order DDAbPeErSRIV20220719_Med1
order DDAbPeErSRIV20220720_Med1
order DDAbPeErSRIV20220721_Med1
order DDAbPeErSRIV20220722_Med1
order DDAbPeErSRIV20220723_Med1
order DDAbPeErSRIV20220724_Med1
order DDAbPeErSRIV20220725_Med1
order DDAbPeErSRIV20220726_Med1
order DDAbPeErSRIV20220727_Med1
order DDAbPeErSRIV20220728_Med1
order DDAbPeErSRIV20220813_Med1
order DDAbPeErSRIV20220814_Med1
order DDAbPeErSRIV20220815_Med1
order DDAbPeErSRIV20220816_Med1
order DDAbPeErSRIV20220817_Med1
order DDAbPeErSRIV20220818_Med1
order DDAbPeErSRIV20220819_Med1
order DDAbPeErSRIV20220820_Med1
order DDAbPeErSRIV20220821_Med1
order DDAbPeErSRIV20220822_Med1
order DDAbPeErSRIV20220823_Med1
order DDAbPeErSRIV20220824_Med1
order DDAbPeErSRIV20220826_Med1
order DDAbPeErSRIV20220827_Med1
order DDAbPeErSRIV20220828_Med1
order DDAbPeErSRIV20220830_Med1
order DDAbPeErSRIV20220831_Med1
order DDAbPeErSRIV20220901_Med1
order DDAbPeErSRIV20220907_Med1
order DDAbPeErSRIV20220911_Med1
order DDAbPeErSRIV20220913_Med1
order DDAbPeErSRIV20220914_Med1
order DDAbPeErSRIV20220916_Med1
order DDAbPeErSRIV20220917_Med1
order DDAbPeErSRIV20220918_Med1
order DDAbPeErSRIV20220919_Med1
order DDAbPeErSRIV20220920_Med1
order DDAbPeErSRIV20220921_Med1
order DDAbPeErSRIV20220922_Med1
order DDAbPeErSRIV20220923_Med1
order DDAbPeErSRIV20220924_Med1
order DDAbPeErSRIV20220925_Med1
order DDAbPeErSRIV20220926_Med1
order DDAbPeErSRIV20220927_Med1
order DDAbPeErSRIV20220928_Med1
order DDAbPeErSRIV20220929_Med1
order DDAbPeErSRIV20220930_Med1
order DDAbPeErSRIV20221001_Med1
order DDAbPeErSRIV20221002_Med1
order DDAbPeErSRIV20221003_Med1
order DDAbPeErSRIV20221004_Med1
order DDAbPeErSRIV20221005_Med1
order DDAbPeErSRIV20221006_Med1
order DDAbPeErSRIV20221007_Med1
order DDAbPeErSRIV20221008_Med1
order DDAbPeErSRIV20221009_Med1
order DDAbPeErSRIV20221010_Med1
order DDAbPeErSRIV20221011_Med1
order DDAbPeErSRIV20221012_Med1
order DDAbPeErSRIV20221013_Med1
order DDAbPeErSRIV20221014_Med1
order DDAbPeErSRIV20221015_Med1
order DDAbPeErSRIV20221016_Med1
order DDAbPeErSRIV20221017_Med1
order DDAbPeErSRIV20221018_Med1
order DDAbPeErSRIV20221019_Med1
order DDAbPeErSRIV20221020_Med1
order DDAbPeErSRIV20221021_Med1
order DDAbPeErSRIV20221022_Med1
order DDAbPeErSRIV20221023_Med1
order DDAbPeErSRIV20221024_Med1
order DDAbPeErSRIV20221025_Med1
order DDAbPeErSRIV20221026_Med1
order DDAbPeErSRIV20221027_Med1
order DDAbPeErSRIV20221028_Med1
order DDAbPeErSRIV20221029_Med1
order DDAbPeErSRIV20221030_Med1
order DDAbPeErSRIV20221031_Med1
order DDAbPeErSRIV20221101_Med1
order DDAbPeErSRIV20221102_Med1
order DDAbPeErSRIV20221114_Med1
order DDAbPeErSRIV20221115_Med1
order DDAbPeErSRIV20221117_Med1
order DDAbPeErSRIV20221118_Med1
order DDAbPeErSRIV20221119_Med1
order DDAbPeErSRIV20221120_Med1
order DDAbPeErSRIV20221121_Med1
order DDAbPeErSRIV20221122_Med1
order DDAbPeErSRIV20221123_Med1
order DDAbPeErSRIV20221124_Med1
order DDAbPeErSRIV20221125_Med1
order DDAbPeErSRIV20221126_Med1
order DDAbPeErSRIV20221127_Med1
order DDAbPeErSRIV20221128_Med1
order DDAbPeErSRIV20221129_Med1
order DDAbPeErSRIV20221130_Med1
order DDAbPeErSRIV20221201_Med1
order DDAbPeErSRIV20221202_Med1
order DDAbPeErSRIV20221203_Med1
order DDAbPeErSRIV20221204_Med1
order DDAbPeErSRIV20221205_Med1
order DDAbPeErSRIV20221206_Med1
order DDAbPeErSRIV20221207_Med1
order DDAbPeErSRIV20221208_Med1
order DDAbPeErSRIV20221209_Med1
order DDAbPeErSRIV20221210_Med1
order DDAbPeErSRIV20221211_Med1
order DDAbPeErSRIV20221212_Med1
order DDAbPeErSRIV20221213_Med1
order DDAbPeErSRIV20221214_Med1
order DDAbPeErSRIV20221215_Med1
order DDAbPeErSRIV20221216_Med1
order DDAbPeErSRIV20221217_Med1
order DDAbPeErSRIV20221218_Med1
order DDAbPeErSRIV20221219_Med1
order DDAbPeErSRIV20221220_Med1
order DDAbPeErSRIV20221221_Med1
order DDAbPeErSRIV20221222_Med1
order DDAbPeErSRIV20221223_Med1
order DDAbPeErSRIV20221224_Med1
order DDAbPeErSRIV20221225_Med1
order DDAbPeErSRIV20221226_Med1
order DDAbPeErSRIV20221227_Med1
order DDAbPeErSRIV20221228_Med1
order DDAbPeErSRIV20221229_Med1
order DDAbPeErSRIV20221230_Med1
order DDAbPeErSRIV20221231_Med1


capture drop DDAbPeErSRIV_Mean1 // "DDAbPeErSRIV mean over updates of median absolute % error by calendar months"
egen DDAbPeErSRIV_Mean1 = rowmean(DDAbPeErSRIV20221231_Med1-DDAbPeErSRIV20200502_Med1) // <<-- modify 11
label var DDAbPeErSRIV_Mean1 "DDAbPeErSRIV mean over updates of median absolute % error by calendar months"
qui replace DDAbPeErSRIV_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErSRIV_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErSRIV_Mean1 = . if date < td(02may2020) // 02may2020 is the earliest date of SRIV forecasts for Afghanistan

 
 
 
 
 
 




* (4) gen AVERAGE over calendar months of _Mean1  = _Mean2

* Wait note: wait ...

		
egen DDErrorSRIV_Mean2 = mean(DDErrorSRIV_Mean1) // get mean for all calendar months of _Mean1
label var DDErrorSRIV_Mean2 "DDErrorSRIV Mean over calendar months of median error over updates"

egen DDAbsErrSRIV_Mean2 = mean(DDAbsErrSRIV_Mean1) // get mean for all calendar months of _Mean1
label var DDAbsErrSRIV_Mean2 "DDAbsErrSRIV Mean over calendar months of median absolute error over updates"

egen DDPerErrSRIV_Mean2 = mean(DDPerErrSRIV_Mean1) // get mean for all calendar months of _Mean1
label var DDPerErrSRIV_Mean2 "DDPerErrSRIV Mean over calendar months of median % error over updates"

egen DDAbPeErSRIV_Mean2 = mean(DDAbPeErSRIV_Mean1) // get mean for all calendar months of _Mean1
label var DDAbPeErSRIV_Mean2 "DDAbPeErSRIV Mean over calendar months of median absolute % error over updates"





drop if date < td(01jan2020)

drop if date > td(01jan2023)


qui compress




******
* graph 03 Daily deaths, Error // <<-- modify 12

twoway ///
(line DDErrorSRIV20200502 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200503 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200504 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200505 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200506 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200507 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200508 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200509 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200510 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200511 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200512 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200513 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200514 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200515 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200516 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200517 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200518 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200519 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200520 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200521 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200522 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200523 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200524 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200525 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200526 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200527 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200528 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200529 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200530 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200531 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200601 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200602 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200603 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200604 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200605 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200606 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200607 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200608 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200609 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200610 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200611 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200612 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200613 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200614 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200615 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200616 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200617 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200618 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200619 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200620 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200621 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200622 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200623 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200624 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200625 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200626 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200627 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200628 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200629 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200630 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200701 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200702 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200703 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200704 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200705 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200706 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200707 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200708 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200709 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200710 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200711 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200712 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200713 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200714 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200715 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200716 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200717 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200718 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200719 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200720 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200721 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200722 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200723 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200724 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200725 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200726 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200727 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200728 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200729 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200730 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200731 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200801 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200802 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200803 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200804 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200805 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200806 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200807 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200808 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200809 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200810 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200811 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200812 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200813 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200814 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200815 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200816 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200817 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200818 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200819 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200820 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200821 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200822 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200823 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200824 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200825 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200826 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200827 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200828 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200829 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200830 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200831 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200901 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200902 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200903 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200904 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200905 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200906 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200907 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200908 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200909 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200910 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200911 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200912 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200913 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200914 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200915 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200916 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200917 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200918 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200919 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200920 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200921 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200922 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200923 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200924 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200925 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200926 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200927 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200928 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200929 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20200930 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201001 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201002 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201003 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201004 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201006 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201007 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201008 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201009 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201010 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201011 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201012 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201013 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201014 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201015 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201016 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201017 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201018 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201019 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201020 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201021 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201022 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201023 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201024 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201025 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201026 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201027 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201028 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201029 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201030 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201031 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201101 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201102 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201103 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201104 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201105 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201106 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201107 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201108 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201109 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201110 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201111 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201112 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201113 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201114 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201115 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201116 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201117 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201118 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201119 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201120 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201121 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201122 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201123 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201124 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201125 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201126 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201127 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201128 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201129 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201130 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201201 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201202 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201203 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201204 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201205 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201206 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201207 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201208 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201209 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201210 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201211 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201212 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201213 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201214 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201216 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201217 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201218 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201219 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201220 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201221 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201222 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201223 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201224 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201225 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201226 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201227 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201229 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201230 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20201231 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210101 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210103 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210104 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210105 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210106 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210107 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210108 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210109 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210110 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210111 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210112 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210113 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210114 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210115 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210116 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210117 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210118 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210119 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210120 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210121 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210122 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210123 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210124 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210125 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210126 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210127 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210128 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210129 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210130 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210131 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210201 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210202 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210203 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210204 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210205 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210206 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210207 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210208 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210209 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210210 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210211 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210212 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210213 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210214 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210215 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210216 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210217 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210218 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210219 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210220 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210221 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210222 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210223 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210224 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210225 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210226 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210227 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210228 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210301 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210302 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210303 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210304 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210305 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210306 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210307 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210308 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210309 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210310 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210311 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210312 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210313 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210314 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210315 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210316 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210317 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210318 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210319 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210320 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210321 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210322 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210323 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210324 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210325 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210326 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210327 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210328 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210329 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210330 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210331 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210401 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210402 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210403 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210404 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210405 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210406 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210407 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210408 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210409 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210410 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210411 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210412 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210413 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210414 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210415 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210416 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210417 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210418 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210419 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210420 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210421 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210422 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210423 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210424 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210425 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210426 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210427 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210428 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210429 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210430 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210501 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210502 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210503 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210504 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210505 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210506 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210507 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210508 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210509 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210510 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210511 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210512 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210513 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210514 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210515 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210516 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210517 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210518 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210519 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210520 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210521 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210522 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210523 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210524 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210525 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210526 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210527 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210528 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210529 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210530 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210531 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210601 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210602 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210603 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210604 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210605 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210606 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210607 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210608 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210609 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210610 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210611 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210612 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210613 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210614 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210615 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210616 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210617 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210618 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210619 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210620 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210621 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210622 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210623 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210624 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210627 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210630 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210703 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210704 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210705 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210706 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210707 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210708 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210709 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210710 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210711 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210712 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210713 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210714 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210715 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210716 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210717 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210718 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210719 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210720 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210721 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210722 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210723 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210724 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210725 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210726 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210727 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210728 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210729 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210730 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210731 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210801 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210808 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210809 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210810 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210811 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210813 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210814 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210815 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210816 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210817 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210818 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210819 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210820 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210821 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210822 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210823 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210824 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210825 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210826 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210827 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210828 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210829 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210830 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210831 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210901 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210902 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210903 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210904 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210905 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210906 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210907 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210908 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210909 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210910 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210911 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210912 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210913 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210914 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210915 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210916 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210917 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210918 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210919 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210920 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210921 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210922 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210923 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210924 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210925 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210926 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210927 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210928 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210929 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20210930 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211001 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211002 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211003 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211004 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211005 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211006 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211007 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211008 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211009 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211010 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211011 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211012 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211013 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211014 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211015 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211016 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211017 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211024 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211025 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211026 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211027 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211028 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211029 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211030 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211031 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211101 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211102 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211103 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211104 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211105 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211106 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211107 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211108 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211109 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211110 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211111 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211112 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211114 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211115 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211116 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211117 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211118 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211119 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211120 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211121 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211122 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211124 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211126 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211127 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211128 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211129 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211130 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211201 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211202 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211203 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211205 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211207 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211208 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211209 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211210 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211211 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211212 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211213 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211214 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211215 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211216 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211217 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211218 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211219 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211222 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211223 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211226 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20211227 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220101 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220102 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220103 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220104 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220105 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220106 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220108 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220109 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220110 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220111 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220112 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220113 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220115 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220116 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220117 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220118 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220119 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220120 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220122 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220123 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220124 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220125 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220126 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220127 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220129 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220130 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220204 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220205 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220206 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220207 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220208 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220209 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220210 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220211 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220212 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220213 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220214 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220215 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220216 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220217 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220218 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220219 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220220 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220221 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220222 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220223 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220224 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220225 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220226 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220227 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220228 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220301 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220305 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220306 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220307 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220308 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220309 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220310 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220311 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220312 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220313 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220314 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220315 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220316 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220317 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220318 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220319 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220320 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220321 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220322 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220323 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220324 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220325 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220326 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220327 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220328 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220329 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220330 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220331 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220401 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220402 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220403 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220404 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220405 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220406 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220407 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220408 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220409 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220410 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220411 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220413 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220417 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220418 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220419 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220420 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220421 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220422 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220423 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220424 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220425 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220426 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220427 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220428 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220429 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220430 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220501 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220502 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220508 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220515 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220516 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220517 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220518 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220519 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220520 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220521 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220522 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220602 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220603 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220605 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220606 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220607 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220608 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220609 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220610 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220611 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220612 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220614 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220615 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220617 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220618 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220619 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220620 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220621 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220622 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220623 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220624 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220625 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220626 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220627 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220628 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220629 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220630 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220701 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220702 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220703 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220704 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220705 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220706 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220707 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220708 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220709 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220710 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220711 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220712 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220713 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220714 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220715 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220716 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220717 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220718 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220719 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220720 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220721 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220722 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220723 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220724 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220725 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220726 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220727 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220728 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220813 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220814 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220815 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220816 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220817 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220818 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220819 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220820 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220821 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220822 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220823 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220824 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220826 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220827 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220828 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220830 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220831 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220901 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220907 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220911 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220913 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220914 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220916 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220917 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220918 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220919 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220920 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220921 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220922 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220923 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220924 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220925 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220926 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220927 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220928 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220929 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20220930 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221001 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221002 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221003 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221004 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221005 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221006 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221007 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221008 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221009 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221010 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221011 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221012 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221013 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221014 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221015 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221016 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221017 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221018 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221019 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221020 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221021 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221022 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221023 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221024 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221025 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221026 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221027 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221028 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221029 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221030 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221031 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221101 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221102 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221114 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221115 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221117 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221118 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221119 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221120 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221121 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221122 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221123 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221124 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221125 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221126 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221127 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221128 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221129 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221130 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221201 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221202 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221203 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221204 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221205 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221206 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221207 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221208 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221209 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221210 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221211 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221212 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221213 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221214 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221215 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221216 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221217 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221218 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221219 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221220 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221221 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221222 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221223 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221224 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221225 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221226 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221227 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221228 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221229 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221230 date, sort lcolor(green) lwidth(thin)) ///
(line DDErrorSRIV20221231 date, sort lcolor(green) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Afghanistan, SRIV, all updates, forecast only", size(small)) 

qui graph export "graph 03 Afghanistan SRIV C19 daily deaths error.pdf", replace





******
* graph 04 Daily deaths, Absolute Error // <<-- modify 13

twoway ///
(line DDAbsErrSRIV20200502 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200503 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200504 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200505 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200506 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200507 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200508 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200509 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200510 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200511 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200512 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200513 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200514 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200515 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200516 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200517 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200518 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200519 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200520 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200521 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200522 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200523 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200524 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200525 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200526 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200527 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200528 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200529 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200530 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200531 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200601 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200602 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200603 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200604 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200605 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200606 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200607 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200608 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200609 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200610 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200611 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200612 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200613 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200614 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200615 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200616 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200617 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200618 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200619 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200620 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200621 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200622 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200623 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200624 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200625 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200626 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200627 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200628 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200629 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200630 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200701 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200702 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200703 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200704 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200705 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200706 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200707 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200708 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200709 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200710 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200711 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200712 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200713 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200714 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200715 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200716 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200717 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200718 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200719 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200720 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200721 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200722 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200723 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200724 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200725 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200726 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200727 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200728 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200729 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200730 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200731 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200801 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200802 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200803 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200804 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200805 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200806 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200807 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200808 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200809 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200810 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200811 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200812 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200813 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200814 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200815 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200816 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200817 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200818 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200819 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200820 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200821 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200822 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200823 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200824 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200825 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200826 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200827 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200828 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200829 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200830 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200831 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200901 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200902 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200903 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200904 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200905 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200906 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200907 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200908 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200909 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200910 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200911 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200912 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200913 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200914 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200915 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200916 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200917 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200918 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200919 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200920 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200921 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200922 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200923 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200924 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200925 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200926 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200927 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200928 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200929 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20200930 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201001 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201002 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201003 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201004 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201006 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201007 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201008 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201009 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201010 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201011 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201012 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201013 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201014 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201015 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201016 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201017 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201018 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201019 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201020 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201021 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201022 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201023 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201024 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201025 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201026 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201027 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201028 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201029 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201030 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201031 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201101 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201102 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201103 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201104 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201105 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201106 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201107 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201108 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201109 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201110 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201111 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201112 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201113 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201114 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201115 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201116 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201117 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201118 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201119 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201120 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201121 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201122 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201123 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201124 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201125 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201126 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201127 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201128 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201129 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201130 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201201 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201202 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201203 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201204 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201205 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201206 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201207 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201208 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201209 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201210 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201211 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201212 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201213 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201214 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201216 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201217 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201218 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201219 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201220 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201221 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201222 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201223 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201224 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201225 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201226 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201227 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201229 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201230 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20201231 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210101 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210103 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210104 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210105 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210106 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210107 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210108 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210109 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210110 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210111 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210112 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210113 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210114 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210115 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210116 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210117 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210118 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210119 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210120 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210121 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210122 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210123 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210124 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210125 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210126 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210127 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210128 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210129 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210130 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210131 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210201 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210202 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210203 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210204 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210205 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210206 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210207 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210208 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210209 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210210 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210211 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210212 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210213 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210214 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210215 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210216 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210217 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210218 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210219 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210220 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210221 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210222 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210223 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210224 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210225 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210226 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210227 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210228 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210301 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210302 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210303 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210304 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210305 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210306 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210307 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210308 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210309 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210310 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210311 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210312 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210313 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210314 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210315 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210316 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210317 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210318 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210319 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210320 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210321 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210322 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210323 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210324 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210325 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210326 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210327 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210328 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210329 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210330 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210331 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210401 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210402 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210403 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210404 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210405 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210406 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210407 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210408 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210409 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210410 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210411 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210412 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210413 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210414 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210415 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210416 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210417 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210418 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210419 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210420 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210421 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210422 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210423 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210424 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210425 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210426 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210427 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210428 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210429 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210430 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210501 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210502 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210503 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210504 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210505 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210506 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210507 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210508 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210509 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210510 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210511 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210512 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210513 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210514 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210515 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210516 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210517 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210518 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210519 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210520 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210521 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210522 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210523 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210524 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210525 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210526 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210527 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210528 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210529 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210530 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210531 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210601 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210602 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210603 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210604 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210605 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210606 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210607 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210608 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210609 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210610 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210611 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210612 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210613 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210614 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210615 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210616 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210617 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210618 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210619 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210620 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210621 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210622 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210623 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210624 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210627 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210630 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210703 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210704 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210705 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210706 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210707 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210708 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210709 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210710 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210711 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210712 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210713 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210714 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210715 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210716 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210717 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210718 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210719 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210720 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210721 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210722 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210723 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210724 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210725 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210726 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210727 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210728 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210729 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210730 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210731 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210801 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210808 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210809 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210810 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210811 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210813 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210814 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210815 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210816 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210817 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210818 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210819 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210820 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210821 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210822 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210823 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210824 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210825 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210826 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210827 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210828 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210829 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210830 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210831 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210901 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210902 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210903 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210904 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210905 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210906 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210907 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210908 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210909 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210910 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210911 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210912 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210913 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210914 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210915 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210916 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210917 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210918 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210919 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210920 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210921 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210922 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210923 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210924 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210925 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210926 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210927 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210928 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210929 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20210930 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211001 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211002 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211003 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211004 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211005 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211006 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211007 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211008 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211009 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211010 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211011 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211012 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211013 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211014 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211015 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211016 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211017 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211024 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211025 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211026 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211027 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211028 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211029 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211030 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211031 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211101 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211102 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211103 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211104 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211105 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211106 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211107 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211108 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211109 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211110 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211111 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211112 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211114 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211115 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211116 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211117 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211118 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211119 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211120 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211121 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211122 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211124 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211126 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211127 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211128 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211129 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211130 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211201 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211202 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211203 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211205 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211207 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211208 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211209 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211210 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211211 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211212 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211213 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211214 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211215 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211216 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211217 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211218 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211219 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211222 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211223 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211226 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20211227 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220101 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220102 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220103 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220104 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220105 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220106 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220108 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220109 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220110 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220111 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220112 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220113 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220115 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220116 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220117 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220118 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220119 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220120 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220122 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220123 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220124 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220125 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220126 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220127 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220129 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220130 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220204 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220205 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220206 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220207 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220208 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220209 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220210 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220211 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220212 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220213 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220214 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220215 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220216 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220217 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220218 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220219 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220220 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220221 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220222 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220223 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220224 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220225 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220226 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220227 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220228 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220301 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220305 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220306 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220307 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220308 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220309 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220310 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220311 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220312 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220313 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220314 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220315 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220316 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220317 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220318 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220319 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220320 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220321 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220322 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220323 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220324 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220325 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220326 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220327 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220328 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220329 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220330 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220331 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220401 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220402 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220403 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220404 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220405 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220406 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220407 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220408 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220409 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220410 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220411 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220413 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220417 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220418 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220419 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220420 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220421 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220422 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220423 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220424 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220425 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220426 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220427 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220428 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220429 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220430 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220501 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220502 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220508 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220515 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220516 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220517 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220518 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220519 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220520 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220521 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220522 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220602 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220603 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220605 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220606 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220607 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220608 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220609 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220610 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220611 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220612 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220614 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220615 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220617 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220618 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220619 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220620 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220621 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220622 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220623 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220624 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220625 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220626 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220627 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220628 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220629 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220630 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220701 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220702 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220703 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220704 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220705 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220706 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220707 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220708 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220709 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220710 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220711 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220712 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220713 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220714 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220715 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220716 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220717 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220718 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220719 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220720 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220721 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220722 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220723 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220724 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220725 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220726 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220727 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220728 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220813 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220814 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220815 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220816 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220817 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220818 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220819 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220820 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220821 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220822 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220823 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220824 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220826 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220827 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220828 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220830 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220831 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220901 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220907 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220911 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220913 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220914 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220916 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220917 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220918 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220919 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220920 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220921 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220922 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220923 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220924 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220925 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220926 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220927 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220928 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220929 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20220930 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221001 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221002 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221003 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221004 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221005 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221006 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221007 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221008 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221009 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221010 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221011 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221012 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221013 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221014 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221015 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221016 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221017 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221018 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221019 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221020 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221021 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221022 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221023 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221024 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221025 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221026 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221027 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221028 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221029 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221030 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221031 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221101 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221102 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221114 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221115 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221117 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221118 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221119 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221120 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221121 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221122 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221123 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221124 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221125 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221126 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221127 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221128 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221129 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221130 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221201 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221202 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221203 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221204 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221205 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221206 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221207 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221208 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221209 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221210 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221211 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221212 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221213 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221214 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221215 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221216 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221217 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221218 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221219 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221220 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221221 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221222 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221223 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221224 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221225 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221226 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221227 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221228 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221229 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221230 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbsErrSRIV20221231 date, sort lcolor(green) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Afghanistan, SRIV, all updates, forecast only", size(small))

qui graph export "graph 04 Afghanistan SRIV C19 daily deaths absolute error.pdf", replace








******
* graph 05 Daily deaths, Percent Error <<-- modify 14

twoway ///
(line DDPerErrSRIV20200502 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200503 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200504 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200505 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200506 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200507 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200508 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200509 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200510 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200511 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200512 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200513 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200514 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200515 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200516 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200517 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200518 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200519 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200520 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200521 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200522 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200523 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200524 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200525 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200526 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200527 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200528 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200529 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200530 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200531 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200601 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200602 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200603 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200604 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200605 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200606 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200607 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200608 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200609 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200610 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200611 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200612 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200613 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200614 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200615 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200616 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200617 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200618 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200619 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200620 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200621 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200622 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200623 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200624 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200625 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200626 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200627 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200628 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200629 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200630 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200701 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200702 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200703 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200704 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200705 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200706 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200707 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200708 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200709 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200710 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200711 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200712 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200713 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200714 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200715 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200716 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200717 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200718 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200719 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200720 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200721 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200722 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200723 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200724 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200725 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200726 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200727 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200728 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200729 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200730 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200731 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200801 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200802 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200803 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200804 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200805 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200806 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200807 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200808 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200809 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200810 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200811 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200812 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200813 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200814 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200815 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200816 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200817 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200818 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200819 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200820 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200821 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200822 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200823 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200824 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200825 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200826 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200827 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200828 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200829 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200830 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200831 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200901 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200902 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200903 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200904 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200905 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200906 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200907 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200908 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200909 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200910 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200911 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200912 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200913 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200914 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200915 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200916 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200917 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200918 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200919 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200920 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200921 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200922 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200923 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200924 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200925 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200926 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200927 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200928 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200929 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20200930 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201001 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201002 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201003 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201004 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201006 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201007 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201008 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201009 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201010 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201011 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201012 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201013 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201014 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201015 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201016 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201017 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201018 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201019 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201020 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201021 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201022 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201023 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201024 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201025 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201026 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201027 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201028 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201029 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201030 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201031 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201101 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201102 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201103 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201104 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201105 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201106 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201107 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201108 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201109 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201110 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201111 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201112 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201113 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201114 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201115 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201116 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201117 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201118 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201119 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201120 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201121 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201122 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201123 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201124 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201125 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201126 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201127 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201128 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201129 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201130 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201201 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201202 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201203 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201204 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201205 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201206 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201207 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201208 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201209 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201210 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201211 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201212 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201213 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201214 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201216 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201217 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201218 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201219 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201220 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201221 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201222 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201223 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201224 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201225 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201226 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201227 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201229 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201230 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20201231 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210101 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210103 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210104 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210105 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210106 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210107 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210108 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210109 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210110 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210111 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210112 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210113 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210114 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210115 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210116 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210117 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210118 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210119 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210120 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210121 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210122 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210123 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210124 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210125 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210126 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210127 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210128 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210129 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210130 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210131 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210201 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210202 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210203 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210204 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210205 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210206 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210207 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210208 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210209 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210210 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210211 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210212 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210213 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210214 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210215 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210216 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210217 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210218 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210219 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210220 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210221 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210222 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210223 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210224 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210225 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210226 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210227 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210228 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210301 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210302 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210303 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210304 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210305 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210306 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210307 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210308 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210309 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210310 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210311 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210312 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210313 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210314 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210315 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210316 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210317 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210318 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210319 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210320 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210321 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210322 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210323 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210324 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210325 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210326 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210327 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210328 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210329 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210330 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210331 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210401 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210402 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210403 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210404 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210405 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210406 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210407 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210408 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210409 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210410 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210411 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210412 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210413 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210414 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210415 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210416 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210417 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210418 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210419 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210420 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210421 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210422 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210423 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210424 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210425 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210426 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210427 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210428 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210429 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210430 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210501 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210502 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210503 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210504 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210505 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210506 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210507 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210508 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210509 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210510 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210511 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210512 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210513 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210514 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210515 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210516 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210517 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210518 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210519 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210520 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210521 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210522 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210523 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210524 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210525 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210526 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210527 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210528 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210529 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210530 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210531 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210601 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210602 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210603 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210604 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210605 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210606 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210607 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210608 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210609 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210610 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210611 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210612 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210613 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210614 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210615 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210616 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210617 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210618 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210619 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210620 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210621 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210622 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210623 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210624 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210627 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210630 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210703 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210704 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210705 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210706 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210707 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210708 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210709 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210710 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210711 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210712 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210713 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210714 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210715 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210716 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210717 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210718 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210719 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210720 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210721 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210722 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210723 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210724 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210725 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210726 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210727 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210728 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210729 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210730 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210731 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210801 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210808 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210809 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210810 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210811 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210813 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210814 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210815 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210816 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210817 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210818 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210819 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210820 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210821 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210822 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210823 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210824 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210825 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210826 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210827 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210828 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210829 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210830 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210831 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210901 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210902 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210903 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210904 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210905 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210906 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210907 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210908 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210909 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210910 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210911 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210912 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210913 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210914 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210915 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210916 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210917 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210918 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210919 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210920 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210921 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210922 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210923 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210924 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210925 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210926 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210927 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210928 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210929 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20210930 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211001 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211002 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211003 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211004 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211005 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211006 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211007 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211008 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211009 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211010 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211011 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211012 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211013 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211014 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211015 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211016 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211017 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211024 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211025 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211026 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211027 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211028 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211029 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211030 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211031 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211101 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211102 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211103 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211104 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211105 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211106 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211107 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211108 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211109 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211110 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211111 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211112 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211114 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211115 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211116 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211117 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211118 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211119 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211120 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211121 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211122 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211124 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211126 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211127 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211128 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211129 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211130 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211201 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211202 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211203 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211205 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211207 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211208 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211209 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211210 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211211 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211212 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211213 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211214 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211215 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211216 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211217 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211218 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211219 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211222 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211223 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211226 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20211227 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220101 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220102 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220103 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220104 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220105 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220106 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220108 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220109 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220110 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220111 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220112 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220113 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220115 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220116 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220117 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220118 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220119 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220120 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220122 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220123 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220124 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220125 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220126 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220127 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220129 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220130 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220204 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220205 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220206 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220207 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220208 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220209 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220210 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220211 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220212 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220213 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220214 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220215 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220216 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220217 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220218 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220219 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220220 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220221 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220222 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220223 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220224 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220225 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220226 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220227 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220228 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220301 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220305 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220306 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220307 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220308 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220309 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220310 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220311 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220312 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220313 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220314 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220315 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220316 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220317 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220318 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220319 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220320 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220321 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220322 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220323 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220324 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220325 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220326 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220327 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220328 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220329 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220330 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220331 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220401 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220402 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220403 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220404 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220405 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220406 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220407 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220408 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220409 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220410 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220411 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220413 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220417 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220418 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220419 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220420 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220421 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220422 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220423 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220424 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220425 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220426 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220427 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220428 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220429 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220430 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220501 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220502 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220508 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220515 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220516 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220517 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220518 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220519 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220520 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220521 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220522 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220602 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220603 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220605 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220606 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220607 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220608 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220609 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220610 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220611 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220612 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220614 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220615 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220617 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220618 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220619 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220620 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220621 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220622 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220623 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220624 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220625 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220626 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220627 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220628 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220629 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220630 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220701 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220702 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220703 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220704 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220705 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220706 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220707 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220708 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220709 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220710 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220711 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220712 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220713 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220714 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220715 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220716 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220717 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220718 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220719 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220720 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220721 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220722 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220723 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220724 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220725 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220726 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220727 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220728 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220813 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220814 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220815 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220816 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220817 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220818 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220819 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220820 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220821 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220822 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220823 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220824 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220826 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220827 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220828 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220830 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220831 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220901 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220907 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220911 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220913 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220914 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220916 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220917 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220918 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220919 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220920 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220921 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220922 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220923 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220924 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220925 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220926 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220927 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220928 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220929 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20220930 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221001 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221002 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221003 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221004 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221005 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221006 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221007 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221008 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221009 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221010 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221011 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221012 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221013 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221014 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221015 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221016 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221017 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221018 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221019 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221020 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221021 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221022 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221023 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221024 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221025 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221026 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221027 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221028 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221029 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221030 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221031 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221101 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221102 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221114 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221115 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221117 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221118 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221119 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221120 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221121 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221122 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221123 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221124 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221125 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221126 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221127 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221128 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221129 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221130 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221201 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221202 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221203 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221204 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221205 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221206 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221207 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221208 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221209 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221210 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221211 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221212 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221213 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221214 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221215 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221216 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221217 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221218 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221219 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221220 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221221 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221222 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221223 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221224 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221225 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221226 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221227 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221228 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221229 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221230 date, sort lcolor(green) lwidth(thin)) ///
(line DDPerErrSRIV20221231 date, sort lcolor(green) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Afghanistan, SRIV, all updates, forecast only", size(small))

qui graph export "graph 05 Afghanistan SRIV C19 daily deaths percent error.pdf", replace








******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 15

* SRIV lcolor green // <<-- modify 16

twoway ///
(line DDAbPeErSRIV20200502 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200503 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200504 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200505 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200506 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200507 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200508 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200509 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200510 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200511 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200512 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200513 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200514 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200515 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200516 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200517 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200518 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200519 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200520 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200521 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200522 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200523 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200524 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200525 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200526 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200527 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200528 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200529 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200530 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200531 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200601 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200602 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200603 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200604 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200605 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200606 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200607 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200608 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200609 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200610 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200611 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200612 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200613 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200614 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200615 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200616 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200617 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200618 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200619 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200620 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200621 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200622 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200623 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200624 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200625 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200626 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200627 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200628 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200629 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200630 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200701 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200702 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200703 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200704 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200705 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200706 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200707 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200708 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200709 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200710 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200711 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200712 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200713 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200714 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200715 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200716 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200717 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200718 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200719 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200720 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200721 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200722 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200723 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200724 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200725 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200726 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200727 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200728 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200729 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200730 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200731 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200801 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200802 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200803 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200804 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200805 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200806 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200807 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200808 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200809 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200810 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200811 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200812 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200813 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200814 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200815 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200816 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200817 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200818 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200819 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200820 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200821 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200822 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200823 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200824 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200825 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200826 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200827 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200828 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200829 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200830 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200831 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200901 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200902 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200903 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200904 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200905 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200906 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200907 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200908 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200909 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200910 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200911 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200912 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200913 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200914 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200915 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200916 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200917 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200918 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200919 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200920 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200921 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200922 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200923 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200924 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200925 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200926 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200927 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200928 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200929 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20200930 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201001 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201002 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201003 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201004 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201006 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201007 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201008 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201009 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201010 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201011 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201012 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201013 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201014 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201015 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201016 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201017 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201018 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201019 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201020 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201021 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201022 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201023 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201024 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201025 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201026 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201027 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201028 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201029 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201030 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201031 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201101 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201102 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201103 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201104 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201105 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201106 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201107 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201108 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201109 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201110 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201111 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201112 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201113 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201114 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201115 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201116 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201117 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201118 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201119 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201120 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201121 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201122 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201123 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201124 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201125 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201126 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201127 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201128 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201129 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201130 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201201 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201202 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201203 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201204 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201205 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201206 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201207 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201208 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201209 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201210 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201211 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201212 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201213 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201214 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201216 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201217 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201218 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201219 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201220 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201221 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201222 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201223 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201224 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201225 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201226 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201227 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201229 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201230 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20201231 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210101 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210103 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210104 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210105 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210106 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210107 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210108 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210109 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210110 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210111 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210112 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210113 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210114 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210115 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210116 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210117 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210118 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210119 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210120 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210121 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210122 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210123 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210124 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210125 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210126 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210127 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210128 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210129 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210130 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210131 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210201 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210202 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210203 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210204 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210205 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210206 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210207 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210208 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210209 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210210 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210211 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210212 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210213 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210214 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210215 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210216 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210217 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210218 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210219 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210220 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210221 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210222 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210223 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210224 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210225 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210226 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210227 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210228 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210301 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210302 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210303 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210304 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210305 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210306 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210307 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210308 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210309 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210310 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210311 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210312 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210313 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210314 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210315 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210316 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210317 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210318 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210319 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210320 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210321 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210322 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210323 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210324 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210325 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210326 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210327 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210328 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210329 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210330 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210331 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210401 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210402 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210403 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210404 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210405 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210406 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210407 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210408 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210409 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210410 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210411 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210412 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210413 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210414 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210415 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210416 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210417 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210418 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210419 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210420 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210421 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210422 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210423 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210424 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210425 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210426 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210427 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210428 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210429 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210430 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210501 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210502 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210503 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210504 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210505 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210506 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210507 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210508 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210509 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210510 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210511 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210512 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210513 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210514 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210515 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210516 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210517 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210518 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210519 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210520 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210521 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210522 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210523 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210524 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210525 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210526 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210527 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210528 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210529 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210530 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210531 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210601 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210602 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210603 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210604 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210605 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210606 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210607 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210608 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210609 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210610 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210611 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210612 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210613 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210614 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210615 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210616 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210617 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210618 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210619 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210620 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210621 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210622 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210623 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210624 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210627 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210630 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210703 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210704 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210705 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210706 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210707 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210708 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210709 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210710 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210711 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210712 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210713 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210714 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210715 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210716 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210717 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210718 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210719 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210720 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210721 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210722 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210723 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210724 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210725 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210726 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210727 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210728 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210729 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210730 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210731 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210801 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210808 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210809 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210810 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210811 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210813 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210814 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210815 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210816 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210817 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210818 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210819 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210820 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210821 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210822 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210823 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210824 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210825 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210826 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210827 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210828 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210829 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210830 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210831 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210901 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210902 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210903 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210904 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210905 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210906 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210907 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210908 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210909 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210910 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210911 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210912 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210913 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210914 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210915 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210916 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210917 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210918 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210919 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210920 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210921 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210922 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210923 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210924 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210925 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210926 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210927 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210928 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210929 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20210930 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211001 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211002 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211003 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211004 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211005 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211006 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211007 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211008 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211009 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211010 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211011 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211012 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211013 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211014 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211015 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211016 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211017 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211024 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211025 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211026 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211027 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211028 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211029 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211030 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211031 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211101 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211102 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211103 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211104 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211105 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211106 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211107 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211108 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211109 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211110 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211111 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211112 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211114 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211115 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211116 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211117 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211118 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211119 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211120 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211121 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211122 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211124 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211126 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211127 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211128 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211129 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211130 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211201 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211202 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211203 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211205 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211207 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211208 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211209 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211210 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211211 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211212 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211213 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211214 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211215 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211216 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211217 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211218 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211219 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211222 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211223 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211226 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20211227 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220101 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220102 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220103 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220104 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220105 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220106 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220108 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220109 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220110 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220111 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220112 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220113 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220115 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220116 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220117 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220118 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220119 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220120 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220122 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220123 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220124 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220125 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220126 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220127 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220129 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220130 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220204 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220205 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220206 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220207 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220208 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220209 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220210 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220211 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220212 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220213 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220214 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220215 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220216 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220217 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220218 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220219 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220220 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220221 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220222 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220223 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220224 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220225 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220226 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220227 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220228 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220301 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220305 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220306 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220307 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220308 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220309 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220310 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220311 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220312 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220313 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220314 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220315 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220316 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220317 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220318 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220319 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220320 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220321 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220322 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220323 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220324 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220325 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220326 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220327 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220328 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220329 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220330 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220331 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220401 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220402 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220403 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220404 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220405 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220406 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220407 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220408 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220409 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220410 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220411 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220413 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220417 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220418 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220419 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220420 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220421 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220422 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220423 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220424 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220425 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220426 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220427 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220428 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220429 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220430 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220501 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220502 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220508 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220515 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220516 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220517 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220518 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220519 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220520 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220521 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220522 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220602 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220603 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220605 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220606 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220607 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220608 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220609 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220610 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220611 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220612 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220614 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220615 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220617 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220618 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220619 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220620 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220621 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220622 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220623 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220624 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220625 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220626 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220627 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220628 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220629 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220630 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220701 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220702 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220703 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220704 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220705 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220706 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220707 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220708 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220709 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220710 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220711 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220712 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220713 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220714 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220715 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220716 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220717 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220718 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220719 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220720 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220721 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220722 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220723 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220724 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220725 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220726 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220727 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220728 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220813 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220814 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220815 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220816 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220817 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220818 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220819 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220820 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220821 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220822 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220823 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220824 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220826 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220827 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220828 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220830 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220831 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220901 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220907 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220911 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220913 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220914 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220916 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220917 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220918 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220919 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220920 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220921 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220922 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220923 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220924 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220925 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220926 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220927 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220928 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220929 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20220930 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221001 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221002 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221003 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221004 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221005 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221006 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221007 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221008 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221009 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221010 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221011 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221012 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221013 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221014 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221015 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221016 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221017 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221018 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221019 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221020 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221021 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221022 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221023 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221024 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221025 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221026 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221027 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221028 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221029 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221030 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221031 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221101 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221102 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221114 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221115 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221117 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221118 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221119 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221120 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221121 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221122 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221123 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221124 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221125 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221126 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221127 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221128 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221129 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221130 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221201 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221202 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221203 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221204 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221205 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221206 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221207 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221208 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221209 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221210 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221211 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221212 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221213 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221214 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221215 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221216 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221217 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221218 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221219 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221220 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221221 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221222 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221223 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221224 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221225 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221226 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221227 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221228 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221229 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221230 date, sort lcolor(green) lwidth(thin)) ///
(line DDAbPeErSRIV20221231 date, sort lcolor(green) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Afghanistan, SRIV, all updates, forecast only", size(small))

qui graph export "graph 06 Afghanistan SRIV C19 daily deaths absolute percent error.pdf", replace











***************************************************************
* graph 07 Daily deaths, average median error 

twoway ///
(line DDErrorSRIV_Mean1 date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Afghanistan, SRIV, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 07 Afghanistan SRIV C19 daily deaths average median error.pdf", replace





*********************
* smooth median error for better viewing 

tsset date, daily   

tssmooth ma DDErrorSRIV_Mean1_window = DDErrorSRIV_Mean1, window(3 1 3)

tssmooth ma DDErrorSRIV_Mean1_sm = DDErrorSRIV_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDErrorSRIV_Mean1_sm "Daily deaths SRIV average median error smooth"

drop *_window

// tsset, clear

*












***************************************************************
* graph 08 Daily deaths, average median absolute error 

twoway ///
(line DDAbsErrSRIV_Mean1 date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Afghanistan, SRIV, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 08 Afghanistan SRIV C19 daily deaths average median absolute error.pdf", replace






*********************
* smooth median absolute error for better viewing 

// tsset date, daily   

tssmooth ma DDAbsErrSRIV_Mean1_window = DDAbsErrSRIV_Mean1, window(3 1 3)

tssmooth ma DDAbsErrSRIV_Mean1_sm = DDAbsErrSRIV_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbsErrSRIV_Mean1_sm "Daily deaths SRIV average median absolute error smooth"

drop *_window

// tsset, clear

*











***************************************************************
* graph 09 Daily deaths, average median percent error 

twoway ///
(line DDPerErrSRIV_Mean1 date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Afghanistan, SRIV, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 09 Afghanistan SRIV C19 daily deaths average median percent error.pdf", replace





*********************
* smooth median percent error for better viewing 

// tsset date, daily   

tssmooth ma DDPerErrSRIV_Mean1_window = DDPerErrSRIV_Mean1, window(3 1 3)

tssmooth ma DDPerErrSRIV_Mean1_sm = DDPerErrSRIV_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDPerErrSRIV_Mean1_sm "Daily deaths SRIV average median percent error smooth"

drop *_window

// tsset, clear

*












***************************************************************
* graph 10 Daily deaths, average median absolute percent error

twoway ///
(line DDAbPeErSRIV_Mean1 date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Afghanistan, SRIV, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 Afghanistan SRIV C19 daily deaths average median absolute percent error.pdf", replace





*********************
* smooth median absolute % error for better viewing 

// tsset date, daily   

tssmooth ma DDAbPeErSRIV_Mean1_window = DDAbPeErSRIV_Mean1, window(3 1 3)

tssmooth ma DDAbPeErSRIV_Mean1_sm = DDAbPeErSRIV_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbPeErSRIV_Mean1_sm "Daily deaths SRIV average median absolute percent error smooth"

drop *_window

tsset, clear

*






***********************************************

capture drop *2str

summ DDAbPeErSRIV_Mean2, meanonly

local DDAbPeErSRIV_Mean2str = string(r(mean),"%8.1f")

gen DDAbPeErSRIV_Mean2str = `DDAbPeErSRIV_Mean2str'
    

* graph 11 Daily deaths, Average MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErSRIV_Mean2str /// 
, bar(1, fcolor(green) lcolor(green)) ///
blabel(bar, format(%30.0fc)) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medium) color(black)) ///
subtitle("Afghanistan, SRIV, forecast only. MAPE: Median Absolute Percent Error", size(small)) /// 
legend(off) ylabel(, labsize(small) angle(forty_five) format(%30.0fc))

qui graph export "graph 11 Afghanistan SRIV C19 daily deaths Average MAPE over updates and calendar months.pdf", replace










******

qui compress 

save "SRIV Afghanistan error.dta", replace 



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "SRIV Afghanistan error data dictionary.csv", replace 
	
restore



view "log CovidLongitudinal Afghanistan 6 SRIV.smcl"

log close

exit, clear

