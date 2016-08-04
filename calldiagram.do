/*** DO NOT EDIT THIS LINE -----------------------------------------------------
Version: 1.0.0
Title: calldiagram
Description: analyzes executed ado programs and produces a dynamic profile 
diagram named _calldiagram.gv_ which can be rendered to a graphical file 
using {help diagram} command. For more information visit
adding [hyperlink](http://www.haghish.com/diagram/diagram.php) 
----------------------------------------------------- DO NOT EDIT THIS LINE ***/


/***
Syntax
======

{p 8 16 2}
{cmd: calldiagram} [{bf:supress}({it:adoname list})] {it:Stata-command}

The __calldiagram__ program tracks all of the executed ado programs, including 
Stata open-source programs (e.g. _clear_ and _findfile_ both are open source 
adofiles that can be viewed using {help viewsource} command.   

In order to avoid including Stata adoprograms in the profile diagram, provide 
the list of the program names that you wish to ignore using the 
__supress(_adoname list_)__ subcommand. This subcommand can be useful for 
generating profile diagrams that only include adoprograms included in a 
userwritten package (see the example section). 

Description
===========

generates dynamic profile diagram, illustrating the chain of executed 
ado-programs in Stata. The command can be used to visualize all of the commands 
that are executed when a user-written package is executed.  

Remarks
=======

The remarks are the detailed description of the command and its 
nuances. Official documented Stata commands don't have much for 
remarks, because the remarks go in the documentation.
Example(s)
=================

    produce a profile from the makediagram.ado which is included in {help diagram} package
        . copy "https://github.com/haghish/diagram/blob/master/examples/cluster.dta?raw=true" ///
          "cluster.dta", replace
        . calldiagram makediagram using "cluster.dta", export(cluster.gv) replace
		
    the previous example includes Stata ado.programs that can be suppressed
        . calldiagram suppress(duplicates clear label) 					///
          makediagram using "cluster.dta", export(cluster.gv)  replace

Author
======

__E. F. Haghish__     
Center for Medical Biometry and Medical Informatics     
University of Freiburg, Germany     
_and_        
Department of Mathematics and Computer Science       
University of Southern Denmark     
haghish@imbi.uni-freiburg.de     
      
[http://www.haghish.com/markdoc](http://www.haghish.com/statistics/stata-blog/reproducible-research/markdoc.php)         
Package Updates on [Twitter](http://www.twitter.com/Haghish)     

- - -

_This help file was dynamically produced by[MarkDoc Literate Programming package](http://www.haghish.com/markdoc/)_ 
***/


markdoc calldiagram.do, export(sthlp) replace
