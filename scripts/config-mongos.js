printf "-------------------------------------------------\n";
printf "                 AÑADIENDO NODO01";
printf "-------------------------------------------------\n";

sh.addShard("nodo01-rs/10.0.0.10:50001,10.0.0.10:50002,10.0.0.10:50003");

printf "-------------------------------------------------\n";
printf "              STATUS REPLICASET NODO01";
printf "-------------------------------------------------\n";

rs.status();  

printf "-------------------------------------------------\n";
printf "                 AÑADIENDO NODO02";
printf "-------------------------------------------------\n";

sh.addShard("nodo02-rs/10.0.0.10:50004,10.0.0.10:50005,10.0.0.10:50006");

printf "-------------------------------------------------\n";
printf "                STATUS ACTUALIZADO";
printf "-------------------------------------------------\n";

sh.status();
