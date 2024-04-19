# Comandos usados no terminal(PowerShell)
# Construir a imagem
# docker build -t rm551491-nginx .

# Executar o container
# docker run -d -p 8080:80 --name rm551491-nginx rm551491-nginx

# Verificar se o container está em execução
# docker ls

# Imagem Oficial NGINX
FROM nginx:latest

# Executa os comandos para atualizar os pacotes da imagem e instalar as ferramentas curl e vim
RUN apt-get -y update   
RUN apt -y install curl && apt -y install vim 
    
# Criar pasta "meu-site"
RUN mkdir -p /meu-site

# /raiz-meu-site/index.html -> /meu-site
COPY ./meu-site/index.html /meu-site

# Cópia dos arquivos da página web para o diretório NGINX
COPY ./meu-site /usr/share/nginx/html

# Adicionando Metadados    
LABEL description="Imagem para hospedar uma página web estática em um Container Docker" \
    author="Cássio Sakai" \
    version="1.0" \
    email="rm551491@fiap.com.br"

# Porta Padrão HTTP 8080
EXPOSE 80




