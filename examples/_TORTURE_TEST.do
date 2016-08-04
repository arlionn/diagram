
cd "/Users/haghish/Documents/Packages/diagram"

// Main Example
// =================
diagram using ./examples/main.txt, magnify(2.2) replace 					///
export("./examples/test.png") phantomjs("/usr/local/bin/phantomjs") 


// Example 1 (neato)
// =================
diagram graph G {																///
    run -- intr;																///
    intr -- runbl;																///
    runbl -- run;																///
    run -- kernel;																///
    kernel -- zombie;															///
    kernel -- sleep;															///
    kernel -- runmem;															///
    sleep -- swap;																///
    swap -- runswap;															///
    runswap -- new;																///
    runswap -- runmem;															///
    new -- runmem;																///
    sleep -- runmem;															///
}																				///
, magnify(1.2)	export("test.png") replace 										///
phantomjs("/usr/local/bin/phantomjs") engine(neato)												


// A BETTER PRACTICE 
// =================
diagram "graph G {"																///
    "run -- intr;"																///
    "intr -- runbl;"															///
    "runbl -- run;"																///
    "run -- kernel;"															///
    "kernel -- zombie;"															///
    "kernel -- sleep;"															///
    "kernel -- runmem;"															///
    "sleep -- swap;"															///
    "swap -- runswap;"															///
    "runswap -- new;"															///
    "runswap -- runmem;"														///
    "new -- runmem;"															///
    "sleep -- runmem;"															///
"}"																				///
, magnify(1.2)	export("test.png") replace engine(neato)											



diagram "digraph {" ///
		`"a -> b[label="0.2",weight="0.2"];"' ///
		`"a -> c[label="0.4",weight="0.4"];"' ///
		`"c -> b[label="0.6",weight="0.6"];"' ///
		`"c -> e[label="0.6",weight="0.6"];"' ///
		`"e -> e[label="0.1",weight="0.1"];"' ///
		`"e -> b[label="0.7",weight="0.7"];"' ///
	"}", export(test.png) replace engine(circo)
	
diagram "digraph name {"	///
    "node [shape=rectangle];" ///
    "graph [layout=neato, outputorder=edgesfirst, overlap=true];" ///
    `"1 [pos="-3,1!", label="Var 1"];"' ///
    `"2 [pos="-3,-1!", label="Var 2"];"' ///
    `"3 [pos="-1,0!", label="Var 3"];"' ///
    `"4 [pos="1,0!", label="Var 4"];"' ///
	`"e1 [shape=circle, pos="-1,-1!", label="e"];"'               ///
	`"e2 [shape=circle, pos="1,-1!", label="e"];"'                ///
    `"1 -> 2  [label="n", weight="0", dir=both, minlen="0"];"' ///
    `"1 -> 3  [label="n"];"' ///
    `"2 -> 3  [label="n"];"' ///
    `"3 -> 4  [label="n", headport="w"];"' ///
    `"1 -> 4  [label="n", tailport="c", headport="c"];"' ///
    `"2 -> 4  [label="n"];"' ///
	"e1 -> 3;" ///
    "e2 -> 4;" ///
"}", export(./examples/pathdiagram.png) magnify(2.0) replace
	
	
diagram "digraph {" ///
		`""Var1" -> "Var2" [dir="both", label="0.2",weight="0.2"];"' ///
		`""Var1" -> "Var3" [label="0.4",weight="0.4"];"' ///
		`""Var2" -> "Var3" [label="0.6",weight="0.6"];"' ///
		`""Var1" -> "Var4" [label="0.4",weight="0.4"];"' ///
		`""Var2" -> "Var4" [label="0.6",weight="0.6"];"' ///
		`""Var3" -> "Var4" [label="0.6",weight="0.6"];"' ///
	"}", export(test.png) replace engine(circo)	
	
// -----------------------------------------------------------------------------
// TESTING FILES
// =============================================================================


// Example 2 (dot)
// =================
diagram using ./examples/directed.txt, magnify(2.2) replace 					///
export("./examples/test.png")

// Example 2b (dot) : the same example but fancier!
// =================
diagram using ./examples/directed2b.txt, magnify(2.2) replace 					///
export("./examples/test.png") 

// Example 3 (dot) : making subgraphs
// =================
diagram using ./examples/subgraph.txt, replace 	magnify(3)						///
export("./examples/test.png") 

// Example 4 (circo) 
// =================
diagram using ./examples/circo.txt, replace magnify(3) engine(circo)			///
export("./examples/test.png") phantomjs("/usr/local/bin/phantomjs") 

// Example 5 (circo) 
// =================
diagram using ./examples/circo2.txt, replace magnify(3) engine(circo)			///
export("./examples/test.png") phantomjs("/usr/local/bin/phantomjs") 

// Example 6 (circo) 
// =================
diagram using ./examples/circo3.txt, replace magnify(3) engine(circo)			///
export("./examples/test.png") phantomjs("/usr/local/bin/phantomjs") 

// Example 7 (circo) 
// =================
diagram using ./examples/circo4.txt, replace magnify(3) engine(circo)			///
export("./examples/test.png") phantomjs("/usr/local/bin/phantomjs") 

// Example 8 (circo) 
// =================
diagram using ./examples/circo5.txt, replace magnify(3) engine(circo)			///
export("./examples/test.png") phantomjs("/usr/local/bin/phantomjs") 



// -----------------------------------------------------------------------------
// TESTING DATA SET
// =============================================================================

// Creating DOT file from numeric variables
// ---------------------------------------

// Example 1 (hello world)
// =================
makediagram using ./examples/helloworld.dta, replace graphtype(digraph)					///
export("test.txt") label("Hello World Example") 

diagram using "test.txt",  replace  export("./examples/test.pdf") 				///
phantomjs("/usr/local/bin/phantomjs")



// Example 2 (clusters)
// =================
makediagram using ./examples/data.dta, replace graphtype(digraph)					///
export("test.txt") label("making diagram from data set") style(./examples/mystyle.txt)

diagram using "test.txt",  replace  magnify(2)						///
export("./examples/test.pdf") phantomjs("/usr/local/bin/phantomjs")


// Example 3 (clusters)
// =================
makediagram using ./examples/cluster.dta, replace graphtype(digraph)					///
export("test.txt") label("making diagram from data set") style(./examples/mystyle2.txt)

diagram using "test.txt",  replace  magnify(2)						///
export("./examples/test.pdf") phantomjs("/usr/local/bin/phantomjs")


// Example 4 (string clusters)
// =================
makediagram using ./examples/string.dta, replace graphtype(digraph)					///
export("test.txt") label("making diagram from data set") style(./examples/stringstyle.txt)

diagram using "test.txt",  replace  magnify(2)						///
export("./examples/test.pdf") phantomjs("/usr/local/bin/phantomjs")



// Creating DOT file from string variables
// ---------------------------------------
makediagram using ./examples/final.dta, replace graphtype(digraph) style(./examples/mystyle3.txt)	///
export("test.txt") label("diagram from string variables")

diagram using "test.txt",  replace  magnify(2) 					///
export("./examples/test.pdf") phantomjs("/usr/local/bin/phantomjs")







/*
label data "template data for diagram package"
label define cluster 1 "Cluster A" 2 "Cluster B"
label values cluster cluster
label values from label
label values to label
label values style style

