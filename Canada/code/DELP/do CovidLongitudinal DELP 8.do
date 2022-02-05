
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 

log using "log CovidLongitudinal DELP 8.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP 8.do"

* Project: Longitudinal assessment of C-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* graphs, daily cases, Error measures


/*

Reference = JOHN, Model = DELP

Error = Reference minus Model 

absolute Error = | Reference minus Model |

percent Error = 100 * (Reference minus Model) / Reference

absolute percent Error = 100 * | Reference minus Model | / Reference



`update' = Model update date

`XYZ' = location

Error = DayCasMeSmA00S00`XYZ' - DayCasMeSmA01S00`XYZ'`update'

absolute Error = | DayCasMeSmA00S00`XYZ' - DayCasMeSmA01S00`XYZ'`update' |

percent Error = 100 * (DayCasMeSmA00S00`XYZ' - DayCasMeSmA01S00`XYZ'`update') / DayCasMeSmA00S00`XYZ’

absolute percent Error = 100 * | DayCasMeSmA00S00`XYZ' - DayCasMeSmA01S00`XYZ’`update' | / DayCasMeSmA00S00`XYZ'



graph / `XYZ' / location

110 XXX National
111 XAB Alberta 
112 XBC British Columbia
113 XMB Manitoba
114 XNB New Brunswick
115 XNL Newfoundland & Labrador
116 XNS Nova Scotia
117 XON Ontario
118 XQC Quebec
119 219 Saskatchewan

*/



set maxvar 32767 // (MP & SE)


grstyle init

grstyle color background white







use "CovidLongitudinal DELP daily cases.dta", clear 






ssc install epiweek


* Create new variables epi_week and epi_year from calendar date

epiweek date, epiw(epi_week) epiy(epi_year)

label var epi_week "Epidemiological week"
label var epi_year "Epidemiological year"


* Create new variables - calendar date with starting Sunday from and ending Saturday to

egen epi_yrwk = concat(epi_year epi_week), p(w)

label var epi_yrwk "Epidemiological year and week"

epiweek2 epi_yrwk, s(epi_week_from) e(epi_week_to)

label var epi_week_from "Epidemiological week start date"
label var epi_week_to "Epidemiological week end date"







* 142 individual updates


local list ///
20200417 ///
20200424 ///
20200501 ///
20200509 ///
20200517 ///
20200524 ///
20200531 ///
20200607 ///
20200614 ///
20200621 ///
20200628 ///
20200704 ///
20200718 ///
20200723 ///
20200926 ///
20201008 ///
20201022 ///
20201105 ///
20201119 ///
20201203 ///
20201217 ///
20201231 ///
20210114 ///
20210128 ///
20210211 ///
20210225 ///
20210311 ///
20210325 ///
20210408 ///
20210422 ///
20210506 ///
20210520 ///
20210603 ///
20210610 ///
20210617 ///
20210624 ///
20210701 ///
20210708 ///
20210715 ///
20210722 ///
20210729 ///
20210805 ///
20210812 ///
20210819 ///
20210826 ///
20210902 ///
20210909 ///
20210916 ///
20210923 ///
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
20211125 ///
20211126 ///
20211127 ///
20211128 ///
20211129 ///
20211130 ///
20211201 ///
20211202 ///
20211203 ///
20211204 ///
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
20211220 ///
20211221 ///
20211222 ///
20211223 ///
20211224 ///
20211225 ///
20211226 ///
20211227 ///
20211228 ///
20211229 ///
20211230 ///
20211231




* (1) gen error TYPES by epi weeks and model updates

foreach update of local list {

	qui {

		foreach XYZ in XAB XBC XMB XXX XNB XNL XNS XON XQC XSK {

gen DCErrorA01`XYZ'`update' = DayCasMeSmA00S00`XYZ' - DayCasMeSmA01S00`XYZ'`update'
label var DCErrorA01`XYZ'`update' "DayCasMeSmA01S00`XYZ'`update' error"

gen DCAbsErrA01`XYZ'`update' = abs(DayCasMeSmA00S00`XYZ' - DayCasMeSmA01S00`XYZ'`update')
label var DCAbsErrA01`XYZ'`update' "DayCasMeSmA01S00`XYZ'`update' absolute error"

gen DCPerErrA01`XYZ'`update' = (100 * (DayCasMeSmA00S00`XYZ' - DayCasMeSmA01S00`XYZ'`update')) / DayCasMeSmA00S00`XYZ'
label var DCPerErrA01`XYZ'`update' "DayCasMeSmA01S00`XYZ'`update' percent error"

gen DCAbPeErA01`XYZ'`update' = (100 * abs(DayCasMeSmA00S00`XYZ' - DayCasMeSmA01S00`XYZ'`update')) / DayCasMeSmA00S00`XYZ'
label var DCAbPeErA01`XYZ'`update' "DayCasMeSmA01S00`XYZ'`update' absolute percent error" 

		}

	}

}
*




* (2) gen MEDIAN of error types by epi weeks and updates = _Med1

* Wait note: wait ...

foreach update of local list {

	qui {

		foreach XYZ in XAB XBC XMB XXX XNB XNL XNS XON XQC XSK {
		
bysort epi_yrwk : egen DCErrorA01`XYZ'`update'_Med1 = median(DCErrorA01`XYZ'`update')
label var DCErrorA01`XYZ'`update'_Med1 "DayCasMeSmA01S00`XYZ'`update' median error by epi weeks and updates"

bysort epi_yrwk : egen DCAbsErrA01`XYZ'`update'_Med1 = median(DCAbsErrA01`XYZ'`update')
label var DCAbsErrA01`XYZ'`update'_Med1 "DayCasMeSmA01S00`XYZ'`update' median absolute error by epi weeks and updates"

bysort epi_yrwk : egen DCPerErrA01`XYZ'`update'_Med1 = median(DCPerErrA01`XYZ'`update')
label var DCPerErrA01`XYZ'`update'_Med1 "DayCasMeSmA01S00`XYZ'`update' median percent error by epi weeks and updates"

bysort epi_yrwk : egen DCAbPeErA01`XYZ'`update'_Med1 = median(DCAbPeErA01`XYZ'`update')
label var DCAbPeErA01`XYZ'`update'_Med1 "DayCasMeSmA01S00`XYZ'`update' median absolute percent error by epi weeks and updates" 

		}

	}

}
*


 

 
 
* (3) gen AVERAGE over updates of MEDIAN of error types by epi weeks = _Mean1

* Wait note: wait ...

order *, alphabetic

qui { 

		foreach XYZ in XAB XBC XMB XXX XNB XNL XNS XON XQC XSK {
		
egen DCErrorA01`XYZ'_Mean1 = rowmean(DCErrorA01`XYZ'20200417_Med1-DCErrorA01`XYZ'20211231_Med1) 
label var DCErrorA01`XYZ'_Mean1 "DayCasMeSmA01S00`XYZ' mean over updates of median error by epi weeks"

egen DCAbsErrA01`XYZ'_Mean1 = rowmean(DCAbsErrA01`XYZ'20200417_Med1-DCAbsErrA01`XYZ'20211231_Med1) 
label var DCAbsErrA01`XYZ'_Mean1 "DayCasMeSmA01S00`XYZ' mean over updates of median absolute error by epi weeks"

egen DCPerErrA01`XYZ'_Mean1 = rowmean(DCPerErrA01`XYZ'20200417_Med1-DCPerErrA01`XYZ'20211231_Med1) 
label var DCPerErrA01`XYZ'_Mean1 "DayCasMeSmA01S00`XYZ' mean over updates of median percent error by epi weeks"

egen DCAbPeErA01`XYZ'_Mean1 = rowmean(DCAbPeErA01`XYZ'20200417_Med1-DCAbPeErA01`XYZ'20211231_Med1) 
label var DCAbPeErA01`XYZ'_Mean1 "DayCasMeSmA01S00`XYZ' mean over updates of median absolute percent error by epi weeks"

	}

}
* 
 
 
 
 
 




* (4) gen AVERAGE over epi weeks of _Mean1  = _Mean2

* Wait note: wait ...

qui { 

	foreach XYZ in XAB XBC XMB XXX XNB XNL XNS XON XQC XSK {
		
egen DCErrorA01`XYZ'_Mean2 = mean(DCErrorA01`XYZ'_Mean1) // get mean for all epi weeks of _Mean1
label var DCErrorA01`XYZ'_Mean2 "DayCasMeSmA01S00`XYZ' Mean over epi weeks of median error over updates"

egen DCAbsErrA01`XYZ'_Mean2 = mean(DCAbsErrA01`XYZ'_Mean1) // get mean for all epi weeks of _Mean1
label var DCAbsErrA01`XYZ'_Mean2 "DayCasMeSmA01S00`XYZ' Mean over epi weeks of median absolute error over updates"

egen DCPerErrA01`XYZ'_Mean2 = mean(DCPerErrA01`XYZ'_Mean1) // get mean for all epi weeks of _Mean1
label var DCPerErrA01`XYZ'_Mean2 "DayCasMeSmA01S00`XYZ' Mean over epi weeks of median Pecent error over updates"

egen DCAbPeErA01`XYZ'_Mean2 = mean(DCAbPeErA01`XYZ'_Mean1) // get mean for all epi weeks of _Mean1
label var DCAbPeErA01`XYZ'_Mean2 "DayCasMeSmA01S00`XYZ' Mean over epi weeks of median absolute percent error over updates"

	}

}
*











*****************

** graphs





* National

***********************************************

* 210 5 Daily cases, National, Error

twoway ///
(line DCErrorA01XXX20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 210 5 C19 daily cases, $country, National, DELP, Error.gph", replace
qui graph export "graph 210 5 C19 daily cases, $country, National, DELP, Error.pdf", replace





***********************************************

* 210 6 Daily cases, National, absolute Error

twoway ///
(line DCAbsErrA01XXX20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 210 6 C19 daily cases, $country, National, DELP, absolute Error.gph", replace
qui graph export "graph 210 6 C19 daily cases, $country, National, DELP, absolute Error.pdf", replace








***********************************************

* 210 7 Daily cases, National, percent Error

twoway ///
(line DCPerErrA01XXX20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases percent error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP" /// 
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 210 7 C19 daily cases, $country, National, DELP, percent Error.gph", replace
qui graph export "graph 210 7 C19 daily cases, $country, National, DELP, percent Error.pdf", replace





***********************************************

* 210 8 Daily cases, National, absolute percent Error

twoway ///
(line DCAbPeErA01XXX20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute % error by epi weeks & model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 210 8 C19 daily cases, $country, National, DELP, absolute percent Error.gph", replace
qui graph export "graph 210 8 C19 daily cases, $country, National, DELP, absolute percent Error.pdf", replace







***********************************************

* 210 5 1 Daily cases, National, median error by epi weeks and updates

twoway ///
(line DCErrorA01XXX20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XXX20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 210 5 1 C19 daily cases, $country, National, DELP, Error median1.gph", replace
qui graph export "graph 210 5 1 C19 daily cases, $country, National, DELP, Error median1.pdf", replace






***********************************************

* 210 5 2 Daily cases, National, AVERAGE over updates of median error by epi weeks

twoway ///
(line DCErrorA01XXX_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small))  

qui graph save "graph 210 5 2 C19 daily cases, $country, National, DELP, Error Mean1.gph", replace
qui graph export "graph 210 5 2 C19 daily cases, $country, National, DELP, Error Mean1.pdf", replace








***********************************************

* 210 6 1 Daily cases, National, median absolute error by epi weeks and updates

twoway ///
(line DCAbsErrA01XXX20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XXX20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP" , size(small)) 

qui graph save "graph 210 6 1 C19 daily cases, $country, National, DELP, absolute Error median1.gph", replace
qui graph export "graph 210 6 1 C19 daily cases, $country, National, DELP, absolute Error median1.pdf", replace






***********************************************

* 210 6 2 Daily cases, National, mean over updates of median absolute error by epi weeks

twoway ///
(line DCAbsErrA01XXX_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 210 6 2 C19 daily cases, $country, National, DELP, Error Mean1.gph", replace
qui graph export "graph 210 6 2 C19 daily cases, $country, National, DELP, Error Mean1.pdf", replace









***********************************************

* 210 7 1 Daily cases, National, median % error by epi weeks and updates

twoway ///
(line DCPerErrA01XXX20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XXX20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 210 7 1 C19 daily cases, $country, National, DELP, percent Error median1.gph", replace
qui graph export "graph 210 7 1 C19 daily cases, $country, National, DELP, percent Error median1.pdf", replace






***********************************************

* 210 7 2 Daily cases, National, mean over updates of median percent error by epi weeks

twoway ///
(line DCPerErrA01XXX_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 210 7 2 C19 daily cases, $country, National, DELP, Error Mean1.gph", replace
qui graph export "graph 210 7 2 C19 daily cases, $country, National, DELP, Error Mean1.pdf", replace







***********************************************

* 210 8 1 Daily cases, National, median absolute % error by epi weeks and updates

twoway ///
(line DCAbPeErA01XXX20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XXX20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 210 8 1 C19 daily cases, $country, National, DELP, absolute percent Error median1.gph", replace
qui graph export "graph 210 8 1 C19 daily cases, $country, National, DELP, absolute percent Error median1.pdf", replace






***********************************************


* 210 8 2 Daily cases, National, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DCAbPeErA01XXX_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute % error by epiweeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 210 8 2 C19 daily cases, $country, National, DELP, Error Mean1.gph", replace
qui graph export "graph 210 8 2 C19 daily cases, $country, National, DELP, Error Mean1.pdf", replace














* Alberta

***********************************************

* 211 5 Daily cases, Alberta, Error

twoway ///
(line DCErrorA01XAB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 211 5 C19 daily cases, $country, Alberta, DELP, Error.gph", replace
qui graph export "graph 211 5 C19 daily cases, $country, Alberta, DELP, Error.pdf", replace





***********************************************

* 211 6 Daily cases, Alberta, absolute Error

twoway ///
(line DCAbsErrA01XAB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 211 6 C19 daily cases, $country, Alberta, DELP, absolute Error.gph", replace
qui graph export "graph 211 6 C19 daily cases, $country, Alberta, DELP, absolute Error.pdf", replace








***********************************************

* 211 7 Daily cases, Alberta, percent Error

twoway ///
(line DCPerErrA01XAB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases percent error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP" /// 
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 211 7 C19 daily cases, $country, Alberta, DELP, percent Error.gph", replace
qui graph export "graph 211 7 C19 daily cases, $country, Alberta, DELP, percent Error.pdf", replace





***********************************************

* 211 8 Daily cases, Alberta, absolute percent Error

twoway ///
(line DCAbPeErA01XAB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute % error by epi weeks & model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 211 8 C19 daily cases, $country, Alberta, DELP, absolute percent Error.gph", replace
qui graph export "graph 211 8 C19 daily cases, $country, Alberta, DELP, absolute percent Error.pdf", replace







***********************************************

* 211 5 1 Daily cases, Alberta, median error by epi weeks and updates

twoway ///
(line DCErrorA01XAB20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XAB20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 211 5 1 C19 daily cases, $country, Alberta, DELP, Error median1.gph", replace
qui graph export "graph 211 5 1 C19 daily cases, $country, Alberta, DELP, Error median1.pdf", replace






***********************************************

* 211 5 2 Daily cases, Alberta, AVERAGE over updates of median error by epi weeks

twoway ///
(line DCErrorA01XAB_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small))  

qui graph save "graph 211 5 2 C19 daily cases, $country, Alberta, DELP, Error Mean1.gph", replace
qui graph export "graph 211 5 2 C19 daily cases, $country, Alberta, DELP, Error Mean1.pdf", replace








***********************************************

* 211 6 1 Daily cases, Alberta, median absolute error by epi weeks and updates

twoway ///
(line DCAbsErrA01XAB20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XAB20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP" , size(small)) 

qui graph save "graph 211 6 1 C19 daily cases, $country, Alberta, DELP, absolute Error median1.gph", replace
qui graph export "graph 211 6 1 C19 daily cases, $country, Alberta, DELP, absolute Error median1.pdf", replace






***********************************************

* 211 6 2 Daily cases, Alberta, mean over updates of median absolute error by epi weeks

twoway ///
(line DCAbsErrA01XAB_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 211 6 2 C19 daily cases, $country, Alberta, DELP, Error Mean1.gph", replace
qui graph export "graph 211 6 2 C19 daily cases, $country, Alberta, DELP, Error Mean1.pdf", replace









***********************************************

* 211 7 1 Daily cases, Alberta, median % error by epi weeks and updates

twoway ///
(line DCPerErrA01XAB20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XAB20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 211 7 1 C19 daily cases, $country, Alberta, DELP, percent Error median1.gph", replace
qui graph export "graph 211 7 1 C19 daily cases, $country, Alberta, DELP, percent Error median1.pdf", replace






***********************************************

* 211 7 2 Daily cases, Alberta, mean over updates of median percent error by epi weeks

twoway ///
(line DCPerErrA01XAB_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 211 7 2 C19 daily cases, $country, Alberta, DELP, Error Mean1.gph", replace
qui graph export "graph 211 7 2 C19 daily cases, $country, Alberta, DELP, Error Mean1.pdf", replace







***********************************************

* 211 8 1 Daily cases, Alberta, median absolute % error by epi weeks and updates

twoway ///
(line DCAbPeErA01XAB20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XAB20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 211 8 1 C19 daily cases, $country, Alberta, DELP, absolute percent Error median1.gph", replace
qui graph export "graph 211 8 1 C19 daily cases, $country, Alberta, DELP, absolute percent Error median1.pdf", replace






***********************************************


* 211 8 2 Daily cases, Alberta, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DCAbPeErA01XAB_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute % error by epiweeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 211 8 2 C19 daily cases, $country, Alberta, DELP, Error Mean1.gph", replace
qui graph export "graph 211 8 2 C19 daily cases, $country, Alberta, DELP, Error Mean1.pdf", replace














* British Columbia

***********************************************

* 212 5 Daily cases, British Columbia, Error

twoway ///
(line DCErrorA01XBC20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 212 5 C19 daily cases, $country, British Columbia, DELP, Error.gph", replace
qui graph export "graph 212 5 C19 daily cases, $country, British Columbia, DELP, Error.pdf", replace





***********************************************

* 212 6 Daily cases, British Columbia, absolute Error

twoway ///
(line DCAbsErrA01XBC20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 212 6 C19 daily cases, $country, British Columbia, DELP, absolute Error.gph", replace
qui graph export "graph 212 6 C19 daily cases, $country, British Columbia, DELP, absolute Error.pdf", replace








***********************************************

* 212 7 Daily cases, British Columbia, percent Error

twoway ///
(line DCPerErrA01XBC20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases percent error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP" /// 
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 212 7 C19 daily cases, $country, British Columbia, DELP, percent Error.gph", replace
qui graph export "graph 212 7 C19 daily cases, $country, British Columbia, DELP, percent Error.pdf", replace





***********************************************

* 212 8 Daily cases, British Columbia, absolute percent Error

twoway ///
(line DCAbPeErA01XBC20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute % error by epi weeks & model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 212 8 C19 daily cases, $country, British Columbia, DELP, absolute percent Error.gph", replace
qui graph export "graph 212 8 C19 daily cases, $country, British Columbia, DELP, absolute percent Error.pdf", replace







***********************************************

* 212 5 1 Daily cases, British Columbia, median error by epi weeks and updates

twoway ///
(line DCErrorA01XBC20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XBC20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 212 5 1 C19 daily cases, $country, British Columbia, DELP, Error median1.gph", replace
qui graph export "graph 212 5 1 C19 daily cases, $country, British Columbia, DELP, Error median1.pdf", replace






***********************************************

* 212 5 2 Daily cases, British Columbia, AVERAGE over updates of median error by epi weeks

twoway ///
(line DCErrorA01XBC_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small))  

qui graph save "graph 212 5 2 C19 daily cases, $country, British Columbia, DELP, Error Mean1.gph", replace
qui graph export "graph 212 5 2 C19 daily cases, $country, British Columbia, DELP, Error Mean1.pdf", replace








***********************************************

* 212 6 1 Daily cases, British Columbia, median absolute error by epi weeks and updates

twoway ///
(line DCAbsErrA01XBC20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XBC20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP" , size(small)) 

qui graph save "graph 212 6 1 C19 daily cases, $country, British Columbia, DELP, absolute Error median1.gph", replace
qui graph export "graph 212 6 1 C19 daily cases, $country, British Columbia, DELP, absolute Error median1.pdf", replace






***********************************************

* 212 6 2 Daily cases, British Columbia, mean over updates of median absolute error by epi weeks

twoway ///
(line DCAbsErrA01XBC_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 212 6 2 C19 daily cases, $country, British Columbia, DELP, Error Mean1.gph", replace
qui graph export "graph 212 6 2 C19 daily cases, $country, British Columbia, DELP, Error Mean1.pdf", replace









***********************************************

* 212 7 1 Daily cases, British Columbia, median % error by epi weeks and updates

twoway ///
(line DCPerErrA01XBC20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XBC20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 212 7 1 C19 daily cases, $country, British Columbia, DELP, percent Error median1.gph", replace
qui graph export "graph 212 7 1 C19 daily cases, $country, British Columbia, DELP, percent Error median1.pdf", replace






***********************************************

* 212 7 2 Daily cases, British Columbia, mean over updates of median percent error by epi weeks

twoway ///
(line DCPerErrA01XBC_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 212 7 2 C19 daily cases, $country, British Columbia, DELP, Error Mean1.gph", replace
qui graph export "graph 212 7 2 C19 daily cases, $country, British Columbia, DELP, Error Mean1.pdf", replace







***********************************************

* 212 8 1 Daily cases, British Columbia, median absolute % error by epi weeks and updates

twoway ///
(line DCAbPeErA01XBC20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XBC20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 212 8 1 C19 daily cases, $country, British Columbia, DELP, absolute percent Error median1.gph", replace
qui graph export "graph 212 8 1 C19 daily cases, $country, British Columbia, DELP, absolute percent Error median1.pdf", replace






***********************************************


* 212 8 2 Daily cases, British Columbia, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DCAbPeErA01XBC_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute % error by epiweeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 212 8 2 C19 daily cases, $country, British Columbia, DELP, Error Mean1.gph", replace
qui graph export "graph 212 8 2 C19 daily cases, $country, British Columbia, DELP, Error Mean1.pdf", replace















* Manitoba

***********************************************

* 213 5 Daily cases, Manitoba, Error

twoway ///
(line DCErrorA01XMB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 213 5 C19 daily cases, $country, Manitoba, DELP, Error.gph", replace
qui graph export "graph 213 5 C19 daily cases, $country, Manitoba, DELP, Error.pdf", replace





***********************************************

* 213 6 Daily cases, Manitoba, absolute Error

twoway ///
(line DCAbsErrA01XMB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 213 6 C19 daily cases, $country, Manitoba, DELP, absolute Error.gph", replace
qui graph export "graph 213 6 C19 daily cases, $country, Manitoba, DELP, absolute Error.pdf", replace








***********************************************

* 213 7 Daily cases, Manitoba, percent Error

twoway ///
(line DCPerErrA01XMB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases percent error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP" /// 
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 213 7 C19 daily cases, $country, Manitoba, DELP, percent Error.gph", replace
qui graph export "graph 213 7 C19 daily cases, $country, Manitoba, DELP, percent Error.pdf", replace





***********************************************

* 213 8 Daily cases, Manitoba, absolute percent Error

twoway ///
(line DCAbPeErA01XMB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute % error by epi weeks & model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 213 8 C19 daily cases, $country, Manitoba, DELP, absolute percent Error.gph", replace
qui graph export "graph 213 8 C19 daily cases, $country, Manitoba, DELP, absolute percent Error.pdf", replace







***********************************************

* 213 5 1 Daily cases, Manitoba, median error by epi weeks and updates

twoway ///
(line DCErrorA01XMB20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XMB20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 213 5 1 C19 daily cases, $country, Manitoba, DELP, Error median1.gph", replace
qui graph export "graph 213 5 1 C19 daily cases, $country, Manitoba, DELP, Error median1.pdf", replace






***********************************************

* 213 5 2 Daily cases, Manitoba, AVERAGE over updates of median error by epi weeks

twoway ///
(line DCErrorA01XMB_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small))  

qui graph save "graph 213 5 2 C19 daily cases, $country, Manitoba, DELP, Error Mean1.gph", replace
qui graph export "graph 213 5 2 C19 daily cases, $country, Manitoba, DELP, Error Mean1.pdf", replace








***********************************************

* 213 6 1 Daily cases, Manitoba, median absolute error by epi weeks and updates

twoway ///
(line DCAbsErrA01XMB20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XMB20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP" , size(small)) 

qui graph save "graph 213 6 1 C19 daily cases, $country, Manitoba, DELP, absolute Error median1.gph", replace
qui graph export "graph 213 6 1 C19 daily cases, $country, Manitoba, DELP, absolute Error median1.pdf", replace






***********************************************

* 213 6 2 Daily cases, Manitoba, mean over updates of median absolute error by epi weeks

twoway ///
(line DCAbsErrA01XMB_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 213 6 2 C19 daily cases, $country, Manitoba, DELP, Error Mean1.gph", replace
qui graph export "graph 213 6 2 C19 daily cases, $country, Manitoba, DELP, Error Mean1.pdf", replace









***********************************************

* 213 7 1 Daily cases, Manitoba, median % error by epi weeks and updates

twoway ///
(line DCPerErrA01XMB20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XMB20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 213 7 1 C19 daily cases, $country, Manitoba, DELP, percent Error median1.gph", replace
qui graph export "graph 213 7 1 C19 daily cases, $country, Manitoba, DELP, percent Error median1.pdf", replace






***********************************************

* 213 7 2 Daily cases, Manitoba, mean over updates of median percent error by epi weeks

twoway ///
(line DCPerErrA01XMB_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 213 7 2 C19 daily cases, $country, Manitoba, DELP, Error Mean1.gph", replace
qui graph export "graph 213 7 2 C19 daily cases, $country, Manitoba, DELP, Error Mean1.pdf", replace







***********************************************

* 213 8 1 Daily cases, Manitoba, median absolute % error by epi weeks and updates

twoway ///
(line DCAbPeErA01XMB20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XMB20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 213 8 1 C19 daily cases, $country, Manitoba, DELP, absolute percent Error median1.gph", replace
qui graph export "graph 213 8 1 C19 daily cases, $country, Manitoba, DELP, absolute percent Error median1.pdf", replace






***********************************************


* 213 8 2 Daily cases, Manitoba, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DCAbPeErA01XMB_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute % error by epiweeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 213 8 2 C19 daily cases, $country, Manitoba, DELP, Error Mean1.gph", replace
qui graph export "graph 213 8 2 C19 daily cases, $country, Manitoba, DELP, Error Mean1.pdf", replace















* New Brunswick

***********************************************

* 214 5 Daily cases, New Brunswick, Error

twoway ///
(line DCErrorA01XNB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 214 5 C19 daily cases, $country, New Brunswick, DELP, Error.gph", replace
qui graph export "graph 214 5 C19 daily cases, $country, New Brunswick, DELP, Error.pdf", replace





***********************************************

* 214 6 Daily cases, New Brunswick, absolute Error

twoway ///
(line DCAbsErrA01XNB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 214 6 C19 daily cases, $country, New Brunswick, DELP, absolute Error.gph", replace
qui graph export "graph 214 6 C19 daily cases, $country, New Brunswick, DELP, absolute Error.pdf", replace








***********************************************

* 214 7 Daily cases, New Brunswick, percent Error

twoway ///
(line DCPerErrA01XNB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases percent error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP" /// 
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 214 7 C19 daily cases, $country, New Brunswick, DELP, percent Error.gph", replace
qui graph export "graph 213 7 C19 daily cases, $country, New Brunswick, DELP, percent Error.pdf", replace





***********************************************

* 214 8 Daily cases, New Brunswick, absolute percent Error

twoway ///
(line DCAbPeErA01XNB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute % error by epi weeks & model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 214 8 C19 daily cases, $country, New Brunswick, DELP, absolute percent Error.gph", replace
qui graph export "graph 214 8 C19 daily cases, $country, New Brunswick, DELP, absolute percent Error.pdf", replace







***********************************************

* 214 5 1 Daily cases, New Brunswick, median error by epi weeks and updates

twoway ///
(line DCErrorA01XNB20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNB20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 214 5 1 C19 daily cases, $country, New Brunswick, DELP, Error median1.gph", replace
qui graph export "graph 214 5 1 C19 daily cases, $country, New Brunswick, DELP, Error median1.pdf", replace






***********************************************

* 214 5 2 Daily cases, New Brunswick, AVERAGE over updates of median error by epi weeks

twoway ///
(line DCErrorA01XNB_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small))  

qui graph save "graph 214 5 2 C19 daily cases, $country, New Brunswick, DELP, Error Mean1.gph", replace
qui graph export "graph 214 5 2 C19 daily cases, $country, New Brunswick, DELP, Error Mean1.pdf", replace








***********************************************

* 214 6 1 Daily cases, New Brunswick, median absolute error by epi weeks and updates

twoway ///
(line DCAbsErrA01XNB20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNB20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP" , size(small)) 

qui graph save "graph 214 6 1 C19 daily cases, $country, New Brunswick, DELP, absolute Error median1.gph", replace
qui graph export "graph 214 6 1 C19 daily cases, $country, New Brunswick, DELP, absolute Error median1.pdf", replace






***********************************************

* 214 6 2 Daily cases, New Brunswick, mean over updates of median absolute error by epi weeks

twoway ///
(line DCAbsErrA01XNB_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 214 6 2 C19 daily cases, $country, New Brunswick, DELP, Error Mean1.gph", replace
qui graph export "graph 214 6 2 C19 daily cases, $country, New Brunswick, DELP, Error Mean1.pdf", replace









***********************************************

* 214 7 1 Daily cases, New Brunswick, median % error by epi weeks and updates

twoway ///
(line DCPerErrA01XNB20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNB20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 214 7 1 C19 daily cases, $country, New Brunswick, DELP, percent Error median1.gph", replace
qui graph export "graph 214 7 1 C19 daily cases, $country, New Brunswick, DELP, percent Error median1.pdf", replace






***********************************************

* 214 7 2 Daily cases, New Brunswick, mean over updates of median percent error by epi weeks

twoway ///
(line DCPerErrA01XNB_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 214 7 2 C19 daily cases, $country, New Brunswick, DELP, Error Mean1.gph", replace
qui graph export "graph 214 7 2 C19 daily cases, $country, New Brunswick, DELP, Error Mean1.pdf", replace







***********************************************

* 214 8 1 Daily cases, New Brunswick, median absolute % error by epi weeks and updates

twoway ///
(line DCAbPeErA01XNB20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNB20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 214 8 1 C19 daily cases, $country, New Brunswick, DELP, absolute percent Error median1.gph", replace
qui graph export "graph 214 8 1 C19 daily cases, $country, New Brunswick, DELP, absolute percent Error median1.pdf", replace






***********************************************


* 214 8 2 Daily cases, New Brunswick, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DCAbPeErA01XNB_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute % error by epiweeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 214 8 2 C19 daily cases, $country, New Brunswick, DELP, Error Mean1.gph", replace
qui graph export "graph 214 8 2 C19 daily cases, $country, New Brunswick, DELP, Error Mean1.pdf", replace





















* Newfoundland & Labrador

***********************************************

* 215 5 Daily cases, Newfoundland & Labrador, Error

twoway ///
(line DCErrorA01XNL20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 215 5 C19 daily cases, $country, Newfoundland & Labrador, DELP, Error.gph", replace
qui graph export "graph 215 5 C19 daily cases, $country, Newfoundland & Labrador, DELP, Error.pdf", replace





***********************************************

* 215 6 Daily cases, Newfoundland & Labrador, absolute Error

twoway ///
(line DCAbsErrA01XNL20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 215 6 C19 daily cases, $country, Newfoundland & Labrador, DELP, absolute Error.gph", replace
qui graph export "graph 215 6 C19 daily cases, $country, Newfoundland & Labrador, DELP, absolute Error.pdf", replace








***********************************************

* 215 7 Daily cases, Newfoundland & Labrador, percent Error

twoway ///
(line DCPerErrA01XNL20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases percent error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP" /// 
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 215 7 C19 daily cases, $country, Newfoundland & Labrador, DELP, percent Error.gph", replace
qui graph export "graph 215 7 C19 daily cases, $country, Newfoundland & Labrador, DELP, percent Error.pdf", replace





***********************************************

* 215 8 Daily cases, Newfoundland & Labrador, absolute percent Error

twoway ///
(line DCAbPeErA01XNL20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute % error by epi weeks & model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 215 8 C19 daily cases, $country, Newfoundland & Labrador, DELP, absolute percent Error.gph", replace
qui graph export "graph 215 8 C19 daily cases, $country, Newfoundland & Labrador, DELP, absolute percent Error.pdf", replace







***********************************************

* 215 5 1 Daily cases, Newfoundland & Labrador, median error by epi weeks and updates

twoway ///
(line DCErrorA01XNL20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNL20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 215 5 1 C19 daily cases, $country, Newfoundland & Labrador, DELP, Error median1.gph", replace
qui graph export "graph 215 5 1 C19 daily cases, $country, Newfoundland & Labrador, DELP, Error median1.pdf", replace






***********************************************

* 215 5 2 Daily cases, Newfoundland & Labrador, AVERAGE over updates of median error by epi weeks

twoway ///
(line DCErrorA01XNL_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small))  

qui graph save "graph 215 5 2 C19 daily cases, $country, Newfoundland & Labrador, DELP, Error Mean1.gph", replace
qui graph export "graph 215 5 2 C19 daily cases, $country, Newfoundland & Labrador, DELP, Error Mean1.pdf", replace








***********************************************

* 215 6 1 Daily cases, Newfoundland & Labrador, median absolute error by epi weeks and updates

twoway ///
(line DCAbsErrA01XNL20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNL20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP" , size(small)) 

qui graph save "graph 215 6 1 C19 daily cases, $country, Newfoundland & Labrador, DELP, absolute Error median1.gph", replace
qui graph export "graph 215 6 1 C19 daily cases, $country, Newfoundland & Labrador, DELP, absolute Error median1.pdf", replace






***********************************************

* 215 6 2 Daily cases, Newfoundland & Labrador, mean over updates of median absolute error by epi weeks

twoway ///
(line DCAbsErrA01XNL_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 215 6 2 C19 daily cases, $country, Newfoundland & Labrador, DELP, Error Mean1.gph", replace
qui graph export "graph 215 6 2 C19 daily cases, $country, Newfoundland & Labrador, DELP, Error Mean1.pdf", replace









***********************************************

* 215 7 1 Daily cases, Newfoundland & Labrador, median % error by epi weeks and updates

twoway ///
(line DCPerErrA01XNL20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNL20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 215 7 1 C19 daily cases, $country, Newfoundland & Labrador, DELP, percent Error median1.gph", replace
qui graph export "graph 215 7 1 C19 daily cases, $country, Newfoundland & Labrador, DELP, percent Error median1.pdf", replace






***********************************************

* 215 7 2 Daily cases, Newfoundland & Labrador, mean over updates of median percent error by epi weeks

twoway ///
(line DCPerErrA01XNL_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 215 7 2 C19 daily cases, $country, Newfoundland & Labrador, DELP, Error Mean1.gph", replace
qui graph export "graph 215 7 2 C19 daily cases, $country, Newfoundland & Labrador, DELP, Error Mean1.pdf", replace







***********************************************

* 215 8 1 Daily cases, Newfoundland & Labrador, median absolute % error by epi weeks and updates

twoway ///
(line DCAbPeErA01XNL20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNL20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 215 8 1 C19 daily cases, $country, Newfoundland & Labrador, DELP, absolute percent Error median1.gph", replace
qui graph export "graph 215 8 1 C19 daily cases, $country, Newfoundland & Labrador, DELP, absolute percent Error median1.pdf", replace






***********************************************


* 215 8 2 Daily cases, Newfoundland & Labrador, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DCAbPeErA01XNL_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute % error by epiweeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 215 8 2 C19 daily cases, $country, Newfoundland & Labrador, DELP, Error Mean1.gph", replace
qui graph export "graph 215 8 2 C19 daily cases, $country, Newfoundland & Labrador, DELP, Error Mean1.pdf", replace

















* Nova Scotia

***********************************************

* 216 5 Daily cases, Nova Scotia, Error

twoway ///
(line DCErrorA01XNS20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 216 5 C19 daily cases, $country, Nova Scotia, DELP, Error.gph", replace
qui graph export "graph 216 5 C19 daily cases, $country, Nova Scotia, DELP, Error.pdf", replace





***********************************************

* 216 6 Daily cases, Nova Scotia, absolute Error

twoway ///
(line DCAbsErrA01XNS20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 216 6 C19 daily cases, $country, Nova Scotia, DELP, absolute Error.gph", replace
qui graph export "graph 216 6 C19 daily cases, $country, Nova Scotia, DELP, absolute Error.pdf", replace








***********************************************

* 216 7 Daily cases, Nova Scotia, percent Error

twoway ///
(line DCPerErrA01XNS20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases percent error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP" /// 
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 216 7 C19 daily cases, $country, Nova Scotia, DELP, percent Error.gph", replace
qui graph export "graph 216 7 C19 daily cases, $country, Nova Scotia, DELP, percent Error.pdf", replace





***********************************************

* 216 8 Daily cases, Nova Scotia, absolute percent Error

twoway ///
(line DCAbPeErA01XNS20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute % error by epi weeks & model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 216 8 C19 daily cases, $country, Nova Scotia, DELP, absolute percent Error.gph", replace
qui graph export "graph 216 8 C19 daily cases, $country, Nova Scotia, DELP, absolute percent Error.pdf", replace







***********************************************

* 216 5 1 Daily cases, Nova Scotia, median error by epi weeks and updates

twoway ///
(line DCErrorA01XNS20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XNS20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 216 5 1 C19 daily cases, $country, Nova Scotia, DELP, Error median1.gph", replace
qui graph export "graph 216 5 1 C19 daily cases, $country, Nova Scotia, DELP, Error median1.pdf", replace






***********************************************

* 216 5 2 Daily cases, Nova Scotia, AVERAGE over updates of median error by epi weeks

twoway ///
(line DCErrorA01XNS_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small))  

qui graph save "graph 216 5 2 C19 daily cases, $country, Nova Scotia, DELP, Error Mean1.gph", replace
qui graph export "graph 216 5 2 C19 daily cases, $country, Nova Scotia, DELP, Error Mean1.pdf", replace








***********************************************

* 216 6 1 Daily cases, Nova Scotia, median absolute error by epi weeks and updates

twoway ///
(line DCAbsErrA01XNS20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XNS20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP" , size(small)) 

qui graph save "graph 216 6 1 C19 daily cases, $country, Nova Scotia, DELP, absolute Error median1.gph", replace
qui graph export "graph 216 6 1 C19 daily cases, $country, Nova Scotia, DELP, absolute Error median1.pdf", replace






***********************************************

* 216 6 2 Daily cases, Nova Scotia, mean over updates of median absolute error by epi weeks

twoway ///
(line DCAbsErrA01XNS_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 216 6 2 C19 daily cases, $country, Nova Scotia, DELP, Error Mean1.gph", replace
qui graph export "graph 216 6 2 C19 daily cases, $country, Nova Scotia, DELP, Error Mean1.pdf", replace









***********************************************

* 216 7 1 Daily cases, Nova Scotia, median % error by epi weeks and updates

twoway ///
(line DCPerErrA01XNS20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XNS20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 216 7 1 C19 daily cases, $country, Nova Scotia, DELP, percent Error median1.gph", replace
qui graph export "graph 216 7 1 C19 daily cases, $country, Nova Scotia, DELP, percent Error median1.pdf", replace






***********************************************

* 216 7 2 Daily cases, Nova Scotia, mean over updates of median percent error by epi weeks

twoway ///
(line DCPerErrA01XNS_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 216 7 2 C19 daily cases, $country, Nova Scotia, DELP, Error Mean1.gph", replace
qui graph export "graph 216 7 2 C19 daily cases, $country, Nova Scotia, DELP, Error Mean1.pdf", replace







***********************************************

* 216 8 1 Daily cases, Nova Scotia, median absolute % error by epi weeks and updates

twoway ///
(line DCAbPeErA01XNS20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XNS20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 216 8 1 C19 daily cases, $country, Nova Scotia, DELP, absolute percent Error median1.gph", replace
qui graph export "graph 216 8 1 C19 daily cases, $country, Nova Scotia, DELP, absolute percent Error median1.pdf", replace






***********************************************


* 216 8 2 Daily cases, Nova Scotia, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DCAbPeErA01XNS_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute % error by epiweeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 216 8 2 C19 daily cases, $country, Nova Scotia, DELP, Error Mean1.gph", replace
qui graph export "graph 216 8 2 C19 daily cases, $country, Nova Scotia, DELP, Error Mean1.pdf", replace















* Ontario

***********************************************

* 217 5 Daily cases, Ontario, Error

twoway ///
(line DCErrorA01XON20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 217 5 C19 daily cases, $country, Ontario, DELP, Error.gph", replace
qui graph export "graph 217 5 C19 daily cases, $country, Ontario, DELP, Error.pdf", replace





***********************************************

* 217 6 Daily cases, Ontario, absolute Error

twoway ///
(line DCAbsErrA01XON20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 217 6 C19 daily cases, $country, Ontario, DELP, absolute Error.gph", replace
qui graph export "graph 217 6 C19 daily cases, $country, Ontario, DELP, absolute Error.pdf", replace








***********************************************

* 217 7 Daily cases, Ontario, percent Error

twoway ///
(line DCPerErrA01XON20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases percent error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP" /// 
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 217 7 C19 daily cases, $country, Ontario, DELP, percent Error.gph", replace
qui graph export "graph 217 7 C19 daily cases, $country, Ontario, DELP, percent Error.pdf", replace





***********************************************

* 217 8 Daily cases, Ontario, absolute percent Error

twoway ///
(line DCAbPeErA01XON20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute % error by epi weeks & model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 217 8 C19 daily cases, $country, Ontario, DELP, absolute percent Error.gph", replace
qui graph export "graph 217 8 C19 daily cases, $country, Ontario, DELP, absolute percent Error.pdf", replace







***********************************************

* 217 5 1 Daily cases, Ontario, median error by epi weeks and updates

twoway ///
(line DCErrorA01XON20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XON20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 217 5 1 C19 daily cases, $country, Ontario, DELP, Error median1.gph", replace
qui graph export "graph 217 5 1 C19 daily cases, $country, Ontario, DELP, Error median1.pdf", replace






***********************************************

* 217 5 2 Daily cases, Ontario, AVERAGE over updates of median error by epi weeks

twoway ///
(line DCErrorA01XON_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small))  

qui graph save "graph 217 5 2 C19 daily cases, $country, Ontario, DELP, Error Mean1.gph", replace
qui graph export "graph 217 5 2 C19 daily cases, $country, Ontario, DELP, Error Mean1.pdf", replace








***********************************************

* 217 6 1 Daily cases, Ontario, median absolute error by epi weeks and updates

twoway ///
(line DCAbsErrA01XON20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XON20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP" , size(small)) 

qui graph save "graph 217 6 1 C19 daily cases, $country, Ontario, DELP, absolute Error median1.gph", replace
qui graph export "graph 217 6 1 C19 daily cases, $country, Ontario, DELP, absolute Error median1.pdf", replace






***********************************************

* 217 6 2 Daily cases, Ontario, mean over updates of median absolute error by epi weeks

twoway ///
(line DCAbsErrA01XON_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 217 6 2 C19 daily cases, $country, Ontario, DELP, Error Mean1.gph", replace
qui graph export "graph 217 6 2 C19 daily cases, $country, Ontario, DELP, Error Mean1.pdf", replace









***********************************************

* 217 7 1 Daily cases, Ontario, median % error by epi weeks and updates

twoway ///
(line DCPerErrA01XON20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XON20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 217 7 1 C19 daily cases, $country, Ontario, DELP, percent Error median1.gph", replace
qui graph export "graph 217 7 1 C19 daily cases, $country, Ontario, DELP, percent Error median1.pdf", replace






***********************************************

* 217 7 2 Daily cases, Ontario, mean over updates of median percent error by epi weeks

twoway ///
(line DCPerErrA01XON_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 217 7 2 C19 daily cases, $country, Ontario, DELP, Error Mean1.gph", replace
qui graph export "graph 217 7 2 C19 daily cases, $country, Ontario, DELP, Error Mean1.pdf", replace







***********************************************

* 217 8 1 Daily cases, Ontario, median absolute % error by epi weeks and updates

twoway ///
(line DCAbPeErA01XON20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XON20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 217 8 1 C19 daily cases, $country, Ontario, DELP, absolute percent Error median1.gph", replace
qui graph export "graph 217 8 1 C19 daily cases, $country, Ontario, DELP, absolute percent Error median1.pdf", replace






***********************************************


* 217 8 2 Daily cases, Ontario, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DCAbPeErA01XON_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute % error by epiweeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 217 8 2 C19 daily cases, $country, Ontario, DELP, Error Mean1.gph", replace
qui graph export "graph 217 8 2 C19 daily cases, $country, Ontario, DELP, Error Mean1.pdf", replace


















* Quebec

***********************************************

* 218 5 Daily cases, Quebec, Error

twoway ///
(line DCErrorA01XQC20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 218 5 C19 daily cases, $country, Quebec, DELP, Error.gph", replace
qui graph export "graph 218 5 C19 daily cases, $country, Quebec, DELP, Error.pdf", replace





***********************************************

* 218 6 Daily cases, Quebec, absolute Error

twoway ///
(line DCAbsErrA01XQC20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 218 6 C19 daily cases, $country, Quebec, DELP, absolute Error.gph", replace
qui graph export "graph 218 6 C19 daily cases, $country, Quebec, DELP, absolute Error.pdf", replace








***********************************************

* 218 7 Daily cases, Quebec, percent Error

twoway ///
(line DCPerErrA01XQC20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases percent error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP" /// 
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 218 7 C19 daily cases, $country, Quebec, DELP, percent Error.gph", replace
qui graph export "graph 218 7 C19 daily cases, $country, Quebec, DELP, percent Error.pdf", replace





***********************************************

* 218 8 Daily cases, Quebec, absolute percent Error

twoway ///
(line DCAbPeErA01XQC20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute % error by epi weeks & model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 218 8 C19 daily cases, $country, Quebec, DELP, absolute percent Error.gph", replace
qui graph export "graph 218 8 C19 daily cases, $country, Quebec, DELP, absolute percent Error.pdf", replace







***********************************************

* 218 5 1 Daily cases, Quebec, median error by epi weeks and updates

twoway ///
(line DCErrorA01XQC20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XQC20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 218 5 1 C19 daily cases, $country, Quebec, DELP, Error median1.gph", replace
qui graph export "graph 218 5 1 C19 daily cases, $country, Quebec, DELP, Error median1.pdf", replace






***********************************************

* 218 5 2 Daily cases, Quebec, AVERAGE over updates of median error by epi weeks

twoway ///
(line DCErrorA01XQC_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small))  

qui graph save "graph 218 5 2 C19 daily cases, $country, Quebec, DELP, Error Mean1.gph", replace
qui graph export "graph 218 5 2 C19 daily cases, $country, Quebec, DELP, Error Mean1.pdf", replace








***********************************************

* 218 6 1 Daily cases, Quebec, median absolute error by epi weeks and updates

twoway ///
(line DCAbsErrA01XQC20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XQC20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP" , size(small)) 

qui graph save "graph 218 6 1 C19 daily cases, $country, Quebec, DELP, absolute Error median1.gph", replace
qui graph export "graph 218 6 1 C19 daily cases, $country, Quebec, DELP, absolute Error median1.pdf", replace






***********************************************

* 218 6 2 Daily cases, Quebec, mean over updates of median absolute error by epi weeks

twoway ///
(line DCAbsErrA01XQC_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 218 6 2 C19 daily cases, $country, Quebec, DELP, Error Mean1.gph", replace
qui graph export "graph 218 6 2 C19 daily cases, $country, Quebec, DELP, Error Mean1.pdf", replace









***********************************************

* 218 7 1 Daily cases, Quebec, median % error by epi weeks and updates

twoway ///
(line DCPerErrA01XQC20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XQC20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 218 7 1 C19 daily cases, $country, Quebec, DELP, percent Error median1.gph", replace
qui graph export "graph 218 7 1 C19 daily cases, $country, Quebec, DELP, percent Error median1.pdf", replace






***********************************************

* 218 7 2 Daily cases, Quebec, mean over updates of median percent error by epi weeks

twoway ///
(line DCPerErrA01XQC_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 218 7 2 C19 daily cases, $country, Quebec, DELP, Error Mean1.gph", replace
qui graph export "graph 218 7 2 C19 daily cases, $country, Quebec, DELP, Error Mean1.pdf", replace







***********************************************

* 218 8 1 Daily cases, Quebec, median absolute % error by epi weeks and updates

twoway ///
(line DCAbPeErA01XQC20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XQC20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 218 8 1 C19 daily cases, $country, Quebec, DELP, absolute percent Error median1.gph", replace
qui graph export "graph 218 8 1 C19 daily cases, $country, Quebec, DELP, absolute percent Error median1.pdf", replace






***********************************************


* 218 8 2 Daily cases, Quebec, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DCAbPeErA01XQC_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute % error by epiweeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 218 8 2 C19 daily cases, $country, Quebec, DELP, Error Mean1.gph", replace
qui graph export "graph 218 8 2 C19 daily cases, $country, Quebec, DELP, Error Mean1.pdf", replace















* Saskatchewan

***********************************************

* 219 5 Daily cases, Saskatchewan, Error

twoway ///
(line DCErrorA01XSK20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 219 5 C19 daily cases, $country, Saskatchewan, DELP, Error.gph", replace
qui graph export "graph 219 5 C19 daily cases, $country, Saskatchewan, DELP, Error.pdf", replace





***********************************************

* 219 6 Daily cases, Saskatchewan, absolute Error

twoway ///
(line DCAbsErrA01XSK20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 219 6 C19 daily cases, $country, Saskatchewan, DELP, absolute Error.gph", replace
qui graph export "graph 219 6 C19 daily cases, $country, Saskatchewan, DELP, absolute Error.pdf", replace








***********************************************

* 219 7 Daily cases, Saskatchewan, percent Error

twoway ///
(line DCPerErrA01XSK20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases percent error by epi weeks and model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP" /// 
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 219 7 C19 daily cases, $country, Saskatchewan, DELP, percent Error.gph", replace
qui graph export "graph 219 7 C19 daily cases, $country, Saskatchewan, DELP, percent Error.pdf", replace





***********************************************

* 219 8 Daily cases, Saskatchewan, absolute percent Error

twoway ///
(line DCAbPeErA01XSK20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211231 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases absolute % error by epi weeks & model updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 219 8 C19 daily cases, $country, Saskatchewan, DELP, absolute percent Error.gph", replace
qui graph export "graph 219 8 C19 daily cases, $country, Saskatchewan, DELP, absolute percent Error.pdf", replace







***********************************************

* 219 5 1 Daily cases, Saskatchewan, median error by epi weeks and updates

twoway ///
(line DCErrorA01XSK20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCErrorA01XSK20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 219 5 1 C19 daily cases, $country, Saskatchewan, DELP, Error median1.gph", replace
qui graph export "graph 219 5 1 C19 daily cases, $country, Saskatchewan, DELP, Error median1.pdf", replace






***********************************************

* 219 5 2 Daily cases, Saskatchewan, AVERAGE over updates of median error by epi weeks

twoway ///
(line DCErrorA01XSK_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP" ///
"Error = Reference minus Model; Reference = JOHN, Model = DELP", size(small))  

qui graph save "graph 219 5 2 C19 daily cases, $country, Saskatchewan, DELP, Error Mean1.gph", replace
qui graph export "graph 219 5 2 C19 daily cases, $country, Saskatchewan, DELP, Error Mean1.pdf", replace








***********************************************

* 219 6 1 Daily cases, Saskatchewan, median absolute error by epi weeks and updates

twoway ///
(line DCAbsErrA01XSK20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbsErrA01XSK20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP" , size(small)) 

qui graph save "graph 219 6 1 C19 daily cases, $country, Saskatchewan, DELP, absolute Error median1.gph", replace
qui graph export "graph 219 6 1 C19 daily cases, $country, Saskatchewan, DELP, absolute Error median1.pdf", replace






***********************************************

* 219 6 2 Daily cases, Saskatchewan, mean over updates of median absolute error by epi weeks

twoway ///
(line DCAbsErrA01XSK_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP" ///
"absolute Error = | Reference minus Model |; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 219 6 2 C19 daily cases, $country, Saskatchewan, DELP, Error Mean1.gph", replace
qui graph export "graph 219 6 2 C19 daily cases, $country, Saskatchewan, DELP, Error Mean1.pdf", replace









***********************************************

* 219 7 1 Daily cases, Saskatchewan, median % error by epi weeks and updates

twoway ///
(line DCPerErrA01XSK20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCPerErrA01XSK20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 219 7 1 C19 daily cases, $country, Saskatchewan, DELP, percent Error median1.gph", replace
qui graph export "graph 219 7 1 C19 daily cases, $country, Saskatchewan, DELP, percent Error median1.pdf", replace






***********************************************

* 219 7 2 Daily cases, Saskatchewan, mean over updates of median percent error by epi weeks

twoway ///
(line DCPerErrA01XSK_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP" ///
"percent Error = 100 * (Reference minus Model) / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 219 7 2 C19 daily cases, $country, Saskatchewan, DELP, Error Mean1.gph", replace
qui graph export "graph 219 7 2 C19 daily cases, $country, Saskatchewan, DELP, Error Mean1.pdf", replace







***********************************************

* 219 8 1 Daily cases, Saskatchewan, median absolute % error by epi weeks and updates

twoway ///
(line DCAbPeErA01XSK20200417_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200424_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200501_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200509_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200517_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200524_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200531_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200607_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200614_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200621_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200628_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200704_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200718_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200723_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20200926_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20201231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210311_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210325_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210408_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210422_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210506_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210520_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210603_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210610_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210617_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210624_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210701_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210708_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210715_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210722_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210729_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210805_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210812_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210819_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210826_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210902_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210909_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210916_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210923_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20210930_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211001_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211002_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211003_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211004_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211005_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211006_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211007_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211008_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211009_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211010_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211011_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211012_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211013_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211014_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211015_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211016_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211017_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211018_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211019_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211020_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211021_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211022_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211023_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211024_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211025_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211026_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211027_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211028_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211029_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211030_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211031_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211101_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211102_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211103_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211104_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211105_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211106_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211107_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211108_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211109_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211110_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211111_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211112_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211113_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211114_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211115_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211116_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211117_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211118_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211119_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211120_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211121_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211122_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211123_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211124_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211125_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211126_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211127_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211128_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211129_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211130_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211201_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211202_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211203_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211204_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211205_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211206_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211207_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211208_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211209_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211210_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211211_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211212_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211213_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211214_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211215_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211216_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211217_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211218_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211219_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211220_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211221_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211222_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211223_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211224_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211225_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211226_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211227_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211228_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211229_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211230_Med1 date, sort lcolor(red) lwidth(medium)) /// 
(line DCAbPeErA01XSK20211231_Med1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases error measure) title("C-19 daily cases median absolute % error by epi weeks and updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small))

qui graph save "graph 219 8 1 C19 daily cases, $country, Saskatchewan, DELP, absolute percent Error median1.gph", replace
qui graph export "graph 219 8 1 C19 daily cases, $country, Saskatchewan, DELP, absolute percent Error median1.pdf", replace






***********************************************


* 219 8 2 Daily cases, Saskatchewan, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DCAbPeErA01XSK_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DC) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily cases error measure) ///
title("C-19 daily cases mean over updates of median absolute % error by epiweeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP" ///
"absolute % Error = 100 * | Reference minus Model | / Reference; Reference = JOHN, Model = DELP", size(small)) 

qui graph save "graph 219 8 2 C19 daily cases, $country, Saskatchewan, DELP, Error Mean1.gph", replace
qui graph export "graph 219 8 2 C19 daily cases, $country, Saskatchewan, DELP, Error Mean1.pdf", replace



























****



qui compress 
save "CovidLongitudinal DELP daily cases 2.dta", replace 






view "log CovidLongitudinal DELP 8.smcl"

log close

exit, clear



