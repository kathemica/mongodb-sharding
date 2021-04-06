use finanzas
db.createCollection('facturas')
db.facturas.createIndex({"cliente.region": 1, condPago: 1, _id: 1})
sh.enableSharding("finanzas")
sh.shardCollection("finanzas.facturas", {"cliente.region": 1, condPago: 1, _id: 1})
sh.status()
db.facturas.getShardDistribution()
