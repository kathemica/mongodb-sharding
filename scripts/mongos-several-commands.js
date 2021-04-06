use finanzas
db.facturas.createIndex({"cliente.cuit" : "hashed"})
sh.shardCollection("finanzas.facturas", {"cliente.cuit" : "hashed"})
sh.status()
db.facturas.getShardDistribution()