# airlines_companies

Go to the page: https://hub.docker.com/repository/docker/shandar1997/airlines/tags?page=1&ordering=last_updated. There are docker images that are created in this program.
Pull theese images from this page in own docker:
  docker pull shandar1997/airlines:mysqldb
  docker pull shandar1997/airlines:app_jdk

Than create containers by theese images. First run MySQL database:
  docker run --name localhost -e MYSQL_ROOT_PASSWORD=1111 -e MYSQL_DATABASE=airlines -e MYSQL_PASSWORD=1111 -d shandar1997/airlines:mysqldb
Wait until the database is ready to use (about 30s). Then run application (app_jdk):
  docker run -d -p 8089:8080 --name app --link localhost:mysql  shandar1997/airlines:app_jdk

After open Postman, open branch "add_jarfile", download file "endpointsFromTestTask.postman_collection_port8089.json" from this repository. Import this collection into Postman and test all required endpoints.
to see tips on how the endpoint works - right-click on the endpoint and select Edit
