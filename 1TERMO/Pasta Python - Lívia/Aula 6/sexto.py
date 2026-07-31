# #Lista de temperaturas lidas pelo sensor por minuto
# leituras = [70, 75,82,98,110,85,80]
# baixos = [50,55,52,30,20,15,10]

# for temp in leituras:
#     if temp > 100:
#         print(f"CRÍTICO: {temp}°C detectado! Acionando parada de emergência")
#         break
#     for temp1 in baixos:
#         if temp < 50:
#             print(f"CRÍTICO: {temp1}°C detectado! Acionando parada de emergência")
#             break
#         else:
#             print(f"Temperatura está em {temp1}°C. Operação com valores baixo")
# print("Checar Sistema. Aguardando manutenção")
########################################################################################

# materiais = ["metal" , "metal", " plástico", "metal", "vidro", "metal"]
# for peca in materiais:
#     if peca != "metal":
#         print(f"Aviso: Peça de {peca} detectada. Desviando para descarte...")
#         continue
#     print(f"Processando peça de {peca}. Furando e polindo")

# print("Fim do lote de produção!")

####################################################################################
# from time import sleep
# for lote in range (1, 11):
#         if lote == 5:
#             print(f"Falha na impressãodo número {lote}!!")
#             sleep(1.8)
#             continue
#         print(f"Processando impressão número {lote}...")
#         sleep(1.8)
# print("Fim da impressão!")
########################################################################

# semáforo = ["verde","verde","verde","verde", "amarelo","amarelo", "vermelho","vermelho","vermelho"]
# from time import sleep
# for cores in semáforo:
#     if cores == "verde":
#         sleep(1.8)
#         print("Sinal VERDE! Seguir em frente!")
#     elif cores =="amarelo":
#         sleep(1.8)
#         print("Sinal AMARELO! Atenção no movimento!")
#     else:
#         sleep(1.8)
#         print("Sinal VERMELHO! Parada Obrigátoria!")
#####################################################################################################
 
# total = 0.0
# for i  in range (1, 6):
#     consumo = float(input(f"Qual o consumo da máquina {i} em kWh? \n"))
#     total += consumo

# print(f"Consumo total da fábrica: {total} kWh")

#######################################################################################

# medidas = [50.1, 49.8,52.0, 48.5]
# for pecas in medidas:
#     if pecas >50:
#         print(f"Peça {pecas} Aprovada...")
#     else:
#         print(f"Peça {pecas} Rejeitada")