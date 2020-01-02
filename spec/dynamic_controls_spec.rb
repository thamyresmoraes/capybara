describe 'Dynamic Control', :dynamic_control do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/dynamic_controls'

    end
    
    it 'quando habilita o campo' do
        
        # quando tem a propriedade disabled true o campo está desabilitado
        # quando tem a propriedade disabled true o campo está desabilitado

        resultado = page.has_field? 'movie', disabled: true
        puts resultado

        click_button 'Habilita'

        resultado = page.has_field? 'movie', disabled: false
        puts resultado
    end

    after(:each) do
        sleep 3
    end

end