use finanzas ;
sh.enableSharding("finanzas") |
db.devices.ensureIndex( {"cliente" : "hashed"}) |
sh.shardCollection("finanzas.finanzas", {"cliente" : "hashed"});
sh.status();
db.devices.getShardDistribution();