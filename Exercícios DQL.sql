Exercícios de DQL
Agora, para você treinar, aqui vão alguns desafios:

🔍 Liste todos os livros com preço acima de R$ 35,00.
SELECT * FROM livros
WHERE preco > 35

📚 Mostre os títulos dos livros e o nome de seus autores.
SELECT l.titulo, a.nome	
FROM livros l
join autores a
on l.autor_id = a.autor_id

💰 Calcule o total de vendas (em reais) de cada livro.
SELECT 
    titulo,
    preco,
    estoque,
    (preco * estoque) AS total_vendas
FROM 
    livros;
🎯 Liste os clientes que já compraram mais de 1 livro.
SELECT 
    c.cliente_id,
    c.nome,
    SUM(v.quantidade) AS total_de_livros_comprados
FROM 
    clientes c
JOIN 
    vendas v ON c.cliente_id = v.cliente_id
GROUP BY 
    c.cliente_id, c.nome
HAVING 
    SUM(v.quantidade) > 1;

📅 Mostre todas as vendas feitas nos últimos 30 dias.
SELECT 
    v.venda_id, 
    c.nome AS cliente, 
    l.titulo AS livro, 
    v.quantidade, 
    v.data_venda
FROM 
    vendas v
JOIN 
    clientes c ON v.cliente_id = c.cliente_id
JOIN 
    livros l ON v.livro_id = l.livro_id
WHERE 
    v.data_venda >= CURRENT_DATE - INTERVAL '30 days'
ORDER BY 
    v.data_venda DESC;

📊 Liste os autores e a quantidade de livros vendidos por cada um.
SELECT 
    a.nome AS autor,
    SUM(v.quantidade) AS quantidade_vendida
FROM 
    vendas v
JOIN 
    livros l ON v.livro_id = l.livro_id
JOIN 
    autores a ON l.autor_id = a.autor_id
GROUP BY 
    a.nome
ORDER BY 
    quantidade_vendida DESC;

🏆 Qual é o livro mais vendido?
SELECT 
    l.titulo AS livro,
    SUM(v.quantidade) AS quantidade_vendida
FROM 
    vendas v
JOIN 
    livros l ON v.livro_id = l.livro_id
GROUP BY 
    l.titulo
ORDER BY 
    quantidade_vendida DESC
LIMIT 1;

🌍 Liste os autores agrupados por país.
SELECT 
    a.pais,
    ARRAY_AGG(a.nome) AS autores
FROM 
    autores a
GROUP BY 
    a.pais
ORDER BY 
    a.pais;
