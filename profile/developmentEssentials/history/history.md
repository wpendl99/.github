# A brief history of web programming.

## The Internet

The essential first step to creating what we now call web programming was the formation of a global communications network that was reliable and publicly available. This was made possible when the United States Department of Defense create the ARPANET as a means of sharing information between universities doing defense related research.

<img src="arpanet1970s.jpg">

\- ARPANET access points in the 1970s (**Source**: _Wikipedia_)

As the network continued to expand and

## Hypertext Markup Language (HTML)

Starting in 1980, Tim Berners-Lee was working at Cern and wanted to build a system that would allow researchers to share documents. Being inspired by the digital publishing format SGML Tim created the HTML specification and deployed the first web server in 1990.

<img src="firstWebServer.jpg" />

\- First web server (**Source**: _Cern_)

Originally containing only 18 elements, or tags, the latest version of HTML has now grown to over 100. In 1996 the HTML specification has been controlled by the [W3C](https://www.w3.org/).

### Versions

| Year | Version | Features                                  |
| ---- | ------- | ----------------------------------------- |
| 1990 | HTML1   | format tags                               |
| 1995 | HTML2   | tables, internationalization              |
| 1997 | HTML3   | MathML, CSS, frame tags                   |
| 1999 | HTML4   | external CSS                              |
| 2014 | HTML5   | email, password, media, and semantic tags |

The following is an example of a simple HTML document.

```html
<!DOCTYPE html>
<html>
  <body>
    <p>Hello world!</p>
  </body>
</html>
```

### HTTP

While HTML is the content language of the web the other major contribution of Berners-Lee was the definition of the Hypertext Transfer Protocol (HTTP). This application layer network protocol defined how web documents are transmitted across the internet.

Until version 3, HTTP was a human readable text based protocol.

```http
GET / HTTP/1.1
Host: info.cern.ch
Accept: text/html
```

### Versions

| Year | Version | Features                                        |
| ---- | ------- | ----------------------------------------------- |
| 1990 | HTTP1   | get/post, header, status codes, content-type    |
| 1997 | HTTP1.1 | put/patch/delete/options, persistent connection |
| 2015 | HTTP2   | multiplex, server push, compression             |
| 2022 | HTTP3   | QUIC for transport protocol, always encrypted   |

<img src="timBernersLee.jpg" width=200 />

\- Tim Berners-Lee (**Source**: _BBC_)

> I just had to take the hypertext idea and connect it to the TCP and DNS ideas and—ta-da!—the World Wide Web.
>
> Tim Berners-Lee, (**Source**: _Answers for Young People_)

## JavaScript

In 1995 Netscape (the most popular browser maker at the time) decided to add the ability to script web pages. The initial implementation was led by Brendan Eich and given the name JavaScript. This turned the previously static web into an interactive experience where a web page could dynamically change based upon a user's interaction.

In 1996 Netscape turned control of JavaScript over to ECMA International in an attempt to standardize the definition of the language. At that point JavaScript officially became know as ECMAScript, although it is still commonly referred to as JavaScript.

Here is an example of a simple JavaScript program.

```javascript
const join = (a, b) => {
  return a + b;
};

console.log(join(1, 2));
console.log(join('hello', 'world'));
```

The first decade of JavaScript was turbulent as each of the major browser vendors attempted to introduce new proprietary features in order to gain market share. Eventually in 2009 the major vendors agreed on the ECMAScript 5 standard and in 2015 ECMAScript 6 was released as the last major feature upgrade. Since then minor releases have taken the year of their release as their version number.

### Versions

| Year | Version | Features                                                                                                                  |
| ---- | ------- | ------------------------------------------------------------------------------------------------------------------------- |
| 1997 | ES1     | types, functions                                                                                                          |
| 1999 | ES3     | regex, exceptions, switch                                                                                                 |
| 2009 | ES5     | json, array iteration                                                                                                     |
| 2015 | ES6     | let/const, default params, classes, template literals, destructuring, generators, promises, modules, internationalization |
| 2016 | ES2016  | array.includes                                                                                                            |
| 2017 | ES2017  | async/await                                                                                                               |
| 2018 | ES2018  | rest/spread, promise.finally                                                                                              |
| 2019 | ES2019  | string.trim                                                                                                               |
| 2020 | ES2020  | ?? operator                                                                                                               |

### JavaScript outside the browser

In 2009 Ryan Dahl created Node.js as the first successful application for deploying JavaScript outside of a browser. This changed the mindset of JavaScript as purely a browser technology to one that is leveraged across an entire technology stack.

Other important milestones in the history of JavaScript include the 2013 standardization of the common object notation JSON, a type version named TypeScript in 2012, and the introduction of numerous transpilers for converting other languages into compatible ECMAScript.

<img src="brendanEich.jpg" width=200 />

\- Brendan Eich (**Source**: _Wikipedia_)

> Always bet on JS
>
> Brendan Eich (**Source**: _brendaneich.github.io_)

## Cascading Style Sheets (CSS)

<img src="hakonLie.jpg" width=200 />

\- Håkon Wium Lie (**Source**: _Wikipedia_)

> If we hadn’t developed CSS, we could have ended up with the web being a giant fax machine
>
> Håkon Wium Lie (**Source**: _Medium.com_)
