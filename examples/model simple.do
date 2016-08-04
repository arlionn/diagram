digraph G {
    rankdir=LR;
    fontname="sans-serif";
    splines="line";
    nodesep="1.0";
    "Var 1" -> "Var 2"  [dir="both", weight="0", minlen="0"];
    "Var 2" -> "Var 3";
    "Var 1" -> "Var 3";
    "Var 3" -> "Var 4"  [minlen="2"];
    "Var 1" -> "Var 4";
    "Var 2" -> "Var 4";
}
