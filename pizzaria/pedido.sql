select p.id, c.nome, f.nome, f.telefone, e.logradouro,e.numero,e.complemento,e.pontoReferencia,b.nome, pi.nome,pr.preco,pr.tamanho
 from pedido p
inner join clientes c on p.fk_clientes_id=c.id
inner join funcionarios f on p.fk_funcionarios_id=f.id
inner join enderecos e on p.fk_enderecos_id=e.id
inner join bairros b on e.fk_bairros_id=b.id
inner join itenspedido i on p.id=i.fk_pedidos_id
inner join pizzas pi on i.fk_pizzas_id=pi.id
inner join precos pr on pi.id=pr.fk_pizzas_id and pr.preco=i.precoVenda;