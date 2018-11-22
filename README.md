# MatrixPedia

MatrixPedia is a library of characters from the movie 'the matrix' using VIPER architecture


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

The above example exposes the JSON Server REST API on port 80, so that you can brows to:

```
http://localhost/characters
```

Retrieve all the characters:

```
http://localhost/characters
```