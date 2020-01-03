describe 'Escopo - Ambiguous Math', :login_escopo do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/access' 
    end

    it 'login', :login_1 do
        
        login_form = find('#login')
        
        login_form.find('input[name=username]').set 'stark'
        login_form.find('input[name=password]').set 'jarvis!'

        click_button 'Entrar'

        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'

    end

    it 'login2', :login_2 do
        
        #Dentro do elemento login, busque:
        within('#login') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'
            click_button 'Entrar'
            
        end

        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'cadastro com sucesso', :cadastro_com_sucesso do

        within('#signup') do
            find('input[name=username]').set 'Thamy'
            find('input[name=password]').set '1234567a'
            click_link 'Criar Conta'
            
        end

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end


end