// Qual é o número total de competições que o corredor participou em um determinado período?
MATCH 
    (corredor:Corredor) - [:REALIZOU] -> (corrida:Corrida)
WHERE 
	corrida.tipo = "competicao" and 
	corrida.data >= "2023-12-01" and 
	corrida.data <= "2023-12-31" and 
	corredor.nome = "Thiago Maranhão" 
RETURN 
    corredor.nome,
    count(*)

// Qual é o número total de treinos que o corredor realizou em um determinado período?
MATCH 
    (corredor:Corredor) - [:REALIZOU] -> (corrida:Corrida)
WHERE 
	corrida.tipo = "treino" and
	corrida.data >= "2023-12-01" and
	corrida.data <= "2023-12-31" and
	corredor.nome = "Allan Victor"
RETURN 
    corredor.nome,
    count(*)

// Qual foi a maior distância percorrida pelo corredor em um determinado período?
MATCH 
    (corredor:Corredor) - [:REALIZOU] -> (corrida:Corrida)
WHERE 
	corrida.data >= "2023-12-01" and 
	corrida.data <= "2023-12-31" and 
	corredor.nome = "Thiago Maranhão" 
RETURN 
    corredor.nome,
    MAX(corrida.distancia)

// Qual foi o melhor ritmo realizado pelo corredor em um determinado período?
MATCH
    (corredor:Corredor) - [:REALIZOU] -> (corrida:Corrida)
WHERE 
	corrida.data >= "2023-12-01" and 
	corrida.data <= "2023-12-31" and 
	corredor.nome = "Thiago Maranhão" 
RETURN 
    corredor.nome,
    MIN(corrida.ritmo)

// Qual foi o maior tempo de corrida realizado pelo corredor em um determinado período?
MATCH 
    (corredor:Corredor) - [:REALIZOU] -> (corrida:Corrida) 
WHERE 
	corrida.data >= "2023-12-01" and
	corrida.data <= "2023-12-31" and
	corredor.nome = "Thiago Maranhão"
RETURN 
    corredor.nome,
    MAX(corrida.tempo)

// Pós Refatoração - Qual é o número total de competições que o corredor participou em um determinado período?
MATCH (corredor:Corredor) - [realizou:REALIZOU] -> (corrida:Corrida)
WHERE 
	realizou.tipoCorrida = "competicao" and
	corrida.data >= "2023-12-01" and
	corrida.data <= "2023-12-31" and
	corredor.nome = "Thiago Maranhão"
RETURN 
    corredor.nome,
    count(*)

// Pós Refatoração - Qual é o número total de treinos que o corredor realizou em um determinado período?
MATCH 
    (corredor:Corredor) - [realizou:REALIZOU] -> (corrida:Corrida)
WHERE 
	realizou.tipoCorrida = "treino" and 
	corrida.data >= "2023-12-01" and 
	corrida.data <= "2023-12-31" and 
	corredor.nome = "Allan Victor"
RETURN 
    corredor.nome,
    count(*)