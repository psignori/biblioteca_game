# biblioteca_game Using: Laravel
<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

# Instrução do deploy do docker;
Copia os Arquivo Dockerfile e docker-compose.yml para dentro do diretorio de sua preferencia, sugiro criar um separado para o projeto

* dentro do diretorio e já com os dois arquivos nele (Dockerfile e docker-compose) executar os seguintes comandos;
    * docker-compose down

    * docker-compose build

    * docker-compose up -d

* Acessa o container com o seguinte comando;
  * docker exec -it biblioteca-game /bin/bash

* Dentro do container acessa o diretorio /var/www e dar o git clone;
    * cd /var/www
    * git clone https://github.com/psignori/biblioteca_game.git

* Dar permissões ao git;
  * git config --global --add safe.directory /var/www/biblioteca_game
  * git config --global user.email "you@example.com"
  * git config --global user.name "Your Name"

* Criar chave pública na seguinte url: https://github.com/settings/tokens
  * ela vai gerar uma chave parecida com essa aq: TESTECqYY1ZI416nTESTE2OoptqjZ9cuK1TESTE sem os testes claro.

* dentro do repositorio que foi clonado executar o seguinte comando trocando somente a chave na url:
  * git remote set-url origin https://sua_chave_aq@github.com/psignori/biblioteca_game.git


# Problemas comum
  * Caso de erro em salvar os arquivos executar o seguinte comando dentro da pasta do projeto na     maquina local fora do docker, trocar o user pelo seu usuario local
    * sudo chmod 775 -Rf .
    * sudo chown www-data:user -Rf .
