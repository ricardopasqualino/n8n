# 🔧 Variáveis de Ambiente - n8n no Render

## 📋 Visão Geral

Este guia explica todas as variáveis de ambiente configuradas no `render.yaml` e quais você precisa ajustar manualmente.

## ✅ Variáveis Configuradas Automaticamente

### 🔐 Segurança (Geradas pelo Render)
```yaml
N8N_ENCRYPTION_KEY: [gerada automaticamente]
N8N_JWT_SECRET: [gerada automaticamente]
```

### 🌐 Host e URL (Configuradas pelo Render)
```yaml
N8N_HOST: ${RENDER_EXTERNAL_URL}
N8N_PROTOCOL: https
N8N_PORT: 5678
N8N_WEBHOOK_URL: ${RENDER_EXTERNAL_URL}
```

### 🗄️ Banco de Dados (Conectado automaticamente)
```yaml
DB_TYPE: postgresdb
DB_POSTGRESDB_DATABASE: [do banco Render]
DB_POSTGRESDB_HOST: [do banco Render]
DB_POSTGRESDB_PASSWORD: [do banco Render]
DB_POSTGRESDB_USER: [do banco Render]
DB_POSTGRESDB_PORT: [do banco Render]
```

## ⚙️ Variáveis que Você DEVE Configurar

### 📧 Email (Obrigatório para envio de emails)

**IMPORTANTE**: Você precisa configurar estas variáveis manualmente no painel do Render após o deploy:

1. **Vá para o painel do Render**
2. **Clique no seu serviço n8n**
3. **Clique em "Environment"**
4. **Adicione/edite estas variáveis:**

```yaml
N8N_SMTP_USER: seu_email@gmail.com
N8N_SMTP_PASS: sua_senha_de_app
N8N_SMTP_SENDER: noreply@suacompany.com
N8N_SMTP_REPLY_TO: noreply@suacompany.com
```

### 🔐 Autenticação Básica (Opcional)

Se quiser proteger o acesso ao n8n:

```yaml
N8N_BASIC_AUTH_ACTIVE: true
N8N_BASIC_AUTH_USER: seu_usuario
N8N_BASIC_AUTH_PASSWORD: sua_senha_segura
```

## 📊 Variáveis Configuradas com Valores Padrão

### 🎯 Configurações Gerais
```yaml
N8N_LOG_LEVEL: info                    # Nível de log
N8N_LOG_OUTPUT: console               # Saída dos logs
GENERIC_TIMEZONE: America/Sao_Paulo   # Fuso horário
N8N_PATH: /                          # Caminho base
N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS: true  # Segurança de arquivos
```

### ⚡ Configurações de Execução
```yaml
N8N_EXECUTIONS_PROCESS: main          # Processo principal
N8N_EXECUTIONS_MODE: regular          # Modo de execução
N8N_EXECUTIONS_TIMEOUT: 3600          # Timeout padrão (1h)
N8N_EXECUTIONS_TIMEOUT_MAX: 7200      # Timeout máximo (2h)
N8N_EXECUTIONS_DATA_SAVE_ON_ERROR: all    # Salvar dados em erro
N8N_EXECUTIONS_DATA_SAVE_ON_SUCCESS: all  # Salvar dados em sucesso
```

### 🔄 Configurações de Persistência de Workflows (IMPORTANTE!)
```yaml
N8N_WORKFLOW_SAVE_DATA_PROCESSING: all        # Salvar dados de processamento
N8N_WORKFLOW_SAVE_DATA_EXECUTION: all         # Salvar dados de execução
N8N_WORKFLOW_SAVE_DATA_SUCCESS: all           # Salvar dados de sucesso
N8N_WORKFLOW_SAVE_DATA_ERROR: all             # Salvar dados de erro
N8N_WORKFLOW_SAVE_DATA_WARNING: all           # Salvar dados de aviso
N8N_WORKFLOW_SAVE_DATA_MANUAL_EXECUTIONS: true # Salvar execuções manuais
N8N_WORKFLOW_SAVE_DATA_PROGRESS: true         # Salvar progresso
N8N_WORKFLOW_SAVE_DATA_INPUT: true            # Salvar dados de entrada
N8N_WORKFLOW_SAVE_DATA_OUTPUT: true           # Salvar dados de saída
N8N_WORKFLOW_SAVE_DATA_MODE: all              # Modo de salvamento
N8N_WORKFLOW_SAVE_DATA_CREDENTIALS: true      # Salvar credenciais
N8N_WORKFLOW_SAVE_DATA_TAGS: true             # Salvar tags
N8N_WORKFLOW_SAVE_DATA_META: true             # Salvar metadados
N8N_WORKFLOW_SAVE_DATA_STATIC_DATA: true      # Salvar dados estáticos
N8N_WORKFLOW_SAVE_DATA_PIN_DATA: true         # Salvar dados fixados
N8N_WORKFLOW_SAVE_DATA_SETTINGS: true         # Salvar configurações
N8N_WORKFLOW_SAVE_DATA_VERSION: true          # Salvar versões
N8N_WORKFLOW_SAVE_DATA_OWNER: true            # Salvar proprietário
N8N_WORKFLOW_SAVE_DATA_SHARED: true           # Salvar compartilhamento
N8N_WORKFLOW_SAVE_DATA_ACTIVE: true           # Salvar status ativo
N8N_WORKFLOW_SAVE_DATA_NODES: true            # Salvar nós
N8N_WORKFLOW_SAVE_DATA_CONNECTIONS: true      # Salvar conexões
N8N_WORKFLOW_SAVE_DATA_TRIGGERS: true         # Salvar triggers
N8N_WORKFLOW_SAVE_DATA_WEBHOOKS: true         # Salvar webhooks
N8N_WORKFLOW_SAVE_DATA_VARIABLES: true        # Salvar variáveis
```

### 📧 Configurações de Email
```yaml
N8N_EMAIL_MODE: smtp                  # Modo de email
N8N_SMTP_HOST: smtp.gmail.com         # Servidor SMTP
N8N_SMTP_PORT: 587                    # Porta SMTP
```

## 🔧 Como Configurar Variáveis Manualmente

### Passo a Passo no Render:

1. **Acesse**: https://dashboard.render.com
2. **Clique**: No seu serviço n8n
3. **Clique**: "Environment" (aba lateral)
4. **Clique**: "Add Environment Variable"
5. **Preencha**:
   - **Key**: `N8N_SMTP_USER`
   - **Value**: `seu_email@gmail.com`
6. **Clique**: "Save Changes"
7. **Repita** para outras variáveis

### Variáveis Prioritárias para Configurar:

```bash
# 1. Email (para envio de confirmações)
N8N_SMTP_USER=seu_email@gmail.com
N8N_SMTP_PASS=sua_senha_de_app

# 2. Autenticação (opcional, para segurança)
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=senha_segura

# 3. Personalização (opcional)
N8N_SMTP_SENDER=noreply@suacompany.com
N8N_SMTP_REPLY_TO=noreply@suacompany.com
```

## 🔐 Configuração de Email Gmail

### Para usar Gmail, você precisa:

1. **Ativar autenticação de 2 fatores** na sua conta Google
2. **Gerar uma senha de app**:
   - Vá para: https://myaccount.google.com/apppasswords
   - Selecione "Mail" e "Windows Computer"
   - Use a senha gerada em `N8N_SMTP_PASS`

### Exemplo de Configuração Gmail:
```yaml
N8N_SMTP_USER: seu_email@gmail.com
N8N_SMTP_PASS: abcd efgh ijkl mnop  # Senha de app do Google
N8N_SMTP_SENDER: noreply@suacompany.com
N8N_SMTP_REPLY_TO: noreply@suacompany.com
```

## 🚨 Variáveis Importantes de Segurança

### Recomendadas para Produção:
```yaml
# Autenticação básica
N8N_BASIC_AUTH_ACTIVE: true
N8N_BASIC_AUTH_USER: admin
N8N_BASIC_AUTH_PASSWORD: senha_muito_segura

# Limitar execuções
N8N_EXECUTIONS_TIMEOUT: 1800        # 30 minutos
N8N_EXECUTIONS_TIMEOUT_MAX: 3600    # 1 hora

# Logs mais detalhados
N8N_LOG_LEVEL: debug
```

## 📋 Checklist de Configuração

### ✅ Após o Deploy Inicial:
- [ ] Configurar `N8N_SMTP_USER` e `N8N_SMTP_PASS`
- [ ] Testar envio de email
- [ ] Configurar autenticação básica (opcional)
- [ ] Verificar logs do serviço
- [ ] Testar webhook de cadastro

### ✅ Para Produção:
- [ ] Usar senhas seguras
- [ ] Configurar domínio personalizado
- [ ] Ativar autenticação básica
- [ ] Configurar monitoramento
- [ ] Fazer backup dos workflows

## 🔍 Verificação das Variáveis

### Como verificar se estão funcionando:

1. **Logs do Render**:
   ```bash
   # Deve aparecer:
   n8n starting...
   Database connection established
   SMTP configured successfully
   n8n ready on port 5678
   ```

2. **Teste de Email**:
   - Crie um workflow simples de email
   - Execute um teste
   - Verifique se o email foi enviado

3. **Teste de Webhook**:
   ```bash
   curl -X POST https://seu-servico.onrender.com/webhook/cadastro \
     -H "Content-Type: application/json" \
     -d '{"nome":"Teste","email":"teste@exemplo.com"}'
   ```

## 💡 Dicas Importantes

### 🔒 Segurança:
- **Nunca** use senhas fracas
- **Sempre** use senhas de app para Gmail
- **Considere** autenticação básica para produção

### 📧 Email:
- **Teste** o envio de email antes de usar em produção
- **Configure** um email de resposta adequado
- **Monitore** falhas de envio

### 🗄️ Banco:
- **Não altere** as variáveis do banco (são automáticas)
- **Monitore** o uso de espaço (1GB no plano gratuito)
- **Faça backup** regular dos dados

---

**🎯 Resumo**: O Render configura automaticamente a maioria das variáveis. Você só precisa configurar manualmente as credenciais de email e, opcionalmente, a autenticação básica.
