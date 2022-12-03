# Web servers

## Monolithic web servers

A web server is a computing device that is hosting a web service that knows how to accept incoming internet connections and speak the HTTP application protocol. In the early days of web programming, you would buy a massive, complex, expensive, software program that spoke HTTP and installed on a hardware server. The package of server and software was considered the web server because the web service software was the only thing running on the server.

Initially web servers only served up static HTML files. This soon advanced so that they provided dynamic functionality, including the ability to generate all the HTML on demand. The facilitated what we now know as modern web applications.

## Combining web and application services

Today, most modern programming languages have include libraries that provide the ability to make connections and serve up HTTP. For example, here is a simple Go language program that is a fully functioning web service.

```go
package main

import (
	"net/http"
)

func main() {
	// Serve up files found in the public_html directory
	fs := http.FileServer(http.Dir("./public_html"))
	http.Handle("/", fs)

	// Listen for HTTP requests on port 3000
	http.ListenAndServe(":3000", nil)
}
```

Being able to easily create web services makes it easy to completely drop the monolithic web server concept and just build web services right into your web application. With our simple `go` example we can add a function that responds with the current time with the `/api/time` resource is requested.

```go
package main

import (
	"fmt"
	"io"
	"net/http"
	"time"
)

func getTime(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, time.Now().String())
}

func main() {
	// Serve up files found in the public_html directory
	fs := http.FileServer(http.Dir("./public_html"))
	http.Handle("/", fs)

	// Dynamically provide data
	http.HandleFunc("/api/time", getTime)

	// Listen for HTTP requests on port 3000
	fmt.Println(http.ListenAndServe(":3000", nil))
}
```

When we run that code and use `Curl` to make an HTTP request we see the time response.

```sh
➜  curl localhost:3000/api/time

2022-12-03 09:50:37.391983 -0700
```

## Web service gateways

Since it is so easy to build web services it is common to find multiple web services running on the same computing device. The trick is exposing the multiple services in a way that a connection can be made to each of them. Every network device allows for separate network connections by referring to a different numbered port. Each service on the device starts up on a different port. In the example above, the `go` web service was using port 3000. So you can just run each service on a different port. However, this makes it difficult for the user of the services to remember what port matches to which service. To resolve this we introduce a service gateway, or reverse proxy, that is itself a simple web service that listens on the common HTTP port of 80 and 443. The gateway then looks at the request and maps it to on of the other services running on a different port.

![Gateway](webServersGateway.jpg)

Our web server will use the application Caddy as the gateway to our services.

## Microservices

These are referred to as microservices. Microservices have the advantage of partitioning functionality into small logical chucks that allows them to be developed independently from other functionality in a larger system. They can also handle large fluctuations in user demand by simply running more and more stateless copies of the microservice from multiple virtual servers hosted in a dynamic cloud environment. For example, one microservice for generating your genealogical family tree might be able to handle 1,000 users concurrently. So in order to support 1 million users, you just deploy 1,000 copies of the service on the corresponding virtual hardware.

## Serverless

The idea of microservices then naturally extended into the world of `serverless` functionality where the server is conceptually removed from the architecture and you just write a function that returns HTTP. That function is loaded through an gateway that maps a web request to the function. The gateway automatically scales the hardware needed to host the serverless function based on demand. This reduces what the web application developer needs to think about down to a single functional piece.
