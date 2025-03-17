-- Enzo de Almeida Belfort Rizzi Di Chiara - 168813

-- Resolver usando subconsulta:
-- Listar nomes das Clinicas que tem especialidade
SELECT c.nome  
FROM Clinica c 
WHERE c.cod IN 
(SELECT ec.clinica_cod
 FROM EspecialidadeClinica ec)

-- Listar nomes dos médicos que não tem consulta
SELECT m.nome 
FROM Medico m 
WHERE m.cod NOT IN 
(SELECT c.medico_cod
 FROM Consulta c)

-- Listar nomes dos médicos que atendem na Clinica ortocentro
SELECT m.nome 
FROM Medico m 
WHERE m.cod IN 
(SELECT mc.medico_cod
 FROM MedicoClinica mc
 WHERE mc.clinica_cod = 7)


-- Listar nomes dos médicos que recebem valor da consulta maior que a média
SELECT m.nome
FROM Medico m, Folha_Pagto fp2  
WHERE fp2.medico_cod = m.cod and fp2.valor > (SELECT AVG(fp.valor) 
                                              FROM Folha_Pagto fp, Medico m2
                                              WHERE fp.medico_cod = m2.cod)



-- Listar nome dos médidos que não estão na folha de pagto
SELECT m.nome 
FROM Medico m 
WHERE m.cod NOT IN 
(SELECT fp.medico_cod
 FROM Folha_Pagto fp)



-- Listar nome dos médicos e para aqueles que estão na folha de pagto, listar a média de salário
SELECT m.nome, AVG (fp.valor)
FROM Medico m LEFT JOIN Folha_Pagto fp ON (m.cod = fp.medico_cod)
GROUP BY m.cod  
