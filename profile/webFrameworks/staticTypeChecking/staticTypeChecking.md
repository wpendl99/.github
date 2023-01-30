# Static type checking

📖 **Suggested reading**: [Static Type Checking](https://reactjs.org/docs/static-type-checking.html)

start with create-react-app

```sh
npx create-react-app my-app --template typescript
```

or add typescript to an existing project

```sh
npm install --dev typescript
```

To create the tsconfig.json

```sh
npx tsc --init
```

add to tsconfig.json so that it knows where to read and output files

```js
{
  "compilerOptions": {
    "rootDir": "src",
    "outDir": "build",

```
