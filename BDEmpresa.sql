-- criando Empresa
CREATE DATABASE BDEmpresa;

-- abrir BDEmpresa
USE BDEmpresa;

-- criação tabela Funcionarios
CREATE TABLE Funcionarios (
    Codigo_func INT,
    NomeFunc VARCHAR(100),
    SobreNome VARCHAR(100),
    DataNasci DATE,
    CPF VARCHAR(14),
    RG VARCHAR(20),
    Endereco VARCHAR(200),
    CEP VARCHAR(10),
    Cidade VARCHAR(100),
    Fone VARCHAR(20),
    Codigo_depto INT,
    Funcao VARCHAR(100),
    Salario DECIMAL(10, 2),
    PRIMARY KEY (Codigo_func)
);
INSERT INTO Funcionarios (Codigo_func, NomeFunc, SobreNome, DataNasci, CPF, RG, Endereco, CEP, Cidade, Fone, Codigo_depto, Funcao, Salario)
VALUES (1, 'Alex', 'Johnson', '1990-02-10', '123.456.789-01', 'A123B456', '123 Elm Street', '12345-678', 'New York', '(555) 123-4567', 1, 'Gerente de Vendas', 5500.00);

INSERT INTO Funcionarios (Codigo_func, NomeFunc, SobreNome, DataNasci, CPF, RG, Endereco, CEP, Cidade, Fone, Codigo_depto, Funcao, Salario)
VALUES(2, 'Emily', 'Williams', '1988-07-25', '987.654.321-02', 'E789F123', '456 Oak Avenue', '54321-876', 'Los Angeles', '(555) 987-6543', 2, 'Engenheiro de Software', 6800.00);

INSERT INTO Funcionarios (Codigo_func, NomeFunc, SobreNome, DataNasci, CPF, RG, Endereco, CEP, Cidade, Fone, Codigo_depto, Funcao, Salario)
VALUES (3, 'Sophia', 'Martinez', '1995-10-15', '555.555.555-03', 'M555N555', '789 Maple Drive', '98765-432', 'Chicago', '(555) 555-5555', 3, 'Analista de Marketing', 4800.00);

INSERT INTO Funcionarios (Codigo_func, NomeFunc, SobreNome, DataNasci, CPF, RG, Endereco, CEP, Cidade, Fone, Codigo_depto, Funcao, Salario)
VALUES (4, 'Oliver', 'Lee', '1983-04-05', '222.333.444-04', 'L444M333', '567 Pine Road', '87654-321', 'San Francisco', '(555) 222-3333', 4, 'Desenvolvedor Web', 6200.00);

INSERT INTO Funcionarios (Codigo_func, NomeFunc, SobreNome, DataNasci, CPF, RG, Endereco, CEP, Cidade, Fone, Codigo_depto, Funcao, Salario)
VALUES(5, 'Ava', 'Garcia', '1999-09-08', '777.888.999-05', 'G777H888', '678 Cedar Lane', '65432-109', 'Miami', '(555) 777-8888', 5, 'Designer Gráfico', 5200.00);


	SELECT * FROM Funcionarios;

-- criação tabela Departamentos
CREATE TABLE Departamentos (
    Codigo_depto INT,
    NomeDepto VARCHAR(100),
	PRIMARY KEY (Codigo_depto)
);

-- Inserir registros na tabela de Departamentos
INSERT INTO Departamentos (Codigo_depto, NomeDepto)
VALUES (1, 'Departamento 1 - Recursos Humanos');

INSERT INTO Departamentos (Codigo_depto, NomeDepto)
VALUES (2, 'Departamento 2 - Administração');

INSERT INTO Departamentos (Codigo_depto, NomeDepto)
VALUES (3, 'Departamento 3 - Finanças');

INSERT INTO Departamentos (Codigo_depto, NomeDepto)
VALUES (4, 'Departamento 4 - Tecnologia da Informação');

INSERT INTO Departamentos (Codigo_depto, NomeDepto)
VALUES (5, 'Departamento 5 - Mídias Sociais');


	SELECT * FROM Departamentos;

	-- Subquery: Liste os nomes dos funcionários que trabalham no departamento Pessoal --
SELECT NomeFunc, SobreNome
FROM Funcionarios
WHERE Codigo_depto IN (SELECT Codigo_depto FROM Departamentos WHERE NomeDepto = 'Departamento 1 - Recursos Humanos');


-- GroupBy: Liste o valor da folha de pagamento de cada departamento (nome) --
SELECT d.NomeDepto, SUM(f.Salario) AS TotalFolhaPagamento
FROM Departamentos d
JOIN Funcionarios f ON d.Codigo_depto = f.Codigo_depto
GROUP BY d.NomeDepto;

-- GroupBy : Liste o menor salário pago pela empresa em cada departamento
SELECT d.NomeDepto, MIN(f.Salario) AS MenorSalario
FROM Departamentos d
JOIN Funcionarios f ON d.Codigo_depto = f.Codigo_depto
GROUP BY d.NomeDepto; 




