# Projeto 2º Trimestre - Lívia Stein

## Descrição do Projeto

Este repositório contém as atividades, exercícios e projetos desenvolvidos durante o 2º trimestre, abrangendo três disciplinas principais: **Banco de Dados (BCD)**, **Linguagens de Programação Web (LIMA)** e **Programação em Bloco Estruturado (PBE)**.

O projeto consolidada aprendizados em:
- Modelagem de banco de dados relacional
- Desenvolvimento web com HTML e CSS
- Programação JavaScript com foco em estruturas de controle e lógica
- Desenvolvimento de aplicações backend com Node.js

---

## Tecnologias Utilizadas

- **HTML5** - Estruturação de páginas web
- **CSS3** - Estilização e design responsivo
- **JavaScript (ES6+)** - Programação front-end e back-end
- **Node.js** - Ambiente de execução JavaScript
- **BrModelo** - Ferramenta para modelagem de banco de dados
- **Git** - Controle de versão

### Dependências do Projeto

O projeto utiliza o pacote:
- `readline-sync` (v1.4.10+) - Para captura de entrada em aplicações Node.js

---

## Estrutura de Pastas

```
2TERMO/
├── BCD/
│   └── MODELO_relacionamentos_Conceitual.brM    # Modelo de banco de dados relacional
├── LIMA/
│   ├── Aula01/
│   │   ├── index.html                           # Página inicial com introdução a HTML
│   │   ├── css.html                             # Exemplos de CSS
│   │   └── desafio.html                         # Desafio prático Aula 01
│   ├── Aula02/
│   │   ├── index.html                           # Página sobre estrutura HTML
│   │   └── equipe.html                          # Página com informações de equipe
│   └── Projeto/
│       ├── index.html                           # Página principal do projeto
│       ├── categoria.html                       # Gerenciamento de categorias
│       ├── clientes.html                        # Gerenciamento de clientes
│       ├── delivery.html                        # Sistema de delivery
│       ├── estoque.html                         # Controle de estoque
│       ├── fornecedor.html                      # Gerenciamento de fornecedores
│       ├── funcionarios.html                    # Gerenciamento de funcionários
│       ├── pagamento.html                       # Processamento de pagamentos
│       ├── pedidos.html                         # Gerenciamento de pedidos
│       ├── produtos.html                        # Catálogo de produtos
│       └── programafidelidade.html              # Sistema de fidelidade
├── PBE/
│   ├── Lacos/
│   │   ├── array.js                             # Exercícios com arrays (parte 1)
│   │   ├── array2.js                            # Exercícios com arrays (parte 2)
│   │   ├── ex1.js                               # Exercício 1 - Laços de repetição
│   │   ├── ex2.js                               # Exercício 2 - Laços de repetição
│   │   ├── ex3.js                               # Exercício 3 - Laços de repetição
│   │   ├── ex4.js                               # Exercício 4 - Laços de repetição
│   │   ├── package.json                         # Configuração do Node.js
│   │   └── node_modules/                        # Dependências instaladas
│   ├── PBE - Manhã/
│   │   ├── Aula01/                              # Aula 1 - Turno da manhã
│   │   ├── Aula_01/                             # Aula 1 - Variação
│   │   └── backend1_aula_autonoma/              # Aula autônoma de backend
│   │       ├── atividade_final.js               # Atividade final
│   │       ├── aula1.js                         # Conteúdo Aula 1
│   │       ├── aula2.js                         # Conteúdo Aula 2
│   │       ├── aula3.js                         # Conteúdo Aula 3
│   │       ├── aula4.js                         # Conteúdo Aula 4
│   │       └── package.json                     # Dependências
│   └── PBE - Tarde/
│       ├── Aula_02/                             # Aula 2 - Turno da tarde
│       └── Lacos/                               # Exercícios sobre laços
└── README.md                                    # Este arquivo
```

---

## Resumo das Atividades por Disciplina

### 📊 BCD (Banco de Dados)

**Conceito:** Modelagem de bancos de dados relacionais
**Atividade Principal:**
- **MODELO_relacionamentos_Conceitual.brM** - Modelo conceitual em brModelo representando relacionamentos entre entidades do domínio de delivery (clientes, pedidos, produtos, fornecedores, estoque, funcionários, pagamento, fidelidade)

**Objetivos:**
- Compreender conceitos de entidades e relacionamentos
- Praticar modelagem conceitual de dados
- Preparar base para implementação em SQL

---

### 🌐 LIMA (Linguagens de Programação Web)

**Conceito:** Fundamentos de desenvolvimento web com HTML e CSS
**Estrutura de Aulas:**

**Aula 01 - Introdução a HTML e CSS**
- `index.html` - Presentação de elementos HTML básicos
- `css.html` - Demonstração de propriedades CSS
- `desafio.html` - Exercício prático de aplicação

**Aula 02 - Estrutura de Páginas e Layouts**
- `index.html` - Consolidação de conceitos
- `equipe.html` - Página com estrutura de tabelas

**Projeto Final - Sistema de Delivery Web**
- Aplicação completa com 11 páginas HTML
- Simulação de um sistema de gerenciamento de delivery
- Módulos:
  - **Produtos** - Catálogo de produtos disponíveis
  - **Categorias** - Classificação de produtos
  - **Pedidos** - Gestão de pedidos dos clientes
  - **Clientes** - Base de dados de clientes
  - **Funcionários** - Gerenciamento de equipe
  - **Fornecedores** - Controle de fornecedores
  - **Estoque** - Controle de inventário
  - **Pagamento** - Processamento de pagamentos
  - **Programa de Fidelidade** - Sistema de recompensas
  - **Delivery** - Acompanhamento de entregas

**Tecnologias:** HTML5, CSS3, Estruturação semântica

---

### 💻 PBE (Programação em Bloco Estruturado)

**Conceito:** Fundamentos de programação com JavaScript
**Estrutura de Atividades:**

**Laços (Loops e Iterações)**
- `array.js` - Operações com arrays (introdução)
- `array2.js` - Operações avançadas com arrays
- `ex1.js` - Laço while simples
- `ex2.js` - Laço for com condições
- `ex3.js` - Manipulação de dados em loops
- `ex4.js` - Exercício de consolidação

**Aula Autônoma de Backend (PBE - Manhã)**
- `aula1.js` - Conceitos de variáveis e tipos
- `aula2.js` - Operadores e expressões
- `aula3.js` - Estruturas de controle (if/else)
- `aula4.js` - Funções e escopo
- `atividade_final.js` - Projeto integralizador

**Turno da Tarde**
- `Aula_02/` - Conteúdo complementar
- `Lacos/` - Prática adicional de laços

**Tecnologias:** JavaScript (Node.js), readline-sync

---

## Instruções para Executar

### Pré-requisitos

- [Node.js](https://nodejs.org/) instalado (versão 12+)
- Editor de código (VS Code, Visual Studio, etc.)
- Git instalado para controle de versão

### Executar Arquivos HTML

Os arquivos HTML podem ser executados diretamente:

1. **Com navegador padrão:**
   ```bash
   # Windows
   start caminho/para/arquivo.html
   
   # macOS
   open caminho/para/arquivo.html
   
   # Linux
   xdg-open caminho/para/arquivo.html
   ```

2. **Com Live Server (VS Code):**
   - Instale a extensão "Live Server"
   - Clique com botão direito no arquivo `.html`
   - Selecione "Open with Live Server"

### Executar Arquivos JavaScript (Node.js)

#### 1. Instalar Dependências

```bash
# Navegar para pasta PBE
cd PBE/Lacos
npm install

# Ou para backend autônomo
cd "PBE - Manhã"
cd backend1_aula_autonoma
npm install
```

#### 2. Executar Scripts

```bash
# Executar arquivo JavaScript
node ex1.js
node array.js
node aula1.js

# Exemplo com entrada do usuário (readline-sync)
node aula2.js
```

#### 3. Exemplo de Execução Completa

```bash
# Terminal/PowerShell
cd "c:\Users\45258947840\Desktop\DEVIS\2TERMO\PBE\Lacos"
node ex1.js
# Output: Contagem: 0, Contagem: 1, ..., Fim da contagem!
```

### Abrir Projeto no Brmodelo

1. Baixe [Brmodelo 3.1+](http://www.brmodelo.com.br/)
2. Abra o arquivo `BCD/MODELO_relacionamentos_Conceitual.brM`
3. Visualize e edite o modelo relacional

---

## Instruções Git

### Configuração Inicial

```bash
# Configurar nome e email (primeira vez)
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@example.com"
```

### Comandos Essenciais

#### Clonar Repositório
```bash
git clone <URL_DO_REPOSITORIO>
cd 2TERMO
```

#### Verificar Status
```bash
# Ver arquivos modificados
git status

# Ver histórico de commits
git log --oneline -10
```

#### Enviar Mudanças

```bash
# 1. Adicionar arquivos modificados
git add .                    # Adiciona tudo
# ou
git add arquivo.html         # Arquivo específico

# 2. Criar commit com mensagem
git commit -m "Descrição clara da mudança"

# Exemplo de mensagens boas:
# "Adiciona nova funcionalidade ao módulo de pedidos"
# "Corrige bug no cálculo de frete"
# "Refatora código do laço em ex2.js"

# 3. Enviar para repositório remoto
git push origin main
# ou
git push origin master
```

#### Atualizar Local com Remoto
```bash
# Obter atualizações
git pull origin main
```

#### Criar Branch para Novas Funcionalidades
```bash
# Criar e trocar de branch
git checkout -b feature/nova-funcionalidade

# Trabalhar no branch
# ... editar arquivos ...

# Commit com prefixo descritivo
git commit -m "feat: adiciona validação de pagamento"

# Enviar branch
git push origin feature/nova-funcionalidade

# No GitHub/GitLab, criar Pull Request (PR)
```

#### Melhores Práticas

```bash
# Commit atômicos (uma mudança por commit)
git commit -m "fix: corrige laço infinito em ex3.js"

# Mensagens convencionais
# feat: nova funcionalidade
# fix: correção de bug
# refactor: reorganização de código
# docs: atualizações de documentação
# style: formatação (não altera lógica)

# Revisar antes de enviar
git diff                  # Ver mudanças
git log -p arquivo.js     # Ver histórico de um arquivo
```

#### Desfazer Mudanças
```bash
# Descartar mudanças locais
git checkout arquivo.html

# Remover arquivo da staging area
git reset arquivo.html

# Desfazer último commit (mantém mudanças)
git reset --soft HEAD~1

# Desfazer último commit (descarta mudanças)
git reset --hard HEAD~1
```

---

## Como Contribuir

1. **Fork** o repositório (se necessário)
2. Crie uma **branch** para sua funcionalidade: `git checkout -b feature/MeuFeature`
3. **Commit** as mudanças: `git commit -m "Adiciona meu recurso"`
4. **Push** para a branch: `git push origin feature/MeuFeature`
5. Abra um **Pull Request**

---

## Padrões de Código

### JavaScript
- Use `const` por padrão, `let` quando necessário reatribuição
- Nomes descritivos: `calcularTotal()` em vez de `calc()`
- Indentação com 2 espaços

### HTML/CSS
- Mantenha tags e classes semanticamente corretas
- Nomes de classe em kebab-case: `classe-do-botao`
- IDs reservados para identificação única

### Comentários
```javascript
// Comentário em linha (explique o "por quê", não o "quê")
// ❌ Incrementa contador
// ✅ Avança posição no array para próxima iteração

/* 
 * Comentário multi-linha
 * Use para explicar lógica complexa
 */
```

---

## Autor

**Lívia Stein**

---

## Licença

Este projeto é fornecido para fins educacionais.

---

## Notas Finais

- Todos os arquivos foram desenvolvidos durante aulas práticas
- Revise o conteúdo de cada pasta para detalhes específicos
- Mantenha o repositório organizado e commits descritivos
- Documente suas mudanças com comentários úteis
- Use branches para não interferir na main

---

**Última atualização:** Agosto de 2026
