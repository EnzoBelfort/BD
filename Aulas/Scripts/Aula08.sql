-- Crie visões para cada uma das consultas abaixo:
-- 1) Selecionar o nome dos pilotos e nome dos circuitos que eles participaram
CREATE VIEW PilCir
AS SELECT DISTINCT p.nomepil , c.nomecir 
FROM piloto p JOIN pospilotoprova p2 ON (p.codpil = p2.codpil) JOIN circuito c ON (c.codcirc = p2.codcirc) 

-- 2) Selecionar o nome de todos os pilotos do banco de dados e para aqueles que participaram de prova, listar a data da prova, duração e posição do piloto na prova.
CREATE VIEW PilProva
AS SELECT p.nomepil, p3.`data`, p3.duracao, p2.posicao  
FROM piloto p LEFT JOIN pospilotoprova p2 ON (p2.codpil = p.codpil) LEFT JOIN prova p3 ON (p3.`data` = p2.`data` and p2.codcirc = p3.codcirc)

-- 3) Selecionar o nome do piloto, seu país de origem, nome da equipe e país da equipe. 
CREATE VIEW PilEquipe
AS SELECT p.nomepil , p2.nomepais as nomepaisPiloto , e.nomeeq, p3.nomepais as nomepaisEquipe
FROM piloto p , equipe e, pais p2, pais p3  
WHERE p.codeq = e.codeq and p.codpais = p2.codpais and e.codpais = p3.codpais  

-- 4) Listar o nome das equipes que não possuem piloto
CREATE VIEW EquipeVazias
AS SELECT e.nomeeq 
FROM equipe e 
WHERE e.codeq NOT IN 
(
	SELECT e2.codeq 
	FROM equipe e2 , piloto p 
	WHERE e2.codeq = p.codeq 
)

-- Usando a visões criadas, selecione:
-- 4) Para cada nome de piloto, indique quantos circuitos eles participaram
SELECT pc.nomepil , COUNT(*) 
FROM PilCir pc 
GROUP BY pc.nomepil 

-- 5) Listar o nome do piloto e o nome da sua equipe
SELECT pe.nomepil , pe.nomeeq 
FROM PilEquipe pe 

-- 6) Listar os pilotos que são do mesmo país que a sua equipe 
SELECT pe.nomepil , pe.nomeeq 
FROM PilEquipe pe 
WHERE pe.nomepaisPiloto = pe.nomepaisEquipe 

-- 7)  Inserir um novo piloto no banco de dados
INSERT INTO piloto (codpil, nomepil, codeq, codpais) VALUES
(8, 'Ayton Senna', 1, 1)

-- 8)  Execute um select *, na view criada na questão 3) e diga o que ocorreu.
SELECT *
FROM PilEquipe pe 

O novo piloto, com todas suas informações, foi adicionado apareceu na view criada no item 3.

-- 9) É possível fazer um comando Insert ou Delete em uma View? Explique.
É possível, porém essas atualizações não são passadas para as tabelas do banco de dados original.