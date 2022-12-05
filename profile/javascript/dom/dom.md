# Document Object Model

📖 **Suggested reading**:

- [MDN Introduction to the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)
- [W3C DOM specification](https://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html) - This official specification is only for reference

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

For everything in an HTML document there is a node in the DOM. This includes elements, attributes, text, comments, and whitespace. All of these nodes form a big tree, with the document node at the top.

<img src="dom.jpg"/>

## Accessing the DOM

Every element in an HTML document implements the DOM Element interface, which is derived off from the DOM Node interface. The [DOM Element Interface](https://developer.mozilla.org/en-US/docs/Web/API/Element) and has properties for iterating child elements, parent element, and attributes. From your JavaScript code, you can start with the `document` variable and walk through the every element in the tree.

```js
function displayElement(el) {
  console.log(el.tagName);
  for (const child of el.children) {
    displayElement(child);
  }
}

displayElement(document);
```

You can provide a CSS selector to the `querySelectorAll` function in order to select specific elements from the document. The `textContent` property contains all of the element's text. You can even access a textual representation of an element's HTML content with the `innerHTML` property.

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

This [CodePen](https://codepen.io/leesjensen/pen/RwJJZBb) dynamically manipulates the DOM using JavaScript. Create a fork of the pen and take some time to experiment with it. Then make your own codePen that manipulates the DOM.

When you are done submit your CodePen URL, along with a description of something you found interesting, to the Canvas assignment.

Don't forget to update your GitHub startup repository README.md with all of the things you learned and want to remember.
