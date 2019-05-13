FROM ruby:2.5.1

# https://github.com/nodesource/distributions#installation-instructions
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

# Seta nosso path
ENV INSTALL_PATH /usr/src/app
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
# Copia o nosso Gemfile para dentro do container
COPY Gemfile ./
# Instala as Gems
RUN bundle install
# Copia nosso código para dentro do container
COPY . .
# Roda nosso servidor
CMD puma -C config/puma.rb
