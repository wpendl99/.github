# JavaScript Async/await

**Suggested reading**: [MDN async function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function)

The creation of JavaScript Promise object was a great advancement for asynchronous execution, but as developers began build large systems with promises they started wanting a more concise representation. This was provided with the introduction of the `async/await` syntax. You can think of `await` a simplified syntactic for representing the execution of a promise. The `await` expression will block until the promise state moves to `fulfilled`, or throws an exception if the state moves to `rejected`. For example, if we have a function that returns a coin toss promise.

```js
const tossCoin = () => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() > 0.1) {
        resolve(Math.random() > 0.5 ? 'heads' : 'tails');
      } else {
        reject('fell off table');
      }
    }, 1000);
  });
};
```

We can create equivalent executions with either a promise `then/catch` chain, or an `async` and a `try/catch` block.

**then/catch chain version**

```js
tossCoin()
  .then((result) => {
    console.log(result);
  })
  .catch(() => {
    console.error('failure');
  });
```

**async, try/catch version**

```js
try {
  const result = await tossCoin();
  console.log(result);
} catch {
  console.error('failure');
}
```

## Async

One key restriction is that you cannot call `await` in a function unless it is a root level function or is defined with the `async` keyword. Applying the `async` keyword transforms the function so that it returns a promise that will resolve to the value that was previously returned by the function. Basically this turns any function into an asynchronous function, so that it can in turn make asynchronous requests.

This can be demonstrated with a function that makes animal noises. Notice that the return value is a simple string.

```js
function cow() {
  return 'moo';
}
console.log(cow());
// OUTPUT: moo
```

If we designate the function to be asynchronous then the return value becomes a promise.

```js
async function cow() {
  return 'moo';
}
console.log(cow());
// OUTPUT: Promise {<fulfilled>: 'moo'}
```

## ☑ Assignment

This [CodePen](https://codepen.io/leesjensen/pen/KKeevVg) uses async/await to order pizzas. Create a fork of the pen and take some time to experiment with it. Then copy the codePen you created for promises and transform it to use async/await.

When you are done submit your CodePen URL, along with a description of something you found interesting, to the Canvas assignment.
