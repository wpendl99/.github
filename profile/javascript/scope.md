# Scope

**Suggested reading**:

- [MDN Scope](https://developer.mozilla.org/en-US/docs/Glossary/Scope)
- [MDN this](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this)

Understanding JavaScript scope is essential for making your programs run as you expect. Scope is defined as the current context of execution and it controls what variables are accessible. JavaScript has four different types of scope:

1. **Gobal** - Visible to all code
1. **Module** - Visible to all code running in module
1. **Function** - Visible within a function
1. **Block** - Variables declared with `let` and `const` are visible only within a block (defined by curly braces)

## Var

Initially JavaScript used the keyword `var` to declare a variable. The problem with var, unlike `const` or `let`, is that its scope is not limited to the block it is declared in. It is always logically hoisted to the top of the function. For example, the following code shows the same variable name being used within different enclosing scopes.

```js
var x = 10;
console.log('start', x);

for (var x = 0; x < 1; x++) {
  console.log('middle', x);
}

console.log('end', x);

// OUTPUT: start 10
//         middle 0
//         end 1
```

⚠ There are few cases where it makes sense to use `var`. It is strongly suggested that you only use `const` and `let` unless you fully are understand why you are using `var.

## This

The keyword `this` represents a variable that is always available anywhere in JavaScript code. Think of it as an automatically declared variable. The value of this depends upon the context in which it is referenced since its scope may hide other automatically defined this variables. The scopes that define a `this` variable include a function, a class, or globally. Properties assigned to `this` remain as long as the context for `this` remains.

```js
function tx() {
  console.log(this.x);
}

var x = 1;
const obj = { x: 2, tx: tx };

// this is defined globally since no owning object
tx();

// this is defined by the owning object
obj.tx();

// the call function takes an explicit this parameter
tx.call({ x: 3 });

// OUTPUT: 1
//         2
//         3

obj.ax = () => console.log(this.x);
// OUTPUT: 1

obj.makeA = function () {
  return () => console.log(this.x);
};
cax = obj.makeA();
cax();
// OUTPUT: 2
```

### Global context

The global this pointer contains all variables declared outside the scope of a function or class. The `this` pointer is assigned to the global context whenever you are outside the context of a function or class. There is a global variable called `globalThis` which is the always available no matter what context you are in. When you are outside a function or class then `this === globalThis`.

### Function context

The value of `this` within a function is always the context of object that owns the function. For functions defined in the global scope it is the global context. For functions defined on an object it is the object's context.

## Arrow function

An arrow function's `this` is always bound to the context where it was created. On creation a closure is created that gives the arrow function access to the variables that were in score at creation time, when the function is executed.

```js
const a = 'a';

function makeClosure(a) {
  a = 'a2';
  const b = 'b';
  return () => {
    return [a, b];
  };
}

const closure = makeClosure(a);
console.log(closure());
// OUTPUT: ['a2', 'b']

console.log(a);
// OUTPUT: 'a'
```

object

module

global

closures

blocks

Variable scope
A variable may belong to one of the following scopes:

Global scope: The default scope for all code running in script mode.
Module scope: The scope for code running in module mode.
Function scope: The scope created with a function.
In addition, variables declared with let or const can belong to an additional scope:

Block scope: The scope created with a pair of curly braces (a block).
When you declare a variable outside of any function, it is called a global variable, because it is available to any other code in the current document. When you declare a variable within a function, it is called a local variable, because it is available only within that function.

let and const declarations can also be scoped to the block statement that they are declared in.

if (Math.random() > 0.5) {
const y = 5;
}
console.log(y); // ReferenceError: y is not defined
However, variables created with var are not block-scoped, but only local to the function (or global scope) that the block resides within.

For example, the following code will log 5, because the scope of x is the global context (or the function context if the code is part of a function). The scope of x is not limited to the immediate if statement block.
