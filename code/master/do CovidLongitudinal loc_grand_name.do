
clear all

cd "$pathCovidLongitudinal"

cd master

capture log close 

log using "log CovidLongitudinal loc_grand_name.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal loc_grand_name.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek 
***************************************************************************


* create location grand name and id // loc_grand_name and loc_grand_id
	
* input file(s): loc_grand_name.xlsx
* output file(s): loc_grand_name.dta

* output data dictionary file(s): "loc_grand_name data dictionary.csv"





import excel using "loc_grand_name.xlsx", clear firstrow


label define country ///
1 "Afghanistan" ///
2 "Albania" ///
3 "Algeria" ///
4 "Andorra" ///
5 "Angola" ///
6 "Antigua and Barbuda" ///
7 "Argentina" ///
8 "Armenia" ///
9 "Australia" ///
10 "Austria" ///
11 "Azerbaijan" ///
12 "Bahamas" ///
13 "Bahrain" ///
14 "Bangladesh" ///
15 "Barbados" ///
16 "Belarus" ///
17 "Belgium" ///
18 "Belize" ///
19 "Benin" ///
20 "Bhutan" ///
21 "Bolivia" ///
22 "Bosnia and Herzegovina" ///
23 "Botswana" ///
24 "Brazil" ///
25 "Brunei" ///
26 "Bulgaria" ///
27 "Burkina Faso" ///
28 "Burundi" ///
29 "Cambodia" ///
30 "Cameroon" ///
31 "Canada" ///
32 "Cape Verde" ///
33 "Central African Republic" ///
34 "Chad" ///
35 "Chile" ///
36 "China" ///
37 "Colombia" ///
38 "Comoros" ///
39 "Congo" ///
40 "Congo DR" ///
41 "Costa Rica" ///
42 "Cote d'Ivoire" ///
43 "Croatia" ///
44 "Cuba" ///
45 "Cyprus" ///
46 "Czechia" ///
47 "Denmark" ///
48 "Djibouti" ///
49 "Dominica" ///
50 "Dominican Republic" ///
51 "Ecuador" ///
52 "Egypt" ///
53 "El Salvador" ///
54 "Equatorial Guinea" ///
55 "Eritrea" ///
56 "Estonia" ///
57 "Eswatini" ///
58 "Ethiopia" ///
59 "Fiji" ///
60 "Finland" ///
61 "France" ///
62 "Gabon" ///
63 "Gambia" ///
64 "Georgia" ///
65 "Germany" ///
66 "Ghana" ///
67 "Greece" ///
68 "Grenada" ///
69 "Guatemala" ///
70 "Guinea" ///
71 "Guinea Bissau" ///
72 "Guyana" ///
73 "Haiti" ///
74 "Honduras" ///
75 "Hungary" ///
76 "Iceland" ///
77 "India" ///
78 "Indonesia" ///
79 "Iran" ///
80 "Iraq" ///
81 "Ireland" ///
82 "Israel" ///
83 "Italy" ///
84 "Jamaica" ///
85 "Japan" ///
86 "Jordan" ///
87 "Kazakhstan" ///
88 "Kenya" ///
89 "Kiribati" ///
90 "Korea North" ///
91 "Korea South" ///
92 "Kosovo" ///
93 "Kuwait" ///
94 "Kyrgyzstan" ///
95 "Laos" ///
96 "Latvia" ///
97 "Lebanon" ///
98 "Lesotho" ///
99 "Liberia" ///
100 "Libya" ///
101 "Liechtenstein" ///
102 "Lithuania" ///
103 "Luxembourg" ///
104 "Madagascar" ///
105 "Malawi" ///
106 "Malaysia" ///
107 "Maldives" ///
108 "Mali" ///
109 "Malta" ///
110 "Mauritania" ///
111 "Mauritius" ///
112 "Mexico" ///
113 "Micronesia" ///
114 "Moldova" ///
115 "Monaco" ///
116 "Mongolia" ///
117 "Montenegro" ///
118 "Morocco" ///
119 "Mozambique" ///
120 "Myanmar" ///
121 "Namibia" ///
122 "Nepal" ///
123 "Netherlands" ///
124 "New Zealand" ///
125 "Nicaragua" ///
126 "Niger" ///
127 "Nigeria" ///
128 "North Macedonia" ///
129 "Norway" ///
130 "Oman" ///
131 "Pakistan" ///
132 "Palestine" ///
133 "Panama" ///
134 "Papua New Guinea" ///
135 "Paraguay" ///
136 "Peru" ///
137 "Philippines" ///
138 "Poland" ///
139 "Portugal" ///
140 "Qatar" ///
141 "Romania" ///
142 "Russia" ///
143 "Rwanda" ///
144 "Saint Kitts and Nevis" ///
145 "Saint Lucia" ///
146 "Saint Vincent and the Grenadines" ///
147 "Samoa" ///
148 "San Marino" ///
149 "Sao Tome and Principe" ///
150 "Saudi Arabia" ///
151 "Senegal" ///
152 "Serbia" ///
153 "Seychelles" ///
154 "Sierra Leone" ///
155 "Singapore" ///
156 "Slovakia" ///
157 "Slovenia" ///
158 "Solomon Islands" ///
159 "Somalia" ///
160 "South Africa" ///
161 "South Sudan" ///
162 "Spain" ///
163 "Sri Lanka" ///
164 "Sudan" ///
165 "Suriname" ///
166 "Sweden" ///
167 "Switzerland" ///
168 "Syria" ///
169 "Tajikistan" ///
170 "Taiwan" ///
171 "Tanzania" ///
172 "Thailand" ///
173 "Timor Leste" ///
174 "Togo" ///
175 "Tonga" ///
176 "Trinidad and Tobago" ///
177 "Tunisia" ///
178 "Turkey" ///
179 "Uganda" ///
180 "Ukraine" ///
181 "United Arab Emirates" ///
182 "United Kingdom" ///
183 "United States of America" ///
184 "Uruguay" ///
185 "Uzbekistan" ///
186 "Vanuatu" ///
187 "Venezuela" ///
188 "Viet Nam" ///
189 "Western Sahara" ///
190 "Yemen" ///
190 "Zambia" ///
191 "Zimbabwe"


gen loc_grand_name_numlabel = loc_grand_id

label values loc_grand_name_numlabel country

tab loc_grand_id



* gen loc_grand_name_snail and replace all spaces with indeline

gen loc_grand_name_snail = loc_grand_name

replace loc_grand_name_snail = subinstr(loc_grand_name_snail, " ", "_", .)




label var loc_grand_order "country order"

label var loc_grand_name "country name"

label var loc_grand_id "country id number"

label var loc_grand_iso "country iso3 code"

label var loc_grand_name_numlabel "country name number label"

label var loc_grand_name_snail "country name snail"


label var DELP "country names used in DELP COVID-19 epidemic model"
label var IHME "country names used in IHME COVID-19 epidemic model"
label var IMPE "country names used in IMPE COVID-19 epidemic model"
label var LANL "country names used in LANL COVID-19 epidemic model"
label var SRIV "country names used in SRIV COVID-19 epidemic model"
label var UCLA "country names used in UCLA COVID-19 epidemic model"
label var YYGU "country names used in YYGU COVID-19 epidemic model"
label var JOHN "country names used in JOHNs Hopkins COVID-19 epidemic data"


label var UNFPA2020 "country names used in UNFPA 2020 population estimates"
label var population2020 "UNFPA 2020 population estimates"
label var UNFPA2021 "country names used in UNFPA 2021 population estimates"
label var population2021 "UNFPA 2021 population estimates"
label var UNFPA2022 "country names used in UNFPA 2022 population estimates"
label var population2022 "UNFPA 2022 population estimates"
label var region "WHO region"




******

* make lists for transforming country names to loc_grand_name

local list DELP IHME IMPE LANL SRIV UCLA YYGU JOHN

foreach model of local list {

list loc_grand_name `model' if loc_grand_name != `model' & `model' != "", noo clean

}
*


codebook loc_grand_name if loc_grand_id != .

tab mapping if loc_grand_id == .

list loc_grand_name mapping if loc_grand_id == .


codebook DELP IHME IMPE LANL SRIV UCLA YYGU JOHN


label var modelmix "Presence 1 or absence 0 of country in models DELP IHME IMPE LANL SRIV UCLA YYGU" 

tab modelmix, sort


label var modelsnumber "Number of models country present in"

tab modelsnumber


label var mapping "mapping plan"

tab mapping


label var mappingcolor "mapping color code"

tab mappingcolor


label var mappingcolormeaning "mapping plan meaning"

tab mappingcolormeaning

drop Y Z



qui compress

save "loc_grand_name.dta", replace


******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "loc_grand_name data dictionary.csv", replace 
	
restore




view "log CovidLongitudinal loc_grand_name.smcl"

exit, clear
