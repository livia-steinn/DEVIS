##########CAÇA_ERROS
#Problema 1
#ERRADO##################################
# idade = input("Digite sua idade: ")
# if idade >=18:
#     print("Você é maior de idade")
#CERTO##################################
# idade = int(input("Digite sua idade: "))
# if idade >= 18:
#     print("Você é maior de idade")
#MELHORADO###############################
# idade = int(input("Digite sua idade: "))
# if idade >= 18:
#     print("Você é maior de idade")
# elif idade >=11:
#     print("Você é adolescente")
# else:
#     print("Você é uma criança")

#Problema 2
#ERRADO##################################
# nome = "Mariana"
# print("Seja bem-vinda,nome!")
# #CERTO#####################################
# nome = "Mariana"
# print("Seja bem-vinda",nome,"!")
#MELHORADO###############################
# nome = input("Qual seu nome? \n")
# print("Seja bem-vindo(a)",nome,"!")

#Problema 3
#ERRADO##################################
# numero = 10
# if numero >5:
# print("o Número é maior que cinco")
# else:
# print("O número é menor ou igual a cinco")
# #CERTO#####################################
# numero = float(input("Digita o número: "))
# if numero >5:
#     print("O número é maior que cinco")
# else:
#     print("O número é menor ou igual a cinco") 
#MELHORADO###############################
# numero = float(input("Digita o número: "))
# if numero >5:
#     print("O número é maior que cinco")
# elif numero <5:
#     print("O número é menor que cinco")
# else:
#     print("O número é igual a cinco") 

#Problema 4
#ERRADO##################################
# usuario ="aluno123"
# if usuario == "aluno123"
#     print("Login realizado com sucesso")
#CERTO#####################################
# usuario = input("Digita sua senha de usuário: ")
# if usuario == "aluno123":
#     print("Login realizado com sucesso")
# else:
#     print("Usuário não detectado! Cadastre-se!")

#Problema 5
#ERRADO##################################
# clima = "ensolarado"
# if clima = "chuvoso":
#     print("Leve um guarda-chuva!")
#CERTO#####################################
# clima = input("Como está o clima hoje? \n")
# if clima == "chuvoso":
#     print("Leve um guarda-chuva")
#MELHORADO###############################
# print("Climas:")
# print("1- Ensolarado")
# print("2- Chuvoso")
# print("3- Frio")
# print("4- Seco")

# clima = input("Como está o clima hoje? \n")
# if clima == "Ensolarado":
#     print("Aproveite seu dia!")
# elif clima == "Chuvoso":
#     print("Leve um guarda-chuva! Tenha um bom dia!")
# elif clima == "Frio":
#     print("Se agasalhe! Tenha um bom dia!")
# elif clima == "Seco":
#     print("Se mantenha hidratado! Tenha um bom dia!")

#Problema 6
#ERRADO##################################
# pontos = 50
# print("Parabéns! Você fez " + pontos + " pontos")
# #CERTO#####################################
# pontos = "50"
# print("Parabéns! Você fez " + pontos + " pontos")
#MELHORADO###############################
# pontos = int(input("Quantos pontos você fez? \n"))
# print("Parabéns! Você fez", pontos,"pontos")

#Problema 7
#ERRADO##################################
# nota = 9.5
# if nota >=7:
#     print("Aprovado")
# elif nota >=9:
#     print("Excelente")
#CERTO#####################################
# nota = int(input("Digita sua nota: "))
# if nota ==7:
#     print("Aprovado")
# elif nota >=9 and 10:
#     print("Excelente!")
#MELHORADO###############################
# nota = int(input("Digita sua nota: "))
# if nota <7:
#     print("Reprovado!")
# elif nota >=9 and 10:
#     print("Excelente!")
# else:
#     print("Aprovado")

#Problema 8
#ERRADO##################################
# for i in range(5):
#     print(i)
# #CERTO#####################################
# for i in range(1,6):
#     print(i)

#Problema 9
#ERRADO##################################
# tentativas = 1
# while tentativas <=3:
#     print("Tentando conectar...")
#CERTO#####################################
# tentativas = 1
# while tentativas <= 3:
#     print(f"Tentando conectar...")
#     tentativas += 1

#Problema 10
#ERRADO##################################
# senha = ""
# while senha == "python123":
#     senha = input("Digite a senha secreta: ")
# print("Acesso concedido!")
#CERTO#####################################
# senha = ""
# while senha != "python123":
#     senha = input("Digite a senha secreta: ")
# print("Acesso concedido!")

