
clear all

cd "$pathCovidLongitudinal"

cd master

capture log close loc_grand_name

log using "log CovidLongitudinal loc_grand_name.smcl", replace name(loc_grand_name)

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
9 "Aruba" ///
10 "Australia" ///
11 "Austria" ///
12 "Azerbaijan" ///
13 "Bahamas" ///
14 "Bahrain" ///
15 "Bangladesh" ///
16 "Barbados" ///
17 "Belarus" ///
18 "Belgium" ///
19 "Belize" ///
20 "Benin" ///
21 "Bhutan" ///
22 "Bolivia" ///
23 "Bosnia and Herzegovina" ///
24 "Botswana" ///
25 "Brazil" ///
26 "Brunei" ///
27 "Bulgaria" ///
28 "Burkina Faso" ///
29 "Burundi" ///
30 "Cambodia" ///
31 "Cameroon" ///
32 "Canada" ///
33 "Cape Verde" ///
34 "Central African Republic" ///
35 "Chad" ///
36 "Chile" ///
37 "China" ///
38 "Colombia" ///
39 "Comoros" ///
40 "Congo" ///
41 "Congo, DR" ///
42 "Costa Rica" ///
43 "Cote d'Ivoire" ///
44 "Croatia" ///
45 "Cuba" ///
46 "Curacao" ///
47 "Cyprus" ///
48 "Czechia" ///
49 "Denmark" ///
50 "Djibouti" ///
51 "Dominica" ///
52 "Dominican Republic" ///
53 "Ecuador" ///
54 "Egypt" ///
55 "El Salvador" ///
56 "Equatorial Guinea" ///
57 "Eritrea" ///
58 "Estonia" ///
59 "Eswatini" ///
60 "Ethiopia" ///
61 "Fiji" ///
62 "Finland" ///
63 "France" ///
64 "French Guiana" ///
65 "French Polynesia" ///
66 "Gabon" ///
67 "Gambia" ///
68 "Georgia" ///
69 "Germany" ///
70 "Ghana" ///
71 "Greece" ///
72 "Grenada" ///
73 "Guadeloupe" ///
74 "Guam" ///
75 "Guatemala" ///
76 "Guinea" ///
77 "Guinea-Bissau" ///
78 "Guyana" ///
79 "Haiti" ///
80 "Holy See" ///
81 "Honduras" ///
82 "Hong Kong" ///
83 "Hungary" ///
84 "Iceland" ///
85 "India" ///
86 "Indonesia" ///
87 "Iran" ///
88 "Iraq" ///
89 "Ireland" ///
90 "Israel" ///
91 "Italy" ///
92 "Jamaica" ///
93 "Japan" ///
94 "Jordan" ///
95 "Kazakhstan" ///
96 "Kenya" ///
97 "Kiribati" ///
98 "Korea, North" ///
99 "Korea, South" ///
100 "Kosovo" ///
101 "Kuwait" ///
102 "Kyrgyzstan" ///
103 "Laos" ///
104 "Latvia" ///
105 "Lebanon" ///
106 "Lesotho" ///
107 "Liberia" ///
108 "Libya" ///
109 "Liechtenstein" ///
110 "Lithuania" ///
111 "Luxembourg" ///
112 "Macao" ///
113 "Madagascar" ///
114 "Malawi" ///
115 "Malaysia" ///
116 "Maldives" ///
117 "Mali" ///
118 "Malta" ///
119 "Marshall Islands" ///
120 "Martinique" ///
121 "Mauritania" ///
122 "Mauritius" ///
123 "Mexico" ///
124 "Micronesia" ///
125 "Moldova" ///
126 "Monaco" ///
127 "Mongolia" ///
128 "Montenegro" ///
129 "Morocco" ///
130 "Mozambique" ///
131 "Myanmar" ///
132 "Namibia" ///
133 "Nepal" ///
134 "Netherlands" ///
135 "New Caledonia" ///
136 "New Zealand" ///
137 "Nicaragua" ///
138 "Niger" ///
139 "Nigeria" ///
140 "North Macedonia" ///
141 "Norway" ///
142 "Oman" ///
143 "Pakistan" ///
144 "Palau" ///
145 "Palestine" ///
146 "Panama" ///
147 "Papua New Guinea" ///
148 "Paraguay" ///
149 "Peru" ///
150 "Philippines" ///
151 "Poland" ///
152 "Portugal" ///
153 "Puerto Rico" ///
154 "Qatar" ///
155 "Reunion" ///
156 "Romania" ///
157 "Russia" ///
158 "Rwanda" ///
159 "Saint Kitts and Nevis" ///
160 "Saint Lucia" ///
161 "Saint Vincent and the Grenadines" ///
162 "Samoa" ///
163 "San Marino" ///
164 "Sao Tome and Principe" ///
165 "Saudi Arabia" ///
166 "Senegal" ///
167 "Serbia" ///
168 "Seychelles" ///
169 "Sierra Leone" ///
170 "Singapore" ///
171 "Sint Maarten" ///
172 "Slovakia" ///
173 "Slovenia" ///
174 "Solomon Islands" ///
175 "Somalia" ///
176 "South Africa" ///
177 "South Sudan" ///
178 "Spain" ///
179 "Sri Lanka" ///
180 "Sudan" ///
181 "Suriname" ///
182 "Sweden" ///
183 "Switzerland" ///
184 "Syria" ///
185 "Taiwan" ///
186 "Tajikistan" ///
187 "Tanzania" ///
188 "Thailand" ///
189 "Timor-Leste" ///
190 "Togo" ///
191 "Tonga" ///
192 "Trinidad and Tobago" ///
193 "Tunisia" ///
194 "Turkey" ///
195 "Turkmenistan" ///
196 "Turks and Caicos Islands" ///
197 "Tuvalu" ///
198 "Uganda" ///
199 "Ukraine" ///
200 "United Arab Emirates" ///
201 "United Kingdom" ///
202 "United States of America" ///
203 "United States Virgin Islands" ///
204 "Uruguay" ///
205 "Uzbekistan" ///
206 "Vanuatu" ///
207 "Venezuela" ///
208 "Viet Nam" ///
209 "Western Sahara" ///
210 "Yemen" ///
211 "Zambia" ///
212 "Zimbabwe"


gen loc_grand_name_numlabel = loc_grand_id

label values loc_grand_name_numlabel country



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


qui compress

save "loc_grand_name.dta", replace


******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "loc_grand_name data dictionary.csv", replace 
	
restore



******

* make lists for transforming country names to loc_grand_name

local list DELP IHME IMPE LANL SRIV UCLA YYGU JOHN

foreach model of local list {

list loc_grand_name `model' if loc_grand_name != `model' & `model' != "", noo clean

}
*


codebook loc_grand_name if loc_grand_id != .


codebook DELP IHME IMPE LANL SRIV UCLA YYGU JOHN



view "log CovidLongitudinal loc_grand_name.smcl"

exit, clear
