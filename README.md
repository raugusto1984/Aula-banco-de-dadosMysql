## 📋 Repositório sobre Banco de dados em MySql

> [Neste repositório iremos ver sobre um trabalho desenvolvido de forma parcelada em várias aulas, comandos como criar um banco de dados, criar tabelas, alterar, incluir e excluir linhas entre outras.]

---

## 📋 Sobre o Projeto

Este projeto foi desenvolvido com o objetivo de [demonstrar um banco de dados para organizar informações sobre hospedagem e como fazer consultas no banco de dados a partir de conversas hipotéticas entre diretoria e nós, que no caso somos os responsáveis pelo banco].

### ✨ Entidades e Atributos
* [Avaliacoes:avaliacao_id, cliente_id, hospedagem_id, nota, comentario]
* [Clientes:cliente_id, nome, cpf, contato]
* [Endereços: endereco_id, rua, numero, bairro, cidade, estado, cep]
* [Hospedagens: hospedagem_id, tipo, endereco_id,propietario_id, ativo]
* [Propietarios: proprietario_id, nome, cpf_cnpj, contato, quant_hospedagens]
* [Reservas: reserva_id, cliente_id, hospedagem_id, data_inicio, data_fim, preco_total]

---

## 🛠️ Tecnologias e Ferramentas

* **SGBD:** MySQL Workbench [versão: 8.0]

---


### Dicionário de Dados (Resumo das Tabelas)

<img width="1440" height="900" alt="Captura de tela de 2026-11-26 20-05-56" src="https://github.com/user-attachments/assets/2fbed526-0e43-46ba-82c7-52a954c35973" />



---

## 📂 Estrutura do Repositório



---

## 📊 Exemplos de Consultas (Queries)

Abaixo está um exemplo de consulta implementada no projeto para [descreva o que a query faz, ex: listar o total gasto por cada cliente]:

pesquisa de 50 nomes da lista clientes
select nome from clientes
limit 50;

/*pesquisa de ticekt medio*/
select cliente_id, avg(preco_total)
as ticket_medio from alugueis
group by cliente_id;

/*quais dias tem maiores quantidades reservas*/
select cliente_id, avg (datediff (data_fim,data_inicio))
as media_dias_estadias
from alugueis
group by cliente_id
order by media_dias_estadias desc;

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


---

## 👤 Autor

Desenvolvido por **[Rafael de Méllo Dias Augusto]**

