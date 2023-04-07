# DockerTemplate_PHP7.4_MySQL5.7

## Usage

### 1. Clone this repository

```bash
git clone https://github.com/KanataTanaka999/DockerTemplate_PHP7.4_MySQL5.7.git
```

### 2. Build docker image

```bash
docker-compose build
```

or double click `build.command`.

### 3. Start docker container

```bash
docker-compose up -d
```

or double click `start.command`.

### 4. Access to localhost

```bash
# http
http://localhost:8084
# https
https://localhost:8443
# phpMyAdmin
http://localhost:4044
# mailhog
http://localhost:8025
```

### 5. Stop docker container

```bash
docker-compose down
```

or double click `stop.command`.
