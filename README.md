# Example linkerd with Go grpc

We want to have lots of services and not much configuration. Sounds good. Hence linkerd. Specify resources and let linkerd handle the load balancing etc.

First, build the docker image for the Go grpc service locally as this will be referred to in the docker-compose file:

```bash
docker build -t go-server  ./go-server
```

Next, run docker-compose `docker-compose up build`. This spins up 2 of grpc servers.

Then, do some server calls using:

```bash
go run ./go-client/main.go
```

Visit [the Linkerd admin/requests page](http://localhost:9990/requests).

To test you can run `./ping.sh [NUMBER]`, for example `./ping.sh 10` would call the service 10 times.

Voila.

To add more servers you will need to:

  - add new servers in the docker-compose.yml file like this, including a port:
    ```
      server-2:
       image: go-server
       container_name: server-2
       environment:
         - PORT=[YOUR_NEW_PORT]
       ports:
         - [YOUR_NEW_PORT]:[YOUR_NEW_PORT]
    ```
  - add image name and port to `linkerd/disco/helloworld.Greeter`
