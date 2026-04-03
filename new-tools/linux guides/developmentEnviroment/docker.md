# Docker tips and tricks

## Summary

## 01

Run containers with database docker images, instead install database on development machine.

> -p (port forwarding) containerPort:hostPort
> --name (container name)
> -e (environment variables)
> -d (deamon mode - run in background)
> postgres (image name)

```
docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres

docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysql -d mysql
```

docker exec -it -u postgres b3ff0de20da4 psql

docker run -d -p 5672:5672 --hostname my-rabbitmq rabbitmq:3 

docker image build -t econt-agro-service ~/Desktop/repository/econt/econt-agro-service/


