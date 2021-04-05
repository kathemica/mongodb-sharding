use iot;
sh.shardCollection("iot.devices", {"deviceId" : 1,"telemetry.full" : 1});
sh.enableSharding("iot");
db.devices.getShardDistribution();
sh.status();