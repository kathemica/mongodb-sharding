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

cd docker-config

#---------------------------------------------------------------
#Config server
#---------------------------------------------------------------
printf '\e[1;32m%-6s\e[m' "Config server: creando contenedores en Docker"
printf "\n"
#Creamos los contenedores
docker-compose -f docker-compose-config-server.yaml up -d

sleep 5

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

sleep 5

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

sleep 5

printf "\n"
printf '\e[1;32m%-6s\e[m' "Nodo 02: configurando el replicaset"
printf "\n"
docker-compose exec nodo-shard02-srv01 sh -c "mongo < ./scripts/config-nodo02.js"

#---------------------------------------------------------------
#Mongos
#---------------------------------------------------------------
printf "\n"
printf '\e[1;32m%-6s\e[m' "Mongos: creando contenedores en Docker"
printf "\n"
#Creamos los contenedores
docker-compose -f docker-compose-mongos-service.yaml up -d

sleep 5

printf "\n"
printf '\e[1;32m%-6s\e[m' "Mongos: configurando mongos"
printf "\n"
#docker-compose exec mongos sh -c "mongo < ./scripts/config-mongos.js"

printf "\n"
printf '\e[1;32m%-6s\e[m' "Mongos: configurando mongos - Añadiendo Nodo01 y Nodo02"
printf "\n"
#docker-compose exec mongos sh -c "mongo < ./scripts/config-mongos.js"



printf "\n"
printf '\e[1;31m%-6s\e[m' "Fin..."
printf "\n"