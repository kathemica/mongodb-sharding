
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">

[<img src="https://img.shields.io/badge/Linkedin-kathesama-blue?style=for-the-badge&logo=linkedin">](https://www.linkedin.com/in/kathesama)
![MongoDB](https://img.shields.io/badge/-MongoDB-009900?logo=mongodb&logoColor=white&style=for-the-badge)
<br>
[![GitHub issues](https://img.shields.io/github/issues/kathemica/mongodb-sharding?style=plastic)](https://github.com/kathemica/mongodb-sharding/issues)
[![GitHub forks](https://img.shields.io/github/forks/kathemica/mongodb-sharding?style=plastic)](https://github.com/kathemica/mongodb-sharding/network)
[![GitHub stars](https://img.shields.io/github/stars/kathemica/mongodb-sharding?style=plastic)](https://github.com/kathemica/mongodb-sharding/stargazers)
![GitHub last commit](https://img.shields.io/github/last-commit/kathemica/mongodb-sharding?color=red&style=plastic)
![GitHub top language](https://img.shields.io/github/languages/top/kathemica/mongodb-sharding?style=plastic)
<br>
[![GitHub license](https://img.shields.io/github/license/kathemica/mongodb-sharding?style=plastic)](https://github.com/kathemica/mongodb-sharding/blob/main/LICENSE)
![GitHub repo size](https://img.shields.io/github/repo-size/kathemica/mongodb-sharding?style=plastic)
<br>

![header](assets/header.png)
---
# FIUBA - MongoDB sharding 

Ejercicio práctico de implementación de Sharding.

Se hacen las siguientes presunciones:

* <i class="fab fa-docker" style="color:blue"></i> El cliente donde se va a configurar el *shard* ya posee instalado y configurado *Docker* como contenedor de imágenes y *Docker compose*.
* <i class="far fa-hand-paper" style="color:red"></i> SE UTILIZA **docker-compose** EN ESTE PROYECTO.
* Se ejecuta en Linux.


<a href="https://youtu.be/ONQ6U0OQKcw " target="_blank">
  <img 
   src="https://i9.ytimg.com/vi/ONQ6U0OQKcw/mq2.jpg?sqp=COCzs4MG&rs=AOn4CLDvsgbdKLjjI8-Zi5vcpHC2BdsuOQ" 
alt="Video tutorial" width="320" border="10" /><br>Click acá para ver el video</a>



---

Este ejercicio ejecuta un script para la implementación inicial de un shard con 4 nodos, donde contendrá la siguiente estructura:
* mongos-service: router (01 nodo - 01 servidor)
  * mongos-service
* config-rs: Replicaset de configuracion (01 nodo - 03 servidores)
  * config-srv01
  * config-srv02
  * config-srv03
  
* nodo01-rs: Replicaset de almacentamiento (01 nodo - 03 servidores)
  * nodo-shard01-srv01
  * nodo-shard01-srv02
  * nodo-shard01-srv03

* nodo02-rs: Replicaset de almacentamiento (01 nodo - 03 servidores)
  * nodo-shard02-srv01
  * nodo-shard02-srv02
  * nodo-shard02-srv03

Luego de la carga de datos y configuración del shard se añadirán dos nodos más:
* nodo03-rs: Replicaset de almacentamiento (01 nodo - 03 servidores)
  * nodo-shard03-srv01
  * nodo-shard03-srv02
  * nodo-shard03-srv03

* nodo04-rs: Replicaset de almacentamiento (01 nodo - 03 servidores)
  * nodo-shard04-srv01
  * nodo-shard04-srv02
  * nodo-shard04-srv03


Finalmente se ejecutarán dos consultas:
* Una que debería consultar un solo nodo
* Otra que debería consultar todos los nodos

Para la ejecución de este proyecto se debe:

1. Clonar este repositorio:
```
git clone https://github.com/kathemica/mongodb-sharding.git
```

2. Ejecutar el script de configuración **luego de acceder a la carpeta del proyecto**:
```
source ./config.sh
```
**NOTA: Durante la ejecución del script deberías ver por consola todos los logs generados por los comandos del script.**

---
Para acceder a la configuracón y datos del proyecto ejecutar:

```
docker exec -it mongos-service /bin/bash
```

Luego:
```
mongo
```

Al hacer esto debería estar en la consola de mongos

Comandos útiles:
* **show dbs**: Muestra las bases de datos en el servidor.
* **use *nombreDeLaBaseDeDatos***: Selecciona una base datos si existe sino la va a crear.
* **show collections**: Muestra las colecciones existentes en una base de datos.
* **sh.status()**: Consulta el estado del shard.
* **db.facturas.getShardDistribution()**: Consulta cómo está distribuida la base de datos, previamente se debe seleccionar con **db *nombreDeLaBaseDeDatos***.
* **db.*nombreDeLaColección*.getIndexes()**: permite conocer los indices que estan en la coleccón de la base de datos a consultar, previamente seleccionar la base de datos.

