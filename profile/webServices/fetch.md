# Fetch

📖 **Required reading**: [MDN Using the Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)

The ability to make HTTP requests from JavaScript is one of the main technologies that changed the web from static content pages (Web 1.0) to one of web applications (Web 2.0) that fully interact with the user. Microsoft introduced the first API for making HTTP requests from JavaScript with the [XMLHttpRequest API](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest).

Today, the [fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) is the current preferred way to make HTTP requests. The `fetch` function is built into the browser's JavaScript runtime. This means you can call it anywhere from JavaScript code running in a browser.

The basic usage of fetch takes a URL and returns a promise. The promise `then` function takes a callback function that is asynchronously called when the requested URL content is obtained. If the returned content is of type `application/json` you can use the `json` function on the response object to convert it to a JavaScript object.

The following example makes a fetch request to get and display an inspirational quote. After reading the documentation for fetch, you can experiment with this code by pasting it in the browser's debug console window. This will allows you to get type-ahead help and clearly display any errors that your experiments generate. Try different URLs, HTTP verbs, and fetch options.

```js
fetch('https://api.quotable.io/random')
  .then((x) => x.json())
  .then((response) => {
    document.activeElement.textContent = response.content;
  });
```

## ☑ Assignment

Create a fork of this [CodePen](https://codepen.io/leesjensen/pen/ExRoqPz) and experiment.

When you are done submit your CodePen URL, along with a description of something you found interesting, to the Canvas assignment.

Don't forget to update your GitHub startup repository README.md with all of the things you learned and want to remember.
