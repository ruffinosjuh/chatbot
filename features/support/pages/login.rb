class LoginPage
    include Capybara::DSL
    include RSpec::Matchers

    def visitar 
        visit("https://unimedsantos-silver.virtualinteractions.com.br/pt_BR/avi.html?id=134&source=2&target=1&channel=1&launchType=popup&ms=1566588028100##forward")
    end

    def preencher_formulario_cliente(nome, telefone, cpf)
        find(EL["campo_nome"]).set nome
        find(EL["campo_telefone"]).set telefone
        find(EL["campo_cpf"]).set cpf
    end

    def entrar
        find(EL["botao_entrar"]).click
    end

    def logando
        expect(page).to have_text "Desejo boas-vindas a central de atendimento da Unimed Santos"
    end

    def verificar_mensagem(mensagem)
        expect(page).to have_text mensagem
    end

    def entrar_nao_cliente
        find(EL["botao_nao_cliente"]).click
    end

    def preencher_formulario_nao_cliente(nome, telefone)
        find(EL["campo_nome"]).set nome
        find(EL["campo_telefone"]).set telefone
    end

end
