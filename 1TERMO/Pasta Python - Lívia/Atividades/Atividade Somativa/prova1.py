#####################Atividade Somativa#######################

# Exercício 1:

# print("Registre seu veículo!")
# modelo= str(input("Qual modelo do seu veículo? \n - "))
# placa = str(input("Qual a placa do seu veículo? \n - "))

# print("Veículo", modelo , "de placa", placa , "registrado no sistema. Boa viagem!")
 
####################################################################################

# Exercício 2:

# print("Cálculo de distância do seu veículo!")

# tanque = float(input("Digite a capacidade do tanque de combustível (em litros) do seu veículo: "))
# consumo = float(input("Digite o consumo médio (km/l) de seu veículo: "))

# distancia = tanque * consumo

# print("Com o tanque cheio, seu veículo pode percorrer por", distancia , "Km/h!")

#######################################################################################

# Exercício 3:

# print("Conversor de Moeda (Fretes Internacionais)!!")

# frete= float(input("Qual valor do frete em dólar (USD)? \n"))
# reais = frete/5
# print("Em reais (BRL$) a taxa convertida é de R$",reais)

######################################################################################

# Exercício 4:

# print("Média de Entrega!")
# print("Digite conforme o modelo (1.11)")
# rota1 = float(input("Qual tempo de entrega da 1ª rota? \n"))
# rota2 = float(input("Qual tempo de entrega da 2ª rota? \n"))
# rota3 = float(input("Qual tempo de entrega da 3ª rota? \n"))

# r1 = rota1* 60
# r2 = rota3* 60
# r3 = rota3* 60

# t1 = r1 + r2 + r3
# t2 = t1/3
# t3 = t2 / 60

# print("A média do tempo entrega  é de", t3 )

#######################################################################################

# Exercício 5:

# Monitor de Carga: Peça o peso atual de um caminhão em toneladas.
#  Abaixo de 10t: "Carga Leve".
#  Entre 10t e 25t: "Carga padrão".
# Acima de 25t: "ALERTA: Excesso de Peso!".

# print("Monitor de Carga!")

# valor = float(input("Digite o peso  atual do caminhão (em toneladas): "))

# if valor < 10:
#     print("Carga Leve")
# elif valor < 25:
#     print("Carga Padrão")
# else:
#     print("ALERTA: Excesso de Peso!")

###################################################################################

# Exercício 6:

# print("Classificador de destino!")

# codigo = str(input("Insira o código de carga: "))

# if codigo == "N":
#     print("Enviado para a Região Norte")
# elif codigo =="S":
#     print("Enviado para a Região Sul")
# else:
#     print("Enviado para Região Internacional")

###################################################################################

# Execício 7:

# print("Liberação de Saída!")

# caminhao = str(input("O Caminhão já passou pelo checklist?\n"))
# motorista = str(input("O Motorista já passou pelo checklist?\n"))

# if caminhao and motorista == "Sim":
#     print("Liberação Concluída. Seguir Rota!")
# else:
#     print("Liberação Negada. Passe pelo checklist para ser liberado!")

#######################################################################################

# Exercício 8:

# print("Calculo de atrasos nas entregas!")

# agendadas = int(input("Quantas entregas estão agendadas? \n"))
# atrasos = int(input("Quantas entregas foram atrasadas? \n"))

# porcentagem = (atrasos/agendadas) * 100

# if atrasos > 10:
#     print("Necessário Otimizar Rotas!")
# else:
#     print("Logística Eficiente!")

#######################################################################

# Exercício 9:

# print("Validação de Calibragem!")

# pressao = float(input("Qual a pressão do pneu (PSI)? \n"))

# if pressao < 100:
#     print("Pressão muito baixa!")
# elif pressao > 110:
#     print("Pressão muito alta!")
# else:
#     print("Pressão adequada!")

#######################################################################

# Exercício 10:

# for i in range (5, 0 , -1):
#     print(i)
# print("Portão Trancado!")

###########################################################################

# Exercício 11:
# total = 0.0
# while True:
#     valores = float(input("Insira o valor do frete:\n"))

#     if valores == 0:
#         break

#     total += valores
# print(f"Você faturou: R$ {total}")

###########################################################################

# Exercício 12:

# total = 0.0

# for i  in range (1, 6):
#     consumo = float(input(f"Digite a quilometragem dos veículos {i}: \n"))
#     if consumo > total:
#         total = consumo
# print(f"A maior quilometragem foi {total}")

#############################################################################

# Exercício 13:

# total = 0.0
# while True: 
#     codigo = str(input("Insira o código de Rastreio:\n"))

#     if codigo == "track99" :
#         print("Código Válido!")
#         total += 3
#     else:
#         print("Acesso Negado! Tente Novamente")



##############################################################################

# Exercício 14:

# print("Gerenciador de combustível!")
# print("Você possui um tanque de 500 litros")

# print("Opções: ")
# print("1 - Abastecer o tanque da base")
# print("2 - Retirar combustível para um caminhão")
# print("3 - Sair")

# escolha= int(input("Selecione uma opção: \n"))

# while True:
    
#     if escolha == 1:
#         print("Você escolheu", [escolha])
#     quantidade= str(input("Quantos litros você deseja retirar?"))
# total= 500 - quantidade

###############################################################################

# Exercício 15:



##################################################################################
