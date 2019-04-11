***********HW 7***************
*******problem 1*************
clear

cd "/Users/dangyang/Downloads/Econ_452"
use "CARD.dta", clear

gen lwage = log(wage)
reg lwage educ exper
** Reset Test **
estat ovtest
gen exper2 = exper^2
reg lwage educ exper*
estat ovtest
test exper=exper2=0
gen educxexper = educ*exper
reg lwage educ exper educxexper
estat ovtest
gen educxexper2 = educ*exper2
reg lwage educ exper exper2 educxexper*
estat ovtest
reg lwage educ exper exper2 IQ
estat ovtest
gen iqxeduc = iq*educ
reg lwage educ exper* IQ iqxeduc
estat ovtest

*******problem 2 *************
clear
cd "/Users/dangyang/Downloads/Econ_452"
use "BWGHT.dta", clear
des

gen lbwght = log(bwght)
gen lfaminc = log(faminc)
reg lbwght cigs lfaminc parity male white
reg lwage cigs lfaminc parity male white motheduc fatheduc
test motheduc fatheduc

******* problem 3 *************
clear





