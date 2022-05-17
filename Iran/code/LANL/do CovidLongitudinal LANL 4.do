
clear all

cd "$pathCovidLongitudinal"

cd LANL

capture log close 

log using "log CovidLongitudinal LANL 4.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal LANL 4.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* graphs 2 a b c d of all model updates (together) with official reports (JOHN)
* 2 a With extremes
* // 2 b Without extremes // there are no extremes
* 2 c Forecast only, with extremes
* // 2 d Forecast only, without extremes // there are no extremes

* input data files: "CovidLongitudinal LANL 2.dta"
* output data files: none (no change in data)



grstyle init

grstyle color background white



use "CovidLongitudinal LANL 2.dta", clear




******
* graph 2 a Daily deaths, Updates together, With extremes
	
twoway ///
(line DayDeaMeSmA00 date, sort lwidth(vthick) lcolor(cyan)) /// JOHN smooth
(line DayDeaMeSmA0420200426 date, sort lwidth(medium) lcolor(gold)) /// 2 to 129 (128 updates)
(line DayDeaMeSmA0420200429 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200506 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200510 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200513 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200517 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200520 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200524 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200527 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200531 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200603 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200607 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200610 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200613 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200617 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200621 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200623 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200628 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200701 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200705 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200708 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200712 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200715 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200719 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200722 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200726 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200729 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200802 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200805 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200809 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200812 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200816 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200819 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200823 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200826 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200830 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200902 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200906 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200909 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200913 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200916 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200920 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200923 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200927 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420200930 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201004 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201007 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201011 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201014 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201018 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201021 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201025 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201028 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201101 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201104 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201108 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201111 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201115 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201118 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201122 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201125 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201129 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201202 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201206 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201209 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201213 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201216 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201220 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420201223 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210103 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210105 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210110 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210113 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210117 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210120 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210124 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210127 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210131 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210203 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210207 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210210 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210214 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210217 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210221 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210224 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210228 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210303 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210307 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210310 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210314 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210321 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210324 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210328 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210331 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210404 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210407 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210411 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210414 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210418 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210421 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210425 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210428 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210502 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210505 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210509 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210512 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210516 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210519 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210523 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210526 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210602 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210606 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210613 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210620 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210627 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210704 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210711 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210718 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210725 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210801 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210808 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210815 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210822 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210829 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210905 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210912 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210919 date, sort lwidth(medium) lcolor(gold)) /// 
(line DayDeaMeSmA0420210926 date, sort lwidth(medium) lcolor(gold)) /// 129
(line DayDeaFOREA0420200426 date, sort lwidth(thin) lcolor(brown)) /// 130
(line DayDeaFOREA0420200429 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200506 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200510 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200513 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200517 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200520 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200524 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200527 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200531 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200603 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200607 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200610 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200613 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200617 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200621 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200623 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200628 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200701 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200705 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200708 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200712 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200715 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200719 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200722 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200726 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200729 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200802 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200805 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200809 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200812 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200816 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200819 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200823 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200826 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200830 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200902 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200906 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200909 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200913 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200916 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200920 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200923 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200927 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200930 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201004 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201007 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201011 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201014 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201018 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201021 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201025 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201028 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201101 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201104 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201108 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201111 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201115 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201118 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201122 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201125 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201129 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201202 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201206 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201209 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201213 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201216 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201220 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201223 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210103 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210105 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210110 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210113 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210117 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210120 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210124 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210127 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210131 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210203 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210207 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210210 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210214 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210217 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210221 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210224 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210228 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210303 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210307 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210310 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210314 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210321 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210324 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210328 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210331 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210404 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210407 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210411 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210414 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210418 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210421 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210425 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210428 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210502 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210505 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210509 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210512 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210516 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210519 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210523 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210526 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210602 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210606 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210613 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210620 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210627 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210704 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210711 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210718 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210725 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210801 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210808 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210815 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210822 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210829 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210905 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210912 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210919 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210926 date, sort lwidth(thin) lcolor(brown)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, LANL, all updates", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "LANL smooth, backcast" 130 "LANL smooth, forecast") size(small) rows(1)) ///
subtitle(., size(small) color(white)) 
 
qui graph export "graph 2 a C19 daily deaths, $country, LANL, Updates together With extremes.pdf", replace







******
* graph 2 c Daily deaths, Updates together, With extremes
	
twoway ///
(line DayDeaMeSmA00 date, sort lwidth(vthick) lcolor(cyan)) /// JOHN smooth
(line DayDeaFOREA0420200426 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200429 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200506 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200510 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200513 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200517 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200520 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200524 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200527 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200531 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200603 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200607 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200610 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200613 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200617 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200621 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200623 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200628 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200701 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200705 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200708 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200712 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200715 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200719 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200722 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200726 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200729 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200802 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200805 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200809 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200812 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200816 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200819 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200823 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200826 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200830 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200902 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200906 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200909 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200913 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200916 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200920 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200923 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200927 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420200930 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201004 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201007 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201011 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201014 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201018 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201021 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201025 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201028 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201101 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201104 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201108 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201111 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201115 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201118 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201122 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201125 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201129 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201202 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201206 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201209 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201213 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201216 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201220 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420201223 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210103 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210105 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210110 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210113 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210117 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210120 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210124 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210127 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210131 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210203 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210207 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210210 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210214 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210217 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210221 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210224 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210228 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210303 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210307 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210310 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210314 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210321 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210324 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210328 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210331 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210404 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210407 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210411 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210414 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210418 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210421 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210425 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210428 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210502 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210505 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210509 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210512 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210516 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210519 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210523 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210526 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210602 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210606 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210613 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210620 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210627 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210704 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210711 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210718 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210725 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210801 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210808 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210815 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210822 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210829 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210905 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210912 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210919 date, sort lwidth(thin) lcolor(brown)) /// 
(line DayDeaFOREA0420210926 date, sort lwidth(thin) lcolor(brown)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, LANL, all updates", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "LANL smooth, forecast") size(small) rows(1)) ///
subtitle(Forecast only, size(small)) 
 
qui graph export "graph 2 c C19 daily deaths, $country, LANL, Updates together With extremes, Forecast only.pdf", replace


*





view "log CovidLongitudinal LANL 4.smcl"

log close
