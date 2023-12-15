// Qual é o número total de competições que o corredor participou em um determinado período?
MATCH 
    (c:Corredor) - [:REALIZOU] -> (s:Corrida)
WHERE 
    s.tipo = "competicao" and
    s.data >= "2023-12-01" and
    s.data <= "2023-12-31" and
    c.nome = "Thiago Maranhão"
RETURN 
    c.nome,
    count(*)

// Qual é o número total de competições que o corredor participou em um determinado período?
MATCH
    (c:Corredor) - [r:REALIZOU] -> (s:Corrida)
WHERE 
    r.tipoCorrida = "competicao" and
    s.data >= "2023-12-01" and
    s.data <= "2023-12-31" and
    c.nome = "Thiago Maranhão"
RETURN 
    c.nome, count(*)

// Qual é o número total de treinos que o corredor realizou em um determinado período?
MATCH
    (c:Corredor) - [r:REALIZOU] -> (s:Corrida)
WHERE
    r.tipoCorrida = "treino" and
    s.data >= "2023-12-01" and
    s.data <= "2023-12-31" and
    c.nome = "Allan Victor"
RETURN
    c.nome,
    count(*)

// Qual foi a maior distância percorrida pelo corredor em um determinado período?
MATCH
    (c:Corredor) - [:REALIZOU] -> (s:Corrida)
WHERE
    s.data >= "2023-12-01" and
    s.data <= "2023-12-31" and
    c.nome = "Thiago Maranhão"
RETURN
    c.nome,
    MAX(s.distancia)

// Qual foi o melhor ritmo realizado pelo corredor em um determinado período?
MATCH
    (c:Corredor) - [:REALIZOU] -> (s:Corrida)
WHERE
    s.data >= "2023-12-01" and
    s.data <= "2023-12-31" and
    c.nome = "Thiago Maranhão"
RETURN
    c.nome,
    MIN(s.ritmo)

// Qual foi o maior tempo de corrida realizado pelo corredor em um determinado período?
MATCH
    (c:Corredor) - [:REALIZOU] -> (s:Corrida)
WHERE
    s.data >= "2023-12-01" and
    s.data <= "2023-12-31" and
    c.nome = "Thiago Maranhão"
RETURN
    c.nome,
    MAX(s.tempo)