# Usar imagem base do Python
FROM python:3.9-slim

# Setar diretório de trabalho
WORKDIR /app

# Copiar arquivos para o container
COPY ./src /app

# Instalar dependências
RUN pip install --no-cache-dir -r requirements.txt

# Expor a porta 8080
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8080", "app:app"]
