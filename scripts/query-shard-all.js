use finanzas
db.facturas.find({"cliente.apellido":"Manoni"}).explain()