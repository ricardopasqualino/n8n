-- Script para configurar o banco de dados no Render
-- Execute este script após o deploy no Render

-- Criar tabela de cadastros
CREATE TABLE IF NOT EXISTS cadastros (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    empresa VARCHAR(255),
    cargo VARCHAR(255),
    data_cadastro TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    status VARCHAR(50) DEFAULT 'pendente',
    id_unico VARCHAR(50) UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Criar índices para melhor performance
CREATE INDEX IF NOT EXISTS idx_cadastros_email ON cadastros(email);
CREATE INDEX IF NOT EXISTS idx_cadastros_status ON cadastros(status);
CREATE INDEX IF NOT EXISTS idx_cadastros_data_cadastro ON cadastros(data_cadastro);
CREATE INDEX IF NOT EXISTS idx_cadastros_id_unico ON cadastros(id_unico);

-- Criar função para atualizar o campo updated_at automaticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Criar trigger para atualizar updated_at
CREATE TRIGGER update_cadastros_updated_at 
    BEFORE UPDATE ON cadastros 
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();

-- Inserir dados de exemplo (opcional)
INSERT INTO cadastros (nome, email, telefone, empresa, cargo, id_unico) VALUES
('João Silva', 'joao@exemplo.com', '(11) 99999-9999', 'Empresa XYZ', 'Desenvolvedor', 'abc123def'),
('Maria Santos', 'maria@exemplo.com', '(11) 88888-8888', 'Tech Solutions', 'Analista', 'def456ghi'),
('Pedro Costa', 'pedro@exemplo.com', '(11) 77777-7777', 'Startup ABC', 'CEO', 'ghi789jkl')
ON CONFLICT (email) DO NOTHING;

-- Verificar se a tabela foi criada corretamente
SELECT 
    column_name, 
    data_type, 
    is_nullable, 
    column_default
FROM information_schema.columns 
WHERE table_name = 'cadastros' 
ORDER BY ordinal_position;

-- Verificar dados inseridos
SELECT * FROM cadastros ORDER BY created_at DESC;

-- Verificar índices criados
SELECT 
    indexname, 
    tablename, 
    indexdef
FROM pg_indexes 
WHERE tablename = 'cadastros';
