digraph G {
    rankdir=LR;
    fontname="sans-serif";
    splines="true";
    nodesep="1.0";
    edge [comment="Wildcard node added automatic in EG."];
    node [comment="Wildcard node added automatic in EG.", 
          shape="plain"];
    "read" -> "write"  [label="0.6", 
                        dir="both", 
                        weight="0", 
                        minlen="0"];
    "write" -> "math"  [label="0.35"];
    "read" -> "math"  [label="0.46"];
    "math" -> "science"  [label="0.3", 
                          minlen="2"];
    "read" -> "science"  [labeldistance="0.5", 
                          labelangle="-0.0", 
                          label="0.31"];
    "write" -> "science"  [label="0.2"];
}
