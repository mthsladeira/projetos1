function [Fztb] = balanceamento(rho,areaalar,cma,Cmac,distcaca,peso,xw,g,VS,VSn,VG,VC,VD)
% Balanceamento 
%VS e fator de carga 1
Ve=VS;
nz=1;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb1 = (K1*Ve^2)-(K2*nz);
%VSn e fator de carga -1
Ve=VSn;
nz=-1;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb2 = (K1*Ve^2)-(K2*nz);
%VG e fator de carga -1
Ve=VG;
nz=-1;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb3 = (K1*Ve^2)-(K2*nz);
%VC e fator de carga -1
Ve=VC;
nz=-1;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb4 = (K1*Ve^2)-(K2*nz);
%VD e fator de carga 0
Ve=VD;
nz=0;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb5 = (K1*Ve^2)-(K2*nz);

Fztb.c1=Fztb1;
Fztb.c2=Fztb2;
Fztb.c3=Fztb3;
Fztb.c4=Fztb4;
Fztb.c5=Fztb5;
end