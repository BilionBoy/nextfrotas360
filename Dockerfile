# syntax=docker/dockerfile:1

# Base image com Ruby 3.3.5
FROM ruby:3.3.5-slim

# Instala dependências do sistema
RUN apt-get update -qq && \
    apt-get install -y \
      build-essential \
      nodejs npm \
      postgresql-client libpq-dev \
      ffmpeg libvips42 \
      xfonts-75dpi xfonts-base \
      wkhtmltopdf xvfb && \
    npm install -g yarn && \
    # Cria link simbólico para o wkhtmltopdf (garante compatibilidade com WickedPDF)
    ln -s /usr/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf && \
    # Limpeza de cache para reduzir tamanho da imagem
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /app

# Copia o Gemfile e o Gemfile.lock para o diretório de trabalho
COPY Gemfile* ./

# Instala as gems
RUN bundle install

# Copia o restante do código do projeto
COPY . .

# Instala as dependências do JavaScript
RUN yarn install --frozen-lockfile

# Define o PATH global
ENV PATH="/usr/local/bin:$PATH"

# Porta padrão do Rails
EXPOSE 3000

# Comando padrão para iniciar o servidor Rails
CMD ["sh", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -p 3000"]
