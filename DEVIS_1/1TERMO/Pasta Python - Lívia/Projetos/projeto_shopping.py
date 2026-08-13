#REQUISITOS PARA O PROJETO
#Projeto: Sistema de Controle de Estacionamento (Shopping Center)

# ● O estacionamento possui um total de 500 vagas.

# ● O sistema deve manter um contador de vagas ocupadas. Se o estacionamento estiver lotado, a
# cancela de entrada não deve abrir para novos clientes (exceto para quem possui Tag de Acesso
# Rápido, pois estes têm vagas reservadas).

#Ao chegar na cancela, o sistema deve verificar o tipo de acesso:
# ● Via TAG (Sem Parar/ConectCar): * Verifique se a Tag está ativa.
# ○ Se ativa, a cancela abre automaticamente e registra o horário de entrada vinculado ao ID
# da Tag. 

# ● Via Ticket (Botão):
# O cliente pressiona o botão.
# O sistema verifica se há vagas comuns disponíveis.
# Se houver, imprime o ticket com a hora de entrada e abre a cancela.

# O cálculo do valor a ser pago na saída segue as seguintes regras:
# ● Até 15 minutos: Grátis (Tolerância).
# ● Até 3 horas: Valor fixo de R$ 15,00.
# ● Hora adicional: R$ 3,00 por hora extra (ou fração).
# ● Clientes com TAG: Possuem 10% de desconto sobre o valor total.

#O sistema não permitirá que a cancela abra sem o ticket for pago, cada ticket terá seu prório codigo para não acontecer erros

while True:
    import time
    ticket = 500
    print("Seja bem-vindo!")
    time.sleep(1.5)
    print("Selecione a opção de estacionamento: ")
    print("1 - Via Ticket")
    print("2 - Via Tag")
    opcao = int(input("Opção: "))
    if opcao == 1:
        time.sleep(1.5)
        print("Liberando Ticket")
        ticket =-1 
        time.sleep(1.5)
        hora_entrada = float(input("Digite o horário de entrada"))
        hora_saida = float(input("Digite o horário de saída"))
        pagamento_ticket= input("Foi realizado o pagamento do ticket?")
        total_hora = hora_saida - hora_entrada
        hora = 15
        hora_add = 0
        if pagamento_ticket == "nao":
            print("Volte ao totem e conclua o pagamento. \nSe aconteceu perca de ticket será cobrado uma taxa de R$50,00")
        if pagamento_ticket == "sim":
            if total_hora > 0 and total_hora < 0.15:
                print("Cobrança isenta, você tem 15 minutos de tolerância")
            elif total_hora <= 3:
                print("Você deve pagar R$15,00 ")
            elif total_hora > 3:
                hora_add = (total_hora - 3)*3
                print("Você deve pagar R$",hora_add+hora)
            print("Obrigado! Volte Sempre")
    elif opcao == 2:
        print("Analisando Tag")
        time.sleep(1.5)
        print("O custo referente ao período em que o veículo permaneceu no estacionamento será incluído em sua conta.")
        print("Liberanco cancela...")
        time.sleep(1)
        print("Obrigado! Volte Sempre")
    if ticket ==0:
        print("Vagas comuns esgotadas, tente a entrada via Tag!")
    
