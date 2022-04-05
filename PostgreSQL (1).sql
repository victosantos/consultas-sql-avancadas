--1.SELECT * FROM a JOIN b ON a.id = b.a_id; Uma cláusula JOIN é usada para combinar linhas de duas ou mais tabelas, com base em uma coluna relacionada entre elas
--2.INNER JOIN Retorna registros que possuem valores correspondentes em ambas as tabelas
--	LEFT (OUTER) JOIN Retorna todos os registros da tabela da esquerda e os registros correspondentes da tabela da direita
--	RIGHT (OUTER) JOIN Retorna todos os registros da tabela da direita e os registros correspondentes da tabela da esquerda
--	FULL (OUTER) JOIN Retorna todos os registros quando há uma correspondência na tabela esquerda ou direita
--	SELF JOIN Uma SEFT JOIN é um JOIN regular, mas a tabela é unida a ela mesma
--3.A instrução GROUP BY agrupa linhas que têm os mesmos valores em linhas de resumo, como "encontrar o número de clientes em cada país"
--4.A cláusula HAVING foi adicionada ao SQL porque a palavra-chave WHERE não pode ser usada com funções agregadas
--5.SELECT * FROM TABLE1 AS A INNER JOIN TABLE2 AS B ON A.ID = B.TABLE_A_ID;
--	SELECT * FROM TABLE1 AS A LEFT JOIN TABLE2 AS B ON A.ID = B.TABLE_A_ID;
--	SELECT * FROM TABLE1 AS A RIGHT JOIN TABLE2 AS B ON A.ID = B.TABLE_A_ID;
--	SELECT * FROM TABLE1 AS A FULL OUTER JOIN TABLE2 AS B ON A.ID = B.TABLE_A_ID;
--	SELECT * TABLE1 T1, TABLE2 T2;

SELECT series.title, genres.name 
from series 
inner join genres on series.genre_id = genres.id;

SELECT ep.title, ac.first_name, ac.last_name 
from actor_episode ae
inner join episodes ep on ep.id = ae.episode_id
inner join actors ac on ae.actor_id = ac.id;

select ser.title, count(sea.id)
from series ser 
inner join seasons sea on ser.id = sea.serie_id
group by ser.title;

SELECT gen.name, COUNT(mov.id)
from genres gen
inner join movies mov on gen.id = mov.genre_id
group by gen.name;

select CONCAT(act.first_name, ' ',act.last_name) "Nome Completo"
from actor_movie acm
inner join actors act on acm.actor_id = act.id
inner join movies mov on acm.movie_id = mov.id
where mov.id in (3, 4)
group by CONCAT(act.first_name, ' ',act.last_name);
