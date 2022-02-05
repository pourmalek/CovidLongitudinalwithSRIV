
clear all

cd "$pathCovidLongitudinal"

cd SRIV

capture log close 

log using "log CovidLongitudinal SRIV 6.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal SRIV 6.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* graphs, daily cases together


/*

Daily cases

Updates together, Estimates’ values (without looking at errors)



--- Order of graphs:

Level (1) Update circles: 1 Without update circles, 2 With update circles. Update circles = Update release dates (x value) and values (y value) denoted with circles. 

Level (2) Extreme values: 1 With extreme values, 2 Without extreme values. Extreme values = Updates whose values are much larger than other updates.


--- Graph numbers and contents:

110 (1-4) National

* 110 1 Daily cases, National, Updates together, Without Update circles, With extremes
* 110 2 Daily cases, National, Updates together, Without Update circles, Without extremes 
* 110 3 Daily cases, National, Updates together, With Update circles, With extremes
* 110 4 Daily cases, National, Updates together, With Update circles, Without extremes 

*/






grstyle init

grstyle color background white


use "CovidLongitudinal SRIV daily cases.dta", clear 



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

* 210 1 Daily cases, National, Updates together, Without Update circles, With extremes

twoway ///
(line DayCasMeSmA00S00XXX date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DCSmA0520200502 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200503 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200504 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200505 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200507 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200508 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200510 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200511 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200512 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200513 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200514 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200515 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200516 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200518 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200519 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200521 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200522 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200523 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200525 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200526 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200527 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200528 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200529 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200530 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200601 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200602 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200604 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200605 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200606 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200608 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200609 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200611 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200612 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200613 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200615 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200616 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200618 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200619 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200620 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200622 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200623 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200625 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200626 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200627 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200629 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200630 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200702 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200703 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200705 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200706 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200707 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200709 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200710 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200711 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200712 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200713 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200714 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200716 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200717 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200719 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200720 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200721 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200724 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200725 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200726 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200727 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200728 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200730 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200731 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200801 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200802 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200803 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200804 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200806 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200807 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200808 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200809 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200810 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200811 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200813 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200814 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200815 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200816 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200817 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200818 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200820 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200821 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200822 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200823 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200824 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200825 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200827 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200828 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200829 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200830 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200831 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200901 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200903 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200904 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200905 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200906 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200907 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200908 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200910 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200911 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200912 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200913 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200914 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200915 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200917 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200918 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200919 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200920 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200921 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200922 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200924 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200925 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200927 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200928 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200929 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210131 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210301 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210302 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210303 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210304 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210305 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210306 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210307 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210308 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210309 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210310 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210312 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210313 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210314 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210315 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210316 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210317 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210318 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210319 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210320 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210321 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210322 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210323 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210324 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210326 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210327 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210328 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210329 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210330 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210331 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210401 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210402 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210403 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210404 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210405 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210406 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210407 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210409 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210410 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210411 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210412 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210413 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210414 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210415 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210416 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210418 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210419 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210420 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210421 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210423 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210425 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210426 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210427 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210428 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210429 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210430 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210502 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210503 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210504 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210505 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210507 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210508 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210510 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210511 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210512 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210513 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210514 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210515 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210516 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210518 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210519 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210521 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210522 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210523 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210525 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210526 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210527 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210528 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210529 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210530 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210601 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210602 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210604 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210605 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210606 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210608 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210609 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210611 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210612 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210613 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210615 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210616 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210618 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210619 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210620 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210622 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210623 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210627 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210630 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210703 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210705 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210706 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210707 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210709 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210710 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210711 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210712 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210713 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210714 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210716 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210717 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210719 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210720 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210721 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210724 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210725 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210726 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210727 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210728 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210730 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210731 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210801 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210808 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210809 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210810 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210811 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210813 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210814 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210815 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210816 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210817 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210818 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210820 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210821 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210822 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210823 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210824 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210825 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210827 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210828 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210829 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210830 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210831 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210901 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210903 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210904 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210905 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210906 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210907 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210908 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210910 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210911 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210912 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210913 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210914 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210915 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210917 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210918 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210919 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210920 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210921 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210922 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210924 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210925 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210927 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210928 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210929 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211227 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases) title("COVID-19 daily cases, $country, National, SRIV, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "SRIV smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) 


qui graph save "graph 210 1 C19 daily cases, $country, National, SRIV, Updates together Without Update circles With extremes.gph", replace
qui graph export "graph 210 1 C19 daily cases, $country, National, SRIV, Updates together Without Update circles With extremes.pdf", replace






***********************************************

* 210 2 Daily cases, National, Updates together, Without Update circles, Without extremes

* extremes (much higher than other updates) = update 20210926 (> 500)

twoway ///
(line DayCasMeSmA00S00XXX date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DCSmA0520200502 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200503 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200504 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200505 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200507 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200508 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200510 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200511 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200512 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200513 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200514 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200515 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200516 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200518 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200519 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200521 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200522 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200523 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200525 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200526 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200527 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200528 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200529 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200530 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200601 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200602 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200604 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200605 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200606 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200608 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200609 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200611 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200612 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200613 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200615 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200616 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200618 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200619 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200620 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200622 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200623 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200625 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200626 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200627 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200629 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200630 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200702 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200703 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200705 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200706 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200707 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200709 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200710 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200711 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200712 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200713 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200714 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200716 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200717 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200719 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200720 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200721 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200724 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200725 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200726 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200727 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200728 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200730 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200731 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200801 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200802 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200803 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200804 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200806 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200807 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200808 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200809 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200810 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200811 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200813 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200814 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200815 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200816 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200817 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200818 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200820 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200821 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200822 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200823 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200824 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200825 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200827 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200828 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200829 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200830 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200831 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200901 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200903 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200904 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200905 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200906 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200907 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200908 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200910 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200911 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200912 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200913 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200914 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200915 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200917 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200918 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200919 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200920 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200921 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200922 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200924 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200925 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200927 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200928 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200929 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520200930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210131 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210301 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210302 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210303 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210304 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210305 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210306 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210307 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210308 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210309 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210310 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210312 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210313 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210314 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210315 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210316 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210317 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210318 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210319 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210320 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210321 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210322 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210323 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210324 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210326 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210327 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210328 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210329 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210330 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210331 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210401 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210402 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210403 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210404 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210405 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210406 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210407 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210409 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210410 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210411 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210412 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210413 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210414 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210415 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210416 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210418 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210419 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210420 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210421 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210423 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210425 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210426 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210427 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210428 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210429 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210430 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210502 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210503 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210504 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210505 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210507 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210508 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210510 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210511 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210512 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210513 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210514 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210515 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210516 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210518 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210519 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210521 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210522 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210523 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210525 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210526 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210527 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210528 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210529 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210530 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210601 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210602 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210604 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210605 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210606 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210608 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210609 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210611 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210612 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210613 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210615 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210616 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210618 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210619 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210620 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210622 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210623 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210627 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210630 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210703 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210705 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210706 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210707 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210709 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210710 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210711 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210712 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210713 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210714 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210716 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210717 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210719 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210720 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210721 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210724 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210725 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210726 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210727 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210728 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210730 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210731 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210801 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210808 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210809 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210810 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210811 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210813 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210814 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210815 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210816 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210817 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210818 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210820 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210821 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210822 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210823 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210824 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210825 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210827 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210828 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210829 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210830 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210831 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210901 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210903 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210904 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210905 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210906 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210907 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210908 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210910 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210911 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210912 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210913 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210914 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210915 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210917 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210918 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210919 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210920 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210921 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210922 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210924 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210925 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210927 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210928 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210929 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCSmA0520211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayCasMeSmA00S00XXX date, sort lcolor(cyan) lwidth(vthick)) /// "JOHN smooth"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases) title("COVID-19 daily cases, $country, National, SRIV, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "SRIV smooth" 572 "JOHN smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) 

qui graph save "graph 210 2 C19 daily cases, $country, National, SRIV, Updates together Without Update circles Without extremes.gph", replace
qui graph export "graph 210 2 C19 daily cases, $country, National, SRIV, Updates together Without Update circles Without extremes.pdf", replace












view "log CovidLongitudinal SRIV 6.smcl"

log close

exit, clear



