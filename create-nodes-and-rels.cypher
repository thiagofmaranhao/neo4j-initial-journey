// Criar Nós - (:Corredor)
MERGE 
  (:Corredor {nome:"Thiago Maranhão"})
MERGE 
  (:Corredor {nome:"Allan Victor"})

// Criar Nós - (:Corrida)
MERGE 
  (corrida:Corrida {nome:"Meia da Conceição"})
SET 
	corrida.data="2023-12-10",
	corrida.tipo="competicao",
	corrida.distancia=21.11,
	corrida.tempo="01:50:16",
	corrida.ritmo="00:05:13"

MERGE 
  (corrida:Corrida {nome:"5Km Regenerativo"})
SET 
	corrida.data="2023-12-12",
	corrida.tipo="treino",
	corrida.distancia=5,
	corrida.tempo="00:30:07",
	corrida.ritmo="00:06:01"

MERGE 
  (corrida:Corrida {nome:"Corrida Matinal"})
SET 
	corrida.data="2023-12-13",
	corrida.tipo="treino",
	corrida.distancia=10.81,
	corrida.tempo="00:52:49",
	corrida.ritmo="00:04:53"

// Criar Relacionamentos [:REALIZOU]
MATCH
  (thiago:Corredor {nome:"Thiago Maranhão"}),
  (conceicao:Corrida {nome:"Meia da Conceição"})
MERGE 
  (thiago)-[realizou:REALIZOU]->(conceicao)

MATCH
  (thiago:Corredor {nome:"Thiago Maranhão"}),
  (cincokm:Corrida {nome:"5Km Regenerativo"})
MERGE 
  (thiago)-[:REALIZOU]->(cincokm)

MATCH
  (allan:Corredor {nome:"Allan Victor"}),
  (corr_matinal:Corrida {nome:"Corrida Matinal"})
MERGE 
  (allan)-[:REALIZOU]->(corr_matinal)

// Refatoração
MATCH 
  (corredor:Corredor) - [realizou:REALIZOU] -> (corrida:Corrida)
SET 
  realizou.tipoCorrida = corrida.tipo

MATCH
  (corrida: Corrida)
SET
  corrida.tipo = NULL

MATCH
  (corrida:Corrida)
REMOVE
  corrida.tipo