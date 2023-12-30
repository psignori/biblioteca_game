# Use a imagem Ubuntu 22.04 como base
FROM ubuntu:22.04

ENV LANG pt_BR.utf8

ENV TZ="America/Sao_Paulo"

ARG DEBIAN_FRONTEND="noninteractive"

# Atualize os repositórios e instale as dependências
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update

# Instale o PHP 8.2
RUN apt-get install -y \
    apache2 \
    libapache2-mod-php \
    php8.2 \
    php8.2-cli \
    php8.2-mbstring \
    php8.2-pgsql \
    php8.2-zip \
    php8.2-xml \
    php8.2-dom\
    php8.2-curl \
    php8.2-redis \
    php8.2-opcache

RUN echo -e "Instalação de dependências..." && \
    apt-get install -y \
    wget \
    git \
    composer \
    cron \
    sudo \
    curl \
    unzip \
    zip \
    vim \
    htop

# Muda o time zone da imagem
ENV TZ 'America/Sao_Paulo'
RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

# instalação do banco
RUN apt-get update && \
    apt-get install postgresql -y \
    postgresql-contrib


# caso de erro su - postgres
# psql -U seu_usuario -d seu_banco_de_dados
# Configuração do PostgreSQL
USER postgres
RUN /etc/init.d/postgresql start && \
    psql --command "ALTER USER postgres WITH PASSWORD 'postgres';" && \
    psql --command "CREATE DATABASE biblioteca_game;"

# Configuração do Apache
RUN a2enmod rewrite

# Copia o virtualhost para o apache
COPY ./biblioteca_game.conf /etc/apache2/sites-available/biblioteca_game.conf
RUN a2ensite biblioteca_game.conf
RUN a2dissite 000-default.conf
RUN /etc/init.d/apache2 restart

RUN chmod 777 /var/www/biblioteca_game/ -Rf

# Inicializa o Apache quando o container for iniciado
CMD service apache2 start && bash
