# 1. Perfil de Gamer: Peça o nick (nome) do jogador e o nível atual. Exiba: "O jogador [nick] está no nível [nível] e pronto para a partida!"

print("Login do Gamer!")
nick = input("Insira seu nick: ")
nível = input("Digita seu nível atual: ")
print(f"O jogador {nick} está no nível {nível} e pronto para a partida!")

# 2. Calculadora de Mesada: Peça o valor que o aluno ganha por semana e multiplique por 4 para mostrar quanto ele terá no final do mês.

print("Calcule sua mesada!")
valor = float(input("Digita o valor da mesada semanal: "))
mesada = valor * 4
print(f"Sua mesada mensal é de {mesada} reais")