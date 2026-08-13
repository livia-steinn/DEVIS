#O laço "for" (repeticoes determinadas)
# Use o for quando voce sabe exatamente quantas vezes algo deve acontecer (como ler 10 sensores ou processar uma lista de peças)
#     Exemplo: Relatorio de produção diaria
# Imagine que voce tem uma meta de produzir 5 lotes q uer enumerar cada um

# for lote in range (1, 6):
#         print(f"Processando lote número {lote}...")
#         print("Qualidade verificada. [OK]")
#         print("Produção do dia finalizada")

#Exercício 1
# for carro in range(1, 6):
#     print(f"Produção de carros diárias {carro}...")

# for i in range(1000000):
#     print(i)
##########################################################################################################################
# pecas = ["Engrenagem","Eixo", "Rolamento", "Parafuso", "Martelo"]
# tipospecas = ["Barra Dentada","Porca do Eixo", "Anel Externo", "Parafuso Phillips", "Martelo cabeça chata" ]

# for item in pecas:
#     print(f"Item em estoque: {item}")
# for tipos in tipospecas:
#     print(f"Minha lista de tipos de pecas {tipospecas}")

# print("Bem-vindo a nossa loja de ferramentas")
# print("Escolha uma das opções")
# print("1 - Peças")
# print("2 - Tipos de Peças")
# opcao = int(input("Digite sua opção: "))
# estoquepecas = ["Engrenagem", "Eixo", "Rolamento", "Parafuso", "Martelo"]
# estoquetipos = ["Barra Dentada","Porca do Eixo", "Anel Externo", "Parafuso Phillips", "Martelo cabeça chata" ]

# if opcao == 1:
#     for item in estoquepecas:
#         print(f"Item em estoque:  {item}")
# elif opcao ==2:
#     for item in estoquetipos:
#      print(f"Item em estoque:  {item}")
# else:
#    print("Não temos essa opção. \n Encerrando Sistema!")

################################################################
# for pecas in range (1, 11):
#     print(f"Peça n°", {pecas},"processada com sucesso")
# print("Ciclo de produção concluído!")

# fruta1="Banana"
# quantidade1=10
# fruta2="Manga"
# quantidade2=5
# fruta3="Melancia"
# quantidade3=10
# fruta4="Abacaxi"
# quantidade4=13

# for tipos in range(1,11):
#     print(f"Frutas em estoque: {fruta1}")
# print(f"Temos", quantidade1,"Bananas")
# for tipos in range(1, 6):
#     print(f"Frutas em estoque: {fruta2}")
# print(f"Temos", quantidade2,"Mangas")
# for tipos in range(1,11):
#     print(f"Frutas em estoque: {fruta3}")
# print(f"Temos", quantidade3,"Melancias")
# for tipos in range(1,14):
#     print(f"Frutas em estoque: {fruta4}")
# print(f"Temos {quantidade4} Abacaxis")
############################################################
# print("Calculadora de Tabuadas 1 ao 10")
# valor=int(input("Qual tabuada você quer fazer?"))

# for i in range(1,11):
#     resultado = valor * i
#     print(f"{valor} x {i} = {resultado}")

################################################################

#O laço while(repeticoes indeterminadas)
#Use o while quando voce nao sabe quando vai parar. El depende de uma condição (como um sensor de segurança ou um botao de emergencia)
#Exemplo:Monitor de pressão (loop infinito controlado)

#Repete enquanto a pressão estiver segura


#Inicio
# import time
# pressão = 25
# while pressão < 40:
#     print(f"pressão atual: {pressão}°C. Sistema operando...")
#     time.sleep(2)
#     pressão+= 3 #Simulando o aquecimento da maquina
# print("ALERTA! pressão atingiu o limite. Desligando motor...")

################################################################################

#Exemplo Menu
# != diferente
# lower minuscumo
# upper maiusculo


# opcao = ""
# while opcao != "sair" and "SAIR":
#     opcao = input("Digite a leitura do sensor ou 'sair' para fechar: ").lower().upper()

#     if opcao != "sair"and "SAIR":
#         print(f"Dado '{opcao}' registrado no banco de dados")
# print("Sistema encerrado.")

#and e or
#and: comparacoes verdadeiras e iguais
#or: comparacoes verdadeiras e nao iguais



######################################################################################
 
# exercicio

# import time
# pressão = float(input("Pressão atual de um compressor: \n"))
# while pressão < 100:
#     print(f"pressão atual: {pressão}. Sistema operando...")
#     time.sleep(0.5)
#     pressão+= 6#Simulando o aquecimento da maquina
# print("ALERTA! pressão atingiu o limite. Desligando compressor...")
###################################################################################

# exercicio

# print("Escolha a série: ")
# print("1 - Grey's Anatomy")
# print("2 - Stranger Things")
# print("3 - Outer Banks")
# print("4 - Girlmore Girls")

# escolha= int(input("Selecione uma opção: \n"))

# while escolha == 1:
#     print("Aproveite sua série", [escolha])