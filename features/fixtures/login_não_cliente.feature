#language: pt
@nao_cliente
Funcionalidade: Login ainda não sendo cliente
    
    Contexto:
    Dado a Pagina de login do Chatbot da Unimed Santos
    E seleciono que não sou cliente

    @corretos_n_cliente
    Cenário: logando com os dados corretos
    Dado as credenciais "Anna" e "(11)25489654"
    Quando entrar no Chatbot
    Então o login é efetuado com sucesso 

    @falta_n_cliente
    Cenário: logando faltando informações
    Dado as credenciais "Anna" e " "
    Quando entrar no Chatbot
    Então exibe a mensagem "Os campos identificados com asteriscos (*) são de preenchimento obrigatório."

    @incorretas_n_cliente
    Cenário: logando com informações incorretas
    Dadas as credenciais "Anna" e "111"
    Quando entrar no Chatbot
    Então exibe a mensagem "Por favor, insira um telefone válido."