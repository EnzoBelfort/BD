-- 1)  crie uma tabela Empregado com id, nome e salario.
-- o id deve ser com auto incremento:

create table empregado ( 
	id integer auto_increment,
	nome varchar(20),
	salario float,
	primary key(id)
);

-- 2. criar uma procedure Insere10  para inserir 10 tuplas na tabela Empregado

DELIMITER $$
CREATE PROCEDURE Insere10()
BEGIN
    DECLARE cont INT;
    DECLARE salario INT;

    SET salario = 2500;
    SET cont = 0;

    WHILE cont < 10 DO
        INSERT INTO empregado (nome, salario) 
        VALUES (CONCAT('nome', cont), salario);
    
        SET cont = cont + 1;
        SET salario = salario + 750;
    END WHILE;
END $$
DELIMITER ;

CALL Insere10();


-- 3) Criar uma procedure que retorne a quantidade de empregados inseridos na tabela Empregado

DELIMITER $$
CREATE PROCEDURE QtdEmpregados(OUT Quantidade INT)
BEGIN
    SELECT COUNT(*) INTO Quantidade
    FROM empregado e;
END $$
DELIMITER ;

CALL QtdEmpregado();

CALL QtdEmpregados(@qtd);
SELECT @qtd;