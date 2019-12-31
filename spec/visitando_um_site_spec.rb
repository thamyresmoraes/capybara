describe 'Visitando um site' do

    it 'acessando o site' do

        visit 'https://www.uol.com.br'
        expect(page.title).to eql 'UOL - O melhor conteúdo'
    end
end