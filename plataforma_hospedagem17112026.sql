#17/11

/*
1ª consulta

Após as consultas anteriores, a  plataforma solicitou algumas mudanças.
Foi observado que não temos a quantidade de propriedades por proprietários.
Também foi pedido que alterassemos a tabela alugueis para "reservas",
o que faz mais sentido para o banco

*/
alter table proprietarios
add quant_hospedagem int;

alter table proprietarios	
add quant_hospedagens int;

alter table proprietarios
drop quant_hospedagem; 

#Renomear o nome da tabela
alter table reserva	
rename to reservas;

#renomear aluguel_id que não existe mais para reserva_id
alter table reservas
rename column aluguel_id to reserva_id;

# Seleção das hospedagens inativas a partir do id

select * from hospedagens
where hospedagem_id in ("1","10","100");

#alterar as hospedagens para ativas baseando-se no id
update hospedagens
set ativo=1
where hospedagem_id in ("1","10","100");

#alterar o email do proprietario de id 1009 para daniela_120@email.com
select * from proprietarios
where proprietario_id = "1009";

update proprietarios
set contato = "daniela_120@email.com"
where proprietario_id = "1009";