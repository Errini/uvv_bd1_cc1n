DROP DATABASE IF EXISTS uvv;
DROP USER if EXISTS nicolas;
CREATE USER nicolas WITH createdb createrole encrypted password 'piscolone1';
CREATE DATABASE uvv 
    WITH 
    OWNER = nicolas
    TEMPLATE = template0
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    ALLOW_CONNECTIONS = true;
 \c "dbname=uvv user=nicolas password=piscolone1"
CREATE SCHEMA IF NOT EXISTS lojas AUTHORIZATION nicolas;
ALTER USER nicolas
SET SEARCH_PATH TO lojas, "$user", public;
    
CREATE SCHEMA IF NOT EXISTS lojas AUTHORIZATION nicolas;
ALTER USER nicolas
SET SEARCH_PATH TO lojas, "$user", public;
CREATE TABLE lojas.Produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                detalhes BYTEA,
                imagem BYTEA,
                imagem_mime_type VARCHAR(512),
                imagem_arquivo VARCHAR(512),
                imagem_charset VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                CONSTRAINT pk_produtos PRIMARY KEY (produto_id)
);
COMMENT ON TABLE lojas.Produtos IS 'Produtos das Lojas UVV';
COMMENT ON COLUMN lojas.Produtos.produto_id IS 'IDs dos produtos das Lojas UVV';
COMMENT ON COLUMN lojas.Produtos.nome IS 'Nomes dos Produtos das Lojas UVV';
COMMENT ON COLUMN lojas.Produtos.preco_unitario IS 'Preço Unitario dos Produtos da Loja UVV';
COMMENT ON COLUMN lojas.Produtos.detalhes IS 'Detalhes dos Produtos das Lojas UVV';
COMMENT ON COLUMN lojas.Produtos.imagem IS 'Imagem dos Produtos das Lojas UVV';
COMMENT ON COLUMN lojas.Produtos.imagem_mime_type IS 'Imagem Mime Type dos Produtos das Lojas UVV';
COMMENT ON COLUMN lojas.Produtos.imagem_arquivo IS 'Tipo de Arquivo das Imagens dos Produtos das Lojas UVV';
COMMENT ON COLUMN lojas.Produtos.imagem_charset IS 'Charset das Imagens das Lojas UVV';
COMMENT ON COLUMN lojas.Produtos.imagem_ultima_atualizacao IS 'Ultima Atualização das Imagens das Lojas UVV';


CREATE TABLE lojas.Lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                endereco_fisico VARCHAR(512),
                latitude NUMERIC,
                longitude NUMERIC,
                logo BYTEA,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                CONSTRAINT pk_lojas PRIMARY KEY (loja_id)
);
COMMENT ON TABLE lojas.Lojas IS 'Tabela das Lojas da UVV';
COMMENT ON COLUMN lojas.Lojas.loja_id IS 'IDs referentes as Lojas UVV';
COMMENT ON COLUMN lojas.Lojas.nome IS 'Nomes dos Clientes das Lojas UVV';
COMMENT ON COLUMN lojas.Lojas.endereco_web IS 'Endereco Web das Lojas UVV';
COMMENT ON COLUMN lojas.Lojas.endereco_fisico IS 'Endereço Físico das Lojas UVV';
COMMENT ON COLUMN lojas.Lojas.latitude IS 'Latitude das Lojas UVV';
COMMENT ON COLUMN lojas.Lojas.longitude IS 'Longitude das Lojas UVV';
COMMENT ON COLUMN lojas.Lojas.logo IS 'Logos das Lojas UVV';
COMMENT ON COLUMN lojas.Lojas.logo_mime_type IS 'Mime type da Logo das Lojas UVV';
COMMENT ON COLUMN lojas.Lojas.logo_arquivo IS 'Arquivo da Logos das Loja UVV';
COMMENT ON COLUMN lojas.Lojas.logo_charset IS 'Charset das Logos das Lojas UVV';
COMMENT ON COLUMN lojas.Lojas.logo_ultima_atualizacao IS 'Ultima atualização das Logos das Lojas UVV';


CREATE TABLE lojas.Estoques (
                estoque_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT pk_estoques PRIMARY KEY (estoque_id)
);
COMMENT ON TABLE lojas.Estoques IS 'Estoques das Lojas UVV';
COMMENT ON COLUMN lojas.Estoques.estoque_id IS 'IDs dos estoques das Lojas UVV';
COMMENT ON COLUMN lojas.Estoques.produto_id IS 'IDs dos produtos das Lojas UVV';
COMMENT ON COLUMN lojas.Estoques.quantidade IS 'Quantidade de Estoque das Lojas UVV';
COMMENT ON COLUMN lojas.Estoques.loja_id IS 'IDs referentes as Lojas UVV';


CREATE TABLE lojas.Clientes (
                cliente_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                email VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                CONSTRAINT pk_clientes PRIMARY KEY (cliente_id)
);
COMMENT ON TABLE lojas.Clientes IS 'Tabela Dos Clientes da UVV';
COMMENT ON COLUMN lojas.Clientes.cliente_id IS 'IDs dos Clientes das Lojas UVV';
COMMENT ON COLUMN lojas.Clientes.nome IS 'Nomes dos Clientes das Lojas UVV';
COMMENT ON COLUMN lojas.Clientes.email IS 'Email dos Clientes das Lojas UVV';
COMMENT ON COLUMN lojas.Clientes.telefone1 IS '1° Telefone dos clientes das Lojas UVV';
COMMENT ON COLUMN lojas.Clientes.telefone2 IS '2° Telefone dos clientes das Lojas UVV';
COMMENT ON COLUMN lojas.Clientes.telefone3 IS '3° Telefone dos clientes das Lojas UVV';


CREATE TABLE lojas.Envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT pk_envios PRIMARY KEY (envio_id)
);
COMMENT ON TABLE lojas.Envios IS 'Envios das Lojas UVV';
COMMENT ON COLUMN lojas.Envios.envio_id IS 'IDs dos Envios das Lojas UVV';
COMMENT ON COLUMN lojas.Envios.loja_id IS 'IDs referentes as Lojas UVV';
COMMENT ON COLUMN lojas.Envios.cliente_id IS 'IDs dos Clientes das Lojas UVV';
COMMENT ON COLUMN lojas.Envios.endereco_entrega IS 'Endereço de entrega do envio das Lojas UVV';
COMMENT ON COLUMN lojas.Envios.status IS 'Status de envio das Lojas UVV';


CREATE TABLE lojas.Pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT pk_pedidos PRIMARY KEY (pedido_id)
);
COMMENT ON TABLE lojas.Pedidos IS 'Pedidos da loja UVV';
COMMENT ON COLUMN lojas.Pedidos.pedido_id IS 'ID dos Pedidos da loja UVV';
COMMENT ON COLUMN lojas.Pedidos.data_hora IS 'Data e Hora dos Pedidos das Lojas UVV';
COMMENT ON COLUMN lojas.Pedidos.cliente_id IS 'IDs dos Clientes das Lojas UVV';
COMMENT ON COLUMN lojas.Pedidos.status IS 'Status dos pedidos das Lojas UVV';
COMMENT ON COLUMN lojas.Pedidos.loja_id IS 'IDs referentes as Lojas UVV';


CREATE TABLE lojas.Pedidos_Itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38),
                CONSTRAINT pk_pedidos_itens PRIMARY KEY (pedido_id, produto_id)
);
COMMENT ON TABLE lojas.Pedidos_Itens IS 'Pedidos Itens das Lojas UVV';
COMMENT ON COLUMN lojas.Pedidos_Itens.pedido_id IS 'IDs dos Pedidos das Lojas UVV';
COMMENT ON COLUMN lojas.Pedidos_Itens.produto_id IS 'IDs de Produtos das Lojas UVV';
COMMENT ON COLUMN lojas.Pedidos_Itens.numero_da_linha IS 'Numero da Linha dos Itens dos Pedidos das Lojas UVV';
COMMENT ON COLUMN lojas.Pedidos_Itens.preco_unitario IS 'Preço Unitario dos Itens dos Pedidos Das Lojas UVV';
COMMENT ON COLUMN lojas.Pedidos_Itens.quantidade IS 'Quantidade de Itens dos Pedidos das Lojas UVV';
COMMENT ON COLUMN lojas.Pedidos_Itens.envio_id IS 'IDs dos Envios das Lojas UVV';


ALTER TABLE lojas.Estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.Produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.Pedidos_Itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.Produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.Pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.Lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.Envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.Lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.Estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.Lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.Pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.Clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.Envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.Clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.Pedidos_Itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES lojas.Envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.Pedidos_Itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES lojas.Pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
