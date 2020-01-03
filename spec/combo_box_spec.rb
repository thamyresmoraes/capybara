describe 'Combo box', :combo_box do
    
    it 'selecione item - select com id' do
        visit '/dropdown'
        select('Loki', from: 'dropdown')
    end

    it 'item especifico com o find - css selector' do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option 
    end

    it 'selecione qualquer item', :sample do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.all('option').sample.select_option
    end

end