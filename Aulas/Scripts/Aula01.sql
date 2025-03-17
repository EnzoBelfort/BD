CREATE TABLE Fornecedor ( 
		fcod int,
		fone int,
		status int,
		cidade varchar(20),
PRIMARY KEY (fcod));


CREATE TABLE Peca ( 
		pcod int,
		pnome varchar(20),
		cor varchar(20),
		peso float,
		cidade varchar(20),
PRIMARY KEY (pcod));


CREATE TABLE Projeto ( 
		prcod int,
		prnome varchar(20),
		cidade varchar(20),
PRIMARY KEY (prcod));


CREATE TABLE Fornecimento (
		fcod INT,
    		pcod INT,
    		prcod INT,
		quantidade int,
FOREIGN KEY(fcod) REFERENCES Fornecedor(fcod),
FOREIGN KEY(pcod) REFERENCES Peca(pcod),
FOREIGN KEY(prcod) REFERENCES Projeto(prcod),
PRIMARY KEY (fcod,pcod,prcod));


ALTER TABLE Peca 
MODIFY pcod INT NOT NULL,
MODIFY pnome VARCHAR(20) NOT NULL,
MODIFY cor VARCHAR(20) NOT NULL,
MODIFY peso FLOAT NOT NULL,
MODIFY cidade VARCHAR(20) NOT NULL;


ALTER TABLE Fornecimento
DROP FOREIGN KEY Fornecimento_ibfk_3,
ADD CONSTRAINT Fornecimento_ibfk_3
FOREIGN KEY (prcod) REFERENCES Projeto(prcod) ON DELETE CASCADE;

ALTER TABLE Projeto
ADD horas INT;


ALTER TABLE Peca
DROP COLUMN cidade;

