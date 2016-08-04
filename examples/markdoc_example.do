cap qui log c

qui log using example, replace
/***
Profiling ado programs
======================
		  
The diagram below shows the ado-programs that are executed by 
`markdoc` package. 
		  
![ado-Programs that are called by `markdoc` package](markdoc.pdf)
***/
qui log c   
adoprofile markdoc example, export(tex) texmaster  replace
diagram using adoprofile.gv, export(markdoc.pdf) magnify(.5) replace


