use iot ;
sh.enableSharding("iot") |
db.devices.ensureIndex( {"deviceId" : "hashed"}) |
sh.shardCollection("iot.devices", {"deviceId" : "hashed"});
db.devices.getShardDistribution();