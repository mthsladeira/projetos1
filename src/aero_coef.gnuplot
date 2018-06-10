set term tikz latex createstyle monochrome  size 16,21
set output "autogenerated/tikzplots/aero_coef.tex"

cd "data/perfis"

set multiplot layout 3,2 columnsfirst\
    title "\\bf Coeficientes Aerodinâmicos dos Perfis Selecionados"
unset key
set grid

### First Column ###
set xrange[-20:20]
set xlabel "$\\alpha [\\si{deg}]$"

### Cl alpha

set title "$C_l \\times \\alpha$"
set ylabel "$C_l$"

plot "polar663-418.sort.dat" using 1:2 with lines title "66\\textsubscript{3}-418"\
,    "polar642-415.sort.dat" using 1:2 with lines title "64\\textsubscript{2}-415"\
,    "polar631-412.sort.dat" using 1:2 with lines title "63\\textsubscript{1}-412"\
,    "polar651-412.sort.dat" using 1:2 with lines title "65\\textsubscript{1}-412"

### L/D
set title "$L/D \\times \\alpha$"
set ylabel "$C_l/C_d$"

plot "polar663-418.sort.dat" using 1:($2/$3) with lines title "66\\textsubscript{3}-418"\
,    "polar642-415.sort.dat" using 1:($2/$3)  with lines title "64\\textsubscript{2}-415"\
,    "polar631-412.sort.dat" using 1:($2/$3)  with lines title "63\\textsubscript{1}-412"\
,    "polar651-412.sort.dat" using 1:($2/$3)  with lines title "65\\textsubscript{1}-412"

### Cm alpha

set autoscale y
set title "$C_m \\times \\alpha$"
set ylabel "$C_m$"

plot "polar663-418.sort.dat" using 1:5 with lines title "66\\textsubscript{3}-418"\
,    "polar642-415.sort.dat" using 1:5 with lines title "64\\textsubscript{2}-415"\
,    "polar631-412.sort.dat" using 1:5 with lines title "63\\textsubscript{1}-412"\
,    "polar651-412.sort.dat"    using 1:5 with lines title "65\\textsubscript{1}-412"

### Second Column ###

### Key plot
unset title
#set tmargin at screen bot(n,n,h,t,b)
#set bmargin at screen 0
set key center center
unset border
unset tics
unset xlabel
unset ylabel
set yrange [0:1]
set title "Legenda"

plot 2 title "66\\textsubscript{3}-418"\
,    2 title "64\\textsubscript{2}-415"\
,    2 title "63\\textsubscript{1}-412"\
,    2 title "65\\textsubscript{1}-412"

#reset everything
set border
set xtics
set ytics
set autoscale
set xlabel
set ylabel
unset key

### Polar de arrasto
set title "Polar de Arrasto"
set xtics -2,.5,2
set mxtics 5
set yrange [0:1000]
set ylabel "$C_d \\cdot 10^4$"
set xlabel "$C_l$"

plot "polar663-418.sort.dat" using 2:($3*1e4) with lines title "66\\textsubscript{3}-418"\
,    "polar642-415.sort.dat" using 2:($3*1e4) with lines title "64\\textsubscript{2}-415"\
,    "polar631-412.sort.dat" using 2:($3*1e4) with lines title "63\\textsubscript{1}-412"\
,    "polar651-412.sort.dat"    using 2:($3*1e4) with lines title "65\\textsubscript{1}-412"

### Arrasto no Balde Laminar

set xtics nomirror
set x2tics ("\\footnotesize cruise" 0.06811,\
            "\\footnotesize top-of-climb" 0.5554)
set xrange [0:1]
set yrange [35:70]

set xlabel "$C_l$"
set ylabel "$C_d \\cdot 10^4$"

set title "Polar de Arrasto no Balde Laminar"

plot "polar663-418.sort.dat" using 2:($3*1e4) with lines title "66\\textsubscript{3}-418"\
,    "polar642-415.sort.dat" using 2:($3*1e4) with lines title "64\\textsubscript{2}-415"\
,    "polar631-412.sort.dat" using 2:($3*1e4) with lines title "63\\textsubscript{1}-412"\
,    "polar651-412.sort.dat"    using 2:($3*1e4) with lines title "65\\textsubscript{1}-412"

unset multiplot

