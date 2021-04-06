rs.initiate({
    _id: "nodo03-rs",      
    members: [
      { _id : 0, host : "10.0.0.10:50007" },
      { _id : 1, host : "10.0.0.10:50008" },
      { _id : 2, host : "10.0.0.10:50009" }
    ]
  }
);
rs.status();  