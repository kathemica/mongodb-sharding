use iot;

db.devices.createIndex({"date.year" : 1,"date.month" : 1,"date.day" : 1,"date.hour" : 1});
db.devices.createIndex({"deviceId" : 1,"telemetry.temperature" : 1});
db.devices.createIndex({"telemetry.temperature" : 1,"telemetry.humidity" : 1});
db.devices.createIndex({"deviceId" : 1,"sensor" : 1,"telemetry.humidity" : 1});
db.devices.createIndex({"deviceId" : 1,"telemetry.full" : 1});
db.devices.createIndex({"telemetry.temperature" : 1,"telemetry.humidity" : 1});
db.devices.createIndex({"deviceId" : 1,"sensor" : 1,"date.year" : 1,"date.month" : 1,"date.day" : 1,"date.hour" : 1});
db.devices.createIndex({"date.year" : 1,"date.month" : 1,"date.day" : 1,"date.hour" : 1});
db.devices.createIndex({"deviceId" : 1,"sensor" : 1,"date.year" : 1,"date.month" : 1,"date.day" : 1});
db.devices.createIndex({"date.year" : 1,"date.month" : 1,"date.day" : 1});