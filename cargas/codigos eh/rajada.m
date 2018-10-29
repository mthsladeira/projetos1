function [Rajada] = rajada(rho,areaalar,cma,Cmac,distcaca,peso,xw,nz,VC,VD,a1eh,downwash,a1w,xt,Iy,pesoeh,g,F1,F2,pesolbs)%% Rajada
%Calculado em VC e VD 
%Balanceamento
Ve=VC;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb1 = (K1*Ve^2)-(K2*nz);
Ve=VD;
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb2 = (K1*Ve^2)-(K2*nz);
%Rajada
mig= (2*(peso/areaalar))/(rho*cma*a1w);
kg = (0.88*mig)/(5.3+mig); %admensional, valores no SI
Fztr1 = ((kg*50*F1*sqrt(pesolbs/179)*a1eh*downwash*32.15)/498); %VC
Fztr2 = -Fztr1;
Fztr3 = ((kg*25*F1*sqrt(pesolbs/179)*F2*a1eh*downwash*32.15)/498); %VD
Fztr4 = -Fztr3;

%Carga de inercia
theta1_2derivada=Fztr1*xt/Iy;
nzt1=nz+(theta1_2derivada*xt/g);
Fzti1=-nzt1*pesoeh*g;
theta2_2derivada=Fztr2*xt/Iy;
nzt2=nz+(theta2_2derivada*xt/g);
Fzti2=-nzt2*pesoeh*g;
theta3_2derivada=Fztr3*xt/Iy;
nzt3=nz+(theta3_2derivada*xt/g);
Fzti3=-nzt3*pesoeh*g;
theta4_2derivada=Fztr4*xt/Iy;
nzt4=nz+(theta4_2derivada*xt/g);
Fzti4=-nzt4*pesoeh*g;

%Carga liquida
Fzt1= Fztb1+Fztr1+Fzti1;
Fzt2= Fztb1+Fztr2+Fzti2;
Fzt3= Fztb2+Fztr3+Fzti3;
Fzt4= Fztb2+Fztr4+Fzti4;

Rajada.c1=Fzt1;
Rajada.c2=Fzt2;
Rajada.c3=Fzt3;
Rajada.c4=Fzt4;
end