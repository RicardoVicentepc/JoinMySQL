create database sprint2;

use sprint2;

create table tbAtleta
(
	idAtleta int primary key auto_increment,
    nomeAtleta varchar(40),
    modalidadeAtleta varchar(40),
    qtdMedalhas int
);
create table tbPais
(
	idPais int primary key auto_increment,
    nomePais varchar(30),
    capitalPais varchar(40)
);

insert into tbPais values
	(null, 'Brasil', 'Brasilia'),
    (null, 'Estados Unidos', 'Washington'),
    (null, 'Portugal', 'Lisboa'),
    (null, 'Itália', 'Roma');
    
insert into tbAtleta values
	(null, 'Manoel Gomes', 'Vôlei', 220),
    (null, 'Neymar Junior', 'Tênis de mesa', 10),
    (null, 'Ricardo Vicente', 'Vôlei', 100),
    (null, 'João Silva', 'Basquete', 310),
    (null, 'Telê Santana', 'Futebol', 4000);

-- • Criar a chave estrangeira na tabela correspondente conforme modelagem;
alter table tbAtleta add column FKidPais int, 
	add foreign key (FkidPais) references tbPais(idPais);
    
-- • Atualizar o país de todos os atletas;
update tbAtleta set FkidPais = 1 where idAtleta in(1,3);
update tbAtleta set FkidPais = 2 where idAtleta = 2;
update tbAtleta set FkidPais = 3 where idAtleta = 4;
update tbAtleta set FkidPais = 4 where idAtleta = 5;

-- • Exibir os atletas e seu respectivo país;
select * from tbAtleta join tbPais
	on tbAtleta.FkidPais = tbPais.idPais;

-- • Exibir apenas o nome do atleta e o nome do respectivo país;
select 
tbAtleta.nomeAtleta as 'Atleta',
tbPais.nomePais as 'Pais'
	from tbAtleta join tbPais
		on tbAtleta.FkidPais = tbPais.idPais;
        
-- • Exibir os dados dos atletas, seus respectivos países, de uma determinada capital;
select * from tbAtleta join tbPais
	on tbAtleta.FkidPais = tbPais.idPais 
		where capitalPais = 'Lisboa';
        
-- Task 2 
create table tbMusica
(
	idMusica int primary key auto_increment,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);
insert into tbMusica values
	(null, 'Antes', 'Matuê', 'Trap'),
    (null, 'Anos Luz', 'Matuê', 'Trap'),
    (null, 'Café', 'Mc Hariel', 'Funk');

create table tbAlbum 
(
	idAlbum int primary key auto_increment,
    nomeAlbum varchar(40),
    tipo char(7) constraint chktipo check (tipo in('digital', 'fisico')),
    dtLancameto date
);
insert into tbAlbum values
	(null, 'Máquina do Tempo', 'digital', '2021-02-12'),
    (null, 'Passado e Presente', 'fisico', '2021-04-20');
        
-- a) Exibir todos os dados das tabelas separadamente;
select * from tbMusica; 
select * from tbAlbum;

-- b) Criar a chave estrangeira na tabela de acordo com a regra de negócio;
alter table tbMusica add column FKidAlbum int,
	add foreign key (FKidAlbum) references tbAlbum(idAlbum);
    
-- c) Atualizar os álbuns de cada música;
update tbMusica set FKidAlbum = 1 where idMusica in(1,2);
update tbMusica set FKidAlbum = 2 where idMusica = 3;

-- d) Exibir as músicas e seus respectivos álbuns;
select * from tbMusica join tbAlbum
	on tbMusica.FKidAlbum = tbAlbum.idAlbum;
    
-- e) Exibir somente o título da música e o nome do seu respectivo álbum;
select
tbMusica.titulo,
tbAlbum.nomeAlbum as 'Nome do Album'
	from tbMusica join tbAlbum
		on tbMusica.FKidAlbum = tbAlbum.idAlbum;

-- f) Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo.
select * from tbMusica join tbAlbum
	on tbMusica.FKidAlbum = tbAlbum.idAlbum
		where nomeAlbum = 'Maquina do Tempo';
