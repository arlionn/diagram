/*** DO NOT EDIT THIS LINE -----------------------------------------------------
Title: makediagram
Description: generates DOT diagram file from data sets
----------------------------------------------------- DO NOT EDIT THIS LINE ***/


/***
Syntax
======

{p 8 16 2}
{cmd: makediagram} {help using} {it:filename} [{cmd:,} 
{it:replace} {it:export(filename)} {it:graphtype(name)} {it:label(str)} 
{it:style(str)} ]
{p_end}

{* the new Stata help format of putting detail before generality}{...}
{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt:{opt replace}}replace the exported DOT file{p_end}
{synopt:{opt graphtype(name)}}specifies the  
type of the graph which can be {bf:digraph} (default) or {bf:graph} (i.e. undirected). {p_end}
{synopt:{opt e:xport(filename)}}export the DOT diagram file. {p_end}
{synopt:{opt label(str)}}specifies the label of the graph{p_end}
{synopt:{opt style(str)}}appends a DOT style sheet to the DOT file{p_end}
{synoptline}
{p2colreset}{...}

Description
===========

__makediagram__ generates a [DOT](http://en.wikipedia.org/wiki/Dot) file from 
a data set that can be rendered to a graphical file using {help diagram} program 
within Stata. the data set should be prepared as explained in the next section.


Variable discription
====================

The data set should have 5 variables named __cluster__ (numeric), __from__ 
(numeric or string), __to__ (numeric or string), __label__ (string), and 
__properties__ (string). The numeric variables can have labels which also changes 
the labels in the DOT file. 

	
   cluster     from       to        label     properties
   ---------   --------   --------  -------   -----------
   numeric     numeric    numeric   string    string
   or          or         or
   string      string     string
  
   
  
the __cluster__, __label__, and __properties__ can be missing. however, the 
__from__ and __to__ variables specifies which nodes are connected to one another. 
in directed graphs, the direction is __"from"__ towards __"to"__. However, in 
undirected graphs, this direction is of no significance and only shows a connection. 

the __cluster__ variable defines in which subgraph the connection takes place 
(see the examples)

the __from__ and __to__ variables specify the nodes where the connection begines and 
ends. the variables can be numeric, e.g. the nodes can be {bf:1 -> 2} or strings 
such as {bf:A -> B} or {bf:"Node A" -> "Node B"}. If the variables are numeric, 
their label is automatically used to alter the labels of the DOT graph (see the examples). 

the __label__ variable simply "labels the connection". this merely specifies the "label" or 
"value" for the arrow. the label of the connection can also be specified within the 
__properties__ variable, but due to its common use and importance 
(_and to make life easier for those who don't wish to learn the DOT language_), 
it is made available as a separate variable. yet, adding __label="__ _label_ __"__ 
in the __properties__ variable can change the connection label. 

Example(s)
=================

the [diagram torture test](https://raw.githubusercontent.com/haghish/diagram/master/torture_test.do) 
includes several examples and example data sets for testing the package. 

    exporting a directed DOT script file from a data set
        . makediagram using name.dta, export("name.txt") label("diagram's label")

    exporting undirected DOT script file
        . makediagram using name.dta, export("name.txt") graphtype(graph)

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
***/

    
prog define makediagram
	version 11
	syntax using/ , Export(str) [replace] [GRAPHtype(name)] [label(str)] 		///
	[style(str)]
	

	// Analyze DOT scripts and data sets
	// =========================================================================
	if !missing("`using'") {
		if (index(lower("`using'"),".dta")) {
			if "`graphtype'" == "graph" {
				local source "graph G {"
				local sign --
			}
			else  {   //if "`graphtype'" == "digraph"
				local source "digraph G {"
				local sign ->
			}
		}
	}
	tempfile tmp
	tempname knot
	qui file open `knot' using "`tmp'", write replace
	file write `knot' "`source'" _n
	
	// adding label
	if !missing("`label'") file write `knot' `"    label="`label'";"' _n
	
	if !missing("`style'") {
		confirm file "`style'"
		tempname hitch 
		qui file open `hitch' using "`style'", read
		file read `hitch' line
		while r(eof)==0 {
			*local source = `"`macval(source)'"' +  `"`macval(line)'"'
			file write `knot' `"`macval(line)'"' _n
			file read `hitch' line
		}
	}
	
	preserve
	qui use "`using'", clear
	
	//Check if cluster variable exists
	capture confirm variable cluster
	
	//if cluster variable exists and it is missing, or if it does not exist:
	if _rc == 0 {
		if missing(cluster) {
			file close `knot'
			diagramconnection using "`using'", tempfile("`tmp'") sign(`sign')
			file open `knot' using "`tmp'", write append
		}
		else {
			
			//check if cluster is string 
			cap confirm string variable cluster
			if _rc == 0 local clusterisstring 1
			
			*if missing("`clusterisstring'") 
			
			qui drop if missing(cluster)							//drop missing values
			
			*sort cluster
			tempfile master
			qui save `master'
			clear
			qui use `master'
			
			//first evaluate when cluster observation is not missing
			
			

			//if cluster is string, the missings come first
			local current : di cluster[1]
			while !missing(cluster[1]) {
				
				qui keep if cluster == cluster[1]
					
				if missing("`clusterisstring'") {
					local nme : di "`: label (cluster) `=cluster[1]''" // label
				}	
				if !missing("`clusterisstring'") {
					if substr(cluster[1], 1,1) == `"""' {
						local current : di substr(`"`macval(current)'"',2,.)
					}
					if substr(cluster[1], -1,1) == `"""' {
						local current : di substr(`"`macval(current)'"',1,strlen(`"`macval(current)'"')-1)
					}
					local nme `"`macval(current)'"' 					// label
					
					//remove white space
					local current : subinstr local current " " "", all
				}
					
					
					file write `knot' "    subgraph cluster_`current' {" _n
					if !missing("`nme'") file write `knot' `"        label="`nme'";"' _n
					
					file close `knot' 
					diagramconnection using "`master'", tempfile("`tmp'") sign(`sign') indent("    ")
					file open `knot' using "`tmp'", write append
					file write `knot' "    }" _n
					
					qui use `master', clear
					qui drop if cluster == cluster[1]
					qui save `master', replace
					local current : di cluster[1]
			}

			*else {
			*	qui drop if missing(cluster)
			*}
			
			//evaluate for observations with missing cluster
			qui use "`using'", clear
			
			//evaluate arguments when cluster is missing
			qui keep if missing(cluster)
			file close `knot'
			diagramconnection using "`using'", tempfile("`tmp'") sign(`sign')
			file open `knot' using "`tmp'", write append
		}
	}	
	
	//if missing cluster variable...
	else {
		file close `knot'
		diagramconnection using "`using'", tempfile("`tmp'") sign(`sign')
		file open `knot' using "`tmp'", write append
	}
	
	
	file close `knot' 
	diagramnode using "`using'", tempfile("`tmp'") 
	file open `knot' using "`tmp'", write append
			
	file write `knot' "}" _n
	file close `knot'
	copy "`tmp'" "`export'", `replace'
	
	restore
	
	cap confirm file "`export'"
	if _rc == 0 {
		di as txt "{p}({bf:makediagram} created "`"{bf:{browse "`export'"}})"' _n
	}
	else display as err "{bf:makediagram} could not produce `export'" _n	
end



* markdoc makediagram.ado, export(sthlp) replace ascii
* markdoc makediagram.ado, export(pdf) replace style(stata)  linesize(200)


