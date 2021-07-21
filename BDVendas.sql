


Create Table TB_Clientes (
ID int auto_increment primary key,
Nm_Cliente Varchar(100),
Nr_RG Varchar(30),
Nr_CPF Varchar(20),
Ds_Email Varchar(200),
Nr_Telefone Varchar(30),
Nr_Celular varchar(30),
Ds_CEP Varchar(10),
Ds_Endereco varchar(255),
Nr_Endereco int,
Ds_Complemento Varchar(200),
Ds_Bairro Varchar(100),
Ds_Cidade varchar(100),
Ds_Estado varchar(2)
);

Create Table TB_Fornecedores (
id int auto_increment primary Key,
Nm_Fornecedor Varchar(100),
Nr_CNPJ Varchar (100),
Ds_Email Varchar(200),
Nr_Telefone Varchar(30),
Nr_Celular varchar(30),
Ds_CEP Varchar(10),
Ds_Endereco varchar(255),
Nr_Endereco int,
Ds_Complemento Varchar(200),
Ds_Bairro Varchar(100),
Ds_Cidade varchar(100),
Ds_Estado varchar(2)
);

Create Table TB_Funcionarios (
ID int auto_increment primary Key,
Nm_Funcionario Varchar(100),
Nr_RG Varchar(30),
Nr_CPF Varchar(20),
Ds_Email Varchar(200),
Ds_Senha varchar(10),
Ds_Cargo varchar(100),
Ds_NivelAcesso Varchar(50),
Nr_Telefone Varchar(30),
Nr_Celular varchar(30),
Ds_CEP Varchar(10),
Ds_Endereco varchar(255),
Nr_Endereco int,
Ds_Complemento Varchar(200),
Ds_Bairro Varchar(100),
Ds_Cidade varchar(100),
Ds_Estado varchar(2)
);


Create Table TB_Produtos (
ID int auto_increment primary Key,
Ds_Produto Varchar(100),
Ds_Preco decimal(10,2),
Qt_Estoque int,
For_ID int,

Foreign Key (For_ID) references TB_Fornecedores(ID)
);

create Table TB_Vendas (
ID int auto_increment primary Key,
ID_Cliente int,
Dt_Venda datetime,
Qt_TotalVenda decimal (10,2),
Ds_Observacoes text,

foreign key (ID_Cliente) references TB_Clientes(ID)
);

Create Table TB_ItensVendas (
ID int auto_increment primary key,
ID_Vendas int,
ID_Produtos int,
Qt_ItensVendas int,
Qt_SubTotal decimal (10,2),

foreign key (ID_Vendas) references TB_Vendas(ID),
foreign key (ID_Produtos) references TB_Produtos(ID)
);