Dado("a Pagina de login do Chatbot da Unimed Santos") do
  @login.visitar
end

Dado("as credenciais {string}, {string} e {string}") do |nome, telefone, cpf|
  @login.preencher_formulario_cliente(nome, telefone, cpf)
end

Quando("entrar no Chatbot") do
  @login.entrar
end

Então("o login é efetuado com sucesso") do
  @login.logando
end

Então("exibe a mensagem {string}") do |mensagem|
  @login.verificar_mensagem(mensagem)
end

