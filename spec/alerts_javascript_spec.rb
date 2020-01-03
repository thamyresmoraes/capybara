describe 'Alertas JS', :alerts_javascript do
    before(:each) do
        visit '/javascript_alerts'
    end

    it 'alerta', :alerta do
        click_button 'Alerta'

        mensagem_alerta = page.driver.browser.switch_to.alert.text

        expect(mensagem_alerta).to eql 'Isto é uma mensagem de alerta'
        
    end

    it 'confirma' do
        click_button 'Confirma'

        pergunta = page.driver.browser.switch_to.alert.text
        expect(pergunta).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada' 

    end

    it 'não confirma' do
        click_button 'Confirma'

        pergunta = page.driver.browser.switch_to.alert.text
        expect(pergunta).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'

    end

    it 'prompt', :prompt do   

        accept_prompt(with: 'Thamy') do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Olá, Thamy'

    end

    it 'dismiss prompt', :dismiss_prompt do   

        dismiss_prompt() do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Olá, null'

    end
end