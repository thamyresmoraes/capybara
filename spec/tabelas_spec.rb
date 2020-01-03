describe 'Tabelas', :tabelas do

    before(:each) do
        visit '/tables'

    end

    it 'exibir salário do ator', :exp_um_salario do
        linhas = all('table tbody tr')
        stark = linhas.detect { |linha| linha.text.include?('Robert Downey Jr') }
        
        expect(stark.text).to include '10.000.00'
    end
    
    it 'exibir salário do ator - exemplo 2', :exp_dois_salario do
        diesel = find('table tbody tr', text: '@vindiesel')
        expect(diesel).to have_content '10.000.00'

    end

    it 'exibir filme do ator', :filme do
        diesel = find('table tbody tr', text: '@vindiesel')
        filme = diesel.all('td')[2].text

        expect(filme).to eql 'Velozes e Furiosos'

    end

    it 'exibir instagram do ator', :instagram  do
        evans = find('table tbody tr', text: 'Chris Evans')
        instagram_evans = evans.all('td')[4].text

        expect(instagram_evans).to eql '@teamcevans'

    end

    it 'selecionar para remoção', :remocao do
        prat = find('table tbody tr', text: 'Chris Prat')
        prat.find('a', text: 'delete').click

        mensagem = page.driver.browser.switch_to.alert.text
        expect(mensagem).to eql 'Chris Pratt foi selecionado para remoção!'


    end

    it 'selecionar para edição', :edicao do
        prat = find('table tbody tr', text: 'Chris Prat')
        prat.find('a', text: 'edit').click

        mensagem = page.driver.browser.switch_to.alert.text
        expect(mensagem).to eql 'Chris Pratt foi selecionado para edição!'


    end
end
