# Fetch

**Required reading**: [MDN - Using the Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)

Fetch provides the ability for JavaScript to make HTTP requests. The `fetch` function is built into the browser's JavaScript runtime. This means you can call it anywhere from JavaScript code running in a browser.

The basic usage of fetch takes a URL and returns a promise. The promise `then` function takes a callback function that is asynchronously called when the requested URL content is obtained. If the returned content is of type `applicaiton/json` you can use the `json` function on the response object to convert it to a JavaScript object.

The following [CodePen](https://codepen.io/leesjensen/pen/ExRoqPz) gives an example of making a fetch request to get and display an inspirational quote. After reading the documentation for fetch, use the CodePen to experiment with fetch. Try different URLs, HTTP verbs, and fetch options.

```javascript
const url = 'https://api.quotable.io/random';
fetch(url)
  .then((x) => x.json())
  .then((response) => {
    document.activeElement.textContent = response.content;
  });
```

You can also run this code in the browser's debugger console. This will allows you to get type-ahead help and clearly see any errors that your experiments generate.
