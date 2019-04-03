***********HW6***************
*******problem 1*************
clear

cd "/Users/dangyang/Documents/Econ_452"
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
