describe 'Key Presses - Teclado', :key_presses do
    
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/key_presses'
    end

    it 'enviando teclas', :simbolos do
        
        teclas = %i[tab escape space enter shift control alt]
        
        teclas.each do |tecla|
            find('#campo-id').send_keys tecla
            expect(page).to have_content 'You entered: ' + tecla.to_s.upcase
        end

    end

    it 'enviando letras', :letras do
    
        letras = %w[a s d f g h j k l q e t]
        
        letras.each do |letra|
            find('#campo-id').send_keys letra
            expect(page).to have_content 'You entered: ' + letra.to_s.upcase
        end

    end
end