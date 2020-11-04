Dado("seleciono que não sou cliente") do
  @login.entrar_nao_cliente
end
  
Dado("as credenciais {string} e {string}") do |nome, telefone|
  @login.preencher_formulario_nao_cliente(nome, telefone)
end


  