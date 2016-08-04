digraph G {
    ratio="fill";
    ordering="out";
    nodesep="0.75";
    edge [comment="Wildcard node added automatic in EG."];
    node [comment="Wildcard node added automatic in EG."];
    "Var1" -> "Var2"  [dir="both", 
                       weight="0", 
                       label="0.2"];
    "Var1" -> "Var3"  [weight="0", 
                       label="0.4"];
    "Var1" -> "Var4"  [label="0.4"];
    "Var2" -> "Var3"  [weight="0", 
                       label="0.6"];
    "Var2" -> "Var4"  [weight="0.6", 
                       label="0.6"];
    "Var3" -> "Var4"  [weight="0", 
                       label="0.6"];
}
