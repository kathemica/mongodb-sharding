use finanzas 
db.facturas.createIndex({"cliente.region": 1, "cliente.nombre": 1})
sh.enableSharding("finanzas")
sh.shardCollection("finanzas.facturas", {"cliente" : "hashed"})
sh.status()
db.devices.getShardDistribution()