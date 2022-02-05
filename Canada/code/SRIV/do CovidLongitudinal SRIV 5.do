
clear all

cd "$pathCovidLongitudinal"

cd SRIV

capture log close 

log using "log CovidLongitudinal SRIV 5.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal SRIV 5.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* graphs, daily deaths together


/*

Daily deaths

Updates together, Estimates’ values (without looking at errors)



--- Order of graphs:

Level (1) Update circles: 1 Without update circles, 2 With update circles. Update circles = Update release dates (x value) and values (y value) denoted with circles. 

Level (2) Extreme values: 1 With extreme values, 2 Without extreme values. Extreme values = Updates whose values are much larger than other updates.


--- Graph numbers and contents:

110 (1-4) National

* 110 1 Daily deaths, National, Updates together, Without Update circles, With extremes
* 110 2 Daily deaths, National, Updates together, Without Update circles, Without extremes 
* 110 3 Daily deaths, National, Updates together, With Update circles, With extremes
* 110 4 Daily deaths, National, Updates together, With Update circles, Without extremes 

*/






grstyle init

grstyle color background white


use "CovidLongitudinal SRIV daily deaths.dta", clear 



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
20201005 ///
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
20211227 








foreach update of local list {

gen update_date_`update' = date("`update'", "YMD")

local value = update_date_`update'

rename update_date_`update' update_date_`value'

}
*







* National

***********************************************

* 110 1 Daily deaths, National, Updates together, Without Update circles, With extremes

twoway ///
(line DayDeaMeSmA00S00XXX date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DDSmA0520200502 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200503 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200504 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200505 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200506 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200507 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200508 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200510 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200511 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200512 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200513 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200514 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200515 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200516 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200518 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200519 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200520 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200521 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200522 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200523 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200525 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200526 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200527 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200528 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200529 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200530 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200601 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200602 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200603 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200604 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200605 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200606 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200608 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200609 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200610 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200611 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200612 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200613 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200615 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200616 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200617 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200618 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200619 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200620 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200622 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200623 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200624 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200625 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200626 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200627 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200629 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200630 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200701 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200702 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200703 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200705 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200706 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200707 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200708 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200709 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200710 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200711 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200712 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200713 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200714 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200715 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200716 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200717 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200719 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200720 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200721 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200722 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200724 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200725 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200726 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200727 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200728 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200729 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200730 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200731 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200801 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200802 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200803 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200804 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200805 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200806 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200807 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200808 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200809 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200810 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200811 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200812 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200813 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200814 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200815 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200816 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200817 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200818 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200819 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200820 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200821 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200822 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200823 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200824 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200825 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200826 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200827 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200828 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200829 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200830 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200831 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200901 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200902 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200903 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200904 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200905 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200906 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200907 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200908 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200909 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200910 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200911 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200912 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200913 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200914 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200915 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200916 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200917 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200918 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200919 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200920 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200921 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200922 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200923 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200924 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200925 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200927 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200928 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200929 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200930 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201001 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201002 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201003 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201004 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201005 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201006 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201007 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201009 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201010 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201011 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201012 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201013 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201014 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201015 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201016 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201017 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201018 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201019 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201020 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201021 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201023 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201024 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201025 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201026 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201027 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201028 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201029 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201030 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201031 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201101 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201102 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201103 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201104 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201106 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201107 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201108 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201109 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201110 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201111 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201112 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201113 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201114 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201115 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201116 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201117 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201118 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201120 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201121 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201122 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201123 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201124 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201125 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201126 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201127 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201128 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201129 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201130 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201201 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201202 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201204 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201205 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201206 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201207 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201208 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201209 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201210 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201211 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201212 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201213 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201214 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201216 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201218 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201219 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201220 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201221 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201222 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201223 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201224 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201225 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201226 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201227 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201229 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201230 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210101 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210102 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210103 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210104 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210105 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210106 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210107 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210108 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210109 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210110 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210111 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210112 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210113 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210115 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210116 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210117 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210118 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210119 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210120 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210121 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210122 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210123 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210124 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210125 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210126 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210127 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210129 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210130 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210131 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210201 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210202 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210203 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210204 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210205 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210206 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210207 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210208 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210209 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210210 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210212 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210213 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210214 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210215 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210216 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210217 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210218 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210219 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210220 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210221 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210222 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210223 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210224 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210226 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210227 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210228 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210301 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210302 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210303 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210304 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210305 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210306 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210307 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210308 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210309 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210310 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210312 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210313 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210314 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210315 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210316 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210317 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210318 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210319 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210320 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210321 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210322 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210323 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210324 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210326 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210327 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210328 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210329 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210330 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210331 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210401 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210402 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210403 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210404 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210405 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210406 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210407 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210409 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210410 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210411 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210412 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210413 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210414 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210415 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210416 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210417 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210418 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210419 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210420 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210421 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210423 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210424 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210425 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210426 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210427 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210428 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210429 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210430 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210501 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210502 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210503 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210504 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210505 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210507 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210508 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210509 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210510 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210511 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210512 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210513 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210514 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210515 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210516 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210517 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210518 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210519 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210521 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210522 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210523 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210524 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210525 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210526 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210527 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210528 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210529 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210530 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210531 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210601 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210602 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210604 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210605 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210606 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210607 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210608 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210609 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210611 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210612 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210613 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210614 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210615 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210616 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210618 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210619 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210620 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210621 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210622 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210623 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210627 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210630 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210703 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210704 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210705 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210706 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210707 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210709 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210710 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210711 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210712 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210713 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210714 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210716 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210717 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210718 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210719 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210720 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210721 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210723 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210724 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210725 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210726 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210727 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210728 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210730 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210731 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210801 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210808 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210809 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210810 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210811 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210813 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210814 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210815 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210816 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210817 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210818 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210820 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210821 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210822 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210823 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210824 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210825 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210827 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210828 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210829 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210830 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210831 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210901 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210903 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210904 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210905 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210906 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210907 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210908 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210910 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210911 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210912 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210913 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210914 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210915 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210917 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210918 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210919 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210920 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210921 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210922 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210924 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210925 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210926 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210927 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210928 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210929 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211227 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, SRIV, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "SRIV smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) 


qui graph save "graph 110 1 C19 daily deaths, $country, National, SRIV, Updates together Without Update circles With extremes.gph", replace
qui graph export "graph 110 1 C19 daily deaths, $country, National, SRIV, Updates together Without Update circles With extremes.pdf", replace






***********************************************

* 110 2 Daily deaths, National, Updates together, Without Update circles, Without extremes

* extremes (much higher than other updates) = update 20210414 20210810 20210926 (> 500)

twoway ///
(line DDSmA0520200502 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200503 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200504 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200505 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200506 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200507 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200508 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200510 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200511 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200512 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200513 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200514 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200515 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200516 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200518 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200519 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200520 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200521 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200522 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200523 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200525 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200526 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200527 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200528 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200529 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200530 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200601 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200602 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200603 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200604 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200605 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200606 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200608 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200609 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200610 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200611 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200612 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200613 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200615 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200616 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200617 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200618 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200619 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200620 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200622 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200623 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200624 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200625 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200626 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200627 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200629 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200630 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200701 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200702 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200703 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200705 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200706 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200707 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200708 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200709 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200710 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200711 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200712 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200713 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200714 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200715 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200716 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200717 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200719 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200720 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200721 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200722 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200724 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200725 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200726 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200727 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200728 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200729 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200730 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200731 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200801 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200802 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200803 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200804 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200805 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200806 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200807 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200808 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200809 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200810 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200811 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200812 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200813 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200814 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200815 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200816 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200817 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200818 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200819 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200820 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200821 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200822 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200823 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200824 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200825 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200826 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200827 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200828 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200829 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200830 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200831 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200901 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200902 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200903 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200904 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200905 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200906 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200907 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200908 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200909 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200910 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200911 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200912 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200913 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200914 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200915 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200916 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200917 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200918 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200919 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200920 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200921 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200922 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200923 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200924 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200925 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200927 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200928 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200929 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200930 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201001 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201002 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201003 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201004 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201005 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201006 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201007 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201009 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201010 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201011 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201012 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201013 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201014 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201015 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201016 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201017 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201018 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201019 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201020 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201021 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201023 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201024 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201025 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201026 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201027 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201028 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201029 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201030 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201031 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201101 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201102 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201103 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201104 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201106 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201107 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201108 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201109 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201110 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201111 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201112 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201113 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201114 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201115 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201116 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201117 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201118 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201120 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201121 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201122 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201123 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201124 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201125 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201126 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201127 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201128 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201129 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201130 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201201 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201202 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201204 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201205 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201206 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201207 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201208 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201209 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201210 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201211 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201212 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201213 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201214 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201216 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201218 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201219 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201220 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201221 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201222 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201223 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201224 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201225 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201226 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201227 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201229 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201230 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210101 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210102 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210103 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210104 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210105 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210106 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210107 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210108 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210109 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210110 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210111 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210112 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210113 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210115 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210116 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210117 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210118 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210119 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210120 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210121 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210122 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210123 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210124 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210125 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210126 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210127 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210129 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210130 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210131 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210201 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210202 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210203 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210204 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210205 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210206 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210207 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210208 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210209 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210210 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210212 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210213 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210214 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210215 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210216 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210217 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210218 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210219 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210220 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210221 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210222 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210223 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210224 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210226 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210227 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210228 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210301 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210302 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210303 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210304 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210305 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210306 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210307 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210308 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210309 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210310 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210312 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210313 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210314 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210315 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210316 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210317 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210318 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210319 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210320 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210321 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210322 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210323 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210324 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210326 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210327 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210328 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210329 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210330 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210331 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210401 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210402 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210403 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210404 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210405 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210406 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210407 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210409 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210410 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210411 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210412 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210413 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210415 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210416 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210417 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210418 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210419 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210420 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210421 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210423 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210424 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210425 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210426 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210427 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210428 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210429 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210430 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210501 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210502 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210503 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210504 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210505 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210507 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210508 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210509 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210510 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210511 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210512 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210513 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210514 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210515 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210516 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210517 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210518 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210519 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210521 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210522 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210523 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210524 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210525 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210526 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210527 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210528 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210529 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210530 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210531 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210601 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210602 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210604 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210605 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210606 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210607 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210608 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210609 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210611 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210612 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210613 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210614 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210615 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210616 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210618 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210619 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210620 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210621 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210622 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210623 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210627 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210630 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210703 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210704 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210705 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210706 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210707 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210709 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210710 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210711 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210712 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210713 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210714 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210716 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210717 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210718 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210719 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210720 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210721 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210723 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210724 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210725 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210726 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210727 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210728 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210730 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210731 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210801 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210808 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210809 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210811 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210813 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210814 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210815 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210816 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210817 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210818 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210820 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210821 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210822 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210823 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210824 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210825 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210827 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210828 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210829 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210830 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210831 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210901 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210903 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210904 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210905 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210906 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210907 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210908 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210910 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210911 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210912 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210913 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210914 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210915 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210917 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210918 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210919 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210920 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210921 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210922 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210924 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210925 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210927 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210928 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210929 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA00S00XXX date, sort lcolor(cyan) lwidth(vthick)) /// "JOHN smooth"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, SRIV, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "SRIV smooth" 573 "JOHN smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) 

qui graph save "graph 110 2 C19 daily deaths, $country, National, SRIV, Updates together Without Update circles Without extremes.gph", replace
qui graph export "graph 110 2 C19 daily deaths, $country, National, SRIV, Updates together Without Update circles Without extremes.pdf", replace








***********************************************

* 110 3 Daily deaths, National, Updates together, With Update circles, With extremes

twoway ///
(line DayDeaMeSmA00S00XXX date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DDSmA0520200502 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200503 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200504 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200505 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200506 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200507 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200508 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200510 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200511 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200512 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200513 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200514 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200515 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200516 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200518 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200519 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200520 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200521 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200522 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200523 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200525 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200526 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200527 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200528 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200529 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200530 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200601 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200602 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200603 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200604 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200605 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200606 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200608 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200609 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200610 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200611 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200612 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200613 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200615 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200616 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200617 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200618 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200619 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200620 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200622 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200623 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200624 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200625 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200626 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200627 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200629 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200630 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200701 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200702 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200703 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200705 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200706 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200707 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200708 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200709 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200710 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200711 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200712 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200713 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200714 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200715 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200716 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200717 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200719 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200720 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200721 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200722 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200724 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200725 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200726 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200727 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200728 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200729 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200730 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200731 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200801 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200802 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200803 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200804 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200805 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200806 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200807 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200808 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200809 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200810 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200811 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200812 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200813 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200814 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200815 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200816 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200817 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200818 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200819 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200820 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200821 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200822 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200823 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200824 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200825 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200826 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200827 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200828 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200829 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200830 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200831 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200901 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200902 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200903 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200904 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200905 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200906 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200907 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200908 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200909 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200910 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200911 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200912 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200913 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200914 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200915 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200916 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200917 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200918 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200919 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200920 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200921 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200922 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200923 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200924 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200925 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200927 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200928 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200929 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200930 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201001 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201002 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201003 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201004 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201005 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201006 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201007 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201009 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201010 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201011 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201012 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201013 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201014 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201015 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201016 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201017 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201018 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201019 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201020 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201021 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201023 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201024 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201025 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201026 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201027 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201028 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201029 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201030 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201031 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201101 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201102 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201103 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201104 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201106 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201107 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201108 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201109 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201110 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201111 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201112 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201113 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201114 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201115 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201116 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201117 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201118 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201120 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201121 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201122 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201123 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201124 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201125 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201126 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201127 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201128 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201129 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201130 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201201 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201202 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201204 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201205 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201206 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201207 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201208 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201209 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201210 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201211 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201212 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201213 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201214 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201216 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201218 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201219 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201220 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201221 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201222 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201223 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201224 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201225 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201226 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201227 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201229 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201230 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210101 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210102 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210103 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210104 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210105 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210106 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210107 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210108 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210109 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210110 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210111 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210112 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210113 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210115 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210116 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210117 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210118 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210119 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210120 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210121 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210122 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210123 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210124 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210125 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210126 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210127 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210129 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210130 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210131 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210201 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210202 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210203 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210204 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210205 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210206 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210207 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210208 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210209 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210210 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210212 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210213 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210214 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210215 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210216 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210217 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210218 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210219 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210220 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210221 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210222 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210223 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210224 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210226 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210227 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210228 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210301 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210302 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210303 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210304 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210305 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210306 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210307 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210308 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210309 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210310 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210312 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210313 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210314 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210315 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210316 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210317 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210318 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210319 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210320 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210321 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210322 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210323 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210324 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210326 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210327 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210328 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210329 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210330 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210331 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210401 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210402 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210403 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210404 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210405 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210406 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210407 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210409 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210410 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210411 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210412 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210413 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210414 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210415 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210416 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210417 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210418 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210419 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210420 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210421 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210423 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210424 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210425 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210426 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210427 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210428 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210429 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210430 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210501 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210502 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210503 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210504 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210505 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210507 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210508 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210509 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210510 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210511 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210512 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210513 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210514 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210515 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210516 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210517 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210518 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210519 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210521 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210522 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210523 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210524 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210525 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210526 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210527 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210528 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210529 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210530 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210531 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210601 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210602 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210604 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210605 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210606 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210607 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210608 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210609 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210611 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210612 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210613 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210614 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210615 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210616 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210618 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210619 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210620 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210621 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210622 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210623 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210627 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210630 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210703 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210704 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210705 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210706 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210707 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210709 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210710 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210711 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210712 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210713 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210714 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210716 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210717 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210718 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210719 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210720 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210721 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210723 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210724 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210725 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210726 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210727 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210728 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210730 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210731 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210801 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210808 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210809 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210810 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210811 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210813 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210814 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210815 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210816 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210817 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210818 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210820 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210821 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210822 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210823 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210824 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210825 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210827 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210828 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210829 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210830 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210831 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210901 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210903 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210904 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210905 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210906 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210907 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210908 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210910 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210911 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210912 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210913 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210914 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210915 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210917 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210918 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210919 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210920 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210921 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210922 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210924 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210925 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210926 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210927 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210928 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210929 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211227 date, sort lcolor(red) lwidth(medium)) /// 
(scatter DDSmA0520200502_val update_date_22037, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200503_val update_date_22038, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200504_val update_date_22039, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200505_val update_date_22040, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200506_val update_date_22041, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200507_val update_date_22042, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200508_val update_date_22043, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200510_val update_date_22045, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200511_val update_date_22046, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200512_val update_date_22047, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200513_val update_date_22048, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200514_val update_date_22049, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200515_val update_date_22050, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200516_val update_date_22051, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200518_val update_date_22053, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200519_val update_date_22054, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200520_val update_date_22055, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200521_val update_date_22056, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200522_val update_date_22057, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200523_val update_date_22058, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200525_val update_date_22060, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200526_val update_date_22061, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200527_val update_date_22062, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200528_val update_date_22063, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200529_val update_date_22064, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200530_val update_date_22065, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200601_val update_date_22067, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200602_val update_date_22068, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200603_val update_date_22069, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200604_val update_date_22070, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200605_val update_date_22071, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200606_val update_date_22072, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200608_val update_date_22074, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200609_val update_date_22075, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200610_val update_date_22076, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200611_val update_date_22077, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200612_val update_date_22078, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200613_val update_date_22079, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200615_val update_date_22081, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200616_val update_date_22082, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200617_val update_date_22083, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200618_val update_date_22084, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200619_val update_date_22085, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200620_val update_date_22086, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200622_val update_date_22088, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200623_val update_date_22089, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200624_val update_date_22090, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200625_val update_date_22091, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200626_val update_date_22092, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200627_val update_date_22093, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200629_val update_date_22095, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200630_val update_date_22096, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200701_val update_date_22097, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200702_val update_date_22098, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200703_val update_date_22099, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200705_val update_date_22101, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200706_val update_date_22102, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200707_val update_date_22103, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200708_val update_date_22104, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200709_val update_date_22105, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200710_val update_date_22106, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200711_val update_date_22107, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200712_val update_date_22108, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200713_val update_date_22109, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200714_val update_date_22110, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200715_val update_date_22111, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200716_val update_date_22112, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200717_val update_date_22113, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200719_val update_date_22115, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200720_val update_date_22116, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200721_val update_date_22117, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200722_val update_date_22118, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200724_val update_date_22120, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200725_val update_date_22121, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200726_val update_date_22122, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200727_val update_date_22123, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200728_val update_date_22124, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200729_val update_date_22125, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200730_val update_date_22126, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200731_val update_date_22127, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200801_val update_date_22128, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200802_val update_date_22129, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200803_val update_date_22130, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200804_val update_date_22131, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200805_val update_date_22132, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200806_val update_date_22133, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200807_val update_date_22134, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200808_val update_date_22135, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200809_val update_date_22136, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200810_val update_date_22137, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200811_val update_date_22138, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200812_val update_date_22139, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200813_val update_date_22140, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200814_val update_date_22141, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200815_val update_date_22142, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200816_val update_date_22143, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200817_val update_date_22144, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200818_val update_date_22145, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200819_val update_date_22146, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200820_val update_date_22147, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200821_val update_date_22148, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200822_val update_date_22149, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200823_val update_date_22150, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200824_val update_date_22151, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200825_val update_date_22152, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200826_val update_date_22153, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200827_val update_date_22154, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200828_val update_date_22155, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200829_val update_date_22156, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200830_val update_date_22157, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200831_val update_date_22158, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200901_val update_date_22159, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200902_val update_date_22160, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200903_val update_date_22161, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200904_val update_date_22162, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200905_val update_date_22163, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200906_val update_date_22164, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200907_val update_date_22165, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200908_val update_date_22166, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200909_val update_date_22167, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200910_val update_date_22168, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200911_val update_date_22169, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200912_val update_date_22170, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200913_val update_date_22171, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200914_val update_date_22172, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200915_val update_date_22173, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200916_val update_date_22174, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200917_val update_date_22175, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200918_val update_date_22176, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200919_val update_date_22177, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200920_val update_date_22178, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200921_val update_date_22179, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200922_val update_date_22180, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200923_val update_date_22181, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200924_val update_date_22182, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200925_val update_date_22183, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200927_val update_date_22185, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200928_val update_date_22186, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200929_val update_date_22187, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200930_val update_date_22188, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201001_val update_date_22189, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201002_val update_date_22190, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201003_val update_date_22191, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201004_val update_date_22192, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201005_val update_date_22193, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201006_val update_date_22194, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201007_val update_date_22195, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201009_val update_date_22197, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201010_val update_date_22198, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201011_val update_date_22199, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201012_val update_date_22200, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201013_val update_date_22201, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201014_val update_date_22202, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201015_val update_date_22203, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201016_val update_date_22204, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201017_val update_date_22205, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201018_val update_date_22206, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201019_val update_date_22207, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201020_val update_date_22208, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201021_val update_date_22209, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201023_val update_date_22211, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201024_val update_date_22212, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201025_val update_date_22213, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201026_val update_date_22214, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201027_val update_date_22215, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201028_val update_date_22216, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201029_val update_date_22217, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201030_val update_date_22218, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201031_val update_date_22219, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201101_val update_date_22220, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201102_val update_date_22221, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201103_val update_date_22222, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201104_val update_date_22223, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201106_val update_date_22225, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201107_val update_date_22226, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201108_val update_date_22227, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201109_val update_date_22228, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201110_val update_date_22229, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201111_val update_date_22230, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201112_val update_date_22231, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201113_val update_date_22232, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201114_val update_date_22233, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201115_val update_date_22234, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201116_val update_date_22235, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201117_val update_date_22236, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201118_val update_date_22237, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201120_val update_date_22239, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201121_val update_date_22240, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201122_val update_date_22241, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201123_val update_date_22242, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201124_val update_date_22243, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201125_val update_date_22244, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201126_val update_date_22245, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201127_val update_date_22246, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201128_val update_date_22247, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201129_val update_date_22248, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201130_val update_date_22249, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201201_val update_date_22250, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201202_val update_date_22251, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201204_val update_date_22253, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201205_val update_date_22254, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201206_val update_date_22255, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201207_val update_date_22256, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201208_val update_date_22257, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201209_val update_date_22258, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201210_val update_date_22259, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201211_val update_date_22260, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201212_val update_date_22261, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201213_val update_date_22262, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201214_val update_date_22263, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201216_val update_date_22265, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201218_val update_date_22267, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201219_val update_date_22268, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201220_val update_date_22269, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201221_val update_date_22270, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201222_val update_date_22271, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201223_val update_date_22272, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201224_val update_date_22273, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201225_val update_date_22274, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201226_val update_date_22275, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201227_val update_date_22276, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201229_val update_date_22278, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201230_val update_date_22279, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210101_val update_date_22281, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210102_val update_date_22282, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210103_val update_date_22283, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210104_val update_date_22284, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210105_val update_date_22285, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210106_val update_date_22286, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210107_val update_date_22287, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210108_val update_date_22288, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210109_val update_date_22289, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210110_val update_date_22290, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210111_val update_date_22291, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210112_val update_date_22292, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210113_val update_date_22293, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210115_val update_date_22295, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210116_val update_date_22296, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210117_val update_date_22297, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210118_val update_date_22298, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210119_val update_date_22299, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210120_val update_date_22300, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210121_val update_date_22301, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210122_val update_date_22302, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210123_val update_date_22303, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210124_val update_date_22304, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210125_val update_date_22305, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210126_val update_date_22306, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210127_val update_date_22307, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210129_val update_date_22309, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210130_val update_date_22310, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210131_val update_date_22311, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210201_val update_date_22312, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210202_val update_date_22313, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210203_val update_date_22314, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210204_val update_date_22315, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210205_val update_date_22316, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210206_val update_date_22317, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210207_val update_date_22318, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210208_val update_date_22319, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210209_val update_date_22320, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210210_val update_date_22321, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210212_val update_date_22323, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210213_val update_date_22324, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210214_val update_date_22325, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210215_val update_date_22326, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210216_val update_date_22327, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210217_val update_date_22328, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210218_val update_date_22329, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210219_val update_date_22330, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210220_val update_date_22331, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210221_val update_date_22332, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210222_val update_date_22333, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210223_val update_date_22334, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210224_val update_date_22335, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210226_val update_date_22337, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210227_val update_date_22338, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210228_val update_date_22339, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210301_val update_date_22340, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210302_val update_date_22341, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210303_val update_date_22342, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210304_val update_date_22343, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210305_val update_date_22344, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210306_val update_date_22345, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210307_val update_date_22346, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210308_val update_date_22347, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210309_val update_date_22348, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210310_val update_date_22349, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210312_val update_date_22351, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210313_val update_date_22352, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210314_val update_date_22353, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210315_val update_date_22354, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210316_val update_date_22355, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210317_val update_date_22356, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210318_val update_date_22357, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210319_val update_date_22358, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210320_val update_date_22359, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210321_val update_date_22360, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210322_val update_date_22361, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210323_val update_date_22362, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210324_val update_date_22363, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210326_val update_date_22365, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210327_val update_date_22366, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210328_val update_date_22367, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210329_val update_date_22368, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210330_val update_date_22369, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210331_val update_date_22370, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210401_val update_date_22371, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210402_val update_date_22372, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210403_val update_date_22373, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210404_val update_date_22374, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210405_val update_date_22375, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210406_val update_date_22376, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210407_val update_date_22377, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210409_val update_date_22379, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210410_val update_date_22380, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210411_val update_date_22381, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210412_val update_date_22382, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210413_val update_date_22383, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210414_val update_date_22384, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210415_val update_date_22385, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210416_val update_date_22386, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210417_val update_date_22387, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210418_val update_date_22388, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210419_val update_date_22389, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210420_val update_date_22390, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210421_val update_date_22391, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210423_val update_date_22393, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210424_val update_date_22394, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210425_val update_date_22395, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210426_val update_date_22396, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210427_val update_date_22397, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210428_val update_date_22398, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210429_val update_date_22399, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210430_val update_date_22400, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210501_val update_date_22401, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210502_val update_date_22402, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210503_val update_date_22403, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210504_val update_date_22404, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210505_val update_date_22405, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210507_val update_date_22407, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210508_val update_date_22408, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210509_val update_date_22409, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210510_val update_date_22410, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210511_val update_date_22411, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210512_val update_date_22412, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210513_val update_date_22413, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210514_val update_date_22414, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210515_val update_date_22415, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210516_val update_date_22416, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210517_val update_date_22417, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210518_val update_date_22418, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210519_val update_date_22419, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210521_val update_date_22421, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210522_val update_date_22422, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210523_val update_date_22423, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210524_val update_date_22424, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210525_val update_date_22425, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210526_val update_date_22426, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210527_val update_date_22427, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210528_val update_date_22428, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210529_val update_date_22429, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210530_val update_date_22430, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210531_val update_date_22431, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210601_val update_date_22432, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210602_val update_date_22433, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210604_val update_date_22435, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210605_val update_date_22436, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210606_val update_date_22437, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210607_val update_date_22438, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210608_val update_date_22439, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210609_val update_date_22440, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210611_val update_date_22442, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210612_val update_date_22443, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210613_val update_date_22444, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210614_val update_date_22445, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210615_val update_date_22446, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210616_val update_date_22447, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210618_val update_date_22449, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210619_val update_date_22450, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210620_val update_date_22451, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210621_val update_date_22452, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210622_val update_date_22453, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210623_val update_date_22454, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210627_val update_date_22458, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210630_val update_date_22461, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210703_val update_date_22464, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210704_val update_date_22465, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210705_val update_date_22466, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210706_val update_date_22467, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210707_val update_date_22468, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210709_val update_date_22470, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210710_val update_date_22471, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210711_val update_date_22472, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210712_val update_date_22473, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210713_val update_date_22474, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210714_val update_date_22475, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210716_val update_date_22477, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210717_val update_date_22478, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210718_val update_date_22479, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210719_val update_date_22480, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210720_val update_date_22481, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210721_val update_date_22482, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210723_val update_date_22484, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210724_val update_date_22485, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210725_val update_date_22486, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210726_val update_date_22487, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210727_val update_date_22488, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210728_val update_date_22489, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210730_val update_date_22491, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210731_val update_date_22492, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210801_val update_date_22493, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210808_val update_date_22500, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210809_val update_date_22501, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210810_val update_date_22502, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210811_val update_date_22503, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210813_val update_date_22505, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210814_val update_date_22506, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210815_val update_date_22507, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210816_val update_date_22508, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210817_val update_date_22509, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210818_val update_date_22510, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210820_val update_date_22512, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210821_val update_date_22513, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210822_val update_date_22514, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210823_val update_date_22515, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210824_val update_date_22516, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210825_val update_date_22517, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210827_val update_date_22519, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210828_val update_date_22520, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210829_val update_date_22521, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210830_val update_date_22522, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210831_val update_date_22523, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210901_val update_date_22524, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210903_val update_date_22526, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210904_val update_date_22527, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210905_val update_date_22528, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210906_val update_date_22529, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210907_val update_date_22530, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210908_val update_date_22531, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210910_val update_date_22533, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210911_val update_date_22534, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210912_val update_date_22535, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210913_val update_date_22536, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210914_val update_date_22537, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210915_val update_date_22538, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210917_val update_date_22540, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210918_val update_date_22541, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210919_val update_date_22542, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210920_val update_date_22543, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210921_val update_date_22544, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210922_val update_date_22545, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210924_val update_date_22547, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210925_val update_date_22548, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210926_val update_date_22549, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210927_val update_date_22550, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210928_val update_date_22551, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210929_val update_date_22552, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) ///  
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, SRIV, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "SRIV smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) ///
note("Update release dates and values denoted with circles")

qui graph save "graph 110 3 C19 daily deaths, $country, National, SRIV, Updates together With Update circles With extremes.gph", replace
qui graph export "graph 110 3 C19 daily deaths, $country, National, SRIV, Updates together With Update circles With extremes.pdf", replace






***********************************************

* 110 4 Daily deaths, National, Updates together, With Update circles, Without extremes

* extremes (much higher than other updates) = update 20210414 20210810 20210926 (> 500)

twoway ///
(line DDSmA0520200502 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200503 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200504 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200505 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200506 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200507 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200508 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200510 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200511 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200512 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200513 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200514 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200515 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200516 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200518 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200519 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200520 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200521 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200522 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200523 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200525 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200526 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200527 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200528 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200529 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200530 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200601 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200602 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200603 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200604 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200605 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200606 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200608 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200609 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200610 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200611 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200612 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200613 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200615 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200616 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200617 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200618 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200619 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200620 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200622 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200623 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200624 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200625 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200626 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200627 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200629 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200630 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200701 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200702 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200703 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200705 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200706 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200707 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200708 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200709 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200710 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200711 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200712 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200713 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200714 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200715 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200716 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200717 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200719 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200720 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200721 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200722 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200724 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200725 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200726 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200727 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200728 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200729 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200730 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200731 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200801 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200802 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200803 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200804 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200805 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200806 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200807 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200808 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200809 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200810 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200811 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200812 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200813 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200814 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200815 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200816 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200817 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200818 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200819 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200820 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200821 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200822 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200823 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200824 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200825 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200826 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200827 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200828 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200829 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200830 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200831 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200901 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200902 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200903 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200904 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200905 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200906 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200907 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200908 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200909 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200910 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200911 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200912 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200913 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200914 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200915 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200916 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200917 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200918 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200919 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200920 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200921 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200922 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200923 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200924 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200925 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200927 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200928 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200929 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520200930 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201001 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201002 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201003 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201004 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201005 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201006 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201007 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201009 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201010 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201011 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201012 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201013 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201014 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201015 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201016 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201017 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201018 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201019 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201020 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201021 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201023 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201024 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201025 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201026 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201027 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201028 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201029 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201030 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201031 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201101 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201102 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201103 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201104 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201106 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201107 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201108 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201109 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201110 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201111 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201112 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201113 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201114 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201115 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201116 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201117 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201118 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201120 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201121 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201122 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201123 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201124 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201125 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201126 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201127 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201128 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201129 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201130 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201201 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201202 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201204 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201205 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201206 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201207 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201208 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201209 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201210 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201211 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201212 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201213 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201214 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201216 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201218 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201219 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201220 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201221 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201222 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201223 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201224 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201225 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201226 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201227 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201229 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201230 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210101 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210102 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210103 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210104 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210105 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210106 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210107 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210108 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210109 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210110 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210111 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210112 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210113 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210115 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210116 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210117 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210118 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210119 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210120 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210121 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210122 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210123 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210124 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210125 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210126 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210127 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210129 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210130 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210131 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210201 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210202 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210203 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210204 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210205 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210206 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210207 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210208 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210209 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210210 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210212 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210213 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210214 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210215 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210216 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210217 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210218 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210219 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210220 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210221 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210222 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210223 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210224 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210226 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210227 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210228 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210301 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210302 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210303 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210304 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210305 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210306 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210307 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210308 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210309 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210310 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210312 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210313 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210314 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210315 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210316 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210317 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210318 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210319 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210320 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210321 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210322 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210323 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210324 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210326 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210327 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210328 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210329 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210330 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210331 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210401 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210402 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210403 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210404 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210405 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210406 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210407 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210409 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210410 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210411 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210412 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210413 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210415 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210416 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210417 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210418 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210419 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210420 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210421 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210423 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210424 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210425 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210426 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210427 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210428 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210429 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210430 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210501 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210502 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210503 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210504 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210505 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210507 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210508 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210509 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210510 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210511 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210512 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210513 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210514 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210515 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210516 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210517 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210518 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210519 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210521 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210522 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210523 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210524 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210525 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210526 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210527 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210528 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210529 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210530 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210531 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210601 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210602 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210604 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210605 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210606 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210607 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210608 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210609 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210611 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210612 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210613 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210614 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210615 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210616 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210618 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210619 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210620 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210621 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210622 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210623 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210627 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210630 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210703 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210704 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210705 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210706 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210707 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210709 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210710 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210711 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210712 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210713 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210714 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210716 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210717 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210718 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210719 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210720 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210721 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210723 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210724 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210725 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210726 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210727 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210728 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210730 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210731 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210801 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210808 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210809 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210811 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210813 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210814 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210815 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210816 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210817 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210818 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210820 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210821 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210822 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210823 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210824 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210825 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210827 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210828 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210829 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210830 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210831 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210901 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210903 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210904 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210905 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210906 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210907 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210908 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210910 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210911 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210912 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210913 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210914 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210915 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210917 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210918 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210919 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210920 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210921 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210922 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210924 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210925 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210927 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210928 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210929 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DDSmA0520211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA00S00XXX date, sort lcolor(cyan) lwidth(vvthick)) /// "JOHN smooth"
(scatter DDSmA0520200502_val update_date_22037, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200503_val update_date_22038, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200504_val update_date_22039, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200505_val update_date_22040, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200506_val update_date_22041, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200507_val update_date_22042, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200508_val update_date_22043, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200510_val update_date_22045, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200511_val update_date_22046, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200512_val update_date_22047, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200513_val update_date_22048, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200514_val update_date_22049, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200515_val update_date_22050, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200516_val update_date_22051, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200518_val update_date_22053, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200519_val update_date_22054, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200520_val update_date_22055, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200521_val update_date_22056, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200522_val update_date_22057, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200523_val update_date_22058, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200525_val update_date_22060, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200526_val update_date_22061, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200527_val update_date_22062, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200528_val update_date_22063, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200529_val update_date_22064, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200530_val update_date_22065, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200601_val update_date_22067, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200602_val update_date_22068, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200603_val update_date_22069, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200604_val update_date_22070, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200605_val update_date_22071, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200606_val update_date_22072, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200608_val update_date_22074, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200609_val update_date_22075, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200610_val update_date_22076, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200611_val update_date_22077, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200612_val update_date_22078, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200613_val update_date_22079, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200615_val update_date_22081, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200616_val update_date_22082, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200617_val update_date_22083, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200618_val update_date_22084, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200619_val update_date_22085, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200620_val update_date_22086, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200622_val update_date_22088, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200623_val update_date_22089, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200624_val update_date_22090, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200625_val update_date_22091, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200626_val update_date_22092, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200627_val update_date_22093, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200629_val update_date_22095, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200630_val update_date_22096, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200701_val update_date_22097, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200702_val update_date_22098, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200703_val update_date_22099, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200705_val update_date_22101, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200706_val update_date_22102, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200707_val update_date_22103, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200708_val update_date_22104, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200709_val update_date_22105, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200710_val update_date_22106, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200711_val update_date_22107, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200712_val update_date_22108, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200713_val update_date_22109, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200714_val update_date_22110, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200715_val update_date_22111, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200716_val update_date_22112, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200717_val update_date_22113, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200719_val update_date_22115, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200720_val update_date_22116, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200721_val update_date_22117, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200722_val update_date_22118, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200724_val update_date_22120, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200725_val update_date_22121, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200726_val update_date_22122, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200727_val update_date_22123, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200728_val update_date_22124, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200729_val update_date_22125, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200730_val update_date_22126, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200731_val update_date_22127, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200801_val update_date_22128, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200802_val update_date_22129, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200803_val update_date_22130, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200804_val update_date_22131, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200805_val update_date_22132, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200806_val update_date_22133, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200807_val update_date_22134, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200808_val update_date_22135, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200809_val update_date_22136, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200810_val update_date_22137, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200811_val update_date_22138, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200812_val update_date_22139, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200813_val update_date_22140, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200814_val update_date_22141, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200815_val update_date_22142, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200816_val update_date_22143, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200817_val update_date_22144, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200818_val update_date_22145, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200819_val update_date_22146, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200820_val update_date_22147, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200821_val update_date_22148, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200822_val update_date_22149, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200823_val update_date_22150, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200824_val update_date_22151, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200825_val update_date_22152, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200826_val update_date_22153, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200827_val update_date_22154, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200828_val update_date_22155, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200829_val update_date_22156, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200830_val update_date_22157, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200831_val update_date_22158, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200901_val update_date_22159, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200902_val update_date_22160, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200903_val update_date_22161, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200904_val update_date_22162, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200905_val update_date_22163, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200906_val update_date_22164, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200907_val update_date_22165, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200908_val update_date_22166, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200909_val update_date_22167, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200910_val update_date_22168, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200911_val update_date_22169, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200912_val update_date_22170, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200913_val update_date_22171, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200914_val update_date_22172, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200915_val update_date_22173, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200916_val update_date_22174, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200917_val update_date_22175, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200918_val update_date_22176, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200919_val update_date_22177, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200920_val update_date_22178, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200921_val update_date_22179, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200922_val update_date_22180, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200923_val update_date_22181, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200924_val update_date_22182, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200925_val update_date_22183, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200927_val update_date_22185, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200928_val update_date_22186, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200929_val update_date_22187, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520200930_val update_date_22188, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201001_val update_date_22189, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201002_val update_date_22190, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201003_val update_date_22191, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201004_val update_date_22192, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201005_val update_date_22193, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201006_val update_date_22194, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201007_val update_date_22195, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201009_val update_date_22197, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201010_val update_date_22198, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201011_val update_date_22199, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201012_val update_date_22200, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201013_val update_date_22201, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201014_val update_date_22202, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201015_val update_date_22203, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201016_val update_date_22204, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201017_val update_date_22205, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201018_val update_date_22206, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201019_val update_date_22207, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201020_val update_date_22208, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201021_val update_date_22209, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201023_val update_date_22211, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201024_val update_date_22212, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201025_val update_date_22213, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201026_val update_date_22214, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201027_val update_date_22215, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201028_val update_date_22216, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201029_val update_date_22217, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201030_val update_date_22218, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201031_val update_date_22219, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201101_val update_date_22220, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201102_val update_date_22221, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201103_val update_date_22222, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201104_val update_date_22223, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201106_val update_date_22225, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201107_val update_date_22226, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201108_val update_date_22227, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201109_val update_date_22228, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201110_val update_date_22229, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201111_val update_date_22230, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201112_val update_date_22231, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201113_val update_date_22232, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201114_val update_date_22233, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201115_val update_date_22234, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201116_val update_date_22235, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201117_val update_date_22236, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201118_val update_date_22237, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201120_val update_date_22239, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201121_val update_date_22240, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201122_val update_date_22241, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201123_val update_date_22242, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201124_val update_date_22243, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201125_val update_date_22244, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201126_val update_date_22245, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201127_val update_date_22246, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201128_val update_date_22247, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201129_val update_date_22248, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201130_val update_date_22249, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201201_val update_date_22250, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201202_val update_date_22251, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201204_val update_date_22253, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201205_val update_date_22254, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201206_val update_date_22255, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201207_val update_date_22256, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201208_val update_date_22257, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201209_val update_date_22258, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201210_val update_date_22259, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201211_val update_date_22260, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201212_val update_date_22261, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201213_val update_date_22262, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201214_val update_date_22263, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201216_val update_date_22265, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201218_val update_date_22267, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201219_val update_date_22268, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201220_val update_date_22269, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201221_val update_date_22270, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201222_val update_date_22271, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201223_val update_date_22272, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201224_val update_date_22273, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201225_val update_date_22274, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201226_val update_date_22275, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201227_val update_date_22276, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201229_val update_date_22278, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201230_val update_date_22279, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210101_val update_date_22281, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210102_val update_date_22282, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210103_val update_date_22283, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210104_val update_date_22284, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210105_val update_date_22285, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210106_val update_date_22286, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210107_val update_date_22287, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210108_val update_date_22288, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210109_val update_date_22289, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210110_val update_date_22290, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210111_val update_date_22291, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210112_val update_date_22292, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210113_val update_date_22293, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210115_val update_date_22295, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210116_val update_date_22296, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210117_val update_date_22297, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210118_val update_date_22298, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210119_val update_date_22299, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210120_val update_date_22300, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210121_val update_date_22301, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210122_val update_date_22302, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210123_val update_date_22303, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210124_val update_date_22304, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210125_val update_date_22305, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210126_val update_date_22306, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210127_val update_date_22307, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210129_val update_date_22309, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210130_val update_date_22310, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210131_val update_date_22311, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210201_val update_date_22312, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210202_val update_date_22313, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210203_val update_date_22314, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210204_val update_date_22315, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210205_val update_date_22316, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210206_val update_date_22317, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210207_val update_date_22318, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210208_val update_date_22319, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210209_val update_date_22320, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210210_val update_date_22321, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210212_val update_date_22323, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210213_val update_date_22324, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210214_val update_date_22325, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210215_val update_date_22326, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210216_val update_date_22327, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210217_val update_date_22328, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210218_val update_date_22329, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210219_val update_date_22330, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210220_val update_date_22331, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210221_val update_date_22332, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210222_val update_date_22333, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210223_val update_date_22334, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210224_val update_date_22335, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210226_val update_date_22337, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210227_val update_date_22338, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210228_val update_date_22339, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210301_val update_date_22340, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210302_val update_date_22341, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210303_val update_date_22342, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210304_val update_date_22343, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210305_val update_date_22344, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210306_val update_date_22345, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210307_val update_date_22346, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210308_val update_date_22347, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210309_val update_date_22348, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210310_val update_date_22349, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210312_val update_date_22351, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210313_val update_date_22352, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210314_val update_date_22353, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210315_val update_date_22354, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210316_val update_date_22355, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210317_val update_date_22356, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210318_val update_date_22357, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210319_val update_date_22358, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210320_val update_date_22359, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210321_val update_date_22360, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210322_val update_date_22361, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210323_val update_date_22362, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210324_val update_date_22363, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210326_val update_date_22365, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210327_val update_date_22366, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210328_val update_date_22367, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210329_val update_date_22368, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210330_val update_date_22369, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210331_val update_date_22370, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210401_val update_date_22371, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210402_val update_date_22372, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210403_val update_date_22373, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210404_val update_date_22374, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210405_val update_date_22375, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210406_val update_date_22376, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210407_val update_date_22377, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210409_val update_date_22379, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210410_val update_date_22380, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210411_val update_date_22381, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210412_val update_date_22382, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210413_val update_date_22383, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210415_val update_date_22385, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210416_val update_date_22386, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210417_val update_date_22387, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210418_val update_date_22388, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210419_val update_date_22389, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210420_val update_date_22390, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210421_val update_date_22391, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210423_val update_date_22393, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210424_val update_date_22394, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210425_val update_date_22395, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210426_val update_date_22396, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210427_val update_date_22397, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210428_val update_date_22398, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210429_val update_date_22399, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210430_val update_date_22400, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210501_val update_date_22401, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210502_val update_date_22402, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210503_val update_date_22403, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210504_val update_date_22404, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210505_val update_date_22405, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210507_val update_date_22407, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210508_val update_date_22408, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210509_val update_date_22409, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210510_val update_date_22410, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210511_val update_date_22411, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210512_val update_date_22412, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210513_val update_date_22413, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210514_val update_date_22414, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210515_val update_date_22415, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210516_val update_date_22416, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210517_val update_date_22417, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210518_val update_date_22418, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210519_val update_date_22419, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210521_val update_date_22421, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210522_val update_date_22422, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210523_val update_date_22423, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210524_val update_date_22424, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210525_val update_date_22425, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210526_val update_date_22426, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210527_val update_date_22427, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210528_val update_date_22428, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210529_val update_date_22429, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210530_val update_date_22430, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210531_val update_date_22431, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210601_val update_date_22432, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210602_val update_date_22433, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210604_val update_date_22435, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210605_val update_date_22436, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210606_val update_date_22437, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210607_val update_date_22438, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210608_val update_date_22439, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210609_val update_date_22440, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210611_val update_date_22442, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210612_val update_date_22443, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210613_val update_date_22444, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210614_val update_date_22445, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210615_val update_date_22446, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210616_val update_date_22447, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210618_val update_date_22449, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210619_val update_date_22450, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210620_val update_date_22451, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210621_val update_date_22452, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210622_val update_date_22453, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210623_val update_date_22454, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210627_val update_date_22458, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210630_val update_date_22461, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210703_val update_date_22464, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210704_val update_date_22465, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210705_val update_date_22466, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210706_val update_date_22467, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210707_val update_date_22468, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210709_val update_date_22470, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210710_val update_date_22471, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210711_val update_date_22472, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210712_val update_date_22473, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210713_val update_date_22474, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210714_val update_date_22475, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210716_val update_date_22477, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210717_val update_date_22478, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210718_val update_date_22479, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210719_val update_date_22480, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210720_val update_date_22481, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210721_val update_date_22482, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210723_val update_date_22484, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210724_val update_date_22485, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210725_val update_date_22486, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210726_val update_date_22487, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210727_val update_date_22488, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210728_val update_date_22489, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210730_val update_date_22491, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210731_val update_date_22492, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210801_val update_date_22493, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210808_val update_date_22500, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210809_val update_date_22501, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210811_val update_date_22503, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210813_val update_date_22505, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210814_val update_date_22506, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210815_val update_date_22507, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210816_val update_date_22508, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210817_val update_date_22509, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210818_val update_date_22510, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210820_val update_date_22512, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210821_val update_date_22513, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210822_val update_date_22514, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210823_val update_date_22515, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210824_val update_date_22516, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210825_val update_date_22517, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210827_val update_date_22519, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210828_val update_date_22520, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210829_val update_date_22521, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210830_val update_date_22522, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210831_val update_date_22523, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210901_val update_date_22524, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210903_val update_date_22526, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210904_val update_date_22527, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210905_val update_date_22528, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210906_val update_date_22529, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210907_val update_date_22530, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210908_val update_date_22531, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210910_val update_date_22533, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210911_val update_date_22534, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210912_val update_date_22535, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210913_val update_date_22536, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210914_val update_date_22537, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210915_val update_date_22538, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210917_val update_date_22540, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210918_val update_date_22541, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210919_val update_date_22542, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210920_val update_date_22543, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210921_val update_date_22544, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210922_val update_date_22545, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210924_val update_date_22547, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210925_val update_date_22548, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210927_val update_date_22550, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210928_val update_date_22551, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210929_val update_date_22552, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) ///  
(scatter DDSmA0520211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) ///  
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, SRIV, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "SRIV smooth" 573 "JOHN smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) ///
note("Update release dates and values denoted with circles")

qui graph save "graph 110 4 C19 daily deaths, $country, National, SRIV, Updates together With Update circles Without extremes.gph", replace
qui graph export "graph 110 4 C19 daily deaths, $country, National, SRIV, Updates together With Update circles Without extremes.pdf", replace











view "log CovidLongitudinal SRIV 5.smcl"

log close

exit, clear



