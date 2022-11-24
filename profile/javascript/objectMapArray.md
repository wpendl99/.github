# JavaScript object, map, and array

## Object

`new` keyword.

## Object

A JavaScript object represents a collection of name value pairs referred to as properties. Then name must be of type String or Symbol, but the value can be of any type.

You can declare a variable of object type with the `object-literal` syntax. This provides the initial composition of the object. Once declared you can add properties to the object by simply referencing the new property name in an assignment. Any type of variable can be assigned to a property. This includes a sub object, array, or function.

```js
const obj = {
  a: 3,
  b: 'fish',
};

obj.c = [1, 2, 3];

console.log(obj);
// OUTPUT: {a: 3, b: 'fish', c: [1,2,3]}
```

The ability to dynamically modify an object is incredibly useful when manipulating data with an indeterminate structure.

Note the different uses of the term object. Object can refer to a class of variable types (Object, Function, Date, ...), or it can refer to the actual Object type (i.e. new Object()), or it can refer to an actual variable of type Object. This overloaded usage can be a bit confusing.

## ☑ Assignment

Create a CodePen that uses loops and `if` expressions compute the equality and strict equality of values found in this array and store the results in an array of arrays.

```js
const vars = [0, -0, NaN, null, '', undefined, 'false', 'a', 1, true];
```

```js
const t = [];
for (let i of vars) {
  const r = [];
  for (let j of vars) {
    r.push(i == j);
  }
  t.push(r);
}
console.table(t);
```

The expected output is the following.

|     | 0     | 1     | 2     | 3     | 4     | 5     | 6     | 7     | 8     | 9     |
| --- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
| 0   | true  | true  | false | false | true  | false | false | false | false | false |
| 1   | true  | true  | false | false | true  | false | false | false | false | false |
| 2   | false | false | false | false | false | false | false | false | false | false |
| 3   | false | false | false | true  | false | true  | false | false | false | false |
| 4   | true  | true  | false | false | true  | false | false | false | false | false |
| 5   | false | false | false | true  | false | true  | false | false | false | false |
| 6   | false | false | false | false | false | false | true  | false | false | false |
| 7   | false | false | false | false | false | false | false | true  | false | false |
| 8   | false | false | false | false | false | false | false | false | true  | true  |
| 9   | false | false | false | false | false | false | false | false | true  | true  |

When you are done submit your CodePen URL, along with a description of something your found interesting, to the Canvas assignment.
