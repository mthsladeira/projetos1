function [ManobraNaoCorrigida] = manobra_nc(rho,areaalar,cma,Cmac,distcaca,peso,xw,Ve,nz,a1w,areaeh,a1eh,downwash,a2eh,deflpos,deflneg,pesoeh,xt,Iy,g)%% Manobra nao-corrigida para VA
%Balanceamento
K1= rho*areaalar*cma*Cmac/(2*distcaca);
K2= (peso*g*xw)/(distcaca);
Fztb = (K1*Ve^2)-(K2*nz);

%Calculando nm
Cl=2*nz*peso*g/(rho*Ve^2*areaalar);
Alpha=Cl/a1w; %radianos
Lzt=Fztb/cos(Alpha);
Clt=2*Lzt/(rho*Ve^2*areaeh);
nm=((Clt-(a1eh*downwash*Alpha))/a2eh)*(180/pi);%graus

%Calculando deltan(n1 e n2)
n1=(deflpos-nm)*pi/180;%radianos
n2=(deflneg-nm)*pi/180;

%Calculando Fztm
Fztm1=cos(Alpha)*rho*Ve^2*areaeh*n1*a2eh/2;
Fztm2=cos(Alpha)*rho*Ve^2*areaeh*n2*a2eh/2;

%% Carga de inercia manobra nao-corrigida
theta1_2derivada=Fztm1*xt/Iy;
nzt1=nz+(theta1_2derivada*xt/g);
Fzti1=-nzt1*pesoeh*g;

theta2_2derivada=Fztm2*xt/Iy;
nzt2=nz+(theta2_2derivada*xt/g);
Fzti2=-nzt2*pesoeh*g;

%% Carga liquida manobra nao-corrigida
Fzt1=Fztb+Fztm1+Fzti1;
Fzt2=Fztb+Fztm2+Fzti2;

ManobraNaoCorrigida.b=Fztb;
ManobraNaoCorrigida.l1=Fzt1;
ManobraNaoCorrigida.l2=Fzt2;

end
