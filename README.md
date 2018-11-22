# MatrixPedia

MatrixPedia is a VIPER example

### Pods

Install dependencies:

```bash
$ pod install
```

## API Docker 

Download [Matrix Docker](https://github.com/alexcros/docker-matrix-server) in your local folder and run: 

```bash
$ docker run -d -p 80:80 -v ~/docker-json-server-master/matrix.json:/data/db.json clue/json-server
```

The above example exposes the JSON Server REST API on port 80, so that you can now call /characters endpoint:

```
http://localhost/characters
```
