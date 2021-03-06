# coding=utf8
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib
import seaborn as sns
import os

save_dir = "autogenerated/graficos_comparativos/"
if not os.path.isdir(save_dir):
    os.makedirs(save_dir)

width = 15 #cm
height = width
in2cm = 2.54
size = height/in2cm #height in inches
aspect = 1.
matplotlib.rcParams.update({
    'font.size': 8, 
    'text.usetex': True,
    'text.latex.unicode': True,
    'font.family': 'serif'
    })

def label_point(x, y, val,data, ax):
    a = pd.concat({'x': data[x], 'y': data[y], 'val': data[val]}, axis=1)
    for i, point in a.iterrows():
        ax.text(point['x']+.03, point['y'], str(int(point['val']))) #int is a dirty fix

df = pd.read_csv("data/tabela_comparativa.csv")

mtow = sns.lmplot(x="Passageiros", y="MTOW (kg)",hue="Tipo de motor",data=df, ci=68, size=size, aspect=aspect)
#TODO: plotar log(MTOW) para a curva nao ir no negativo
mtow.ax.set_ylim(0,50000)
mtow.ax.set_title(r"\textbf{Comparação do MTOW}")
label_point("Passageiros","MTOW (kg)","n",df,mtow.ax)
mtow.fig.savefig(save_dir+"mtow.pdf")

empty = sns.lmplot(x="Passageiros", y="Peso vazio (kg)",hue="Tipo de motor",data=df, ci=68, size=size, aspect=aspect)
label_point("Passageiros","Peso vazio (kg)","n",df,empty.ax)
empty.ax.set_ylim(0,30000)
empty.ax.set_title(r"\bf Comparação do Peso Vazio")
empty.fig.savefig(save_dir+"pesovazio.pdf")

ceiling = sns.lmplot(x="Passageiros", y="Teto de serviço (ft)",hue="Tipo de motor",data=df,ci=68, size=size, aspect=aspect)
label_point("Passageiros","Teto de serviço (ft)","n",df,ceiling.ax)
ceiling.ax.set_ylim(0,42000)
ceiling.ax.set_title(r"\bf Comparação do Teto de Serviço")
ceiling.fig.savefig(save_dir+"teto.pdf")

rangenm = sns.lmplot(x="Passageiros", y="Alcance (nm)",hue="Tipo de motor",data=df, ci=68, size=size, aspect=aspect)
label_point("Passageiros","Alcance (nm)","n",df,rangenm.ax)
rangenm.ax.set_ylim(0,4000)
rangenm.ax.set_title(r"\bf Comparação do Alcance")
rangenm.fig.savefig(save_dir+"alcance.pdf")

maxspeed= sns.lmplot(x="Passageiros", y="Velocidade máxima (kts)",hue="Tipo de motor",data=df, ci=68, size=size, aspect=aspect)
label_point("Passageiros","Velocidade máxima (kts)","n",df,maxspeed.ax)
maxspeed.ax.set_ylim(0,500)
maxspeed.ax.set_title(r"\bf Comparação da Velocidade Máxima")
maxspeed.fig.savefig(save_dir+"vmaxima.pdf")
#Uma amostra maior de aeronaves a pistao com mais passageiros seria
# interessante para eliminar a tendencia irreal de aumento de velocidade

cruise = sns.lmplot(x="Passageiros", y="Velocidade de cruzeiro (kts)",hue="Tipo de motor",data=df, ci=68, size=size, aspect=aspect)
label_point("Passageiros","Velocidade de cruzeiro (kts)","n",df,cruise.ax)
cruise.ax.set_ylim(0,500)
cruise.ax.set_title(r"\bf Comparação da Velocidade de Cruzeiro")
cruise.fig.savefig(save_dir+"vcruzeiro.pdf")

span = sns.lmplot(x="Passageiros", y="Envergadura (m)",hue="Tipo de motor",data=df, ci=68, size=size, aspect=aspect)
label_point("Passageiros","Envergadura (m)","n",df,span.ax)
span.ax.set_ylim(10,40)
span.ax.set_title(r"\bf Comparação da Envergadura")
span.fig.savefig(save_dir+"envergadura.pdf")

ar = sns.lmplot(x="Passageiros", y="Alongamento",hue="Tipo de motor",data=df, ci=68, size=size, aspect=aspect)
label_point("Passageiros","Alongamento","n",df,ar.ax)
ar.ax.set_ylim(6,14)
ar.ax.set_title(r"\bf Comparação do Alongamento")
ar.fig.savefig(save_dir+"alongamento.pdf")

area = sns.lmplot(x="Passageiros", y="Área alar (m^2)",hue="Tipo de motor",data=df, ci=68, size=size, aspect=aspect)
label_point("Passageiros",r"Área alar (m^2)","n",df,area.ax)
area.ax.set_ylim(0,150)
area.ax.set_title(r"\bf Comparação da Área Alar")
area.fig.savefig(save_dir+"area.pdf")

length = sns.lmplot(x="Passageiros", y="Comprimento (m)",hue="Tipo de motor",data=df, ci=68, size=size, aspect=aspect)
label_point("Passageiros","Comprimento (m)","n",df,length.ax)
length.ax.set_ylim(0,32)
length.ax.set_title(r"\bf Comparação do Comprimento")
length.fig.savefig(save_dir+"comprimento.pdf")

height = sns.lmplot(x="Passageiros", y="Altura (m)",hue="Tipo de motor",data=df, ci=68, size=size, aspect=aspect)
label_point("Passageiros","Altura (m)","n",df,height.ax)
height.ax.set_ylim(0,10)
height.ax.set_title(r"\bf Comparação da Altura")
height.fig.savefig(save_dir+"altura.pdf")

power_df=df.loc[df['Tipo de motor']=='Turbo-hélice']
power = sns.lmplot(x="Passageiros", y="Potência (kW)",data=power_df, ci=68, size=size, aspect=aspect)
label_point("Passageiros","Potência (kW)","n",power_df,power.ax)
power.ax.set_ylim(0,8000)
power.ax.set_title(r"\bf Comparação da Potência")
power.fig.savefig(save_dir+"potencia.pdf")

thrust_df=df.loc[df['Tipo de motor']=='Turbofan']
thrust = sns.lmplot(x="Passageiros", y="Empuxo (kN)",data=thrust_df, ci=68, size=size, aspect=aspect)
label_point("Passageiros","Empuxo (kN)","n",thrust_df,thrust.ax)
thrust.ax.set_ylim(40,140)
thrust.ax.set_title(r"\bf Comparação do Empuxo")
thrust.fig.savefig(save_dir+"empuxo.pdf")
