////////////////////////////////////////////////////////////////////////////////
//////////////||Politics of Social Assistance in South Africa||/////////////////
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



*** 2 ---- Table 5: Models with Odds-Ratios. Controls are gradually introduced.

//	Model-1	//
logit _csg1 ib2.protest ib4.race ib2.tu ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model1
outreg2 [model1] using result.xls, replace dec(3) label symbol(***,**,*, †) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 1) eform
//	Model-2	//
logit _csg1 ib2.vote_ANC ib4.race ib2.tu ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model2
outreg2 [model2] using result.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 2) eform
//	Model-3	//
logit _csg1 ib2.protest ib2.vote_ANC ib4.race ib2.tu ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year  if sample==1, or robust cluster(province)
est store model3
outreg2 [model3] using result.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 2) eform
//	Model-4	//
logit _csg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model4
outreg2 [model4] using result.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 3) eform
//	Model-5	//
logit _csg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model5
outreg2 [model5] using result.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 4) eform
//	Model-6	//
logit _csg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
est store model6
outreg2 [model6] using result.xls, append dec(3) label symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle(Model 5) eform



*** 3 ---- Figure 1: Predicted Probabilities of Interaction between Protest and ANC Support. Other Variables fixed at mean values. 

//	Based on Table4-Model6 - Predicted Probability	//
logit _csg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
margins protest#vote_ANC, atmeans
marginsplot



*** 4 ---- Removed: Predicted Probabilities of Interaction between Protest and ANC Support. Other Variables fixed at mean values by Race.

//	Predicted Probabilities by Race	Based on Table4-Model6	//
logit _csg1 ib2.protest##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib3.soc_ass_sat ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province ib2008.year if sample==1, or robust cluster(province)
margins, at(protest=(1(1)2)) over(vote_ANC race) atmeans
marginsplot



*** 5 ---- Table 8: The Odds-Ratios of Receiving the CSG based on Protest Types during the last five years.

recode peace_part (1/2=1 "Yes, protest in the last five year")(3/5=2 "No"), gen(peace_protest_5year)
recode dist_part (1/2=1 "Yes, protest in the last five year")(3/5=2 "No"), gen(dist_protest_5year)
recode viol_part (1/2=1 "Yes, protest in the last five year")(3/5=2 "No"), gen(viol_protest_5year)

//	Model-1	//
logit _csg1 ib2.peace_protest_5year##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province if year==2016, or robust cluster(province)
est store model1
outreg2 [model1] using result_2016_5years.xls, replace dec(3) symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle (Peaceful Protest) eform
//	Model-2	//
logit _csg1 ib2.dist_protest_5year##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province if year==2016, or robust cluster(province)
est store model2
outreg2 [model2] using result_2016_5years.xls, append dec(3) symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle (Distruptive Protest) eform
//	Model-3	//
logit _csg1 ib2.viol_protest_5year##ib2.vote_ANC ib4.race ib2.tu ib1.politization ib4.ideology ib1.income_source ib5.h_inc ib1.dwelling ib0.hh_child ib2.gender ib5.education ib1.age ib1.citizen ib1.geo_location ib1.province if year==2016, or robust cluster(province)
est store model3
outreg2 [model3] using result_2016_5years.xls, append dec(3) symbol(***,**,*, +) alpha (0.001, 0.01, 0.05, 0.1) addstat(Pseudo R-squared, `e(r2_p)') ctitle (Violent Protest) eform
