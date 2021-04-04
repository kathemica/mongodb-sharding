rs.initiate(
    {
      _id: "nodo02-rs",
      configsvr: true,
      members: [
        { _id : 0, host : "10.0.0.10:50004" },
        { _id : 1, host : "10.0.0.10:50005" },
        { _id : 2, host : "10.0.0.10:50006" }
      ]
    }
  );
rs.status();  