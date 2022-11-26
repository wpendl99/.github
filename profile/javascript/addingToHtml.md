# Adding JavaScript to HTML

You can insert JavaScript into HTML either by directly including it in the HTML within the content of a `<script>` element, or using by the `src` attribute of the script element to reference an external JavaScript file.

**index.js**

```js
function sayHello() {
  console.log('hello');
}
```

**index.html**

```html
<head>
  <script src="javascript.js"></script>
</head>
<body>
  <button onClick="sayHello()">Say Hello</button>
  <button onClick="sayGoodbye()">Say Goodbye</button>
  <script>
    function sayGoodbye() {
      alert('Goodbye');
    }
  </script>
</body>
```

Notice that the calls to our JavaScript in our button element 'onClick` attributes also contain JavaScript that is executed directly from the HTML. This doesn't just have to be a call to a function. It can be any JavaScript including an entire program.

```html
<button onClick="let i=1;i++;console.log(i)">press me</button>
<!-- OUTPUT: 2 -->
```

⚠ Executing JavaScript loaded from HTML provides a common attack vector for hackers. If an untrusted party can inject JavaScript anywhere in your application then that JavaScript can represent itself as the current user of the application. The attacker can then make requests for sensitive data, monitor activity, and steal credentials. The example below shows how the img element can be used to launch an attack as soon as the page is loaded.

```html
<img src="bogus.png" onerror="console.log('All your base are belong to us')">press me</button>
```
