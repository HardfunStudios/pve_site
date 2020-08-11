# PVE_Site

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


- Install

        bundle install
        
- Execute

         rails db:create
         rails db:migrate
         rails s

