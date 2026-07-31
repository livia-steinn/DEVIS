# Revisao
# ############################ 1
# print("Registro de Veículo")
# modelo_veiculo = input("Informe o modelo do veículo \n")
# placa_veiculo = input ("Informe a placa do veículo \n")
# print(f"Veículo {modelo_veiculo} de placa {placa_veiculo} registrado no sistema. Boa Viagem!")
# ########################### 2

# print("Cálculo de Autonomia")
# capacidade_tanque = float(input("Digite a capacidadade de litros: "))
# consumo_medio= float(input("Digite o consumo do camião em km/l: "))
# distancia_totall= capacidade_tanque * consumo_medio
# print(f"Capacidade {capacidade_tanque} do tanque e sua distancia {consumo_medio} em média KM/L e o total {distancia_total}")

# ############################ 3

# print("Conversor de Moeda (frete Internacional)")
# frete = float(input("Valor de frete em dólar: "))
# real = float(input("Valor da taxa em reais: "))
# conversao = frete * real
# print= (f"O valor do frete foi {frete} e a taxa aplicada foi de {real} e o total do frete {conversao:.2f}")

# ############################# 4
# print("Média de Entregas")
# rota1 = int(input("Digite a primeira rota em horas"))
# rota2 = int(input("Digite a segunda rota em horas"))
# rota3 = int(input("Digite a terceita rota em horas"))
# mediarota = (rota1 + rota2 + rota3) /3
# print(f"A média de entregas da rotas realizadas foi de... {mediarota:.2f}")

# ########################### 5

# print("Monitor de carga - Peso em tonelagdas")
# peso_caminhao = float(input("Informe o peso do caminhão em Toneladas: "))
# if peso_caminhao <= 10:
#     print("Carga Leve -)")
# elif peso_caminhao < 25:
#     print("Carga Padrão --)")
# elif peso_caminhao >= 25:
#     print("ALERTA: Excesso de Peso! ---)")
# else:
#     print("Digite outro valor ----)")

# ############################ 6

# print("Classificador de Destino - Código de Cargas")
# print("Código de Cargas = N - Norte S - Sul e Outros Internacional")
# codigo_carga = input("Inserir o código da Carga em N ou S ou O").upper()
# if codigo_carga == "N":
#     print("Região Norte")
# elif codigo_carga == "S":
#     print("Região Sul")
# else:
#     print("Região Internacional")

# ############################## 7
# print("Liberação de Saída - Checklist e Motorista")
# checklist = input("O Checklist foi realizado (Concluído ou Não Concluído)")
# motorista = input("O motorista foi identificado (Sim ou Não)")

# if checklist == "Concluído" and motorista == "Sim":
#     print("Iniciar Rota - Boa Viagem")
# else:
#     print("Volte e realize o Checklist!")

# ########################### 8
# print("Cálculo de Atrasos")
# entregas_agendadas = int(input("Quantidade de entregas agendadas"))
# entregas_atraso = int(input("Quantidade de entregas com atraso"))
# total = entregas_atraso / entregas_agendadas
# if total > 0.1:
#     print("Necessário Otimizar Rotas")
# else:
#     print("Logística Eficiente")

# ########################### 9
# print("Validação de Calibragem - Pressão dos Pneus")
# carga_pressao = float(input("Digite e medida da pressão em PSI dos Pneus"))
# if carga_pressao <= 100:
#     print("Abaixo do recomendado")
# elif carga_pressao >=110:
#     print("Acima do recomendado") 
# else:
#     print("Dentro do padrão recomendado")

# ########################## 10
# import time
# print("Contagem de Embarque")
# for embarque in range(5,0,-1):
#     time.sleep(1)
#     print(f"Embarque em: :) {embarque}")
    
# ######################### 11

# print("Somatório de Frete (Acumulador)")
# faturamento = 0
# frete = 1

# while frete != 0:
#     frete = float(input("Valor do Frete ou 0 para encerrar"))
#     faturamento += frete
# print(f"Faturamento total foi de {faturamento}")

# ########################## 12

# var = 0
# print("Monitoramento de Frota - Km - Versão 2.0")
# veiculo1 = int(input("Informe a KM do veiculo 1"))
# for km in range (2,6):
#     veiculos = float(input(f"Informe a KM do veiculo{km}registrada"))
# if veiculos > var:
#         var = var + veiculos
#         print(f"A maior KM foi de {var}")

# ########################### 13
# print("Sistema de Rastreio")
# erros = 0
# tentativas = 3

# while erros != 3:
#       codigo = input("Insira o código de acesso: ")
#       if codigo != "track99":
#             erros = erros + 1
#             tentativas = tentativas - 1
#             print(f"Codigo incorreto você possui {tentativas}")
#       else:
#         break
#       if erros == 3:
#         print("Rastreamento bloqueado!")
#       else:
#         print("Acesso liberado")

# ###########13 pt2##################
# print("Sistema de Rastreio - Versão 2")
# acesso_negado = 0
# while acesso_negado != 3:
#     codigo = input("Digite o código de acesso do rastreador")
#     if codigo != "track99":
#         acesso_negado = acesso_negado + 1
#         print("Acesso Negado")
#         print("Rastramento Bloqueado")
#     elif codigo:
#         print("Acesso Liberado")
#         break
        

# ########################## 14

# print("Gerenciador de Combustível")
# tanque = 500
# while True:
#     print("1 - Abastecer")
#     print("2 - Retirar")
#     print("3 - Sair")
#     opcao = input("Escolha uma opção")
#     if opcao == "1":
#         valor = float(input("Quantidade a abastecer"))
#         tanque += valor
#         print(f"Tanque atual: {tanque}")
#     elif opcao == "2":
#         valor = float(input("Quantidade a retirar"))
#         if valor > tanque:
#             print("Quantidade indisponível")
#         else:
#             tanque -= valor
#             print(f"Tanque atual {tanque}")
#     elif opcao == "3":
#         print("Encerrando o Sistema")
#         break
#     else:
#         print("Opção Inválida")
#         if tanque < 50:
#             print("Reserva Critica")   

# ########################## 15

# print("Relatório de Inspeção de Pneus")
# contagem = 0
# total = 5
# for pneu in range(1,6):
#     medida = float(input(f"Medida do sulco do pneu {pneu} em mm"))
#     if medida >= 1.6:
#         contagem = contagem + 1
#         print("Pneu aprovado e adicionado a contagem :)")
#     else:
#         print("Pneu fora das medidas regulares não foi adicionado a contagem")
#         pass 
#     porcentagem = (contagem / total) * 100
#     print(f"Tiveram {contagem} pneus aprovados hoje com uma taxa de {porcentagem}% de conformidade")
