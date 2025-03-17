insert into Ano_Semestre(IDAnoSemestre, Ano, Semestre) values 
	(1, 2022, 1),
	(2, 2022, 2),
	(3, 2023, 1),
	(4, 2023, 2),
	(5, 2024, 1),
	(6, 2024, 2),
	(7, 2025, 1);

insert into Monitor(IDMonitor, NomeMonitor, StatusMonitor, IDCapitao, IDAnoSemestre) values
	(1, 'Viviane', 'Ativo', 1, 4),
	(2, 'Breno', 'Ativo', 1, 4),
	(3, 'Davi', 'Não ativo', 1, 4),
	(4, 'Ícaro', 'Ativo', 1, 5),
	(5, 'Pedro', 'Ativo', 1, 5),
	(6, 'Luana', 'Ativo', 1, 6),
	(7, 'Heitor', 'Ativo', 1, 6),
	(8, 'João', 'Não ativo', 1, 6),
	(9, 'Stefani', 'Ativo', 1, 6),
	(10, 'Beatriz', 'Não ativo', 2, 5),
	(11, 'Ana', 'Não ativo', 2, 5),
	(12, 'Luiza', 'Não ativo', 12, 3),
	(13, 'Gabriel', 'Não ativo', 13, 1);
	
insert into Capitao(IDCapitao, StatusCapitao) values
	(1, 'Não ativo'),
	(2, 'Ativo'),
	(12, 'Não ativo'),
	(13, 'Não ativo');

insert into Professor(IDProfessor, NomeProf, StatusProf, IDCapitao) values 
	(1, 'Fábio', 'Não ativo', 1),
	(2, 'Sérgio', 'Ativo', 2),
	(3, 'Lauro', 'Não ativo', NULL),
	(4, 'Shida', 'Não ativo', NULL);

insert into Aluno(IDAluno, NomeAluno, CPFAluno, NumeroTelAluno, StatusAluno, IDAnoSemestre) values
	(1, 'Maria Eduarda', '01010101010', '12901010101', 'Ativo', 1),
	(2, 'Maria Beatriz', '02020202020', '12902020202', 'Ativo', 3),
	(3, 'Davi S', '03030303030', '12903030303', 'Ativo', 1),
	(4, 'Davi G', '04040404040', '12904040404', 'Ativo', 5),
	(5, 'Miguel', '05050505050', '12905050505', 'Ativo', 5),
	(6, 'Miguel G', '06060606060', '12906060606', 'Ativo', 5),
	(7, 'Luís Miguel', '07070707070', '12907070707', 'Ativo', 5),
	(8, 'Kauan', '08080808080', '12908080808', 'Ativo', 3),
	(9, 'Marcelo', '09090909090', '12909090909', 'Ativo', 5),
	(10, 'Nicolas', '10101010101', '12910101010', 'Ativo', 5),
	(11, 'Luan', '11111111111', '12911111111', 'Ativo', 5),
	(12, 'João', '12121212121', '12912121212', 'Ativo', 5),
	(13, 'Maria', '13131313131', '12913131313', 'Não ativo', 5),
	(14, 'Aubrey', '14141414141', '12914141414', 'Não ativo', 1);

insert into Ensina(IDMonitor, IDAluno) values
	(4, 1),
	(4, 2),
	(4, 3),
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 2),
	(2, 3),
	(5, 6),
	(5, 7),
	(10, 5),
	(10, 4),
	(10, 11),
	(12, 14);

insert into Responsavel(IDResponsavel, NomeResponsavel, NumeroTelResponsavel) values
	(1, 'José', '12900100100'),
	(2, 'Karla', '12900200200'),
	(3, 'Geraldo', '12900300300'),
	(4, 'Osvaldo', '12900400400'),
	(5, 'Paula', '12900500500'),
	(6, 'Helen', '12900600600'),
	(7, 'Gabriela', '12900700700'),
	(8, 'Thaís', '12900800800'),
	(9, 'Josefina', '12900900900'),
	(10, 'Lara', '12901001001'),
	(11, 'Marcos', '12901101101'),
	(12, 'Carlos', '12901201201'),
	(13, 'Renata', '12901301301'),
	(14, 'Sabrina', '12901401401');

insert into Responsavel_Aluno(IDAluno, IDResponsavel) values
	(1, 7),
	(2, 10),
	(3, 1),
	(4, 14),
	(5, 3),
	(6, 9),
	(7, 11),
	(8, 6),
	(9, 2),
	(10, 12),
	(11, 4),
	(12, 5),
	(13, 8),
	(14, 13);

insert into Equipe(IDEquipe, NomeEquipe) values
	(1, 'Scuderia Ferrari HP'),
	(2, 'Os Galáticos'),
	(3, 'Autobots'),
	(4, 'Silvertech'),
	(5, 'Equipe');

insert into Projeto(IDProjeto) values
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8),
	(9);

insert into Projeto_Interno(IDProjeto, DescricaoProjeto) values
	(1, 'Braço robótico de três eixos'),
	(2, 'Aulas introdutórias de Arduino'),
	(8, 'Impressora 3D'),
	(9, 'Garra Robótica');

insert into Competicao(IDProjeto, NomeCompeticao, FaseCompeticao) values
	(3, 'OBR 2023', 'Regional'),
	(4, 'OBR 2024', 'Regional'),
	(5, 'OBR 2024', 'Estadual'),
	(6, 'MOTORS 2023', 'Regional'),
	(7, 'MOTORS 2024', 'Estadual');

insert into Material(IDMaterial, DescricaoMaterial) values
	(1, 'LEGO'),
	(2, 'Bloco NXT'),
	(3, 'Computador'),
	(4, 'Carregador'),
	(5, 'Cabo'),
	(6, 'Atuador'),
	(7, 'Sensor de cor'),
	(8, 'Sensor ultrassônico'),
	(9, 'Sensor de toque'),
	(10, 'Pista');

insert into Robo(IDRobo, NomeRobo, IDEquipe, IDMaterial, IDProjeto) values
	(1, 'Loki', 1, 1, 4),
	(2, 'Loki', 1, 1, 5),
	(3, 'Odin', 2, 2, 2),
	(4, 'Hela', 3, 7, 1);

insert into Aula(IDAula, IDProjeto, DescricaoAula) values
	(1, 1, 'Criação da base para o braço'),
	(2, 1, 'Redução e potência'),
	(3, 1, 'Apresentação do braço'),
	(4, 2, 'Introdução à placa'),
	(5, 2, 'Arduino IDE e C++'),
	(6, 2, 'Protoboard e projetos');

insert into Aluno_Equipe_Projeto(IDAluno, IDProjeto, IDEquipe) values
	(1, 4, 1),
	(2, 4, 1),
	(3, 4, 1),
	(1, 5, 1),
	(2, 5, 1),
	(3, 5, 1),
	(9, 7, 5),
	(10, 7, 5),
	(5, 7, 5),
	(11, 7, 5);

insert into Projeto_AnoSemestre(IDAnoSemestre, IDProjeto) values
	(6, 1),
	(7, 2),
	(3, 3),
	(5, 4),
	(6, 5),
	(4, 6),
	(6, 7);