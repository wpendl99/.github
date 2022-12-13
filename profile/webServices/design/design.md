# Service design

Web services provide the interactive functionality of your web application. They commonly authenticate users, track their session state, provide, store, and analyze data, connect peers, and aggregate user information.

Web services usually are provided over HTTP and so that protocol greatly influences their design. The HTTP verbs such as GET, POST, PUT, and DELETE often mirror the designed actions of a web service. For example, list the comments (GET), create a comment (POST), update a comment (PUT), and delete a comment (DELETE) all fit nicely with the design of HTTP. Likewise, the content types (MIME) defined by IANA is a natural fit for defining the types of content that you want to provide (e.g. HTML, PNG, MP3, and MP4). The goal is to leverage those technologies as much as possible so that you don't have to recreate the functionality they provide and can take advantage of the significant networking infrastructure built up around HTTP. This includes caching servers that increase your performance, edge servers that bring your content closer, and replication servers that provide redundant copies of your content and make your application more resilient to network failures.

<img src='webServicesHTTPServices.jpg' width=400 />

A web service is always divided up into multiple service endpoints. Each endpoint provides a single functional purpose. All of the criteria that you would apply to creating well designed code functions also applies when exposing service endpoints.

<img src='webServicesHTTPEndpoints.jpg' width=400 />

Here are some things you should consider when designing your service's endpoints.

- **Use HTTP verbs** - With HTTP everything is a resource (think noun or object). You then act on the resource with an HTTP verb. For example, you might have an order resources that belongs to a store. You then create, get, update, and delete order resources for the store resource.
- **Use human readable URL paths** - The resource you are referencing with an HTTP request should be clearly referenced in the URL path. For example, an order resource might contain the path to both the order and store where the order resource resides: `/store/provo/order/28502`. This makes it easier to remember how to use the endpoint because it is human readable.
- **Make discoverable** - As you expose resources that contain other resources you can provide the endpoints for the aggregated resources. This makes it so someone using your endpoints only needs to remember the top level endpoint and then they can discover everything else. For example, if you have a store endpoint that returns information about a store you can include an endpoint for working with store in the response.

  ```http
  GET /store/provo
  ```

  ```json
  {
    "id": "provo",
    "address": "Cougar blvd",
    "orders": "https://cs260.click/store/provo/orders",
    "employees": "https://cs260.click/store/provo/employees"
  }
  ```

- **Make backward compatible** -
- **Make forward compatible** -
- **Do not overload endpoints** -
- **Provide documentation** -
- **Deprecate old functionality** -

Note that a service's endpoints is often called an Application Programming Interface (API). This is a throwback to old desktop applications and the programming interfaces that they exposed. Sometimes the term API refers to the entire collection of endpoints, and sometimes it is used to refer to a single endpoint.

## Open API

## RPC

## Rest

## GraphQL
