# JavaScript exceptions

📖 **Suggested reading**: [MDN try...catch](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/try...catch)

JavaStript supports exception handling using the `try catch` and `throw` syntax. An exception can be triggered at any time that your code throws an exception using the `throw` keyword, or whenever an exceptional case happens in the JavaScript runtime. For example, when an undefined variable is used.

To catch the thrown exception that occurs within a block of code, you wrap the code block with the `try` keyword, and follow the try block with a `catch` block. If within the code contained in the try block (including any code that block may call) and exception is thrown, using the `throw` keyword, then all of the code after the throw is ignored, the call stack is unwound, and the catch block is called.

In addition to a catch block you can specify a `finally` block that is always called whenever the `try` block is exited regardless if an exception was ever thrown.

The basic syntax looks like the following.

```js
try {
  // normal execution code
} catch (ex) {
  // exception handling code
} finally {
  // always called code
}
```

For example:

```js
function connectDatabase() {
  throw new Error('connection error');
}

try {
  connectDatabase();
  console.log('ever executed');
} catch (ex) {
  console.log(ex);
} finally {
  console.log('always executed');
}

// OUTPUT: Error: connection error
//         always executed
```

⚠ When first using exception handling it is tempting to use it as way to handle normal flows of execution. For example, throwing a file not found exception when it is common for users to request nonexistent files. Throwing an exceptions should only happen when something truly exceptional has happened. For example, a file not found exception when the file is expected to exist, such as a required configuration file. You code will be easier to debug, and your logs more meaningful if you restrict exceptions to exceptional situations.

## Fallbacks

It is common to wrap a functionality in a try block and then use a fallback implementation in the catch block if there is an exception thrown. For example, you make a request for the current high scores from a scoring service, but if that fails then a locally stored version of the last available scores is returned.

```js
function getScores() {
  try {
    const scores = scoringService.getScores();
    window.localStorage.setItem('scores', scores);
    return scores;
  } catch {
    return window.localStorage.getItem('scores');
  }
}
```

## ☑ Assignment

Create a CodePen that uses exception handling.

When you are done submit your CodePen URL, along with a description of something you found interesting, to the Canvas assignment.
