-- Consultas Básicas -- 
-- 1. Selecione o nome dos monitores que são ou já foram capitães do TOR, indicando o status atuais deles.
SELECT m.NomeMonitor, c.StatusCapitao  
FROM Monitor m, Capitao c
WHERE m.IDMonitor = c.IDCapitao; 

-- 2. Selecione os alunos que participaram do TOR no semestre 2024/1, indicando o nome do aluno e o seu status.
SELECT a.NomeAluno, a.StatusAluno
FROM Aluno a JOIN Ano_Semestre ans ON (a.IDAnoSemestre = ans.IDAnoSemestre AND ans.Ano = 2024 AND ans.Semestre = 1);

-- 3. Retorne o nome do robô, o nome da equipe que o construiu e o nome da competição em que ele participou.
SELECT r.NomeRobo, e.NomeEquipe, c.NomeCompeticao
FROM Robo r JOIN Equipe e ON (r.IDEquipe = e.IDEquipe) JOIN Competicao c ON (r.IDProjeto = c.IDProjeto);

-- 4. Retorne o nome dos alunos e o CPF dos alunos, nos quais os responsáveis tenham um número de telefone que termine com 1.
SELECT a.NomeAluno, a.CPFAluno
FROM Aluno a JOIN Responsavel_Aluno ra ON (a.IDAluno = ra.IDAluno) JOIN Responsavel r ON (ra.IDResponsavel = r.IDResponsavel)            
WHERE r.NumeroTelResponsavel LIKE '%1';

-- 5. Indique o nome dos capitães, seguidos de seus status, e o nome de seus professores orientadores, com seus status.
SELECT m.NomeMonitor, c.StatusCapitao, p.NomeProf, p.StatusProf
FROM Capitao c, Professor p, Monitor m
WHERE c.IDCapitao = m.IDMonitor AND p.IDCapitao = c.IDCapitao;




-- Consultas com LEFT JOIN --
-- 1. Mostrar o nome dos robôs que participam de competições, indicando o nome da equipe e o nome da competição. Robôs que nao participaram de competições devem aparecer.
SELECT r.NomeRobo, e.NomeEquipe, c.NomeCompeticao
FROM Robo r LEFT JOIN Equipe e ON (r.IDEquipe = e.IDEquipe) LEFT JOIN Competicao c ON (r.IDProjeto = c.IDProjeto);

-- 2. Retorne o ID e a descrição dos projetos internos que são aulas, mostrando também a descrição da aula e o ID da aula. Projetos internos que não são aulas devem aparecer.
SELECT pi.IDProjeto, pi.DescricaoProjeto, a.DescricaoAula, a.IDAula 
FROM Projeto_Interno pi LEFT JOIN Aula a ON (pi.IDProjeto = a.IDProjeto);




-- Consultas Agregadas --
-- 1. Obter o nome dos capitães na ordem crescente e o número de monitores que cada capitão liderou, apenas para os que lideraram mais de 1 aluno.
SELECT c.NomeMonitor, COUNT(m.IDMonitor)
FROM Monitor m JOIN Monitor c ON (m.IDCapitao = c.IDMonitor)
GROUP BY c.NomeMonitor
HAVING COUNT(m.IDMonitor) > 1
ORDER BY c.NomeMonitor ASC;

-- 2. Retorne o nome das equipes que têm mais de 3 alunos, ordenando os nomes das equipes de forma decrescente.
SELECT e.NomeEquipe
FROM Equipe e, Aluno_Equipe_Projeto aep 
WHERE e.IDEquipe = aep.IDEquipe
GROUP BY e.NomeEquipe
HAVING COUNT(aep.IDAluno) > 4
ORDER BY e.NomeEquipe DESC;

-- 3. Selecione o nome dos monitores que ensinaram mais de 2 alunos, ordenando seus nomes por ordem crescente.
SELECT m.NomeMonitor
FROM Monitor m JOIN Ensina e ON (m.IDMonitor = e.IDMonitor)
GROUP BY m.NomeMonitor
HAVING COUNT(e.IDAluno) > 2
ORDER BY m.NomeMonitor ASC;

-- 4. Indique a descrição do material que foi utilizado em mais de 1 robo, ordenando as descrições por ordem decrescente.
SELECT m.DescricaoMaterial
FROM Material m, Robo r
WHERE m.IDMaterial = r.IDMaterial
GROUP BY m.DescricaoMaterial
HAVING COUNT(r.IDRobo) > 1
ORDER BY m.DescricaoMaterial DESC;

-- 5. Retorne o ano e semestre que foram feitos mais de 2 projetos, ordenando os anos e semestres de forma crescente.
SELECT a.Ano, a.Semestre
FROM Ano_Semestre a JOIN Projeto_AnoSemestre p ON (a.IDAnoSemestre = p.IDAnoSemestre)
GROUP BY p.IDAnoSemestre
HAVING COUNT(p.IDProjeto) > 2
ORDER BY a.Ano, a.Semestre ASC;