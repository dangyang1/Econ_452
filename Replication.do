*** Program name: Sample Do File.do

* NOTE:  Whenever a line begins with an asterisk, STATA ignores the whole line - this is just a comment/note.
capture log close
clear /* The 'clear' command gets rid of all data in memory*/
set memory 60000 /* Allocate 60MB memory to Stata */
set matsize 150
set more 1

* This line tells Stata where the files are located. USE "" if your folder names contain spaces.
* THIS IS THE ONLY LINE YOU NEED TO CHANGE. 

cd "/Users/dangyang/Downloads/Econ_452"


* NOTE:  The next lines set up the .log file.  It will contain all of the output
* from this program when it is run. It will be saved in the same directory as the
* program and will be replaced with each new run. I have called the log-file ProblemSet1. 
log using Replication_v2.log, replace

* This line reads in the data set called WAGE2.dta in the same directory (in my case this is directory "Datasets").


* I. SAMPLE STATISTICS: TABLE 1

*For the households:

use "ABChousehold.dta", clear

ttest age if year==2009, by (abc)
ttest hhhead if year==2009, by (abc)
ttest assets if year==2009, by (abc)
ttest cellphoneowner if year==2009, by (abc)
ttest usecellphone if year==2009, by (abc)


*For the teachers:

use "ABCteacher.dta", clear

ttest teacherage if year==2009, by (abc)
ttest femaleteacher if year==2009, by (abc)
ttest local if year==2009, by (abc)
ttest levelno if year==2009, by (abc)

*For testcores

use "ABCtestscore.dta", clear

ttest writezscore if year==2009, by (abc)
ttest mathzscore if year==2009, by (abc)

* II. DID RESULTS - TABLE 2

use "ABCtestscore.dta", clear
* OUTCOME: mathzscore 
keep if round==1|round==2|round==4

sum mathzscore
sum writezscore

reg mathzscore abc post abcpost, robust
reg writezscore abc post abcpost, robust
reg mathzscore abc post abcpost age female hausa zarma kanuri dosso, robust
reg writezscore abc post abcpost age female hausa zarma kanuri dosso, robust
gen agesq = age^2
reg mathzscore abc post abcpost age agesq female hausa zarma kanuri dosso, robust
test age=agesq
reg writezscore abc post abcpost age agesq female hausa zarma kanuri dosso, robust
test age=agesq

qui tab codevillage, gen(village_dum)
reg mathzscore abc post abcpost age agesq female village_dum*, robust
reg writezscore abc post abcpost age agesq female village_dum*, robust


log close

exit, clear
