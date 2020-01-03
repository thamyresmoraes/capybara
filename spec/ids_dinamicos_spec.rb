describe 'Ids Dinâmicos', :ids_dinamicos do

    before(:each) do
        visit '/access'

    end

    it 'cadastro', :cadastro_ids_dinamicos do
        #regex
        find('input[id$=UsernameInput]').set 'Thamy'
        find('input[id^=PasswordInput]').set '1234567'
        find('a[id*=GetStartedButton]').click

    end
    
end
