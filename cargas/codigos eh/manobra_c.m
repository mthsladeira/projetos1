function [ManobraCorrigida] = manobra_c(rho,areaalar,cma,Cmac,distcaca,peso,xw,VA,VC,VD,Iy,xt,pesoeh,g)%% Manobra corrigida 
%Calculada em VA, VC e VD
%Manobra 1, VA
Ve=VA;
%para nz=1
%Balanceamento 
nz=1;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb1 = (K1*Ve^2)-(K2*nz);
%Manobra
nz=2.5;
theta1=39*nz*(nz-1.5)/(Ve/0.5144); %velocidade em nos
Fzt1m1=Iy*theta1/xt;
%Inercia
nzt1=nz+(theta1*xt/g);
Fzti1=-nzt1*pesoeh*g;

%para nz=2.5
%Balanceamento 
nz=2.5;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb2 = (K1*Ve^2)-(K2*nz);
%Manobra
theta2=-theta1;
Fzt2m1=-Fzt1m1;
%Inercia
nzt2=nz+(theta2*xt/g);
Fzti2=-nzt2*pesoeh*g;

%Carga liquida
Fzt11=Fztb1+Fzt1m1+Fzti1;
Fzt12=Fztb2+Fzt2m1+Fzti2;

ManobraCorrigida.lva1=Fzt11;
ManobraCorrigida.lva2=Fzt12;

%Manobra 2, VC
Ve=VC;
%para nz=1
%Balanceamento
nz=1;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb3 = (K1*Ve^2)-(K2*nz);
%Manobra
nz=2.5;
theta3=39*nz*(nz-1.5)/(Ve/0.5144);
Fzt1m1=Iy*theta3/xt;
%Inercia
nzt1=nz+(theta3*xt/g);
Fzti1=-nzt1*pesoeh*g;
%para nz=2.5
%Balanceamento
nz=2.5;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb4 = (K1*Ve^2)-(K2*nz);
%Manobra
theta4=-theta3;
Fzt2m1=-Fzt1m1;
%Inercia
nzt2=nz+(theta4*xt/g);
Fzti2=-nzt2*pesoeh*g;

%Carga liquida
Fzt11=Fztb3+Fzt1m1+Fzti1;
Fzt12=Fztb4+Fzt2m1+Fzti2;

ManobraCorrigida.lvc1=Fzt11;
ManobraCorrigida.lvc2=Fzt12;

%Manobra 3, VD
Ve=VD;
%para nz=1
%Balanceamento
nz=1;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb5 = (K1*Ve^2)-(K2*nz);
%Manobra
nz=2.5;
theta5=39*nz*(nz-1.5)/(Ve/0.5144);
Fzt1m1=Iy*theta5/xt;
%Inercia
nzt1=nz+(theta5*xt/g);
Fzti1=-nzt1*pesoeh*g;
%para nz=2.5
%Balanceamento
nz=2.5;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb6 = (K1*Ve^2)-(K2*nz);
%Manobra
theta6=-theta5;
Fzt2m1=-Fzt1m1;
%Inercia
nzt2=nz+(theta6*xt/g);
Fzti2=-nzt2*pesoeh*g;

%Carga liquida
Fzt11=Fztb5+Fzt1m1+Fzti1;
Fzt12=Fztb6+Fzt2m1+Fzti2;

ManobraCorrigida.lvd1=Fzt11;
ManobraCorrigida.lvd2=Fzt12;
ManobraCorrigida.b1=Fztb1;
ManobraCorrigida.b2=Fztb2;
ManobraCorrigida.b3=Fztb3;
ManobraCorrigida.b4=Fztb4;
ManobraCorrigida.b5=Fztb5;
ManobraCorrigida.b6=Fztb6;
end