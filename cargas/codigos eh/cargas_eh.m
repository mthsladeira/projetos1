% Cargas EH
load 'dados_canarinho'
% Variaveis 
%Posicao mais a frente do CG
xw1 = xcg1; %considerando ca da asa na mesma posição que cg da aeronave
xt1 = xw1+lt;
%O CG da EH esta no mesmo ponto que o CA.
F1 = 34.1-(5500/179)*0.055; %Razao W/s maior q 20
F2 = 1.4125-(5500/179)*6.25*10e-4;
%% Fatores de carga limite 
% Manobra
nzm = 2.5;
Cmac = -0.0447; % pag 85 
g=9.81;
Iy= 1939*1.36*3.63; %Napolitano - convertido do sistema ingles (utilizando o cessna310 como base)
rho = 1.225;
massalbs=aviao.MTOW*2.205;
%% Carga liquida manobra nao-corrigida funcao
[ManobraNaoCorrigida1] = manobra_nc(rho,asa.S,asa.cma,Cmac,lt,aviao.MTOW,xw1,VA,nzm,a1w,eh.S,a1eh,downwash,a2eh,eh.profundor.down_deflexao,eh.profundor.up_deflexao,massa.eh,xt1,Iy,g);
%% Carga liquida manobra corrigida funcao
[ManobraCorrigida1] = manobra_c(rho,asa.S,asa.cma,Cmac,lt,aviao.MTOW,xw1,VA,VC,VD,Iy,xt1,massa.eh,g);
%% Carga de rajada
[Rajada1] = rajada(rho,asa.S,asa.cma,Cmac,lt,aviao.MTOW,xw1,nzm,VC,VD,a1eh,downwash,a1w,xt1,Iy,massa.eh,g,F1,F2,massalbs);
%% Balanceamento para demais condicoes do Diagrama de Manobra
[Fztb1] = balanceamento(rho,asa.S,asa.cma,Cmac,lt,aviao.MTOW,xw1,g,VS,VSn,VG,VC,VD);
%% Posicao traseira do CG
xw2 = xcg2;
xt2 = lt+xw2;
%% Carga liquida manobra nao-corrigida funcao
[ManobraNaoCorrigida2] = manobra_nc(rho,asa.S,asa.cma,Cmac,lt,aviao.MTOW,xw2,VA,nzm,a1w,eh.S,a1eh,downwash,a2eh,eh.profundor.down_deflexao,eh.profundor.up_deflexao,massa.eh,xt2,Iy,g);
%% Carga liquida manobra corrigida funcao
[ManobraCorrigida2] = manobra_c(rho,asa.S,asa.cma,Cmac,lt,aviao.MTOW,xw2,VA,VC,VD,Iy,xt2,massa.eh,g);
%% Carga de rajada
[Rajada2] = rajada(rho,asa.S,asa.cma,Cmac,lt,aviao.MTOW,xw2,nzm,VC,VD,a1eh,downwash,a1w,xt2,Iy,massa.eh,g,F1,F2,massalbs);
%% Balanceamento para demais condicoes do Diagrama de Manobra
[Fztb2] = balanceamento(rho,asa.S,asa.cma,Cmac,lt,aviao.MTOW,xw2,g,VS,VSn,VG,VC,VD);
save cargas_eh
