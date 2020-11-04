#language: pt
@cliente
Funcionalidade: login como cliente
    
    Contexto: 
    Dado a Pagina de login do Chatbot da Unimed Santos
    @correto
    Cenário: logando com os dados corretos
    Dado as credenciais "Anna", "(11)25489654" e "212.854.827-60"
    Quando entrar no Chatbot
    Então o login é efetuado com sucesso 

    @cpf_incorreto
    Cenário: logando com o CPF incorreto
    Dado as credenciais "Anna", "(11)25489654" e "111.111.111-11"
    Quando entrar no Chatbot
    Então exibe a mensagem "Por favor, insira um numero de CPF válido."

    @falta
    Cenário: logando faltando informações
    Dado as credenciais "Anna", " " e "212.854.827-60"
    Quando entrar no Chatbot
    Então exibe a mensagem "Os campos identificados com asteriscos (*) são de preenchimento obrigatório."

    @telefone
    Cenário: logando com o telefone incorreto
    Dado as credenciais "Anna", "1 1 1" e "212.854.827-60"
    Quando entrar no Chatbot
    Então exibe a mensagem "Por favor, insira um telefone válido."

