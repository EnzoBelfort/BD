-- Base de Dados - Produção Cinematográfica


-- 1. Criar a base de dados apresentada a seguir. Os atributos sublinhados representam a chave primária.
-- ATOR(coda, nomeart, nomereal, nacionalidade, sexo, idade, indicacoesoscar, oscar)
-- FILME(codf, nome, ano, orcamento, tempo)
-- PERSONAGEM(#coda, # codf,personagem, cache) 

CREATE TABLE Ator ( 
		coda int,
		nomeart varchar(20),
		nomereal varchar(20),
		nacionalidade varchar(20),
		sexo varchar(1),
		idade int,
		indicacoesoscar int,
		oscar int,
		PRIMARY KEY (coda));

CREATE TABLE FIlme (
		codf int,
		nome varchar(20),
		ano varchar(4),
		orcamento int,
		tempo int,
		PRIMARY KEY (codf));

CREATE TABLE Personagem (
coda int,
codf int,
personagem varchar(20),
cache int,
PRIMARY KEY (coda, codf),
FOREIGN KEY (coda) REFERENCES Ator(coda),
FOREIGN KEY (codf) REFERENCES FIlme(codf));

-- 2. Inserir os seguintes dados:

-- ATOR
-- coda nomeart nomereal nacionalidade sexo idade Indicações oscar oscar

-- 1 DemiMoore MariadaSilva USA f 32 0 0
-- 2 BradPitt JoaoPaulo USA f 28 1 0
-- 3 DustinHoffman DustinHoffman USA f 36 2 0
-- 4 JessicaLange JessicaLange USA f 42 4 2
-- 5 SoniaBraga SoniaBraga Brasil f 45 0 0

-- FILME

-- codf nome ano orcamento Tempo
-- 1 AJurada 1996 1000000 18
-- 2 ALetraEscarlate 1995 10000000 24
-- 3 Seven 1995 1500000 20
-- 4 Tootsie 1982 50000 16
-- 5 Tieta 1995 200000 18

-- PERSONAGEM
-- 1 1 Mary 3.000
-- 1 2 Sandy 5.000
-- 2 3 John 5.000
-- 3 4 Mary 1000
-- 4 4 Tootsie 2.000
-- 5 5 Tieta 500

INSERT INTO Ator (coda, nomeart, nomereal, nacionalidade, sexo, idade, indicacoesoscar, oscar)
VALUES 	(1, 'Demi Moore', 'Maria da Silva', 'USA', 'f', 32,0,0),
(2, 'BradPitt', 'Joao Paulo', 'USA','f',28,1,0),
(3, ‘DustinHoffman’, ‘DustinHoffman’, ‘USA’, ‘f’, 36, 2, 0),
(4, ‘JessicaLange’, ‘JessicaLange’, ‘USA’, ‘f’, 42, 4, 2),
(5, ‘SoniaBraga’, ‘SoniaBraga’, ‘Brasil’, ‘f’, 45, 0, 0);


INSERT INTO Filme (codf, nome, ano, orcamento, tempo)
VALUES	(1, ‘AJurada’, ‘1996’, 1000000, 18),
		(2, ‘ALetraEscarlate’, ‘1995’, 10000000, 24),
		(3, ‘Seven’, ‘1995’, 1500000, 20),
		(4, ‘Tootsie’, ‘1982’, 50000, 16),
		(5, ‘Tieta’, ‘1995’, 200000, 18);
INSERT INTO Personagem (coda, codf, personagem, cache)
VALUES	(1, 1, ‘Mary’, 3.000),
(1, 2, ‘Sandy’, 5000),
(2, 3, ‘John’, 5.000),
(3, 4, ‘Mary’, 1000),
(4, 4, ‘Tootsie’, 2.000),
(5, 5, ‘Tieta’, 500);

-- 3. Alterar o sexo do BradPitt para masculino.

UPDATE Ator
SET sexo = ‘m’
WHERE coda = 2;