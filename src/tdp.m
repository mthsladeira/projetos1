%%WARNING: codigo bem sujo
max_alfa=15;
L=20;
rfus =2.1/2;
xCG=14;
A = [1, -tand(max_alfa)
    tand(max_alfa), 1]
 
B = [xCG+rfus*tand(max_alfa)
     L*tand(max_alfa)]
 
 X=A\B;
 xmlg =X(1)
 h = X(2)
 
 assert(h-((L-xmlg)*tand(max_alfa))<1e-6)
 
 nose_load = 0.15;
 xCG = 12.5;
 xnlg = (xCG - xmlg*(1-nose_load))/nose_load
 assert (nose_load - (xmlg-xCG)/(xmlg-xnlg)<1e-6)
 
 xCG=11
 nose_load_max = (xmlg-xCG)/(xmlg-xnlg)
 
  xCG=14
 nose_load_min = (xmlg-xCG)/(xmlg-xnlg)