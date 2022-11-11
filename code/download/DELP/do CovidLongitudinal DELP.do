
clear all

cd "$pathCovidLongitudinal/download/DELP"

capture log close 

log using "log CovidLongitudinal DELP.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Download estimates files for DELP model                                                                   
***************************************************************************


* download and prepare update files
* input data files: download csv files
* output data files: "CovidLongitudinal DELP 202?????.dta" 
*                    "DELP countries.dta"
*                    "DELP countries long.dta"




/*
Rule for harvesting updates:

Get the later version of updates with the same date where applicable.

Example: For update 20200704, there are two versions available: 
Global_20200704.csv and Global_V2_20200704.csv. 
Get the later version, Global_V2_20200704.csv.

For any update where a _since100_ version file is available, that _since100_ is used 
since it includes more dates. 

*/





/*

File name formats on https://github.com/COVIDAnalytics/website/tree/master/data/predicted


Update				File name

20200417	    	Global_20200417.csv
20200424	    	Global_20200424.csv
20200501	    	Global_20200501.csv
20200509	    	Global_20200509.csv
20200517	    	Global_20200517.csv
20200524	    	Global_20200524.csv
20200531	    	Global_20200531.csv
20200607	    	Global_20200607.csv
20200614	    	Global_20200614.csv
20200621	    	Global_20200621.csv
20200628	    	Global_20200628.csv
20200704	    	Global_V2_20200704.csv
20200718	    	Global_V2_20200718.csv
20200723	    	Global_V2_since100_20200723.csv
20200801	    	Global_V2_20200801.csv
20200815	    	Global_V2_20200815.csv
20200829	    	Global_V2_20200829.csv
20200912	    	Global_V2_20200912.csv
20200926	    	Global_V2_since100_20200926.csv
20201008	    	Global_V2_since100_20201008.csv
20201022	    	Global_V2_since100_20201022.csv
20201105	    	Global_V2_since100_20201105.csv
20201119	    	Global_V4_since100_20201119.csv
20201203	    	Global_V4_since100_20201203.csv
20201217	    	Global_V4_since100_20201217.csv
20201231	    	Global_V4_since100_20201231.csv
20210114	    	Global_V4_since100_20210114.csv
20210128	    	Global_V4_since100_20210128.csv
20210211	    	Global_V4_since100_20210211.csv
20210225	    	Global_V4_since100_20210225.csv
20210311	    	Global_V4_since100_20210311.csv
20210325	    	Global_V4_since100_20210325.csv
20210408	    	Global_V4_since100_20210408.csv
20210422	    	Global_V4_since100_20210422.csv
20210506	    	Global_V4_since100_20210506.csv
20210520	    	Global_V4_since100_20210520.csv
20210603	    	Global_V4_since100_20210603.csv
20210610	    	Global_V4_since100_20210610.csv
20210617	    	Global_V4_since100_20210617.csv
20210624	    	Global_V4_since100_20210624.csv
20210701	    	Global_V4_since100_20210701.csv
20210708	    	Global_V4_since100_20210708.csv
20210715	    	Global_V4_since100_20210715.csv
20210722	    	Global_V4_since100_20210722.csv
20210729	    	Global_V4_since100_20210729.csv
20210805	    	Global_V4_since100_20210805.csv
20210812	    	Global_V4_since100_20210812.csv
20210819	    	Global_V4_since100_20210819.csv
20210826	    	Global_V4_since100_20210826.csv
20210902	    	Global_V4_since100_20210902.csv
20210909	    	Global_V4_since100_20210909.csv
20210916	    	Global_V4_since100_20210916.csv
20210923	    	Global_V4_since100_20210923.csv
20210930	    	Global_V4_since100_20210930.csv
20211007	    	Global_V4_since100_20211007.csv
20211014	    	Global_V4_since100_20211014.csv
20211021	    	Global_V4_since100_20211021.csv
20211028	    	Global_V4_since100_20211028.csv
20211104	    	Global_V4_since100_20211104.csv
20211111	    	Global_V4_since100_20211111.csv
20211118	    	Global_V4_since100_20211118.csv
20211125	    	Global_V4_since100_20211125.csv
20211202	    	Global_V4_since100_20211202.csv
20211209	    	Global_V4_since100_20211209.csv
20211216	    	Global_V4_since100_20211216.csv
20211223	    	Global_V4_since100_20211223.csv
20211230	    	Global_V4_since100_20211230.csv

20220106	   	Global_V4_since100_20220106.csv
20220113	   	Global_V4_since100_20220113.csv
20220114	   	Global_V4_since100_20220114.csv
20220115	   	Global_V4_since100_20220115.csv
20220116	   	Global_V4_since100_20220116.csv
20220117	   	Global_V4_since100_20220117.csv
20220118	   	Global_V4_since100_20220118.csv
20220119	   	Global_V4_since100_20220119.csv
20220120	   	Global_V4_since100_20220120.csv
20220121	   	Global_V4_since100_20220121.csv
20220122	   	Global_V4_since100_20220122.csv
20220123	   	Global_V4_since100_20220123.csv
20220124	   	Global_V4_since100_20220124.csv
20220125	   	Global_V4_since100_20220125.csv
20220126	   	Global_V4_since100_20220126.csv
20220127	   	Global_V4_since100_20220127.csv
20220128	   	Global_V4_since100_20220128.csv
20220129	   	Global_V4_since100_20220129.csv
20220130	   	Global_V4_since100_20220130.csv
20220131	   	Global_V4_since100_20220131.csv
20220201	   	Global_V4_since100_20220201.csv
20220202	   	Global_V4_since100_20220202.csv
20220203	   	Global_V4_since100_20220203.csv
20220204	   	Global_V4_since100_20220204.csv
20220205	   	Global_V4_since100_20220205.csv
20220206	   	Global_V4_since100_20220206.csv
20220207	   	Global_V4_since100_20220207.csv
20220208	   	Global_V4_since100_20220208.csv
20220209	   	Global_V4_since100_20220209.csv
20220210	   	Global_V4_since100_20220210.csv
20220211	   	Global_V4_since100_20220211.csv
20220212	   	Global_V4_since100_20220212.csv
20220213	   	Global_V4_since100_20220213.csv
20220214	   	Global_V4_since100_20220214.csv
20220215	   	Global_V4_since100_20220215.csv
20220216	   	Global_V4_since100_20220216.csv
20220217	   	Global_V4_since100_20220217.csv
20220218	   	Global_V4_since100_20220218.csv
20220219	   	Global_V4_since100_20220219.csv
20220220	   	Global_V4_since100_20220220.csv
20220221	   	Global_V4_since100_20220221.csv
20220222	   	Global_V4_since100_20220222.csv
20220223	   	Global_V4_since100_20220223.csv
20220224	   	Global_V4_since100_20220224.csv
20220225	   	Global_V4_since100_20220225.csv
20220226	   	Global_V4_since100_20220226.csv
20220227	   	Global_V4_since100_20220227.csv
20220228	   	Global_V4_since100_20220228.csv
20220301	   	Global_V4_since100_20220301.csv
20220302	   	Global_V4_since100_20220302.csv
20220303	   	Global_V4_since100_20220303.csv
20220304	   	Global_V4_since100_20220304.csv
20220305	   	Global_V4_since100_20220305.csv
20220306	   	Global_V4_since100_20220306.csv
20220307	   	Global_V4_since100_20220307.csv
20220308	   	Global_V4_since100_20220308.csv
20220309	   	Global_V4_since100_20220309.csv
20220310	   	Global_V4_since100_20220310.csv
20220311	   	Global_V4_since100_20220311.csv
20220312	   	Global_V4_since100_20220312.csv
20220313	   	Global_V4_since100_20220313.csv
20220314	   	Global_V4_since100_20220314.csv
20220315	   	Global_V4_since100_20220315.csv
20220316	   	Global_V4_since100_20220316.csv
20220317	   	Global_V4_since100_20220317.csv
20220318	   	Global_V4_since100_20220318.csv
20220319	   	Global_V4_since100_20220319.csv
20220320	   	Global_V4_since100_20220320.csv
20220321	   	Global_V4_since100_20220321.csv
20220322	   	Global_V4_since100_20220322.csv
20220323	   	Global_V4_since100_20220323.csv
20220324	   	Global_V4_since100_20220324.csv
20220325	   	Global_V4_since100_20220325.csv
20220326	   	Global_V4_since100_20220326.csv
20220327	   	Global_V4_since100_20220327.csv
20220328	   	Global_V4_since100_20220328.csv
20220329	   	Global_V4_since100_20220329.csv
20220330	   	Global_V4_since100_20220330.csv
20220331	   	Global_V4_since100_20220331.csv
20220401	   	Global_V4_since100_20220401.csv
20220402	   	Global_V4_since100_20220402.csv
20220403	   	Global_V4_since100_20220403.csv
20220404	   	Global_V4_since100_20220404.csv
20220405	   	Global_V4_since100_20220405.csv
20220406	   	Global_V4_since100_20220406.csv
20220407	   	Global_V4_since100_20220407.csv
20220408	   	Global_V4_since100_20220408.csv
20220409	   	Global_V4_since100_20220409.csv
20220410	   	Global_V4_since100_20220410.csv
20220411	   	Global_V4_since100_20220411.csv
20220412	   	Global_V4_since100_20220412.csv
20220413	   	Global_V4_since100_20220413.csv
20220414	   	Global_V4_since100_20220414.csv
20220415	   	Global_V4_since100_20220415.csv
20220416	   	Global_V4_since100_20220416.csv
20220417	   	Global_V4_since100_20220417.csv
20220418	   	Global_V4_since100_20220418.csv
20220419	   	Global_V4_since100_20220419.csv
20220420	   	Global_V4_since100_20220420.csv
20220421	   	Global_V4_since100_20220421.csv
20220422	   	Global_V4_since100_20220422.csv
20220423	   	Global_V4_since100_20220423.csv
20220424	   	Global_V4_since100_20220424.csv
20220425	   	Global_V4_since100_20220425.csv
20220426	   	Global_V4_since100_20220426.csv
20220427	   	Global_V4_since100_20220427.csv
20220428	   	Global_V4_since100_20220428.csv
20220429	   	Global_V4_since100_20220429.csv
20220430	   	Global_V4_since100_20220430.csv
20220501	   	Global_V4_since100_20220501.csv
20220502	   	Global_V4_since100_20220502.csv
20220503	   	Global_V4_since100_20220503.csv
20220504	   	Global_V4_since100_20220504.csv
20220505	   	Global_V4_since100_20220505.csv
20220506	   	Global_V4_since100_20220506.csv
20220507	   	Global_V4_since100_20220507.csv
20220508	   	Global_V4_since100_20220508.csv
20220509	   	Global_V4_since100_20220509.csv
20220510	   	Global_V4_since100_20220510.csv
20220511	   	Global_V4_since100_20220511.csv
20220512	   	Global_V4_since100_20220512.csv
20220513	   	Global_V4_since100_20220513.csv
20220514	   	Global_V4_since100_20220514.csv
20220515	   	Global_V4_since100_20220515.csv
20220516	   	Global_V4_since100_20220516.csv
20220517	   	Global_V4_since100_20220517.csv
20220518	   	Global_V4_since100_20220518.csv
20220519	   	Global_V4_since100_20220519.csv
20220520	   	Global_V4_since100_20220520.csv
20220521	   	Global_V4_since100_20220521.csv
20220522	   	Global_V4_since100_20220522.csv
20220523	   	Global_V4_since100_20220523.csv
20220524	   	Global_V4_since100_20220524.csv
20220525	   	Global_V4_since100_20220525.csv
20220526	   	Global_V4_since100_20220526.csv
20220527	   	Global_V4_since100_20220527.csv
20220528	   	Global_V4_since100_20220528.csv
20220529	   	Global_V4_since100_20220529.csv
20220530	   	Global_V4_since100_20220530.csv
20220531	   	Global_V4_since100_20220531.csv
20220601	   	Global_V4_since100_20220601.csv
20220602	   	Global_V4_since100_20220602.csv
20220603	   	Global_V4_since100_20220603.csv
20220604	   	Global_V4_since100_20220604.csv
20220605	   	Global_V4_since100_20220605.csv
20220606	   	Global_V4_since100_20220606.csv
20220607	   	Global_V4_since100_20220607.csv
20220608	   	Global_V4_since100_20220608.csv
20220609	   	Global_V4_since100_20220609.csv
20220610	   	Global_V4_since100_20220610.csv
20220611	   	Global_V4_since100_20220611.csv
20220612	   	Global_V4_since100_20220612.csv
20220613	   	Global_V4_since100_20220613.csv
20220614	   	Global_V4_since100_20220614.csv
20220615	   	Global_V4_since100_20220615.csv
20220616	   	Global_V4_since100_20220616.csv
20220617	   	Global_V4_since100_20220617.csv
20220618	   	Global_V4_since100_20220618.csv
20220619	   	Global_V4_since100_20220619.csv
20220620	   	Global_V4_since100_20220620.csv
20220621	   	Global_V4_since100_20220621.csv
20220622	   	Global_V4_since100_20220622.csv
20220623	   	Global_V4_since100_20220623.csv
20220624	   	Global_V4_since100_20220624.csv
20220625	   	Global_V4_since100_20220625.csv
20220626	   	Global_V4_since100_20220626.csv
20220627	   	Global_V4_since100_20220627.csv
20220628	   	Global_V4_since100_20220628.csv
20220629	   	Global_V4_since100_20220629.csv
20220630	   	Global_V4_since100_20220630.csv
20220701	   	Global_V4_since100_20220701.csv
20220702	   	Global_V4_since100_20220702.csv
20220703	   	Global_V4_since100_20220703.csv
20220704	   	Global_V4_since100_20220704.csv
20220705	   	Global_V4_since100_20220705.csv
20220706	   	Global_V4_since100_20220706.csv
20220707	   	Global_V4_since100_20220707.csv
20220708	   	Global_V4_since100_20220708.csv
20220709	   	Global_V4_since100_20220709.csv
20220710	   	Global_V4_since100_20220710.csv
20220711	   	Global_V4_since100_20220711.csv
20220712	   	Global_V4_since100_20220712.csv
20220713	   	Global_V4_since100_20220713.csv
20220714	   	Global_V4_since100_20220714.csv
20220715	   	Global_V4_since100_20220715.csv
20220716	   	Global_V4_since100_20220716.csv
20220717	   	Global_V4_since100_20220717.csv
20220718	   	Global_V4_since100_20220718.csv
20220719	   	Global_V4_since100_20220719.csv
20220720	   	Global_V4_since100_20220720.csv
20220721	   	Global_V4_since100_20220721.csv
20220722	   	Global_V4_since100_20220722.csv
20220723	   	Global_V4_since100_20220723.csv
20220724	   	Global_V4_since100_20220724.csv
20220725	   	Global_V4_since100_20220725.csv
20220726	   	Global_V4_since100_20220726.csv
20220727	   	Global_V4_since100_20220727.csv
20220728	   	Global_V4_since100_20220728.csv
20220729	   	Global_V4_since100_20220729.csv
20220730	   	Global_V4_since100_20220730.csv
20220731	   	Global_V4_since100_20220731.csv
20220801	   	Global_V4_since100_20220801.csv
20220802	   	Global_V4_since100_20220802.csv
20220803	   	Global_V4_since100_20220803.csv
20220804	   	Global_V4_since100_20220804.csv
20220805	   	Global_V4_since100_20220805.csv
20220806	   	Global_V4_since100_20220806.csv
20220807	   	Global_V4_since100_20220807.csv
20220808	   	Global_V4_since100_20220808.csv
20220809	   	Global_V4_since100_20220809.csv
20220810	   	Global_V4_since100_20220810.csv
20220811	   	Global_V4_since100_20220811.csv
20220812	   	Global_V4_since100_20220812.csv
20220813	   	Global_V4_since100_20220813.csv
20220814	   	Global_V4_since100_20220814.csv
20220815	   	Global_V4_since100_20220815.csv
20220816	   	Global_V4_since100_20220816.csv
20220817	   	Global_V4_since100_20220817.csv
20220818	   	Global_V4_since100_20220818.csv
20220819	   	Global_V4_since100_20220819.csv
20220820	   	Global_V4_since100_20220820.csv
20220821	   	Global_V4_since100_20220821.csv
20220822	   	Global_V4_since100_20220822.csv
20220823	   	Global_V4_since100_20220823.csv
20220824	   	Global_V4_since100_20220824.csv
20220825	   	Global_V4_since100_20220825.csv
20220826	   	Global_V4_since100_20220826.csv
20220827	   	Global_V4_since100_20220827.csv
20220828	   	Global_V4_since100_20220828.csv
20220829	   	Global_V4_since100_20220829.csv
20220830	   	Global_V4_since100_20220830.csv
20220831	   	Global_V4_since100_20220831.csv
20220901	   	Global_V4_since100_20220901.csv
20220902	   	Global_V4_since100_20220902.csv
20220903	   	Global_V4_since100_20220903.csv
20220904	   	Global_V4_since100_20220904.csv
20220905	   	Global_V4_since100_20220905.csv
20220906	   	Global_V4_since100_20220906.csv
20220907	   	Global_V4_since100_20220907.csv
20220908	   	Global_V4_since100_20220908.csv
20220909	   	Global_V4_since100_20220909.csv
20220910	   	Global_V4_since100_20220910.csv
20220911	   	Global_V4_since100_20220911.csv
20220912	   	Global_V4_since100_20220912.csv
20220913	   	Global_V4_since100_20220913.csv
20220914	   	Global_V4_since100_20220914.csv
20220915		Global_V4_since100_20220915.csv


* Global_20200417.csv (format 1 of 4)

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
20200628 




* Global_V2_20200704.csv (format 2 of 4)

20200704 ///
20200718 /// 
20200801 ///
20200815 ///
20200829 ///
20200912 



* Global_V2_since100_20200723.csv (format 3 of 4)	

20200723 ///
20200926 ///
20201008 ///
20201022 ///
20201105 




* Global_V4_since100_20201119.csv (format 4 of 4)

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
20211007 ///
20211014 ///
20211021 ///
20211028 ///
20211104 ///
20211111 ///
20211118 ///
20211125 ///
20211202 ///
20211209 ///
20211216 ///
20211223 ///
20211230 ///

20220106 ///
20220113 ///
20220114 ///
20220115 ///
20220116 ///
20220117 ///
20220118 ///
20220119 ///
20220120 ///
20220121 ///
20220122 ///
20220123 ///
20220124 ///
20220125 ///
20220126 ///
20220127 ///
20220128 ///
20220129 ///
20220130 ///
20220131 ///
20220201 ///
20220202 ///
20220203 ///
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
20220302 ///
20220303 ///
20220304 ///
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
20220414 ///
20220415 ///
20220416 ///
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
20220503 ///
20220504 ///
20220505 ///
20220506 ///
20220507 ///
20220508 ///
20220509 ///
20220510 ///
20220511 ///
20220512 ///
20220513 ///
20220514 ///
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
20220604 ///
20220605 ///
20220606 ///
20220607 ///
20220608 ///
20220609 ///
20220610 ///
20220611 ///
20220612 ///
20220613 ///
20220614 ///
20220615 ///
20220616 ///
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
20220825 ///
20220826 ///
20220827 ///
20220828 ///
20220829 ///
20220830 ///
20220831 ///
20220901 ///
20220902 ///
20220903 ///
20220904 ///
20220905 ///
20220906 ///
20220907 ///
20220908 ///
20220909 ///
20220910 ///
20220911 ///
20220912 ///
20220913 ///
20220914 ///
20220915

*/




*********************************************************************

* Global_20200417.csv (format 1 of 4)

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
20200628 




foreach update of local list {

di in red "This is DELP update " `update'

capture shell rm -r  "Global_`update'.csv"

clear

copy https://raw.githubusercontent.com/COVIDAnalytics/website/master/data/predicted/Global_`update'.csv Global_`update'.csv

import delimited using "Global_`update'.csv", clear varnames(1)

rename country loc_grand_name

label var loc_grand_name "country"

rename province provincestate

label var provincestate "province or state"

drop if continent == "None" // global 

drop if loc_grand_name == "None" // continents

drop continent

replace provincestate = loc_grand_name if provincestate == "None" // national estimate for countries with subnational estimates


* gen date

rename day date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date

label var date "calendar date"

drop year month day date2

*

rename totaldetecteddeaths TotDeaMeRaDELP

label var TotDeaMeRaDELP "Total Deaths Mean Raw DELP"

keep loc_grand_name provincestate date TotDeaMeRaDELP   

order loc_grand_name provincestate date TotDeaMeRaDELP  

capture drop update_date

gen update_date = date("`update'", "YMD")

label var update_date "update date"


* add update to varnames

rename (*) (*`update')

rename (date`update' loc_grand_name`update' provincestate`update') (date loc_grand_name provincestate)

sort loc_grand_name provincestate update_date`update' date

order date loc_grand_name provincestate update_date`update'

qui compress

save "CovidLongitudinal DELP `update'.dta", replace

shell rm -r "Global_`update'.csv"

}
*


















*********************************************************************


* Global_V2_20200704.csv (format 2 of 4)

local list ///
20200704 ///
20200718 /// 
20200801 ///
20200815 ///
20200829 ///
20200912 


foreach update of local list {

di in red "This is DELP update " `update'

capture shell rm -r  "Global_V2_`update'.csv"

clear

copy https://raw.githubusercontent.com/COVIDAnalytics/website/master/data/predicted/Global_V2_`update'.csv Global_V2_`update'.csv

import delimited using "Global_V2_`update'.csv", clear varnames(1)

rename country loc_grand_name

label var loc_grand_name "country"

rename province provincestate

label var provincestate "province or state"

drop if continent == "None" // global 

drop if loc_grand_name == "None" // continents

drop continent

replace provincestate = loc_grand_name if provincestate == "None" // national estimate for countries with subnational estimates


* gen date

rename day date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date

label var date "calendar date"

drop year month day date2

*

rename totaldetecteddeaths TotDeaMeRaDELP

label var TotDeaMeRaDELP "Total Deaths Mean Raw DELP"

keep loc_grand_name provincestate date TotDeaMeRaDELP   

order loc_grand_name provincestate date TotDeaMeRaDELP  

capture drop update_date

gen update_date = date("`update'", "YMD")

label var update_date "update date"


* add update to varnames

rename (*) (*`update')

rename (date`update' loc_grand_name`update' provincestate`update') (date loc_grand_name provincestate)

sort loc_grand_name provincestate update_date`update' date

order date loc_grand_name provincestate update_date`update'

qui compress

save "CovidLongitudinal DELP `update'.dta", replace

shell rm -r "Global_V2_`update'.csv"

}
*
















*********************************************************************


* Global_V2_since100_20200723.csv (format 3 of 4)	

local list ///
20200723 ///
20200926 ///
20201008 ///
20201022 ///
20201105 



foreach update of local list {

di in red "This is DELP update " `update'

capture shell rm -r  "Global_V2_since100_`update'.csv"

clear

copy https://raw.githubusercontent.com/COVIDAnalytics/website/master/data/predicted/Global_V2_since100_`update'.csv Global_V2_since100_`update'.csv

import delimited using "Global_V2_since100_`update'.csv", clear varnames(1)

rename country loc_grand_name

label var loc_grand_name "country"

rename province provincestate

label var provincestate "province or state"

drop if continent == "None" // global 

drop if loc_grand_name == "None" // continents

drop continent

replace provincestate = loc_grand_name if provincestate == "None" // national estimate for countries with subnational estimates


* gen date

rename day date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date

label var date "calendar date"

drop year month day date2

*

rename totaldetecteddeaths TotDeaMeRaDELP

label var TotDeaMeRaDELP "Total Deaths Mean Raw DELP"

keep loc_grand_name provincestate date TotDeaMeRaDELP   

order loc_grand_name provincestate date TotDeaMeRaDELP  

capture drop update_date

gen update_date = date("`update'", "YMD")

label var update_date "update date"


* add update to varnames

rename (*) (*`update')

rename (date`update' loc_grand_name`update' provincestate`update') (date loc_grand_name provincestate)

sort loc_grand_name provincestate update_date`update' date

order date loc_grand_name provincestate update_date`update'

qui compress

save "CovidLongitudinal DELP `update'.dta", replace

shell rm -r "Global_V2_since100_`update'.csv"

}
*













*********************************************************************

* Global_V4_since100_20201119.csv (format 4 of 4)


local list ///
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
20211007 ///
20211014 ///
20211021 ///
20211028 ///
20211104 ///
20211111 ///
20211118 ///
20211125 ///
20211202 ///
20211209 ///
20211216 ///
20211223 ///
20211230 ///
20220106 ///
20220113 ///
20220114 ///
20220115 ///
20220116 ///
20220117 ///
20220118 ///
20220119 ///
20220120 ///
20220121 ///
20220122 ///
20220123 ///
20220124 ///
20220125 ///
20220126 ///
20220127 ///
20220128 ///
20220129 ///
20220130 ///
20220131 ///
20220201 ///
20220202 ///
20220203 ///
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
20220302 ///
20220303 ///
20220304 ///
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
20220414 ///
20220415 ///
20220416 ///
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
20220503 ///
20220504 ///
20220505 ///
20220506 ///
20220507 ///
20220508 ///
20220509 ///
20220510 ///
20220511 ///
20220512 ///
20220513 ///
20220514 ///
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
20220604 ///
20220605 ///
20220606 ///
20220607 ///
20220608 ///
20220609 ///
20220610 ///
20220611 ///
20220612 ///
20220613 ///
20220614 ///
20220615 ///
20220616 ///
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
20220825 ///
20220826 ///
20220827 ///
20220828 ///
20220829 ///
20220830 ///
20220831 ///
20220901 ///
20220902 ///
20220903 ///
20220904 ///
20220905 ///
20220906 ///
20220907 ///
20220908 ///
20220909 ///
20220910 ///
20220911 ///
20220912 ///
20220913 ///
20220914 ///
20220915
 


foreach update of local list {

di in red "This is DELP update " `update'

capture shell rm -r "Global_V4_since100_`update'.csv"

clear 

copy https://raw.githubusercontent.com/COVIDAnalytics/website/master/data/predicted/Global_V4_since100_`update'.csv Global_V4_since100_`update'.csv

import delimited using "Global_V4_since100_`update'.csv", clear varnames(1)

rename country loc_grand_name

label var loc_grand_name "country"

rename province provincestate

label var provincestate "province or state"

drop if continent == "None" // global 

drop if loc_grand_name == "None" // continents

drop continent

replace provincestate = loc_grand_name if provincestate == "None" // national estimate for countries with subnational estimates


* gen date

rename day date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date

label var date "calendar date"

drop year month day date2

*

rename totaldetecteddeaths TotDeaMeRaDELP

label var TotDeaMeRaDELP "Total Deaths Mean Raw DELP"

keep loc_grand_name provincestate date TotDeaMeRaDELP   

order loc_grand_name provincestate date TotDeaMeRaDELP  

capture drop update_date

gen update_date = date("`update'", "YMD")

label var update_date "update date"


* add update to varnames

rename (*) (*`update')

rename (date`update' loc_grand_name`update' provincestate`update') (date loc_grand_name provincestate)

sort loc_grand_name provincestate update_date`update' date

order date loc_grand_name provincestate update_date`update'

qui compress

save "CovidLongitudinal DELP `update'.dta", replace

shell rm -r "Global_V4_since100_`update'.csv"

*

}
*




**************************************************
* gen list of countries and update dates


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
20200801 ///
20200815 ///
20200829 ///
20200912 ///
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
20211007 ///
20211014 ///
20211021 ///
20211028 ///
20211104 ///
20211111 ///
20211118 ///
20211125 ///
20211202 ///
20211209 ///
20211216 ///
20211223 ///
20211230 ///
20220106 ///
20220113 ///
20220114 ///
20220115 ///
20220116 ///
20220117 ///
20220118 ///
20220119 ///
20220120 ///
20220121 ///
20220122 ///
20220123 ///
20220124 ///
20220125 ///
20220126 ///
20220127 ///
20220128 ///
20220129 ///
20220130 ///
20220131 ///
20220201 ///
20220202 ///
20220203 ///
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
20220302 ///
20220303 ///
20220304 ///
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
20220414 ///
20220415 ///
20220416 ///
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
20220503 ///
20220504 ///
20220505 ///
20220506 ///
20220507 ///
20220508 ///
20220509 ///
20220510 ///
20220511 ///
20220512 ///
20220513 ///
20220514 ///
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
20220604 ///
20220605 ///
20220606 ///
20220607 ///
20220608 ///
20220609 ///
20220610 ///
20220611 ///
20220612 ///
20220613 ///
20220614 ///
20220615 ///
20220616 ///
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
20220825 ///
20220826 ///
20220827 ///
20220828 ///
20220829 ///
20220830 ///
20220831 ///
20220901 ///
20220902 ///
20220903 ///
20220904 ///
20220905 ///
20220906 ///
20220907 ///
20220908 ///
20220909 ///
20220910 ///
20220911 ///
20220912 ///
20220913 ///
20220914 ///
20220915


foreach update of local list {

	use "CovidLongitudinal DELP `update'.dta", clear
	
	keep loc_grand_name 
		
	contract loc_grand_name
	
	drop _freq
		
	rename loc_grand_name loc_grand_name`update'
	
	gen counter = _n
	
	save "DELP `update' countries.dta", replace

}
*



use "DELP 20200417 countries.dta" // earliest update date for this model


foreach update of local list {

	merge m:m counter using "DELP `update' countries.dta"
	
	drop _merge

}
*


order counter

qui compress 

save "DELP countries.dta", replace


*





* determine earliest date each country was present (date_present_first) 
* dates on which each country was absent (after their first presence)(date_absent_1*)

use "DELP countries.dta", clear 

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



* country names to loc_grand_name

replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"               
replace loc_grand_name = "Congo" if loc_grand_name == "Congo (Brazzaville)"               
replace loc_grand_name = "Congo DR" if loc_grand_name == "Congo (Kinshasa)"               
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"               
replace loc_grand_name = "Korea South" if loc_grand_name == "Korea, South"               
replace loc_grand_name = "United States of America" if loc_grand_name == "US"               
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"               

                                
isid loc_grand_name update_date_block, sort
                          
                            
                                     

qui compress

save "DELP countries long.dta", replace








view "log CovidLongitudinal DELP.smcl"

log close

exit, clear




