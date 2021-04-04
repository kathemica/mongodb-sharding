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

#---------------------------------------------------------------
#Config server
#---------------------------------------------------------------
printf '\e[1;32m%-6s\e[m' "Consig server: creando contenedores en Docker"
#Creamos los contenedores
docker-compose -f docker-config/docker-compose-config-server.yaml up -d

printf '\e[1;32m%-6s\e[m' "Consig server: configurando el replicaset"
docker exec config-srv01 sh -c "mongo < ./scripts/config-server.js"