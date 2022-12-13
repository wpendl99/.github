# SOP and CORS

📖 **Suggested reading**:

- [MDN Same origin policy](https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy)
- [MDN Cross origin resource sharing](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)

Security should always be on your mind when you are working with the web. The ability to provide services to a global audience makes the web very valuable, and therefore an attractive target for nefarious parties. When website architecture and browser clients were still in their infancy they allowed JavaScript to make requests from one domain when displaying a website from a different domain. These are called cross-origin requests. Consider the following example. An attacker sends out an email with a link to a hacker website (`welsfargo.com`) that is similar to the real banking website. Notice the missing `l`. If the hacker website could request anything from the real website then it could make itself appear and act just like the real banking website. All it would have to do is request images, html, and login endpoints from the banking website and display the results as if it were the hacker website. This would give the hacker access to everything the user did.

To combat this problem the `Same Origin Policy` (SOP) was created. Simply stated SOP only allows background requests from the domain you are looking at to the same domain. A request from `welsfargo.com` for images or service endpoints to `wellsfargo.com` would fail because they do not match. This provides significant security, but it also introduces complications when building web applications. For example, if you want to include images from a different website, or call web services from a third party, they would also violate SOP and fail. In order to address this, the concept of Cross Origin Resource Sharing (CORS) was invented.

CORS allows the client (e.g. browser) to specify the origin of a request and then let the server respond with what origins are allowed. The server may say that all origins are allowed, for example if they are a general purpose image provider, or only a specific origin is allowed, for example if they are a bank's authentication service. If the server doesn't specify what origin is allowed then the browser assumes that it must be the same origin.

Going back to our hacker example, the HTTP request from the hacker site (`welsfargo.com`) to the bank's authentication service (`wellsfargo.com`) would look like the following.

```http
GET /resources/public-data/ HTTP/1.1
Host: wellsfargo.com
Origin: https://welsfargo.com
```

In response the request the banking website would return:

```http
HTTP/1.1 200 OK
Access-Control-Allow-Origin: https://wellsfargo.com
```

The browser would then see that the actual origin of the request does not match the allowed origin and so an error would be generated.

Notice that with CORS it is the browser that is protecting the user from accessing the banking website's authentication endpoint. CORS is only meant to alert the user that something nefarious is being attempted. A hacker can still proxy requests through their own server to the banking website and completely ignore the `Access-Control-Allow-Origin` header. Therefore the banking website needs to implement its own precautions to stop a hacker for using its services inappropriately.

## Using third party services

When you make requests to your own web services you are always on the same origin and so you will not violate the SOP and the browser will not display any errors to your users. However, if you want to make requests to a different domain than the one your web application is hosted on, then you need to make sure that domain allows requests with its `Access-Control-Allow-Origin` header. For example, if I have JavaScript in my web application loaded from `cs260.click` that makes a fetch request for an image from the website `i.picsum.photos` the browser will fail the request with an HTTP status code of 403 and an error message that CORS has blocked the request.

![CORS](webServicesCors.jpg)

That happens because `i.picsum.photos` does not return an `Access-Control-Allow-Origin` header. Without a header the browser assumes that all requests must be made from the same origin.

If your web application instead makes a service request to `icanhazdadjoke.com` to get a joke, that request will succeed because `icanhazdadjoke.com` returns an `Access-Control-Allow-Origin` header with a value of `*` meaning that any origin can make requests to this service.

```http
HTTP/2 200
access-control-allow-origin: *

Did you hear about the bread factory burning down? They say the business is toast.
```

This would have also succeeded if the HTTP header had explicitly listed you web application domain. For example, if you make your request from the origin `cs260.click` the following response would also satisfy CORS.

```http
HTTP/2 200
access-control-allow-origin: https://cs260.click

I’ll tell you something about German sausages, they’re the wurst
```

This all means that you just need to test the services you want to use before you include them in your application. Either make sure they are responding with the wildcard allowed origin or your calling origin. If they do not they you will not be able to use them.
