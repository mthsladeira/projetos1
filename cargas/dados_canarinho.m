% Dados CANARINHO

% Velocidades (m/s) pag 101
VS = 61.33;
VA = 96.97;
VC = 140;
VD = 194.44;
VSn = 79.17;
VG=VSn;

% Dados Fuselagem (m) pag 52
aviao.l=29.87; 
aviao.h=2.1;

%Dados massa (kg) pag 115
aviao.P_vazio=11830;
aviao.MTOW=19200;
massa.eh=233;
massa.ev=191;
massa.asa=2094;

%CG (m) pag 81
xcg1 = 13.5; % dianteiro
xcg2 = 14.3; % traseiro

% Dados Asa (SI) pag 76
asa.b=27.24;
asa.cr=2.684;
asa.cp=1.207;
asa.S=53;
asa.cma=2.039;
asa.afil=asa.cp/asa.cr;
asa.enfle=-1.55;
asa.along=14;

% Dados EH (SI) pag 86 e 95
eh.cr=1.94;
eh.cp=1.49;
eh.S=8.9;
eh.profundor.up_deflexao=-23;
eh.profundor.down_deflexao=17;
eh.afil=eh.cp/eh.cr;
eh.cma=(2/3)*eh.cr*(1+eh.afil+eh.afil^2)/(1+eh.afil);
lt=12.255;

% Dados EV (SI) pag 88
ev.b=4.08;
ev.cp=2.42;
ev.cr=3.41;
ev.S=(ev.cp+ev.cr)*0.5*ev.b; %foi pra 12.89, ver qual parametro mudou
% ev.rudder.up_deflexao=-25;
% ev.rudder.down_deflexao=25; definir valores
ev.afil=ev.cp/ev.cr;
ev.cma=(2/3)*ev.cr*(1+ev.afil+ev.afil^2)/(1+ev.afil);

% Dados TDP pag 106
tdp.xP_CA=14.664; % Dist horizontal TDP Principal - Nariz
tdp.xA_CA=0.235; % Dist horizontal TDP Auxiliar - Nariz
tdp.zP_CA=1.430; % Dist vertical TDP

%% Derivadas

a1w=4.586; %pag 85
a1eh=3.567; %pag 88
a1ev=2.63; %pag 90

%pag 93
a2eh=1.837;
a3eh=1.097;
a1beh=-0.0967;
a2beh=-0.4246;
a3beh=-0.2015;
downwash=(1-0.1352); 

%% Salva dados
save dados_canarinho