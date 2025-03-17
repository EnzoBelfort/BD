-- Resolva usando JOIN. 

-- 1. Recuperar nome dos médicos que atendem na Clínica Bem Estar;
SELECT m.nome 
FROM Medico m JOIN MedicoClinica mc ON (m.cod = mc.medico_cod and mc.clinica_cod = 8)

-- 2.  Exiba o nome e endereço das clínicas onde o médico André trabalha;
SELECT c.nome, c.endereco  
FROM Clinica c JOIN MedicoClinica mc ON (c.cod = mc.clinica_cod and mc.medico_cod = 1)

-- 3. Insira 2 clinicas , apenas na tabela Clínica
iNSERT iNTO Clinica VALUES(11, 'centro de dermatologia', 'jardim satelite' );
iNSERT iNTO Clinica VALUES(12, 'clinica da criança', 'vila ema' );

-- 4. Insira 2 médicos, apenas na tabela Medico
iNSERT iNTO Medico VALUES (11, 'Eduardo', '1515-1010');
iNSERT iNTO Medico VALUES (12, 'Rosania', '9900-1000');

-- 5. Liste o Nome das Clinicas e suas especialidades
SELECT c.nome , e.nome 
FROM Clinica c JOIN EspecialidadeClinica ec ON (c.cod = ec.clinica_cod) JOIN Especialidade e ON (e.cod = ec.especialidade_cod)

-- 6.  Liste o Nome de todas as clinicas e suas Especialidade.Clinicas que não possuem especialidade devem aparecer. Ordenar o resultado pelo nome da Clinica.
SELECT c.nome , e.nome 
FROM Clinica c LEFT JOIN EspecialidadeClinica ec ON (c.cod = ec.clinica_cod) LEFT JOIN Especialidade e ON (e.cod = ec.especialidade_cod)
ORDER BY c.nome 

-- 7. Liste o nome de todos os médicos cadastrados e para aqueles que tem consulta, listar a data e hora da consulta.
SELECT m.nome , c.`data` , c.hora 
FROM Medico m LEFT JOIN Consulta c ON (m.cod = c.medico_cod)

-- 8. Liste para cada médico, o seu nome e a quantidade de consultas que ele possui.
SELECT m.nome , COUNT(c.medico_cod) 
FROM Medico m JOIN Consulta c ON (m.cod = c.medico_cod)
GROUP BY m.nome 

-- 9. Liste para cada médico, o seu nome e a quantidade de consultas que ele  possui. Médicos que não possuem consulta também devem aparecer no resultado.
SELECT m.nome , COUNT(c.medico_cod) 
FROM Medico m LEFT JOIN Consulta c ON (m.cod = c.medico_cod)
GROUP BY m.nome 

-- 10.  Listar nomes dos médicos que atendem na Clinica ortocentro.
SELECT m.nome 
FROM Medico m JOIN MedicoClinica mc ON (mc.medico_cod = m.cod and mc.clinica_cod = 7) 