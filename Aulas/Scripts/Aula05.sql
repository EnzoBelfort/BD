-- 1.Para cada médico contar em quantas clinicas eles atendem. Resposta ordenada em ordem alfabética.
SELECT m.nome, COUNT(mc.medico_cod)  
FROM Medico m , MedicoClinica mc 
WHERE m.cod = mc.medico_cod 
GROUP BY mc.medico_cod 
ORDER BY m.nome 

-- 2. Listar o nome dos médicos que tem 2 especialidades.
SELECT m.nome, COUNT(me.especialidade_cod) as contador
FROM Medico m , MedicoEspecialidade me 
WHERE m.cod = me.medico_cod 
GROUP BY me.medico_cod 
HAVING contador = 2
ORDER BY m.nome

-- 3. Listar o menor e maior horário de cada consulta 
SELECT c.`data` , MIN(c.hora), MAX(c.hora)  
FROM Consulta c   
GROUP BY c.`data`

-- 4. Para cada clinica, listar o nome das suas especialidades, ordenado pelo nome da clinica.
SELECT c.nome , e.nome 
FROM Clinica c , EspecialidadeClinica ec , Especialidade e 
WHERE  ec.especialidade_cod = e.cod and c.cod =ec.clinica_cod 
GROUP BY c.nome 
ORDER BY c.nome 

-- 5. Para cada clínica, listar quantas especialidades ela atende.
SELECT c.nome , COUNT(ec.especialidade_cod) 
FROM Clinica c , EspecialidadeClinica ec 
WHERE  c.cod = ec.clinica_cod 
GROUP BY c.nome 

-- 6. Selecionar o nome da Clinica em que a media de horario das consultas é maior que 20.
SELECT c.nome , AVG(c2.hora) as media
FROM Clinica c , Consulta c2 
WHERE c.cod = c2.clinica_cod 
GROUP BY c.nome 
HAVING media > 200000

-- 7. Listar o nome dos pacientes que realizaram mais de 3 consultas:
SELECT m.nome , COUNT(c.cod) as contador
FROM Medico m , Consulta c 
WHERE c.medico_cod = m.cod 
GROUP BY m.nome 
HAVING contador > 3

-- 8. Listar o número total de consultas realizadas por cada clínica:
SELECT c2.nome  , COUNT(c.cod) 
FROM Clinica c2  , Consulta c 
WHERE c2.cod = c.clinica_cod  
GROUP BY c2.cod   