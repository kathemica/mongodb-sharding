rs.initiate({
    _id: "nodo01-rs",
    members: [
      { _id : 0, host : "10.0.0.10:50001" },
      { _id : 1, host : "10.0.0.10:50002" },
      { _id : 2, host : "10.0.0.10:50003" }
    ]
  }
);
rs.status();