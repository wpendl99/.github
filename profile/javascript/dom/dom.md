# Document Object Model

**Suggested reading**: [MDN Introduction to the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)

The Document Object Model (DOM) is an object representation of a web page that the browser uses to render the display. With the introduction of JavaScript the DOM was exposed so that the JavaScript could manipulate the elements displayed to the user.

The browser provides a global variable name `document` that points to the root element of the DOM. If you open the browser debugger's console window and type the variable name `document` you will se the DOM for the document the browser is currently rendering.

```html
> document

<!DOCTYPE html>
<html lang="en">
  <head>
    ...
  </head>
  <body>
    ...
  </body>
</html>
```

For everything in the HTML and CSS there is a node in the DOM. This includes tags, attributes, text, comments, and whitespace. All of these nodes form a big tree, with the document node at the top.

<img src="dom.jpg"/>

## Accessing the DOM

Every element in the DOM implements the [DOM Element base class](https://developer.mozilla.org/en-US/docs/Web/API/Element) and has properties for iterating child elements, and its parent (parentNode). From your JavaScript code, you can start with the `document` variable and walk through the every element in the tree.

```js
function displayElement(el) {
  console.log(el.tagName);
  for (const child of el.children) {
    displayElement(child);
  }
}

displayElement(document);
```

You can also use CSS selectors to look for specific elements. The `textContent` property contains all of the element's text. You can also access the element's HTML content with the `innerHTML` property.

```js
const listElements = document.querySelectorAll('p');
for (const el of listElements) {
  console.log(el.textContent);
}
```

## Modifying the DOM

You can also make changes to the DOM by modifying or deleting existing elements or by inserting new ones. To create a new element you first get the element that you want for a parent. Then create a new element in the document and append it as a child to the parent element.

```js
function insertChild(selector, text) {
  const parentElement = document.querySelector(selector);
  const newChild = document.createElement('div');
  newChild.textContent = text;
  parentElement.appendChild(newChild);
}

insertChild('#courses', 'new course');
```

To delete elements call the `removeChild` function on the parent element.

```js
function deleteChild(selector) {
  const el = document.querySelector(selector);
  el.parentElement.removeChild(el);
}

deleteChild('#courses div');
```

## Injecting HTML

The DOM also allows you to inject entire blocks of HTML into an element. The following code finds the first `div` element in the DOM and replaces all the HTML it contains.

```js
const el = document.querySelector('div');
el.innerHTML = '<div class="injected"><b>Hello</b>!</div>';
```

However, directly injecting HTML as a block of text is a serious security risk because if there is any way for a third party to manipulate the text you insert they can gain control of your application. This will be discussed in detail with the instruction on security.

## ☑ Assignment

This [CodePen](https://codepen.io/leesjensen/pen/RwJJZBb) dynamically manipulates the DOM using JavaScript. Take some time to experiment with it. Then make your own codePen that manipulates the DOM.

When you are done submit your CodePen URL, along with a description of something you found interesting, to the Canvas assignment.
