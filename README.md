# PVE_Site
Projeto Rails parte do novo site do PVE. O conteudo é entregue pelo Wordpress ao Rails via webhooks.

Instalação

Setup Wordpress

1) Baixar e instalar o MAMP
1.1) Durante a instalação você pode clicar em "Personalizar" e optar por não instalar o MAMP PRO

2) Download do WordPress em: https://wordpress.org/download/
2.1) Descompacte o conteudo na pasta Applications/MAMP/htdocs

3) Abra o MAMP e inicie o servidor
3.1) Ao iniciar, clique em "Open WebStart page"
3.2) Na página, vá em Tools -> PHPMYADMIN
3.3) Na aba "Databases", dê um nome para o novo banco de dados e crie ele

4) Para instalar o Wordpress vá em http://localhost:8888/wordpress (ou o nome da pasta que você colocou no htdocs)
4.1) Selecione o idioma e siga a instalação
4.2) Nos dados do banco de dados coloque o nome do banco que criou no passo anterior e username: root, password: root, host: localhost:8888.
4.3) O banco de dados será conectado e você pode rodar a instalação. 
4.4) Preencha os dados do site e complete a instalação.

Instalar e Configurar o plugin WP Webhooks (pode-se utilizar a interface de busca de plugins do WP mesmo)
- No plugin, ir em Settings e acionar os Triggers para Posts
- Na aba Send Data, configurar as urls dos hooks
- Nos webhooks, selecionar "Published" em "Trigger on initial post status change"
- (opcional) Nos webhooks, em Settings, marcar "Allow unsafe URLs" e "Allow unverified SSL" para funcionar em localhost

Rails part:
- Pré Requisitos
        brew install mysql

- Install

        bundle install
        
- Execute

         rails db:create
         rails db:migrate
         rails s

Troubleshooting
- Erros ao instalar a gem mysql2: 
        https://dev.to/morinoko/using-mysql-with-rails-6-and-installing-mysql-on-mac-macos-mojave-di3
-- No meu caso, MacOS Catalina 10.15.5, tive que instalar a gem separadamente informando o caminho do mysql:
    gem install mysql2 -- --srcdir=/usr/local/Cellar/mysql/8.0.21_1/include/
-- Mas não funcionava o create, aí rodei:
    gem uninstall mysql2
    gem install mysql2 -- --with-mysql-config=/usr/local/Cellar/mysql/8.0.21_1/bin/mysql_config --with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include
    brew update && brew upgrade
-- Aí ao rodar o db:create dava: Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
    Just run: mysql.server start




