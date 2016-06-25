
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
, magnify(1.2)	export("test.png") replace 							///
phantomjs("/usr/local/bin/phantomjs") engine(neato)												



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
