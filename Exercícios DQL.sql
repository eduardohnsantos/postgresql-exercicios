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

SELECT * FROM autores

💰 Calcule o total de vendas (em reais) de cada livro.
🎯 Liste os clientes que já compraram mais de 1 livro.
📅 Mostre todas as vendas feitas nos últimos 30 dias.
📊 Liste os autores e a quantidade de livros vendidos por cada um.
🏆 Qual é o livro mais vendido?
🌍 Liste os autores agrupados por país.
