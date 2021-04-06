use finanzas
db.createCollection('facturas')
db.facturas.createIndex({"cliente.cuit" : "hashed"})
sh.enableSharding("finanzas")
sh.shardCollection("finanzas.facturas", {"cliente.cuit" : "hashed"})
sh.status()
db.facturas.getShardDistribution()