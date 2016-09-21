cap qui log c

qui log using example, replace

/***
Profiling ado programs
======================
		  
The diagram below shows the ado-programs that are executed by 
`markdoc` package. 
		  
![ado-Programs that are called by `markdoc` package](graph.png)
***/

qui log c   

adoprofile markdoc example, export(html)  replace
diagram using ./adoprofile.gv, export(graph.png) magnify(.5) replace


