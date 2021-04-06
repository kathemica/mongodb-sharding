rs.initiate({
    _id: "nodo04-rs",      
    members: [
      { _id : 0, host : "10.0.0.10:50010" },
      { _id : 1, host : "10.0.0.10:50011" },
      { _id : 2, host : "10.0.0.10:50012" }
    ]
  }
);
rs.status();  