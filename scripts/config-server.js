rs.initiate(
    {
      _id: "cfgrs",
      configsvr: true,
      members: [
        { _id : 0, host : "10.0.0.10:40001" },
        { _id : 1, host : "10.0.0.10:40002" },
        { _id : 2, host : "10.0.0.10:40003" }
      ]
    }
  );
rs.status();  