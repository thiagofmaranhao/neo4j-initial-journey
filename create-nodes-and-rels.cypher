// Criar Nós - (:Corredor)
MERGE (c:Corredor {nome:"Thiago Maranhão"})
MERGE (c:Corredor {nome:"Allan Victor"})

// Criar Nós - (:Corrida)
MERGE (n:Corrida {nome:"Meia da Conceição"})
SET 
    n.data="2023-12-10",
    n.tipo="competicao",
    n.distancia=21.11,
    n.tempo="01:50:16",
    n.ritmo="00:05:13"

MERGE (n:Corrida {nome:"5Km Regenerativo"})
SET 
    n.data="2023-12-12",
    n.tipo="treino",
    n.distancia=5,
    n.tempo="00:30:07",
    n.ritmo="00:06:01"

MERGE (n:Corrida {nome:"Corrida Matinal"})
SET 
    n.data="2023-12-13",
    n.tipo="treino",
    n.distancia=10.81,
    n.tempo="00:52:49",
    n.ritmo="00:04:53"

// Criar Relacionamentos [:REALIZOU]
MATCH
  (thiago:Corredor {nome:"Thiago Maranhão"}),
  (conceicao:Corrida {nome:"Meia da Conceição"})
MERGE (thiago)-[r:REALIZOU]->(conceicao)

MATCH
  (thiago:Corredor {nome:"Thiago Maranhão"}),
  (cincokm:Corrida {nome:"5Km Regenerativo"})
MERGE (thiago)-[r:REALIZOU]->(cincokm)

MATCH
  (allan:Corredor {nome:"Allan Victor"}),
  (corr_matinal:Corrida {nome:"Corrida Matinal"})
MERGE (allan)-[r:REALIZOU]->(corr_matinal)