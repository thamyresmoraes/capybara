describe 'Forms' do
    it 'login com sucesso' do
        
        visit '/login'

        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis!'

        click_button 'Login'

        #Pegue o texto e verifique se contém o valor no elemento.
        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'

        #Existe o conteúdo no elemento?
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'senha incorreta' do
        visit '/login'

        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'senha_incorreta'

        click_button 'Login'

        expect(find('#flash').text).to include 'Senha é invalida!'
    end
    it 'usuário não cadastrado' do
        visit '/login'

        fill_in 'username', with: 'não sou cadastrado'
        fill_in 'password', with: 'jarvis!'

        click_button 'Login'

        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
        
    end
    
end