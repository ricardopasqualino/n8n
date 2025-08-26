# Dockerfile para n8n no Render
# Usa a imagem oficial do n8n

FROM n8nio/n8n:latest

# Expor a porta padrão do n8n
EXPOSE 5678

# O n8n já tem o comando de inicialização configurado
# Não precisamos definir CMD ou ENTRYPOINT
