use iot;
sh.ensureIndex( {"deviceId" : hashed});
sh.shardCollection("iot.devices", {"deviceId" : hashed});
db.devices.getShardDistribution();