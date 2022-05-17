
clear all

cd "$pathCovidLongitudinal"

cd IMPE

capture log close 

log using "log CovidLongitudinal IMPE 4.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE 4.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



* graphs 2 a b c d of all model updates (together) with official reports (JOHN)
* 2 a With extremes
* 2 b Without extremes
* 2 c Forecast only, with extremes
* 2 d Forecast only, ithout extremes

* input data files: "CovidLongitudinal IMPE 2.dta"
* output data files: none (no change in data)




use "CovidLongitudinal IMPE 2.dta", clear



* updates together

grstyle init

grstyle color background white


******
* graph 2 a Daily deaths, Updates together, With extremes
	
twoway ///
(line DayDeaMeSmA00S00 date, sort lwidth(vthick) lcolor(cyan)) /// JOHN smooth
(line DayDeaMeSmA0320200614 date, sort lwidth(thin) lcolor(gold)) /// 2-94
(line DayDeaMeSmA0320200616 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200619 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200623 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200702 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200703 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200704 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200707 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200711 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200714 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200715 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200718 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200720 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200722 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200725 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200727 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200731 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200808 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200810 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200811 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200813 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200814 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200817 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200823 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200825 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200827 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200831 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200902 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200906 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200908 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200912 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200915 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200919 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200923 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200925 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201003 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201006 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201012 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201019 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201025 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201028 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201101 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201110 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201114 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201118 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201123 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201129 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201204 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201212 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201220 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201226 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210110 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210112 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210118 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210124 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210130 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210203 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210210 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210217 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210226 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210305 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210312 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210319 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210329 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210406 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210417 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210424 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210510 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210516 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210522 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210527 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210604 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210611 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210618 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210626 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210702 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210709 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210719 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210806 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210819 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210825 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210909 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210924 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211006 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211021 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211027 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211103 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211115 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211121 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211129 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211205 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211213 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211226 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaFOREA0320200614 date, sort lwidth(thin) lcolor(magenta)) /// 95
(line DayDeaFOREA0320200616 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200619 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200623 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200702 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200703 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200704 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200707 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200711 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200714 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200715 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200718 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200720 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200722 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200725 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200727 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200731 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200808 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200810 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200811 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200813 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200814 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200817 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200823 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200825 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200827 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200831 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200902 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200906 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200908 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200912 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200915 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200919 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200923 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200925 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201003 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201006 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201012 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201019 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201025 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201028 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201101 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201110 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201114 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201118 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201123 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201129 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201204 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201212 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201220 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201226 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210110 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210112 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210118 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210124 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210130 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210203 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210210 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210217 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210226 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210305 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210312 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210319 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210329 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210406 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210417 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210424 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210510 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210516 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210522 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210527 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210604 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210611 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210618 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210626 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210702 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210709 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210719 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210806 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210819 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210825 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210909 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210924 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211006 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211021 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211027 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211103 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211115 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211121 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211129 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211205 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211213 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211226 date, sort lwidth(thin) lcolor(magenta)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, IMPE, all updates", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "IMPE backcast" 95 "IMPE forecast") size(small) rows(1)) ///
subtitle("With extremes", size(small)) yscale(titlegap(2)) 
 
qui graph export "graph 2 a C19 daily deaths, Iran, IMPE, Updates together With extremes.pdf", replace






* graph 2 b Daily deaths, Updates together, Without extremes

* extremes (much higher than other updates, i.e., > 2000) = update
* 20200616 20200707 20200715 20200722 20200725 20200727 
* 20200731 20201129 20210406 20210417 20210424 


twoway ///
(line DayDeaMeSmA00S00 date, sort lwidth(vthick) lcolor(cyan)) /// JOHN smooth
(line DayDeaMeSmA0320200614 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200619 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200623 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200702 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200703 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200704 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200711 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200714 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200718 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200720 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200808 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200810 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200811 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200813 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200814 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200817 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200823 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200825 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200827 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200831 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200902 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200906 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200908 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200912 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200915 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200919 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200923 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320200925 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201003 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201006 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201012 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201019 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201025 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201028 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201101 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201110 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201114 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201118 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201123 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201204 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201212 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201220 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320201226 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210110 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210112 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210118 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210124 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210130 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210203 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210210 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210217 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210226 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210305 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210312 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210319 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210329 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210510 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210516 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210522 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210527 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210604 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210611 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210618 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210626 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210702 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210709 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210719 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210806 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210819 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210825 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210909 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320210924 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211006 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211021 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211027 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211103 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211115 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211121 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211129 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211205 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211213 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaMeSmA0320211226 date, sort lwidth(thin) lcolor(gold)) /// 
(line DayDeaFOREA0320200614 date, sort lwidth(thin) lcolor(magenta)) /// 84
(line DayDeaFOREA0320200619 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200623 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200702 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200703 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200704 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200711 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200714 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200718 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200720 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200808 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200810 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200811 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200813 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200814 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200817 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200823 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200825 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200827 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200831 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200902 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200906 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200908 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200912 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200915 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200919 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200923 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200925 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201003 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201006 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201012 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201019 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201025 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201028 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201101 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201110 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201114 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201118 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201123 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201204 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201212 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201220 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201226 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210110 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210112 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210118 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210124 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210130 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210203 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210210 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210217 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210226 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210305 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210312 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210319 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210329 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210510 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210516 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210522 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210527 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210604 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210611 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210618 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210626 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210702 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210709 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210719 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210806 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210819 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210825 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210909 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210924 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211006 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211021 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211027 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211103 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211115 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211121 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211129 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211205 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211213 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211226 date, sort lwidth(thin) lcolor(magenta)) /// 165
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, IMPE, all updates", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "IMPE backcast" 84 "IMPE forecast") size(small) rows(1)) ///
subtitle("Without extremes", size(small)) yscale(titlegap(2))
 
qui graph export "graph 2 b C19 daily deaths, Iran, IMPE, Updates together Without extremes.pdf", replace





* graph 2 c Daily deaths, Updates together, With extremes, Forecast only

twoway ///
(line DayDeaMeSmA00S00 date, sort lwidth(thick) lcolor(cyan)) /// JOHN smooth
(line DayDeaFOREA0320200614 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200616 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200619 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200623 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200702 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200703 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200704 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200707 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200711 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200714 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200715 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200718 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200720 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200722 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200725 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200727 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200731 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200808 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200810 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200811 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200813 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200814 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200817 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200823 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200825 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200827 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200831 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200902 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200906 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200908 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200912 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200915 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200919 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200923 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200925 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201003 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201006 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201012 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201019 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201025 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201028 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201101 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201110 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201114 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201118 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201123 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201129 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201204 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201212 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201220 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201226 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210110 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210112 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210118 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210124 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210130 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210203 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210210 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210217 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210226 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210305 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210312 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210319 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210329 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210406 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210417 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210424 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210510 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210516 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210522 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210527 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210604 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210611 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210618 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210626 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210702 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210709 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210719 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210806 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210819 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210825 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210909 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210924 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211006 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211021 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211027 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211103 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211115 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211121 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211129 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211205 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211213 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211226 date, sort lwidth(thin) lcolor(magenta)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, IMPE, all updates", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "IMPE forecast") size(small) rows(1)) ///
subtitle("Forecast only, with extremes", size(small)) yscale(titlegap(2))

qui graph export "graph 2 c C19 daily deaths, Iran, IMPE, Updates together With extremes, Forecast only.pdf", replace
 
 

 
 
***********************************************

* graph 2 d Daily deaths, Updates together, Without extremes, Forecast only 

* extremes (much higher than other updates, i.e., > 2000) = update
* 20200616 20200707 20200715 20200722 20200725 20200727 
* 20200731 20201129 20210406 20210417 20210424 
 
twoway ///
(line DayDeaMeSmA00S00 date, sort lwidth(thick) lcolor(cyan)) /// JOHN smooth
(line DayDeaFOREA0320200614 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200619 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200623 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200702 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200703 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200704 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200711 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200714 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200718 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200720 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200808 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200810 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200811 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200813 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200814 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200817 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200823 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200825 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200827 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200831 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200902 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200906 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200908 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200912 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200915 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200919 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200923 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320200925 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201003 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201006 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201012 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201019 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201025 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201028 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201101 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201110 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201114 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201118 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201123 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201204 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201212 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201220 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320201226 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210110 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210112 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210118 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210124 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210130 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210203 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210210 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210217 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210226 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210305 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210312 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210319 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210329 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210510 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210516 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210522 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210527 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210604 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210611 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210618 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210626 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210702 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210709 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210719 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210806 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210819 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210825 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210909 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320210924 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211006 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211021 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211027 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211103 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211115 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211121 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211129 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211205 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211213 date, sort lwidth(thin) lcolor(magenta)) /// 
(line DayDeaFOREA0320211226 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == " National" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, IMPE, all updates", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "IMPE smooth, forecast") size(small) row(1)) ///
subtitle("Forecast only, without extremes", size(small)) yscale(titlegap(2))

qui graph export "graph 2 d C19 daily deaths, Iran, IMPE, Updates together Without extremes, Forecast only.pdf", replace
 
*
 
 








view "log CovidLongitudinal IMPE 4.smcl"

log close
