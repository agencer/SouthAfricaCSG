////////////////////////////////////////////////////////////////////////////////
//////////////||Politics of Social Assistance in South Africa||/////////////////
////////////////////////////////////////////////////////////////////////////////


*** 1 ---- Getting Ready

use "data_pol_sainsa.dta", clear
est clear 
set more off

*** 2 ---- Descriptives for Social Assistance and Child Support Grant

tab soc_ass1 if sample==1
tab _csg1 if sample==1

*	Table 2 in the Article
tab province if sample==1, sum(_csg1)  nofreq
tab year if sample==1, sum(_csg1)  nofreq
tab geo_location if sample==1, sum(_csg1)  nofreq
tab race if sample==1, sum(_csg1)  nofreq
tab gender if sample==1, sum(_csg1) nofreq
tab vote_ANC1 if sample==1, sum(_csg1) nofreq
tab protest1 if sample==1, sum(_csg1) nofreq

*	Table 3
tab vote_ANC1 protest1 if sample==1, sum(_csg1) nofreq

*** 3 ---- Descriptives for Protest and Elections in each Individual Province

*	Table 4 in the Article
preserve
collapse (mean) vote_ANC1 protest1 _csg1 if sample==1, by(province)
tab vote_ANC1 protest1, chi nofreq col
bysort province: tab vote_ANC1 protest1, chi nofreq col
edit
restore


