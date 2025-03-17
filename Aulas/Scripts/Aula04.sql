-- 1. Listar as clinicas que o medico Arthur atende. 
SELECT c.nome
FROM Clinica c, MedicoClinica mc 
WHERE mc.medico_cod = '2' and c.cod = mc.clinica_cod 

-- 2. Selecionar o nome das Clinicas que atendem a especialidade ortopedia. 
SELECT c.nome
FROM Clinica c, EspecialidadeClinica ec 
WHERE ec.especialidade_cod = '9' and c.cod = ec.clinica_cod 

-- 3. Buscar as especialidades do médico Andre
SELECT e.nome 
FROM Especialidade e , MedicoEspecialidade me 
WHERE me.medico_cod = '1' and e.cod = me.especialidade_cod 

-- 4. Retornar o nome dos  médicos que tem  consulta e a data das consultas 
SELECT m.nome, c.`data` , c.hora 
FROM Medico m , Consulta c 
WHERE m.cod = c.medico_cod 

-- 5. Listar o nome de todos os médicos em ordem alfabetica
SELECT m.nome 
FROM Medico m 
ORDER BY nome 