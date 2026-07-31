# Condições lógicas
# if:"Se"a condição for verdadeira
# elif : Senão, se (usado para múltiplas condições)
# else: Senão (executa se nenhumas das anteriores for verdadeira)

# print("Verificar Maioridade")
# idade = int(input("digite sua idade"))

# if idade >= 18:
#     print("Você é um adulto")
# elif idade >=16:
#     print("Você não é adulto mas pode votar")
# else :
#     print("Você é Adolescente")

    ##Sinais de > Maior
    #Sinais de < Menor+
    #Sinais de == 

# print("Loja")
# print("Bem-Vindo ao Sistemas da Lívia")
# print("Opções:")
# print("1 - Sapatos")
# print("2 - Roupas")
# print("3 - Perfumes")

# escolha = int(input("Digite sua escolha pelo número da opção "))

# if escolha == 1:
#     print("Você escolheu Sapatos")
#     print("Você quer Sapastos, OK")
#     v1 = float(input("Digite o valor do produto: "))
#     qt1 = int(input("Digite a quantidade desejada: "))
#     total = v1 * qt1
#     print("Sua compra de sapatos foi de un total de:", total)
# elif escolha == 2:
#     print("Você escolheu Roupas")
#     print("Você quer Roupas, OK")
#     v2 = float(input("Digite o valor do produto: "))
#     qt2 = int(input("Digite a quantidade desejada: "))
#     total = v2 * qt2
#     print("Sua compra de Roupas foi de un total de:", total)
# elif escolha == 3:
#     print("Você escolheu Perfumes")
#     print("Você quer Perfumes, OK")
#     v3 = float(input("Digite o valor do produto: "))
#     qt3 = int(input("Digite a quantidade desejada: "))
#     total = v3 * qt3
#     print("Sua compra de perfumes foi de un total de:", total)
# else:
#     print("Obrigada por utilizar o sistema da Lívia")


# print("Escolha uma opção para iniciar o Sistema")
# print("Séries = S")
# print("Filmes = F")
# categoria = input("Digite sua categoria ")
# if categoria == "S":
#     print("Você escolheu por Séries")
# elif categoria == "F":
#     print("Você escolheu por Filmes")
# else:
#     print("Não existe essa categoria\n" + "Estamos encerrando o aplicativo")

# Exercícios

# print("Calculadora Master")
# print("Bem-Vindo a calculadora!")
# print("Opções:")
# print("1 - Adição +")
# print("2 - Subtração -")
# print("3 - Divisão /")
# print("4 - Multiplicação *")
# conta = int(input("Digite qual sua operação"))

# if conta == 1:
#     n1= int(input("Primeiro valor \n"))
#     n2= int(input("Segundo valor\n"))
#     soma = n1 + n2
#     print("O resultado é", soma)
#     print("Espero que esteja satisfeito com suas operações! \n" + "Obrigada por usar a Calculadora Master")
# elif conta == 2:
#     n1= int(input("Primeiro valor \n"))
#     n2= int(input("Segundo valor\n"))
#     subtração = n1 - n2
#     print("O resultado é", subtração)
#     print("Espero que esteja satisfeito com suas operações! \n" + "Obrigada por usar a Calculadora Master")
# elif conta == 3:
#     n1= int(input("Primeiro valor \n"))
#     n2= int(input("Segundo valor\n"))
#     divisão = n1/n2
#     print("O resultado é", divisão)
#     print("Espero que esteja satisfeito com suas operações! \n" + "Obrigada por usar a Calculadora Master")
# elif conta == 4:
#     n1= int(input("Primeiro valor \n"))
#     n2= int(input("Segundo valor\n"))
#     multiplicação = n1*n2
#     print("O resultado é", multiplicação)
#     print("Espero que esteja satisfeito com suas operações! \n" + "Obrigada por usar a Calculadora Master")
# else:
#     print("Sinto muito por não poder ajudar! \n" + "Obrigada por usar a Calculadora Master")

#Exercicio 2

# print("Calculo de idade")
# print("Informações necessárias: ")
# print("- Nome")
# print("- Ano de Nascimento")
# print("- Ano atual")

# nome= input("Qual seu nome? \n")

# ano1= int(input("Em que ano estamos? \n"))

# ano2= int(input("Em que ano você nasceu? \n"))

# total= ano1 - ano2

# print("Seu nome é", nome)
# print("Você tem ", total, "anos")


#Exercicio 3

# print("Calculadora de gorjetas")
# valor_conta = float(input("Digite o valor da conta: R$"))
# porcentagem = int(input("Digite a porcentagem da gorgeta(5 ou 10): "))

# if porcentagem == 5 or porcentagem ==10:
#     gorjeta= valor_conta*(porcentagem / 100)
#     total = valor_conta + gorjeta

#     print(f"Gorjeta: R$ {gorjeta:.2f}")
#     print(f"Total a pagar: R$ {total:.2f}")
# else:
#     print("Porcentagem inválida! Escolha 5 ou 10.")

#Exercicio 4
 
# print("Calcule os antecessores e sucessores de seus valores!")
# n1 = int(input("Digite seu Valor: "))
# antecessor = n1 - 1
# print("O antecessor do seu valor é: ", antecessor)
# sucessor = n1 + 1
# print("O sucessor do seu valor é: ", sucessor)

#Exercicio 5

# print("Caulculadora de porcentagem!")
# livro = float(input("Qual total dos livros?"))
# total = livro * (100/5) + livro
# valordesconto= total