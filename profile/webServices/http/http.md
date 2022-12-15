# HTTP

📖 **Suggested reading**: [MDN An overview of HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)

HTTP is how the web talks. When a web browser makes a request to a web server it does it using the HTTP protocol. In previous instruction we discussed how to use HTTP. Now, we will talk about the internals of HTTP. Just like becoming fluent in a foreign language make a visit to another country more enjoyable, understanding the key pieces of HTTP helps you communicate better when talking on the web.

When a web client (e.g. a web browser) and a web server talk they exchange HTTP requests and responses. The browser will make an HTTP request and the server will generate an HTTP response. You can see the HTTP exchange by using the browser's debugger or by using a console tool like Curl. For example, in your console you would see something like the following HTTP exchange if you used curl to request the URL `http://info.cern.ch/hypertext/WWW/Helping.html`.

```sh
curl -v -s http://info.cern.ch/hypertext/WWW/Helping.html
```

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

In this example we are asking to `GET` a resource found at the path `/hypertext/WWW/Helping.html`. The version used by the request is `HTTP/1.1`. This is followed by two headers. The first specifies the requested host, or domain, name. The second specifies what thy of resources the client will accept. This is always a [MIME type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types) as defined by internet governing body IANA. In this case it is asking for HTML.

### Response

The response to the above requests looks like this.

```yaml
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

- 1xx - Informational.
- 2xx - Success.
- 3xx - Redirect to some other location or that the previously delivered resource is a valid cached version.
- 4xx - Client errors. The request is invalid.
- 5xx - Server errors. The response is invalid due to an error on the server.

Within those ranges here are some of the more common codes. See the [MDN documentation](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) for a full description of status codes.

| Code | Text                                                                                 | Meaning                                                                                    |
| ---- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| 100  | Continue                                                                             | The service is working on the request                                                      |
| 200  | Success                                                                              | The requested resource was found and returned as appropriate.                              |
| 201  | Created                                                                              | The request was successful and a new resource was created.                                 |
| 204  | No Content                                                                           | The request was successful but no resource is returned.                                    |
| 304  | Not Modified                                                                         | The cached version of the resource is still valid.                                         |
| 307  | Permanent redirect                                                                   | You should always use the response location header for future requests.                    |
| 308  | Temporary redirect                                                                   | The original request may resolve without a redirect in the future.                         |
| 400  | Bad request                                                                          | The request was malformed or invalid.                                                      |
| 401  | Unauthorized                                                                         | The request did not provide a valid authentication token.                                  |
| 403  | Forbidden                                                                            | The provided authentication token is not authorized for the resource.                      |
| 404  | Not found                                                                            | An unknown resource was requested.                                                         |
| 408  | Request timeout                                                                      | The request takes too long.                                                                |
| 409  | Conflict                                                                             | The updated resource represent an older version than the current resource.                 |
| 418  | [I'm a teapot](https://en.wikipedia.org/wiki/Hyper_Text_Coffee_Pot_Control_Protocol) | The service refuses to brew coffee in a teapot.                                            |
| 429  | Too many requests                                                                    | The client is making too many requests in to short of a time period.                       |
| 500  | Internal server error                                                                | The server failed to properly process the request.                                         |
| 503  | Service unavailable                                                                  | The service is temporarily down. The client should try again with an exponential back off. |

## Headers

📖 **Suggested reading**: [MDN HTTP headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers)

HTTP headers specify metadata about a request or response. This includes things like how to handle security, caching, data formats, and cookies. Some common headers that you will use include the following.

| Header                      | Example                              | Meaning                                                                                                |
| --------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------ |
| Authorization               | Bearer eyfhbGciOiJIUzI1NiIsI         | A token that authorized the user making the request.                                                   |
| Accept                      | image/\*                             | What content format the client accepts. This may include wildcards.                                    |
| Content-Type                | text/html; charset=utf-8             | The format of the response content.                                                                    |
| Cookie                      | SessionID=39s8cgj34; csrftoken=9dck2 | Key value pairs that are generated by the server and stored on the client.                             |
| Host                        | info.cern.ch                         | The domain name of the server. This is required in all requests.                                       |
| Origin                      | cs260.click                          | Identifies the origin that caused the request. A server may only allow requests from specific origins. |
| Access-Control-Allow-Origin | https://cs260.click                  | Server response of what origins can make a request. This include a wildcard.                           |
| Content-Length              | 368                                  | The number of bytes contained in the response.                                                         |
| Cache-Control               | public, max-age=604800               | Tells the client how it can cache the response.                                                        |
| User-Agent                  | Mozilla/5.0 (Macintosh)              | The client application making the request.                                                             |

## Body

The format of the body of an HTTP request or response is defined by the `Content-Type` header. For example, it may be HTML text (text/html), a binary image format (image/png), JSON (application/json), or JavaScript (text/javascript). A client may specify what formats it accepts using the `accept` header.

## Cookies

![Cookie](webServicesCookie.png)

📖 **Suggested reading**: [MDN Using HTTP cookies](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies)

HTTP itself is stateless. This means that one HTTP request does not know anything about a previous or future request. However, that does not mean that a server or client cannot track state about a user. One method for tracking state is the `cookie`. Cookies are generated by a server and passed to the client as an HTTP header.

```http
HTTP/2 200
Set-Cookie: myAppCookie=tasty; SameSite=Strict; Secure; HttpOnly
```

The client then caches the cookie and returns it as an HTTP header back to the server on subsequent requests.

```http
HTTP/2 200
Cookie: myAppCookie=tasty
```

This allows the server to remember things like the language preference of the user, or the user's authentication credentials. A server can also use cookies to track, and share, everything that a user does. However, there is nothing inherently evil about cookies, the problem comes from web applications that use them as a means to violate users privacy and inappropriately monetize their data.

## HTTP Versions

| Year | Version | Features                                        |
| ---- | ------- | ----------------------------------------------- |
| 1990 | HTTP0.9 | one line, no versions, only get                 |
| 1996 | HTTP1   | get/post, header, status codes, content-type    |
| 1997 | HTTP1.1 | put/patch/delete/options, persistent connection |
| 2015 | HTTP2   | multiplex, server push, binary representation   |
| 2022 | HTTP3   | QUIC for transport protocol, always encrypted   |
