***********HW5***************
*******problem 1*************
clear

cd "/Users/dangyang/Downloads"
use "BEAUTY.dta", clear

gen lwage=log(wage)
reg lwage female
reg lwage female educ
predict yhat_f if female==1
predict yhat_m if female == 0
twoway (scatter lwage educ)(lfit yhat_f educ)(lfit yhat_m educ)

reg lwage female educ exper black

*******problem 2*************
//female only
reg lwage educ if female == 1
//male only
reg lwage educ if female == 0
//male-female interaction
gen interaction = educ * female
reg lwage educ female interaction
predict yhat_fi if female==1
predict yhat_mi if female==0
twoway(scatter lwage educ)(lfit yhat_fi educ)(lfit yhat_mi educ)

sum educ

reg lwage educ female interaction exper black bigcity

*******problem 3*************
clear

cd "/Users/dangyang/Downloads"
use "SMOKE.dta", clear

sum smoke
reg smoke educ white

reg smoke educ white cigprice
reg smoke educ white restaurn
reg smoke educ white, robust

*******problem 4*************
clear

cd "/Users/dangyang/Downloads"
use "GPA2.dta", clear

reg colgpa sat hsrank hsize athlete
//if student is not an athlete
reg colgpa sat hsrank hsize if athlete==0
//if student is an athlete
reg colgpa sat hsrank hsize if athlete==1










