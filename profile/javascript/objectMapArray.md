# JavaScript object, map, and array

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
