describe 'Combo box', :combo_box do
    
    it 'selecione item' do
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'

        select('Loki', from: 'dropdown')
        sleep 3 
    end
end