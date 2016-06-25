# diagram : DOT Diagrams in Stata

__`diagram`__ generates dynamic diagrams using 
[DOT markup language](http://en.wikipedia.org/wiki/Dot)  
and exports images in __pdf__, __png__, __jpeg__, __gif__, and __bmp__ format. For 
more information [visit diagram homepage](http://www.haghish.com/dot).

        
Author
------
  **E. F. Haghish**  
  Center for Medical Biometry and Medical Informatics    
  University of Freiburg, Germany        
  _haghish@imbi.uni-freiburg.de_       
  _http://www.haghish.com/dot_      
  _[@Haghish](https://twitter.com/Haghish)_      
  
Installation
------------

The __diagram__ releases are also hosted on SSC server. So you can download the latest release as follows:

    ssc install diagram
    
You can also directly download __diagram__ from GitHub which includes the latest beta version (unreleased). The `force` 
option ensures that you _reinstall_ the package, even if the release date is not yet changed, and thus, must be specified. 
  
    net install diagram, force  from("https://raw.githubusercontent.com/haghish/diagram/master/")
    
For exporting graphical files, the package requires [phantomJS](http://phantomjs.org/download.html), 
which is an open-source freeware available for Windows, Mac, and Linux. The 
path to the executable [phantomJS](http://phantomjs.org/download.html) file is required in order to export the graphical files. However, if the executable file is installed in the default local 
directory (e.g. `/usr/local/bin/` in Mac), the `phantomjs(str)` can be ignored. 


Package Structure
-----------------

The package includes only 1 Stata ado file named `diagram.ado`, 1 JavaScript file named
`viz.js` which is developed by [Michael Daines](https://www.github.com/mdaines), and another 
JavaScript file for rendering the graphs into images named `diagram.js`. 

