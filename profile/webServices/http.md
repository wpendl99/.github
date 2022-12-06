# HTTP

📖 **Suggested reading**: [MDN An overview of HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)

HTTP is how the web talks. When a web browser makes a request to a web server it does it using the HTTP protocol. In previous instruction we discussed how to use HTTP. Now, we will talk about the internals of HTTP.

Until version 3 of HTTP it was a human readable format. That means if you had access to the network traffic between the client and the server you would see a HTTP request and response like the following when the URL `http://info.cern.ch/hypertext/WWW/Helping.html` was requested from a browser. (Note: this was the web's very first web page.)

### Request

```http
GET /hypertext/WWW/Helping.html HTTP/1.1
Host: info.cern.ch
Accept: text/html
```

An HTTP request follows this syntax.

```yaml
<verb> <url path, parameters, anchor> <version>
[<header key: value>]*
[

  <body>
]
```

The first line of the HTTP request contains the `verb` of the request, followed by the path, parameters, and anchor of the URL, and finally the version of HTTP being used. The following lines are optional headers that are defined by key value pairs. After the headers you have an optional body. The body start is delimited by two new lines

In this example we are asking to `GET` a resource found at the path `/hypertext/WWW/Helping.html`. The version used by the request is `HTTP/1.1`. This is followed by two headers. The first specifies the requested host, or domain, name. The second specifies what thy of resources the client will accept. This is always a [media type](https://www.iana.org/assignments/media-types/media-types.xhtml) as defined by internet governing body IANA. In this case it is asking for HTML.

### Response

The response to the above requests looks like this.

```http
HTTP/1.1 200 OK
Date: Tue, 06 Dec 2022 21:54:42 GMT
Server: Apache
Last-Modified: Thu, 29 Oct 1992 11:15:20 GMT
ETag: "5f0-28f29422b8200"
Accept-Ranges: bytes
Content-Length: 1520
Connection: close
Content-Type: text/html

<TITLE>Helping -- /WWW</TITLE>
<NEXTID 7>
<H1>How can I help?</H1>There are lots of ways you can help if you are interested in seeing
the <A NAME=4 HREF=TheProject.html>web</A> grow and be even more useful...
```

An HTTP response has the following syntax.

```yaml
<version> <status code> <status string>
[<header key: value>]*
[

  <body>
]
```

You can see that response the syntax is similar to the request syntax. The major difference is that the first line represents the version and the status of the response.

Understanding the meaning of the common HTTP verbs, status codes, and headers is an important skill for a web programmer. Take some time to internalize and memories the following values.

## Verbs

There are several verbs that describe what the HTTP request is asking for. The list below only describes the most common ones.

| Verb    | Meaning                                                                                                                                                                                                                                                  |
| ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| GET     | Get the requested resource. This can represent a request to get a single resource or a resource representing a list of resources.                                                                                                                        |
| POST    | Create a new resource. The body of the request contains the resource. The response should include a unique ID of the newly created resource.                                                                                                             |
| PUT     | Update a resource. Either the URL path, HTTP header, or body must contain the unique ID of the resource being updated. The body of the request should contain the updated resource. The body of the response may contain the resulting updated resource. |
| DELETE  | Delete a resource. Either the URL path or HTTP header must contain the unique ID of the resource to delete.                                                                                                                                              |
| OPTIONS | Get metadata about a resource. Usually only HTTP headers are returned. The resource itself is not returned.                                                                                                                                              |

## Status codes

It is important that you use the standard HTTP status codes in your HTTP responses so that the client of a request can know how to interpret the response. That means you need to be familiar with the common status codes. The codes are partitioned into five blocks.

1xx - Informational.
2xx - Success.
3xx - Redirect to some other location or that the previously delivered resource is a valid cached version.
4xx - Client errors. The request is invalid.
5xx - Server errors. The response is invalid due to an error on the server.

Within those ranges here are some of the more common codes. See the [MDN documentation](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) for a full description of status codes.

|Code|Text|Meaning|
|100|Continue|The service is working on the request|
|200|Success|The requested resource was found and returned as appropriate.|
|201|Created|The request was successful and a new resource was created.|
|204|No Content|The request was successful but no resource is returned.|
|304|Not Modified|The cached version of the resource is still valid.|
|307|Permanent redirect| You should always use the response location header for future requests.|
|308|Temporary redirect| The original request may resolve without a redirect in the future.|
|400|Bad request|The request was malformed or invalid.|
|401|Unauthorized|The request did not provide a valid authentication token.|
|403|Forbidden|The provided authentication token is not authorized for the resource. |
|404|Not found| An unknown resource was requested.|
|408|Request timeout|The request takes too long.|
|409|Conflict|The updated resource represent an older version than the current resource.|
|418|[I'm a teapot](https://en.wikipedia.org/wiki/Hyper_Text_Coffee_Pot_Control_Protocol)|The service refuses to brew coffee in a teapot.|
|429|Too many requests|The client is making too many requests in to short of a time period.|
|500|Internal server error|The server failed to properly process the request.|
|503|Service unavailable|The service is temporarily down. The client should try again with an exponential back off.|

## Headers

!!TODO!!

## Body

## HTTP semantics

HTTP requests are expected to be idempotent. Caching.

## HTTP Versions

| Year | Version | Features                                                     |
| ---- | ------- | ------------------------------------------------------------ |
| 1990 | HTTP0.9 | one line, no versions, only get                              |
| 1996 | HTTP1   | get/post, header, status codes, content-type                 |
| 1997 | HTTP1.1 | put/patch/delete/options, persistent connection              |
| 2015 | HTTP2   | multiplex, server push, compression                          |
| 2022 | HTTP3   | QUIC for transport protocol, always encrypted and compressed |

## Cookies

## REST
