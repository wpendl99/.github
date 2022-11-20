# React

<img src="reactLogo.png" width="200" />

React, and its associated projects, provide a powerful web programming framework. The name React comes from its focus on making reactive web page components that automatically update based on user interactions or changes in the underlying data.

React abstracts HTML into a JavaScript variate called [JSX](https://reactjs.org/docs/introducing-jsx.html). JSX is converted into valid HTML and JavaScript using a preprocessor called [Babel](https://babeljs.io/). For example, the following is a JSX file. Notice that it mixes both HTML and JavaScript into a single representation.

```jsx
const list = (
  <ol>
    <li>Item 1</li>
  </ol>
);
```

Babel will convert that into valid JavaScript:

```Javascript
const header = React.createElement("ol", null,
  React.createElement("li", null, "Item 1")
);
```

The `React.createElement` function will then generate DOM elements and monitor the data they represent for changes. When a change is discovered React will trigger dependent changes.

## Tutorials

To get hands on experience with React you can go through the following tutorials.

- [Official Introduction Tutorial](https://reactjs.org/tutorial/tutorial.html)
- [Mozilla Introduction Tutorial](https://developer.mozilla.org/en-US/docs/Learn/Tools_and_testing/Client-side_JavaScript_frameworks/React_getting_started)

## ☑ Assignment

Complete the [tic-tac-toe tutorial](https://reactjs.org/tutorial/tutorial.html). As you go through the tutorial create your own CodePen project. Do not copy and paste the code. Type the code in as you work through the tutorial. Experiment and provide alternative functionality. When you are done submit your codePen URL. [Here is an example](https://codepen.io/leesjensen/pen/MWXOzbQ) of an alternative solution.
