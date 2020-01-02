describe 'Drag and Drop', :drag_and_drop do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/drag_and_drop'

    end
    
    it 'homem aranha pertence ao time do stark' do

        team_stark = find('.team-stark .column')
        team_cap = find('.team-cap .column')

        spiderman = find('img[alt$=Aranha')
        spiderman.drag_to team_stark

        expect(team_stark).to have_css 'img[alt$=Aranha'
        expect(team_cap).not_to have_css 'img[alt$=Aranha'
        
    end

end