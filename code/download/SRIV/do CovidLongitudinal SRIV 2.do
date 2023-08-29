
clear all

cd "$pathCovidLongitudinal/download/SRIV"

capture log close 

log using "log CovidLongitudinal SRIV 2.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal SRIV 2.do"

* Project: Longitudinal assessment of COVID-19 models  

* Objective: Download estimates files for SRIV model, part 2 of 2                                                                       
***************************************************************************


* download and prepare update files, continued

* input data files: csv files on web site
* output data files: "SRIV `update'.dta" 
*                    "SRIV countries.dta"
*                    "SRIV countries long.dta"




* There are two series of updates: 
* (1) updates with global_forecasts_deaths.csv -> processed in "do CovidLongitudinal SRIV 1a.do"
* (2) updates with us_forecasts_deaths.csv but without global_forecasts_deaths.csv -> processed below




* updates with us_forecasts_deaths.csv but without global_forecasts_deaths.csv : processed in this do file
* 2021-08-12 2021-10-18 2021-10-19 2021-10-20 2021-10-21 2021-10-22 2021-10-23
* 2021-11-23 2021-12-06 2022-04-12 2022-05-23 2022-05-24 2022-05-25 2022-05-26
* 2022-05-27 2022-05-28 2022-05-29 2022-05-30 2022-05-31 2022-06-01 2022-07-29
* 2022-07-30 2022-07-31 2022-08-01 2022-08-02 2022-08-03 2022-08-04 2022-08-05
* 2022-08-06 2022-08-07 2022-08-08 2022-08-09 2022-08-10 2022-08-11 2022-08-12
* 2022-09-12 2022-09-15 

* update "2022-08-25" us_forecasts_deaths.csv includes an error 
* GitHub says: We can make this file beautiful and searchable if this error is corrected: It looks like row 2 should actually have column, instead of 103. in line 1.
* https://github.com/scc-usc/ReCOVER-COVID-19/blob/master/results/historical_forecasts/2022-08-25/us_forecasts_deaths.csv


* updates with neither global_forecasts_deaths.csv nore us_forecasts_deaths.csv (a third type) are not usable here:
* 2021-12-04 2021-12-28 2021-12-29 2022-01-07 2022-01-14 2022-01-21 2022-01-28
* 2022-02-03 2022-03-02 2022-04-14 2022-04-15 2022-04-16 2022-05-03 2022-05-09
* 2022-05-10 2022-05-11 2022-05-12 2022-05-13 2022-05-14 2022-06-04 2022-06-13 
* 2022-06-16 


clear 
	
set obs 1
		
local list `" "2021-01-02" "2021-08-12" "2021-10-18" "2021-10-19" "2021-10-20" "2021-10-21" "2021-10-22" "2021-10-23" "2021-11-13" "2021-11-23" "2021-12-06" "2022-04-12" "2022-05-23" "2022-05-24" "2022-05-25" "2022-05-26" "2022-05-27" "2022-05-28" "2022-05-29" "2022-05-30" "2022-05-31" "2022-06-01" "2022-07-29" "2022-07-30" "2022-07-31" "2022-08-01" "2022-08-02" "2022-08-03" "2022-08-04" "2022-08-05" "2022-08-06" "2022-08-07" "2022-08-08" "2022-08-09" "2022-08-10" "2022-08-11" "2022-08-12" "2022-09-12" "2022-09-15" "2022-11-16" "'	
	
	
foreach update of local list {	
	
	capture shell rm -r "us_forecasts_deaths.csv"
	
	di in red "This is SRIV USA-only update " "`update'"
	
	* transfrom update (2020-05-02) to updatestring (20200502)
	
	capture drop updatestring
	gen updatestring = "`update'"
	
	gen year = substr(updatestring,1,4) 
	gen month = substr(updatestring,6,2) 
	gen day = substr(updatestring,9,2) 
	capture drop updatestring2
	egen updatestring2 = concat(year month day)
	
	drop updatestring
	rename updatestring2 updatestring
	local updatestring = updatestring
	
	di `updatestring'
	
	* download "us_forecasts_deaths.csv" for each update
	
	copy https://raw.githubusercontent.com/scc-usc/ReCOVER-COVID-19/master/results/historical_forecasts/`update'/us_forecasts_deaths.csv us_forecasts_deaths.csv 
			
	import delimited "us_forecasts_deaths.csv", clear varnames(1) 
	
	
	qui destring *, replace
	
	* destring for Total Deaths that contain NaN instead of numbers
	
	qui {
		foreach v of var * {
			capture replace `v' = "" if `v' == "NaN"
		}
			*
		destring *, replace
	}	
	
	drop id
	
	* use varlables for varnames
	
	foreach v of var v* {
		local lbl : var label `v'
		local lbl = strtoname("`lbl'")
		rename `v' `lbl'					
	}		
*
 
	rename (_*) (v_*)
	
	* reshape long
		
	gen i = _n
	qui reshape long v, i(i) j(j, string)
	rename v TotDeaMeRaSRIV
	rename j date_original
	drop i
	
	* gen date
	
	gen year = substr(date_original,2,4) 
	gen month = substr(date_original,7,2) 
	gen day = substr(date_original,10,2) 
	egen date2 = concat(day month year)
	gen date = date(date2, "DMY", 2050)
	format date %tdDDMonCCYY
	codebook date
	drop year month day date2 date_original

	* add update date to the end of Total Deaths

	rename TotDeaMeRaSRIV TotDeaMeRaSRIV`updatestring'
	
	* gen update date for this update
	
	gen update = "`updatestring'"
	tostring update, replace
	gen update_date = date(update, "YMD")
	format update_date %tdDDMonCCYY
	codebook update_date
	

	replace country = "United States of America" if country == "United States" 
	replace country = "United States of America" if country == "US" 
	
	
	qui compress
	
	save "SRIV `updatestring'.dta", replace
	 
	shell rm -r "global_forecasts_deaths.csv" 

		
}
*











**********************************************
**********************************************

**********************************************
**********************************************

* gen list of countries and update dates


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
20210102 ///
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
20210812 ///
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
20211018 ///
20211019 ///
20211020 ///
20211021 ///
20211022 ///
20211023 ///
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
20211113 ///
20211114 ///
20211115 ///
20211116 ///
20211117 ///
20211118 ///
20211119 ///
20211120 ///
20211121 ///
20211122 ///
20211123 ///
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
20211206 ///
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
20220412 ///
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
20220523 ///
20220524 ///
20220525 ///
20220526 ///
20220527 ///
20220528 ///
20220529 ///
20220530 ///
20220531 ///
20220601 ///
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
20220729 ///
20220730 ///
20220731 ///
20220801 ///
20220802 ///
20220803 ///
20220804 ///
20220805 ///
20220806 ///
20220807 ///
20220808 ///
20220809 ///
20220810 ///
20220811 ///
20220812 ///
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
20220912 ///
20220913 ///
20220914 ///
20220915 ///
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
20221116 ///
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


foreach update of local list {

	use "SRIV `update'.dta", clear
	
	rename country loc_grand_name
		
	contract loc_grand_name
	
	drop _freq
		
	rename loc_grand_name loc_grand_name`update'
	
	gen counter = _n
	
	save "SRIV `update' countries.dta", replace

}
*



use "SRIV 20200502 countries.dta" 


foreach update of local list {

	merge m:m counter using "SRIV `update' countries.dta"
	
	drop _merge

}
*


order counter

qui compress 

save "SRIV countries.dta", replace


*





* determine earliest date each country was present (date_present_first) 
* dates on which each country was absent (after their first presence)(date_absent_1*)

use "SRIV countries.dta", clear 

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

replace loc_grand_name = "Bahamas" if loc_grand_name == "The Bahamas" 
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of the Congo" 
replace loc_grand_name = "Czechia" if loc_grand_name == "Czech Republic" 
replace loc_grand_name = "Gambia" if loc_grand_name == "The Gambia" 
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau" 
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea" 
replace loc_grand_name = "North Macedonia" if loc_grand_name == "Macedonia" 
replace loc_grand_name = "Palestine" if loc_grand_name == "West Bank and Gaza" 
replace loc_grand_name = "Russia" if loc_grand_name == "Russian Federation" 
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste" 
replace loc_grand_name = "United States of America" if loc_grand_name == "United States" 
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam" 
                                       

                                           
	
isid loc_grand_name update_date_block, sort

duplicates drop loc_grand_name update_date_block, force

isid loc_grand_name update_date_block, sort
                                           


qui compress

save "SRIV countries long.dta", replace
















view "log CovidLongitudinal SRIV 2.smcl"

log close

exit, clear




