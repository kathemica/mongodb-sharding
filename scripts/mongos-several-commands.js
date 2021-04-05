sh.enableSharding("iot");
sh.shardCollection("iot.devices", {"deviceId" : 1,"telemetry.full" : 1});
db.devices.getShardDistribution();
sh.status();