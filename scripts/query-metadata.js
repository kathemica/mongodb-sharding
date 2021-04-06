sh.status()
db.facturas.getShardDistribution()
use config
db.chunks.find({}, {min:1,max:1,shard:1,_id:0,ns:1}).pretty()