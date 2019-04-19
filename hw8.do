***********HW 8***************
*******PART 1*************
clear

cd "/Users/dangyang/Downloads/Econ_452"
use "star8se2.dta", clear

//dummy variables for class size
gen small = (cltypek2==1)
gen regular = (cltypek2==2)
gen regularaide = (cltypek2==3)

gen count= (cltypek != cltypek2)
tab count

//check if actual classes are random and about the same composition
gen female=(ssex==2)
tab cltypek2, sum (female)
gen black = (srace==2)
tab cltypek2, sum(black)
gen free = (sesk==1)
tab cltypek2, sum(free)
tab cltypek2, sum(sbirthy)

//math test score
reg tmathssk regular regularaide
sum tmathssk

reg treadssk regular regularaide
sum treadssk

//1 stdev change
egen mathSD = sd(tmathssk)
gen tmathsskSD = tmathssk/mathSD
reg tmathsskSD regular regularaide

//added test score PDFs
kdensity tmathssk if small==0, nogr gen(x0 fx0)
kdensity tmathssk if small==1, nogr gen(fx1) at (x0)
twoway line fx1 fx0 x0, sort ytitle(density) xtitle(Math scores) title("Figure 1") 
legend(label(1 " Small classes") label(2 "Large classes"))

//IV test with Random Assigned
reg cltypek2 cltypek
gen smallrand = (cltypek==1)
gen regularrand= (cltypek==2)
gen aiderand = (cltypek==3)
ivreg tmathssk (regular regularaide = regularrand aiderand)
ivreg treadssk (regular regularaide = regularrand aiderand)

*******PART 2*************
*******Problem 2*************
clear

cd "/Users/dangyang/Downloads/Econ_452"
use "CARD.dta", clear

//using nearc4 IV conditions
reg educ nearc4
reg nearc4 IQ
reg IQ nearc4 smsa66







