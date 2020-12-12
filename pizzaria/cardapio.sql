select c.nome, p.nome, pr.tamanho, pr.preco from cardapios c
inner join consta co on c.id=co.fk_cardapios_id
inner join pizzas p on co.fk_pizzas_id=p.id
inner join precos pr on p.id=pr.fk_pizzas_id;