clear

printf "Authors:  Ing. Katherine Aguirre\n"
printf "Date:     Abril 2021\n"
printf "Licence:  Apache V.2\n"
printf "Project:  Mongo Sharding\n"
printf "Brief:    configure whole application\n"
printf "\n"
printf '\e[1;31m%-6s\e[m' "Ejecutando los pasos de instalación..."
printf "\n"
# How to use this
# source ./config.sh 

#Funcion que crea un contador de N a 0
#Parámetro
#Tiempo  -- $1
timerFunction(){
    for (( c=$1; c>0; c-- ))
        do  
            echo -ne "\r$c ";
            sleep 1;
    done
}

cd docker-config

#---------------------------------------------------------------
#Config server
#---------------------------------------------------------------
printf '\e[1;32m%-6s\e[m' "Config server: creando contenedores en Docker"
printf "\n"
#Creamos los contenedores
docker-compose -f docker-compose-config-server.yaml up -d

timerFunction 5

printf "\n"
printf '\e[1;32m%-6s\e[m' "Config server: configurando el replicaset"
printf "\n"

docker-compose exec config-srv01 sh -c "mongo < ./scripts/config-server.js"

#---------------------------------------------------------------
#Nodo 01
#---------------------------------------------------------------
printf '\e[1;32m%-6s\e[m' "Nodo 01: creando contenedores en Docker"
printf "\n"
#Creamos los contenedores
docker-compose -f docker-compose-nodo01.yaml up -d

timerFunction 5

printf "\n"
printf '\e[1;32m%-6s\e[m' "Nodo 01: configurando el replicaset"
printf "\n"
docker-compose exec nodo-shard01-srv01 sh -c "mongo < ./scripts/config-nodo01.js"

#---------------------------------------------------------------
#Nodo 02
#---------------------------------------------------------------
printf "\n"
printf '\e[1;32m%-6s\e[m' "Nodo 02: creando contenedores en Docker"
printf "\n"
#Creamos los contenedores
docker-compose -f docker-compose-nodo02.yaml up -d

timerFunction 5

printf "\n"
printf '\e[1;32m%-6s\e[m' "Nodo 02: configurando el replicaset"
printf "\n"
docker-compose exec nodo-shard02-srv01 sh -c "mongo < ./scripts/config-nodo02.js"

#---------------------------------------------------------------
#Mongos
#---------------------------------------------------------------
printf "\n"
printf '\e[1;32m%-6s\e[m' "Mongos-service: creando contenedores en Docker"
printf "\n"
#Creamos los contenedores
docker-compose -f docker-compose-mongos-service.yaml up -d

timerFunction 5

printf "\n"
printf '\e[1;32m%-6s\e[m' "Mongos-service: configurando mongos - Añadiendo Nodo01 y Nodo02"
printf "\n"
docker exec mongos-service sh -c "mongo < ./scripts/config-mongos.js"

timerFunction 5

printf "\n"
printf '\e[1;31m%-6s\e[m' "Mongos-service: Habilitando sharding para la base de datos..."
printf "\n"

docker exec mongos-service sh -c "mongo < ./scripts/mongos-several-commands.js"

printf "\n"
printf '\e[1;31m%-6s\e[m' "Mongos-service: Cargando la base de datos... se paciente por favor."
printf "\n"
docker exec mongos-service sh -c "mongo < ./scripts/load-database.js"

printf "\n"
printf '\e[1;32m%-6s\e[m' "Mongos-service: Agregando dos (2) nuevo shards al cluster."
printf "\n"

#---------------------------------------------------------------
#Nodo 03
#---------------------------------------------------------------
printf "\n"
printf '\e[1;32m%-6s\e[m' "Nodo 03: creando contenedores en Docker"
printf "\n"
#Creamos los contenedores
docker-compose -f docker-compose-nodo03.yaml up -d

timerFunction 5

printf "\n"
printf '\e[1;32m%-6s\e[m' "Nodo 03: configurando el replicaset"
printf "\n"
docker exec nodo-shard03-srv01 sh -c "mongo < ./scripts/config-nodo03.js"

#---------------------------------------------------------------
#Nodo 04
#---------------------------------------------------------------
printf "\n"
printf '\e[1;32m%-6s\e[m' "Nodo 04: creando contenedores en Docker"
printf "\n"
#Creamos los contenedores
docker-compose -f docker-compose-nodo04.yaml up -d

timerFunction 5

printf "\n"
printf '\e[1;32m%-6s\e[m' "Nodo 04: configurando el replicaset"
printf "\n"
docker exec nodo-shard04-srv01 sh -c "mongo < ./scripts/config-nodo04.js"

timerFunction 5

#---------------------------------------------------------------
#Mongos
#---------------------------------------------------------------
printf "\n"
printf '\e[1;32m%-6s\e[m' "Mongos-service: configurando mongos - Añadiendo Nodo03 y Nodo04"
printf "\n"
docker exec mongos-service sh -c "mongo < ./scripts/config-mongos-update.js"

printf "\n"
printf '\e[1;31m%-6s\e[m' "Mongos-service: Cargando la base de datos con nuevos registros... se paciente por favor."
printf "\n"
docker exec mongos-service sh -c "mongo < ./scripts/load-database.js"

printf "\n"
printf '\e[1;32m%-6s\e[m' "PAUSA: En espera que los nodos se balanceen."
printf "\n"
timerFunction 300

printf "\n"
printf '\e[1;32m%-6s\e[m' "Mongos-service: Consultando la nueva metadata"
printf "\n"
docker exec mongos-service sh -c "mongo < ./scripts/query-metadata.js"

timerFunction 5

printf "\n"
printf '\e[1;32m%-6s\e[m' "Mongos-service: Query con un sólo shard"
printf "\n"
docker exec mongos-service sh -c "mongo < ./scripts/query-shard-solo.js"

printf "\n"
printf '\e[1;32m%-6s\e[m' "Mongos-service: Query con todos los shards"
printf "\n"
docker exec mongos-service sh -c "mongo < ./scripts/query-shard-all.js"

printf "\n"
printf '\e[1;31m%-6s\e[m' "Fin..."
printf "\n"

cd ..