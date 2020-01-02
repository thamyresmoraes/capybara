describe 'Mouse Hover', :mouse_hover do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/hovers'

    end
    
    it 'quando passo o mouse sobre o blade' do
       card_blade = find('img[alt=Blade]')
       card_blade.hover

       expect(page).to have_content 'Nome: Blade'
    end

    it 'quando passo o mouse sobre o pantera negra' do
        #quando o valor do elemento tem caracteres especiais ou espaços, é necessário colocar o valor do atibuto dentro de uma string.
        card_blade = find('img[alt="Pantera Negra"]')
        card_blade.hover
 
        expect(page).to have_content 'Nome: Pantera Negra'
     end
    
     it 'quando passo o mouse sobre o pantera negra' do
        card_blade = find('img[alt="Homem Aranha"]')
        card_blade.hover
 
        expect(page).to have_content 'Nome: Homem Aranha'
     end
    after(:each) do
        sleep 0.5
    end

end