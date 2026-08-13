#lbl = label = rótulo, é um widget do tkinter que serve para exibir um texto ou uma imagem na interface gráfica. Ele é usado para fornecer informações ao usuário, como títulos, descrições, instruções ou mensagens. O label pode ser personalizado com diferentes fontes, cores e estilos para se adequar ao design da aplicação. Ele é uma parte fundamental para criar interfaces amigáveis e informativas em aplicativos desenvolvidos com tkinter.    
#grid = é um método de posicionamento de widgets no tkinter que organiza os elementos em uma grade de linhas e colunas. Ele permite que você especifique a posição de cada widget usando coordenadas de linha e coluna, facilitando a criação de layouts estruturados e responsivos. O grid é uma alternativa ao método pack, oferecendo mais controle sobre o posicionamento dos widgets na interface gráfica.
#tkinter = é uma biblioteca de interface gráfica para Python que permite criar aplicativos com janelas, botões, rótulos e outros elementos visuais. Ele é amplamente utilizado para desenvolver interfaces de usuário simples e eficazes, proporcionando uma maneira fácil de criar aplicativos gráficos em Python. O tkinter é parte da biblioteca padrão do Python, o que significa que não requer instalação adicional para ser usado.
#pady = é um parâmetro usado no método grid do tkinter para adicionar espaço vertical (padding) entre os widgets. Ele define a quantidade de espaço em pixels que deve ser adicionado acima e abaixo do widget, ajudando a melhorar a aparência e a legibilidade da interface gráfica. O pady é útil para criar um layout mais organizado e visualmente agradável, evitando que os elementos fiquem muito próximos uns dos outros.
#padx = é um parâmetro usado no método grid do tkinter para adicionar espaço horizontal (padding) entre os widgets. Ele define a quantidade de espaço em pixels que deve ser adicionado à esquerda e à direita do widget, ajudando a melhorar a aparência e a legibilidade da interface gráfica. O padx é útil para criar um layout mais organizado e visualmente agradável, evitando que os elementos fiquem muito próximos uns dos outros.
#import = é uma palavra-chave em Python usada para incluir módulos ou bibliotecas externas no código. Ela permite que você acesse funções, classes e variáveis definidas em outros arquivos ou pacotes, facilitando a reutilização de código e a organização do projeto. O import é essencial para aproveitar as funcionalidades oferecidas por bibliotecas de terceiros e para modularizar o código em diferentes arquivos, tornando-o mais legível e fácil de manter. 
#geometry = é um método do tkinter usado para definir o tamanho e a posição de uma janela na tela. Ele aceita uma string no formato "LxA+X+Y", onde L é a largura da janela, A é a altura, X é a posição horizontal e Y é a posição vertical. Por exemplo, "500x500+100+100" criaria uma janela de 500 pixels de largura e 500 pixels de altura, posicionada a 100 pixels da borda esquerda e 100 pixels da borda superior da tela. O geometry é fundamental para controlar a aparência e o layout da interface gráfica em aplicativos desenvolvidos com tkinter.
#configure = é um método do tkinter usado para configurar as propriedades de um widget, como cor de fundo, cor do texto, fonte, entre outros. Ele permite personalizar a aparência e o comportamento dos elementos da interface gráfica, tornando-os mais atraentes e adequados ao design desejado. O configure é essencial para criar interfaces visuais agradáveis e funcionais em aplicativos desenvolvidos com tkinter.
#messagebox = é um módulo do tkinter que fornece uma maneira fácil de exibir caixas de diálogo para o usuário, como mensagens de aviso, erros, perguntas ou informações. Ele oferece funções como showinfo, showwarning, showerror e askquestion, que permitem criar interações mais dinâmicas e informativas em aplicativos gráficos desenvolvidos com tkinter. O messagebox é útil para fornecer feedback ao usuário e solicitar ações ou confirmações em situações específicas.
#tk.Tk= é a classe principal do tkinter que representa a janela principal da aplicação. Ela é usada para criar a interface gráfica e gerenciar os widgets e eventos associados a ela. Ao instanciar tk.Tk(), você cria uma janela onde pode adicionar botões, rótulos, caixas de texto e outros elementos visuais para construir a interface do usuário. A classe tk.Tk() é fundamental para iniciar o loop de eventos da aplicação e exibir a janela na tela.
#bg = é um parâmetro usado para definir a cor de fundo de um widget ou da janela principal em tkinter. Ele pode ser configurado usando o método configure ou diretamente na criação do widget, especificando a cor desejada em formato hexadecimal, nome da cor ou código RGB. O bg é importante para personalizar a aparência da interface gráfica e criar um design visualmente atraente em aplicativos desenvolvidos com tkinter.

# Revisão Tkinter

#Biblioteca
# import tkinter as tk
# from tkinter import messagebox, ttk

# # DEF - Linha de bloco de função
# def cadastrar_usuario():
#         # .get em todos os componentes que irão receber informação
#     nome_usuario = ent_nome_usuario.get()
#     nome_escola = cmb_nome_escola.get()

#     if nome_usuario == "":
#         messagebox.showwarning("Verificação de Dados", "Verificar os campos")
#     else:
#         messagebox.showinfo("Bem-Vindo", f"Olá usuário {nome_usuario}")


# # 0 Etapas - Janela 
# janela = tk.Tk()
# janela.title("Revisão Tkinter")
# janela.geometry("500x500")
# janela.configure(bg="pink")

# # 1 - Etapa - Componentes
# # Labels = Rotulos e Textos antigo print
# lbl_titulo_aplicacao = tk.Label(janela, text="Revisão Tkinter :)", font=("Arial", 14), fg="black", bg="white")
# lbl_titulo_aplicacao.grid(row=0, column=0, pady=20, padx=20)

# lbl_nome_usuario = tk.Label(janela, text="Digite seu nome:", font=("Arial", 12), fg="black", bg="white")
# lbl_nome_usuario.grid(row=1,column=0, pady=20, padx=20)

# lbl_nome_escola = tk.Label(janela, text="Escolha sua Escola:", font=("Arial", 12), fg="black", bg="white")
# lbl_nome_escola.grid(row=2, column=0, pady=10, padx=10)

# # Entrys = Caixa de texto ou antigo input
# ent_nome_usuario = tk.Entry(janela, font=("Arial", 14), fg="black", width=20)
# ent_nome_usuario.grid(row=1, column=1, pady=10, padx=10)

# # Caixa de seleção ou combobox
# cmb_nome_escola = ttk.Combobox(janela, values=["SESI5", "SESI408"], state="readonly",width=20)
# cmb_nome_escola.grid(row=2, column=1, pady=10, padx=10)

# #Botões 
# btn_enviar_dados = tk.Button(janela, text="Cadastrar Usuário", width=30, command=cadastrar_usuario)
# btn_enviar_dados.grid(row=3, column=0, pady=10, padx=10)

# btn_fechar_aplicacao = tk.Button(janela, text="Fechar Aplicação", width=30, command=janela.destroy) 
# btn_fechar_aplicacao.grid(row=3, column=1, pady=10, padx=10)


# # 4 Etapa - Mainloop
# janela.mainloop()



import tkinter as tk
from tkinter import messagebox

# DEF - Linha de bloco de função
def cadastrar_usuario():
    # .get em todos os componentes que irão receber informação
    nome_usuario = ent_nome_usuario.get()
    ano_usuario = ent_ano_usuario.get()

    # Validação: verifica se algum dos campos ficou em branco
    if nome_usuario == "" or ano_usuario == "":
        messagebox.showwarning("Verificação de Dados", "Verifique os campos!")
    else:
        messagebox.showinfo("Bem-Vindo", f"Olá {nome_usuario}, você nasceu em {ano_usuario}!")


# 0 Etapas - Janela 
janela = tk.Tk()
janela.title("Revisão Tkinter")
janela.geometry("500x500")
janela.configure(bg="pink")

# 1 - Etapa - Componentes
# Labels = Rotulos e Textos
lbl_titulo_aplicacao = tk.Label(janela, text="Revisão Tkinter :)", font=("Arial", 14), fg="black", bg="white")
lbl_titulo_aplicacao.grid(row=0, column=0, pady=20, padx=20)

lbl_nome_usuario = tk.Label(janela, text="Digite seu nome:", font=("Arial", 12), fg="black", bg="white")
lbl_nome_usuario.grid(row=1, column=0, pady=20, padx=20)

# Alterado para pedir a digitação do ano de nascimento
lbl_ano_usuario = tk.Label(janela, text="Digite seu ano de nascimento:", font=("Arial", 12), fg="black", bg="white")
lbl_ano_usuario.grid(row=2, column=0, pady=10, padx=10)

# Entrys = Caixa de texto (input) para o Nome
ent_nome_usuario = tk.Entry(janela, font=("Arial", 14), fg="black", width=20)
ent_nome_usuario.grid(row=1, column=1, pady=10, padx=10)

# Nova Entry = Caixa de texto (input) para o Ano de Nascimento
ent_ano_usuario = tk.Entry(janela, font=("Arial", 14), fg="black", width=20)
ent_ano_usuario.grid(row=2, column=1, pady=10, padx=10)

# Botões 
btn_enviar_dados = tk.Button(janela, text="Cadastrar Usuário", width=30, command=cadastrar_usuario)
btn_enviar_dados.grid(row=3, column=0, pady=10, padx=10)

btn_fechar_aplicacao = tk.Button(janela, text="Fechar Aplicação", width=30, command=janela.destroy) 
btn_fechar_aplicacao.grid(row=3, column=1, pady=10, padx=10)


# 4 Etapa - Mainloop
janela.mainloop()