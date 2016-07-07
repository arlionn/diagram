
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
, magnify(1.2)	export("test.png") replace 										///
phantomjs("/usr/local/bin/phantomjs") engine(neato)											


// -----------------------------------------------------------------------------
// TESTING FILES
// =============================================================================


// Example 2 (dot)
// =================
diagram using ./examples/directed.txt, magnify(2.2) replace 					///
export("./examples/test.png") phantomjs("/usr/local/bin/phantomjs") 

// Example 2b (dot) : the same example but fancier!
// =================
diagram using ./examples/directed2b.txt, magnify(2.2) replace 					///
export("./examples/test.png") phantomjs("/usr/local/bin/phantomjs") 

// Example 3 (dot) : making subgraphs
// =================
diagram using ./examples/subgraph.txt, replace 	magnify(3)						///
export("./examples/test.png") phantomjs("/usr/local/bin/phantomjs") 

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
makediagram using helloworld.dta, replace graphtype(digraph)					///
export("test.txt") label("Hello World Example") 

diagram using "test.txt",  replace  export("./examples/test.pdf") 				///
phantomjs("/usr/local/bin/phantomjs")



// Example 2 (clusters)
// =================
makediagram using data.dta, replace graphtype(digraph)					///
export("test.txt") label("making diagram from data set") style(mystyle.txt)

diagram using "test.txt",  replace  magnify(2)						///
export("./examples/test.pdf") phantomjs("/usr/local/bin/phantomjs")


// Example 3 (clusters)
// =================
makediagram using cluster.dta, replace graphtype(digraph)					///
export("test.txt") label("making diagram from data set") style(mystyle2.txt)

diagram using "test.txt",  replace  magnify(2)						///
export("./examples/test.pdf") phantomjs("/usr/local/bin/phantomjs")


// Example 4 (string clusters)
// =================
makediagram using string.dta, replace graphtype(digraph)					///
export("test.txt") label("making diagram from data set") style(stringstyle.txt)

diagram using "test.txt",  replace  magnify(2)						///
export("./examples/test.pdf") phantomjs("/usr/local/bin/phantomjs")



// Creating DOT file from string variables
// ---------------------------------------
makediagram using final.dta, replace graphtype(digraph) style(mystyle3.txt)	///
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

