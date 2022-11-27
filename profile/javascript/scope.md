# Scope

**Suggested reading**:

- [MDN Scope](https://developer.mozilla.org/en-US/docs/Glossary/Scope)
- [MDN this](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this)
- [MDN Closures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures)

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

⚠ There are few cases where it makes sense to use `var`. It is strongly suggested that you only use `const` and `let` unless you fully are understand why you are using `var`.

## This

The keyword `this` represents a variable that is always available anywhere in JavaScript code. Think of it as an automatically declared variable. The value of `this` depends upon the context in which it is referenced. There are three different context that this can be referenced from:

1. **Function** - When `this` is referenced in a function it refers to the object that owns the function. That is either an object or global. If global and JavaScript mode is enabled then `this` is undefined.
1. **Object** - When `this` is referenced in a object it refers to the object itself.
1. **Global** - When `this` is referenced outside a function or object it refers to the global scope.

There is also a global variable named `globalThis` that always contains the this pointer for the global context.

## Closure

A closure is defined as a function and its surrounding state. That means whatever variables are accessible when a function is created are available inside of that function. This holds true even if you pass the function outside of the scope of its original creation.

Here is an example of a function that is created as part of an object. That means that function has access to the object's variables, including the this pointer.

```js
globalThis.x = 'global';

const obj = {
  x: 'object',
  f: function () {
    console.log(this.x);
  },
};

obj.f();
// OUTPUT: object
```

Arrow functions are a bit different because they inherit the this pointer of their creation context. So if we change our previous example to return an arrow function the this pointer at the time of creation will be globalThis.

```js
globalThis.x = 'global';

const obj = {
  x: 'object',
  f: () => console.log(this.x),
};

obj.f();
// OUTPUT: global
```

However, if we make function in our object that returns an arrow function, then the this pointer will be the object's this pointer since that was the active context at the time of creation.

```js
globalThis.x = 'global';

const obj = {
  x: 'object',
  make: function () {
    return () => console.log(this.x);
  },
};

const f = obj.make();
f();
// OUTPUT: object
```
