use finanzas
db.facturas.find({"cliente.region":"CABA", "condPago":"30 Ds FF"}).explain()