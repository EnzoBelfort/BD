create table Ano_Semestre(
	IDAnoSemestre int not null auto_increment,
	Ano year not null,
	Semestre int not null,
	primary key(IDAnoSemestre)
)Engine=INNODB;

create table Monitor(
	IDMonitor int not null auto_increment,
	NomeMonitor varchar(80) not null,
	StatusMonitor varchar(10) not null,
	IDCapitao int,
	IDAnoSemestre int not null,
	primary key(IDMonitor),
	foreign key(IDCapitao) references Monitor(IDMonitor),
	foreign key(IDAnoSemestre) references Ano_Semestre(IDAnoSemestre)
)Engine=INNODB;

create table Capitao(
	IDCapitao int not null,
	StatusCapitao varchar(10) not null,
	primary key(IDCapitao),
	foreign key(IDCapitao) references Monitor(IDMonitor)
)Engine=INNODB;

create table Professor(
	IDProfessor int not null auto_increment,
	NomeProf varchar(80) not null,
	StatusProf varchar(10) not null,
	IDCapitao int,
	foreign key(IDCapitao) references Capitao(IDCapitao),
	primary key(IDProfessor)
)Engine=INNODB;	

create table Aluno(
	IDAluno int not null auto_increment,
	NomeAluno varchar(80) not null,
	CPFAluno varchar(11) not null,
	NumeroTelAluno varchar(11) not null,
	StatusAluno varchar(10) not null,
	IDAnoSemestre int not null,
	primary key(IDAluno),
	foreign key(IDAnoSemestre) references Ano_Semestre(IDAnoSemestre)
)Engine=INNODB;	

create table Ensina(
	IDAluno int not null,
	IDMonitor int not null,
	primary key(IDAluno, IDMonitor),
	foreign key(IDAluno) references Aluno(IDAluno),
	foreign key(IDMonitor) references Monitor(IDMonitor)
)Engine=INNODB;	

create table Responsavel(
	IDResponsavel int not null auto_increment,
	NomeResponsavel varchar(80) not null,
	NumeroTelResponsavel varchar(11) not null,
	primary key(IDResponsavel)
)Engine=INNODB;	

create table Responsavel_Aluno(
	IDAluno int not null,
	IDResponsavel int not null,
	primary key(IDAluno,IDResponsavel),
	foreign key(IDAluno) references Aluno(IDAluno),
	foreign key(IDResponsavel) references Responsavel(IDResponsavel)
)Engine=INNODB;	

create table Equipe(
	IDEquipe int not null auto_increment,
	NomeEquipe varchar(80) not null,
	primary key(IDEquipe)
)Engine=INNODB;	

create table Projeto(
	IDProjeto int not null auto_increment,
	primary key(IDProjeto)
)Engine=INNODB;	

create table Projeto_Interno(
	IDProjeto int not null,
	DescricaoProjeto varchar(80) not null,
	primary key(IDProjeto),
	foreign key(IDProjeto) references Projeto(IDProjeto)
)Engine=INNODB;	

create table Competicao(
	IDProjeto int not null,
	NomeCompeticao varchar(80) not null,
	FaseCompeticao varchar(50) not null,
	primary key(IDProjeto),
	foreign key(IDProjeto) references Projeto(IDProjeto)
)Engine=INNODB;	

create table Material(
	IDMaterial int not null auto_increment,
	DescricaoMaterial varchar(80) not null,
	primary key(IDMaterial)
)Engine=INNODB;	

create table Robo(
	IDRobo int not null auto_increment, 
	NomeRobo varchar(80) not null,
	IDEquipe int not null,
	IDMaterial int not null, 
	IDProjeto int not null,
	primary key(IDRobo, IDMaterial, IDProjeto),
	foreign key(IDEquipe) references Equipe(IDEquipe),
	foreign key(IDMaterial) references Material(IDMaterial),
	foreign key(IDProjeto) references Projeto(IDProjeto)
)Engine=INNODB;	

create table Aula(
	IDAula int not null auto_increment,
	IDProjeto int not null,
	DescricaoAula varchar(80),
	primary key(IDAula, IDProjeto),
	foreign key(IDProjeto) references Projeto_Interno(IDProjeto)
)Engine=INNODB;	

create table Aluno_Equipe_Projeto(
	IDAluno int not null,
	IDEquipe int not null,
	IDProjeto int not null,
	primary key(IDAluno, IDEquipe, IDProjeto),
	foreign key(IDAluno) references Aluno(IDAluno),
	foreign key(IDEquipe) references Equipe(IDEquipe),
	foreign key(IDProjeto) references Projeto(IDProjeto)
)Engine=INNODB;	

create table Projeto_AnoSemestre(
	IDAnoSemestre int not null,
	IDProjeto int not null,
	primary key(IDAnoSemestre, IDProjeto),
	foreign key(IDAnoSemestre) references Ano_Semestre(IDAnoSemestre),
	foreign key(IDProjeto) references Projeto(IDProjeto)
)Engine=INNODB;