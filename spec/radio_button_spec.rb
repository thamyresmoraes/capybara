describe 'Radio Buttons', :radio_button do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/radios'
    end

    it 'selecionando por ID' do
        choose('cap')
    end

    it 'selecionando pelo find e css selector' do
        find('input[value=guardians').click
    end
    
    after(:each) do
        sleep 3
    end
end