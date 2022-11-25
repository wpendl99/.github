# JavaScript string

Strings are a primitive type in JavaScript. A string variable is specified by surround a sequence of characters with single quotes (`'`), double quotes (`"`), or backticks (\`). The meaning of single or double quotes are equivalent, but the backtick defines a string literal that may contain JavaScript that is evaluated in place and concatenated into the string. A string literal replace specifier is declared with a dollar sign followed by a curly brace pair. Anything inside the curly braces are evaluated as JavaScript. The use of backticks can also be used to create multiline strings without having to explicitly escape the newline characters using `\n`.

```js
'single quotes text';
'double quotes text';

const l = 'literal';
console.log(`string ${l + (1 + 1)} text`);
// OUTPUT: string literal2 text
```

## Unicode support

JavaScript supports Unicode by defining a string as a 16-bit unsigned integers that represents UTF-16 strings. Unicode support allows JavaScript to represent most languages spoken on the planet. This includes those that are read from right to left. However, are several important steps you must take in order to make your web application fully internationalized. This includes handling of currency, time, dates, iconography, units or measure, keyboard layouts, and respecting local customs. Read this [article on the W3C website](https://www.w3.org/standards/webdesign/i18n) to learn more about internationalization

## String functions

The string object has several interesting functions associated with it. Here are some of the interesting ones.

| Function    | Meaning                                                      |
| ----------- | ------------------------------------------------------------ |
| length      | The number of characters in the string                       |
| indexOf     | The starting index of a given substring                      |
| split       | Split the string into an array on the given delimiter string |
| startsWith  | True if the string has a given prefix                        |
| endsWith    | True if the string has a given suffix                        |
| toLowerCase | Converts all characters to lowercase                         |

```js
const s = 'Example:조선글';

console.log(s.length);
// OUTPUT: 11
console.log(s.indexOf('조선글'));
// OUTPUT: 8
console.log(s.split(':'));
// OUTPUT: ['Example', '조선글']
console.log(s.startsWith('Ex'));
// OUTPUT: true
console.log(s.endsWith('조선글'));
// OUTPUT: false
console.log(s.toLowerCase());
// OUTPUT: example:조선글
```
