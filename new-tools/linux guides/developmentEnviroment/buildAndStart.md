# Build and Start Development Enviroment

## **Build econt-agro-service**

### Install Java Development Kit

```shell
sudo apt install openjdk-11-jdk -y && sudo apt update
```

### Install Maven

```shell
sudo apt install maven -y && sudo apt update
```

### RabbitMQ install and configuration

```shell
apt install rabbitmq-server -y && sudo apt update
sudo systemctl enable rabbitmq-server
sudo systemctl start rabbitmq-server
sudo systemctl stop rabbitmq-server
sudo rabbitmq-plugins enable rabbitmq_management
```

*access <http://localhost:15672>*

### PostgreSQL install and configuration

```shell
apt install postgresql -y && sudo apt update
sudo -u postgres psql
# alter user postgres with encrypted password 'postgres';
# create database econt;
```

### PGAdmin4 install and configuration

```shell
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'
sudo apt install pgadmin4 -y && sudo apt update
sudo /usr/pgadmin4/bin/setup-web.sh
```

*Configlsure e-mail and password to login <http://localhost/pgadmin4>*  
*Create a server name "econt" host "locahost" with username "postgres" port "5432"*

### Locale configuration to pt_BR.UTF-8

```shell
sudo localectl set-locale LC_COLLATE=pt_BR.UTF-8
sudo localectl set-locale LC_MESSAGE=pt_BR.UTF-8
locale
```

### Data and hour configuration to America - Cuiaba

```shell
sudo dpkg-reconfigure tzdata
```

## **Build econt-agro-frontend**

### Install yarn

```shell
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn
```

### Install node

```shell
curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### Install Angular

```shell
npm install -g @angular/cli
```

## **Start econt-agro-service**

```shell
sh script-maven-build-with-tests.sh
java -jar econt-agro-starter/target/econt-agro-starter-1.0.0-RELEASE.jar
```

## **Start econt-agro-frontend**

```shell
yarn
ng serve --host 0.0.0.0
```
