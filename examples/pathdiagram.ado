
*! version 2.0 -- 11/8/01 9/3/09 -- pbe -- updated for stata 11

cap prog drop pathdiagram
program define pathdiagram
	version 8
	syntax anything
    
	// Export the filename!   
	tempfile edited
	tempname knot
	qui file open `knot' using "`edited'", write text replace
	file write `knot' "digraph G {" _n ///
		"node [shape=rectangle];" _n ///
		"graph [layout=neato, outputorder=edgesfirst, overlap=true];" _n ///
		`"1 [pos="-3,1!", label="Var 1"];"' _n ///
		`"2 [pos="-3,-1!", label="Var 2"];"' _n ///
		`"3 [pos="-1,0!", label="Var 3"];"' _n ///
		`"4 [pos="1,0!", label="Var 4"];"' _n ///
		`"e1 [shape=circle, pos="-1,-1!", label="e"];"' _n              ///
		`"e2 [shape=circle, pos="1,-1!", label="e"];"' _n               
	 
	
	     

   tempvar touse
   local totvar "`0'"
   local totexp "`0'"
   local totvar = subinstr("`totvar'", "(", " ",.)
   local totvar = subinstr("`totvar'", ")", " ",.)

   mark `touse'
   *markout `touse' `totvar'


  while "`totexp'" ~= "" {
    
    gettoken open totexp : totexp, parse("(") 
	if `"`open'"' != "(" {
		error 198
	}
	gettoken next totexp : totexp, parse(")")

	while `"`next'"' != ")" {
		if `"`next'"'=="" { 
			error 198
		}
	  local list `next'
	  gettoken next totexp : totexp, parse(")")
	}
	
	
	di as err `"First Group:`i':`list'"'
	
	// Calculate number of variables
	tokenize `list', parse(" ")
	local i 0
	local depvar "`1'"
	
	while "`1'" != "" {
		
		if "`i'" >= "1" {
			file write `knot' `"`macval(1)'"' " -> " `"`macval(depvar)'"' _n
			di as err `"`1' -> `depvar'"'
		}
		
		local pre "`1'"
		local i `++i'
		macro shift
	}
	
	local varnumber `i' 
	
	// figure out how many variables exist
	
	tokenize `list', parse(" :")
	if "`2'"==":" {
		local name "`1'"
		mac shift 2
	}
	
	
	

    *local vl1 `varlist'
    *regress `list' if `touse', beta noheader
    *display _skip(17) in green "n = "  in yellow e(N) in green "  R2 = " in yellow %6.4f e(r2) in green "  sqrt(1 - R2) = " in yellow %6.4f sqrt(1-e(r2))
    *display
 }
	
	file write `knot' "}" 
	qui file close `knot'
	copy "`edited'" diagram.txt, replace
	
end

use "http://www.ats.ucla.edu/stat/data/hsb2", clear
pathdiagram (read write[dir="both"])(math read[] write[])(science math[] read[] write[])

