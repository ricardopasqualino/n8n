# 🚀 Deploy n8n no Render - Webhooks de Cadastro

## 📋 Visão Geral

Este projeto configura um n8n no Render para receber webhooks de cadastro e executar automações completas.

## 🎯 Funcionalidades

- ✅ **Webhook de Cadastro**: Recebe dados via POST
- ✅ **Validação de Dados**: Valida campos obrigatórios
- ✅ **Banco PostgreSQL**: Salva dados automaticamente
- ✅ **Email de Confirmação**: Envia confirmação por email
- ✅ **Integração CRM**: Envia dados para sistemas externos
- ✅ **Resposta JSON**: Retorna status da operação

## 📁 Arquivos do Projeto

```
├── render.yaml                    # Configuração do Render
├── DEPLOY_RENDER.md              # Guia de deploy detalhado
├── setup_render_db.sql           # Script para configurar banco
├── exemplo_workflow_cadastro.json # Workflow pronto
└── README_RENDER.md              # Este arquivo
```

## ⚡ Deploy Rápido

### 1. Preparar Repositório
```bash
# Clone ou crie um repositório
git clone https://github.com/seu-usuario/n8n-webhook-cadastro.git
cd n8n-webhook-cadastro

# Adicione os arquivos necessários
# (render.yaml, exemplo_workflow_cadastro.json, etc.)
```

### 2. Deploy no Render
1. **Acesse**: https://render.com
2. **Clique**: "New +" → "Blueprint"
3. **Conecte**: Seu repositório Git
4. **Clique**: "Apply"

### 3. Configurar Email (Opcional)
Após o deploy, configure as variáveis de email:
```
N8N_SMTP_USER=seu_email@gmail.com
N8N_SMTP_PASS=sua_senha_app
N8N_SMTP_SENDER=noreply@suacompany.com
```

## 🔧 Configuração

### Variáveis Automáticas
O Render configura automaticamente:
- `N8N_ENCRYPTION_KEY`: Chave de criptografia
- `N8N_JWT_SECRET`: Secret JWT
- `DB_*`: Conexão com PostgreSQL

### URLs Geradas
- **Interface**: `https://seu-servico.onrender.com`
- **Webhook**: `https://seu-servico.onrender.com/webhook/cadastro`

## 🧪 Testando

### 1. Acessar Interface
1. Aguarde 2-3 minutos após o deploy
2. Acesse a URL fornecida pelo Render
3. Crie sua conta de administrador

### 2. Importar Workflow
1. Clique em "Import from file"
2. Selecione `exemplo_workflow_cadastro.json`
3. Clique em "Import"

### 3. Testar Webhook
```bash
curl -X POST https://seu-servico.onrender.com/webhook/cadastro \
  -H "Content-Type: application/json" \
  -d '{
    "nome": "João Silva",
    "email": "joao@exemplo.com",
    "telefone": "(11) 99999-9999",
    "empresa": "Empresa XYZ",
    "cargo": "Desenvolvedor"
  }'
```

## 📊 Estrutura de Dados

### Dados Esperados
```json
{
  "nome": "string (obrigatório)",
  "email": "string (obrigatório)",
  "telefone": "string (opcional)",
  "empresa": "string (opcional)",
  "cargo": "string (opcional)"
}
```

### Resposta de Sucesso
```json
{
  "success": true,
  "message": "Cadastro realizado com sucesso",
  "data": {
    "id": "abc123def",
    "nome": "João Silva",
    "email": "joao@exemplo.com",
    "status": "pendente"
  },
  "timestamp": "2024-01-15T10:30:00.000Z"
}
```

## 🔍 Troubleshooting

### Problema: "Cannot GET /"
- Aguarde 2-3 minutos após o deploy
- Verifique se o serviço está "Healthy"
- Confirme se o banco está conectado

### Problema: Webhook não responde
- Verifique se o workflow está ativo
- Confirme a URL do webhook
- Verifique os logs do serviço

### Problema: Email não envia
- Configure as credenciais SMTP
- Use senha de app do Gmail
- Verifique o email remetente

## 📈 Monitoramento

### Logs Importantes
```bash
# Sucesso
n8n starting...
Database connection established
n8n ready on port 5678

# Erro
Database connection failed
Cannot connect to database
```

### Métricas do Render
- **Uptime**: Serviço sempre ativo
- **Response Time**: Tempo de resposta
- **Error Rate**: Taxa de erros

## 🔒 Segurança

### Recomendações
1. **HTTPS**: Configurado automaticamente
2. **Autenticação**: Configure se necessário
3. **Monitoramento**: Acompanhe logs regularmente
4. **Backup**: Faça backup dos workflows

## 💰 Custos

### Plano Gratuito
- **n8n**: 750 horas/mês
- **PostgreSQL**: 1 GB
- **Limitação**: Serviço pode "dormir"

### Upgrade Recomendado
- **n8n**: $7/mês (sempre ativo)
- **PostgreSQL**: $7/mês (mais espaço)

## 🎯 Casos de Uso

### 1. Cadastro de Clientes
- Recebe dados do formulário
- Valida informações
- Salva no banco
- Envia email de boas-vindas
- Integra com CRM

### 2. Cadastro de Funcionários
- Recebe dados do RH
- Cria conta de email
- Adiciona ao sistema de ponto
- Envia credenciais

### 3. Cadastro de Fornecedores
- Recebe dados
- Valida documentos
- Salva no ERP
- Envia para aprovação

## 📚 Recursos

- [Documentação Render](https://render.com/docs)
- [Documentação n8n](https://docs.n8n.io/)
- [Guia de Webhooks](https://docs.n8n.io/integrations/builtin/trigger-nodes/n8n-nodes-base.webhook/)

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para detalhes.

---

**🎉 Seu n8n está pronto para receber webhooks de cadastro no Render!**

Para suporte, consulte a documentação ou abra uma issue no repositório.
