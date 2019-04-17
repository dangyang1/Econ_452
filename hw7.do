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
reg lwage educ exper educxexper1
estat ovtest
gen educxexper2 = educ*exper2
reg lwage educ exper exper2 educxexper*
estat ovtest
sum exper
reg lwage educ exper exper2 IQ
estat ovtest
gen iqxeduc = IQ*educ
reg lwage educ exper* IQ iqxeduc
estat ovtest
test IQ=iqxeduc=0

*******problem 2 *************
clear
cd "/Users/dangyang/Downloads/Econ_452"
use "BWGHT.dta", clear
des

reg lbwght cigs lfaminc parity male white
sum lbwght
reg lbwght cigs lfaminc parity male white motheduc fatheduc
test motheduc fatheduc

******* problem 3 *************
clear

cd "/Users/dangyang/Downloads/Econ_452"
use "GPA2.dta", clear

des

gen hsize2 = hsize^2
gen interact1 = female*black
reg sat hsize hsizesq female black interact1
test hsize hsizesq

ttest sat, by(black)
test interact1 black

******* PART IIA : Time Series *************
clear

cd "/Users/dangyang/Downloads/Econ_452"
use "TRAFFIC2.dta", clear

browse year spdlaw feb mar apr may jun jul aug sep oct nov dec

reg totacc feb mar apr may jun jul aug sep oct nov dec
reg totacc feb mar apr may jun jul aug sep oct nov dec unem
reg totacc feb mar apr may jun jul aug sep oct nov dec unem spdlaw
reg totacc feb mar apr may jun jul aug sep oct nov dec unem spdlaw year
reg prcfat feb mar apr may jun jul aug sep oct nov dec unem spdlaw
reg prcfat feb mar apr may jun jul aug sep oct nov dec unem spdlaw year


******* PART IIB : Time Series *************
clear

cd "/Users/dangyang/Downloads/Econ_452"
use "INTDEF.RAW", clear

reg i3 inf def
line i3 inf def year

browse inf inf_1
browse def def_1
reg inf def inf_1 def_1
corr inf inf_1
corr def def_1

reg inf_1 def_1
scatter i3 year

gen after79 = (year>1979)
reg inf_1 def_1 after79






