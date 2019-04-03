***********HW6***************
*******problem 1*************
clear

cd "/Users/dangyang/Downloads/Econ_452"
use "BEAUTY.dta", clear

gen lwage = log(wage)
reg lwage educ

gen HSdrop = (educ<12)
gen HSgrad = (educ==12)
gen college = (educ>12)

reg lwage HSgrad college
sum lwage if HSdrop==1
sum lwage if HSgrad==1
sum lwage if college==1

reg lwage HSgrad college exper female black bigcity

sum lwage

*******problem 2*************

gen below = (looks<3)
gen average = (looks==3)
gen above = (looks>3)

reg lwage below above if female==1
test below = above
test below = above = _cons

reg lwage below above educ exper black bigcity if female==1
test above = below = 0

*******problem 3*************

clear

cd "/Users/dangyang/Downloads/Econ_452"
use "NBASAL.dta", clear

reg wage guard forward
reg points lwage

reg lwage points forward center
predict yhat_g if guard==1
predict yhat_f if forward==1
predict yhat_c if center ==1
twoway (scatter lwage points)(lfit yhat_g points)(lfit yhat_f points)(lfit yhat_c points)

reg lwage points rebounds assists exper forward center marr
test marr = 0









