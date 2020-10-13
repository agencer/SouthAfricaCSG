////////////////////////////////////////////////////////////////////////////////
//////////////||Politics of Social Assistance in South Africa||/////////////////
///////////////////////////||     APPENDIX     ||///////////////////////////////
////////////////////////////////////////////////////////////////////////////////



*** 1 ---- Getting Ready -------------------------------------------------------

use "data_pol_sainsa.dta", clear
est clear 
set more off

*	Running the regression with most requirement to take the sample so that we 
*could compare meaningful results across regressions.
logit _csg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year, or robust cluster(province)
ereturn list
gen sample=e(sample)

*	We need "outreg2" to have tables. If it is not installed, plaese install it
*via the following command by deleting the star in the beginning.
*	ssc  install outreg2



*** 2 ---- Table 5: The Child Support Grant Incidence Rates by Different Subpopulations
*	Please see "sum_analysis.do"



*** 3 ---- Table 6: Cross-Tabular Analysis of the CSG Incidence by Protest Participation and Voting for the ANC (the italicized text indicates the standard deviation)
*	Please see "sum_analysis.do"



*** 4 ---- Table 7: Percentage of protestors, ANC-supporters and the Child Support Grant incidence across provinces. 
*	Please see "sum_analysis.do"



*** 5 ---- Table 8: Demographics of Protestors.
tab hh_child protest if sample==1, chi  col nofreq
tab race protest if sample==1, chi col nofreq
tab tu protest if sample==1, chi col nofreq
tab h_inc protest if sample==1, chi col nofreq
tab gender protest if sample==1, chi col nofreq
tab education protest if sample==1, chi col nofreq
tab age protest if sample==1, chi col nofreq
tab citizen protest if sample==1, chi col nofreq
tab citizen protest if sample==1, chi col nofreq
tab geo_location protest if sample==1, chi col nofreq




*** 6 ---- Table 9: Models with Odds-Ratios. Controls are gradually introduced
*	Please see "reg_analysis.do", Table 5 in the article.



*** 7 ---- Table 10: Models with Odds-Ratios. Controls are gradually introduced. With all variables.
*	Please see "reg_analysis.do"Table 5 in the article.



*** 8 ---- Table 11: Interpretation of Interaction Term Based on the Sixth Model
*	Please see "reg_analysis.do", Table 6 in the article.



*** 9 ---- Table 12: Relative Levels of Odd-Ratios of CGS Benefit by Type of Electoral and Protest Behavior.
*	Please see "reg_analysis.do", Table 7 in the article.



*** 10 ---- Table 13: The Odds-Ratios of Receiving the CSG based on Protest Types during the last five years. 
*	Please see "reg_analysis.do", Table 8 in the article.



*** 11 ---- Table 14: Models with Odds-Ratios. Language and Religion Controls are Gradually Introduced

//	Base Model (Model 6 from Table 5 in the Article, Table 9 in Appendix)	//
logit _csg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model1
outreg2 [model1] using appendix1.xls, replace dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 5) eform

//	Language	//
logit _csg1 ib2.protest##ib2.vote_ANC ib1.language ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model2
outreg2 [model2] using appendix1.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 5) eform

//	Religion	//
logit _csg1 ib2.protest##ib2.vote_ANC ib3.religion ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model3
outreg2 [model3] using appendix1.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 5) eform

//	Language + Religion	//
logit _csg1 ib2.protest##ib2.vote_ANC ib1.language ib3.religion ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model4
outreg2 [model4] using appendix1.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 5) eform



*** 12 ---- Table 15: Voting for the ANC in the next Election 


//	Base Model (Model 6 from Table 4)	//
logit _csg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model1
outreg2 [model1] using appendix2.xls, replace dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 5) eform

//	Voting for the ANC in the Next Election	//
logit _csg1 ib2.protest##ib2.vote_ANC_next ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model2
outreg2 [model2] using appendix2.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 5) eform



*** 13 ---- Table 16: The Odds-Ratios of Receiving the CSG based on Protest Types in the course of last 12 months.

//	Base Model (Model 6 from Table 4)	//
logit _csg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province if year==2016, or robust cluster(province)
est store model1
outreg2 [model1] using appendix3.xls, replace dec(3) symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle (Total Protest) eform
//	Model-2	//
logit _csg1 ib2.peace_protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province if year==2016, or robust cluster(province)
est store model2
outreg2 [model2] using appendix3.xls, append dec(3) symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle (Peaceful Protest) eform
//	Model-3	//
logit _csg1 ib2.dist_protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province if year==2016, or robust cluster(province)
est store model3
outreg2 [model3] using appendix3.xls, append dec(3) symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle (Distruptive Protest) eform
//	Model-4	//
logit _csg1 ib2.viol_protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province if year==2016, or robust cluster(province)
est store model4
outreg2 [model4] using appendix3.xls, append dec(3) symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle (Violent Protest) eform



*** 14 ---- Table 17: Models with Odds-Ratios. Childs Support Grant (Model 1) Old-Age Grant (Model 2), Disability Grant (Model 3), All Grants (Model 4).

//	Base Model (Model 6 from Table 4)	//
logit _csg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model1
outreg2 [model1] using appendix4.xls, replace dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 1) eform
//	Model-2 - Old-Age Grant	//
logit _oag1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model2
outreg2 [model2] using appendix4.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 2) eform
//	Model-3	- Disability Grant//
logit _dg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model3
outreg2 [model3] using appendix4.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 3) eform
//	Model-4	- All Social Grants//
logit soc_ass1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model4
outreg2 [model4] using appendix4.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 4) eform



*** 15 ---- Table 18: Models with Logistic Regression (Odds Ratios, Model 1) and Linear Probability Model (Model 2).

//	Base Model (Model 6 from Table 4)	//
logit _csg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model1
outreg2 [model1] using appendix5.xls, replace dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 1) eform
//	Linear Probability Model	//
reg _csg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, robust cluster(province)
est store mode21
outreg2 [model2] using appendix5.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(R-squared, `e(r2)') ctitle(Model 2)


*** 16 ---- Table 19: Voter Abstention Reasons

use "G:\My Drive\Projects\EMW\+South_Africa_Paper\Manuscript\Submission\final submission\Revision\Data\Last\appendix.dta", clear
tab reas_abst if sample == 1
tab reas_abst year if sample == 1, nofreq col
