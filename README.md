# Criando o ambiente no Linux

 - Chrome drive (última versão)
 - Geckodriver
 - Ruby
 - Bundler

# Instalando o Chrome drive no linux:
1. Acesse a URL: https://chromedriver.storage.googleapis.com/index.html
2. Faça o download da última versão do Chromedriver (MAC ou Linux). (para saber a ultima versão acesse https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
Faça a descompactação do chromedriver_linux64.zip
3. Acesse a pasta Downloads pelo terminal
4. Agora basta mover para o PATH executando o comando: `sudo mv chromedriver /usr/local/bin`

# Instalando o Geckodriver:
1. Acesse a URL: https://github.com/mozilla/geckodriver/releases
2. Faça o download da última versão do Gekodriver (MAC ou Linux)
3. Faça a descompactação do geckodriver-v0.XX.0-linux64.tar.gz
4. Acesse a pasta Downloads pelo terminal
5. Agora basta mover para o PATH executando o comando: `sudo mv geckodriver /usr/local/bin`

# Instalando o Ruby:
Dependências

```
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update

sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
sudo apt-get install git
```
BASH

```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

source ~/.bashrc

rbenv install 2.6.1
rbenv global 2.6.1

source ~/.bashrc
```
# Verificando se deu tudo certo

- ruby -v

# Instalando bundler

- `gem install bundler`

# Criando script
  - Crie o arquivo Gemfile
    ```
    source 'https://rubygems.org'

    gem 'capybara'
    gem 'selenium-webdriver'
    gem 'rspec'
    ```
- Instale as gems executando o comando `bundle install` 
- Excute o comando `rspec --init` para inicializar um projeto o rspec

# Integrar rspec com o capybara
 - No topo do arquivo spec_helper.rb importe:
    ```
    require 'capybara'
    require  'capybara/rspec'
    ```
- E no final do arquivo chame o método config:
     ```
     config.include Capybara::DSL
     ```

- Configure o driver do capybara:
    ```
    Capybara.configure do |config|
        config.default_driver = :selenium_chrome
    end
    ```
- Dentro da pasta spec crie o arquivo `visitando_um_site_spec.rb`
     ```
    describe 'Visitando um site' do
    
        it 'acessando o site' do
    
            visit 'https://www.uol.com.br'
            puts page.title #titulo_da_página
        end
    end
     ```
- Execute o script:
    `rspec -fd`

![image](https://user-images.githubusercontent.com/23202661/71630788-b99f0b00-2be3-11ea-91ac-cff8323dfebc.png)

# Verificando se o titulo da página corresponde ao resultado esperado

`expect(page.title).to eql 'UOL - O melhor conteúdo'`


![image](https://user-images.githubusercontent.com/23202661/71630911-74c7a400-2be4-11ea-8968-cab2388a76f4.png)

# Congelando gems
- gem "capybara", "3.30.0"

# Atualizando gem
`bundle update`

# Executando o teste no firefox
- No arquivo `spec_helper.rb` substitua `config.default_driver = :selenium_chrome` para o navegador default(firefox) `config.default_driver = :selenium`

# Executando cenário com tag
`rspec --tag @combo_box`

# Incluindo before e after
![image](https://user-images.githubusercontent.com/23202661/71681920-d0249e00-2d6c-11ea-82af-63e8e0db9eb4.png)

# Adeus sleep!!!
Por default, o Capybara aguarda 2 segundos até que o elemento seja exibido na tela, mas alguns cenários exigem mais que 2 segundos, tornando comum a inserção do `sleep` no código. Mas podemos melhorar isso alterando a variável `default_max_wait_time` para o tempo exigido na validação de nossos testes.

- Vá até o arquivo `spec_helper.rb` e adicione a variavel `default_max_wait_time`: 

![image](https://user-images.githubusercontent.com/23202661/71686472-09173f80-2d7a-11ea-96d3-49d6ff4e0a22.png)


# Testes

- [FORMS](https://github.com/thamyresmoraes/capybara/blob/master/spec/forms_spec.rb)
- [NOTIFICAÇÕES](https://github.com/thamyresmoraes/capybara/blob/master/spec/validando_notificações_spec.rb)
- [COMBO BOX](https://github.com/thamyresmoraes/capybara/blob/master/spec/combo_box_spec.rb)
- [CHECK BOX](https://github.com/thamyresmoraes/capybara/blob/master/spec/check_box_spec.rb)
- [RADIO BUTTON](https://github.com/thamyresmoraes/capybara/blob/master/spec/radio_button_spec.rb)
- [UPLOAD DE ARQUIVOS](https://github.com/thamyresmoraes/capybara/blob/master/spec/upload_spec.rb)
- [DYNAMIC CONTROLS](https://github.com/thamyresmoraes/capybara/blob/master/spec/dynamic_controls.rb)
- [MOUSE HOVER](https://github.com/thamyresmoraes/capybara/blob/master/spec/mouse_hover_spec.rb)