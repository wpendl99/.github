# Endpoint testing

Running automated tests for your service is much easier than UI tests that require a browser. You are highly encouraged to incorporate tests for your endpoints as part of your development process. Standard Test Driven Development (TDD) methodology has you first write your tests and then use that to guide the design and development of your endpoints.

As demonstrated by the following [State of JS](https://2021.stateofjs.com/en-US/libraries/testing/) survey, there are lots of good testing packages that work well with Express driven services. We are going to look at the current champion [Jest](https://jestjs.io/).

![State of JS Testing](webServicesStateOfJsEndpointTesting.jpg)

To get started with Jest we need a simple web service. In a console window, create a test directory, install Express, and open up VS Code.

```sh
mkdir testJest
cd testJest
npm init -y
npm install express
code .
```

We then create a file named `server.js` and use Express to create an application with an endpoint for getting a store, and one for updating a store.

**server.js**

```js
const express = require('express');
const app = express();

app.use(express.json());

// Endpoints
app.get('/store/:storeName', (req, res) => {
  res.send({ name: req.params.storeName });
});

app.put('/st*/:storeName', (req, res) =>
  res.send({ update: req.params.storeName })
);

module.exports = app;
```

In order to allow Jest to start up the HTTP server initialized the application a little bit differently than we have in the past. Normally, we would have just started listening on the Express app object after we defined our endpoints. Instead we export the Express app object from our `server.js` file and then import the app object in our `index.js` that is used to run our service.

**index.js**

```js
const app = require('./server');

const port = 8080;
app.listen(port, function () {
  console.log(`Listening on port ${port}`);
});
```

Breaking apart the definition of the service from the starting of the service allows us to start the service both as a normal service and also using our testing framework. To launch the service using Jest we create another file with a special name that has a suffix of `.test.js`. Any file with that suffix is considered a testing file and will automatically be discovered by Jest and examined for tests to run.

## A simple test

Before we write tests for our endpoints we will write a simple test that demonstrates how Jest works. A test is created by calling the `test` function that is defined by Jest. Note that you don't need to include a `require` statement to import Jest functions into your code. Jest will automatically do that when it discovers a test file.

Let's make our first test by creating a file named `store.test.js` and pasting in the following code. The `test` function takes a description as the first parameter. The description is meant to be read like "test that equal values are equal". The second parameter is the function to call. Our function just calls the Hest `expect` function and chains it to the `toBe` function. You can read this as "expect false to be true", which is of course a bug, but we want to see our test fail the first time. We will fix this later.

**store.test.js**

```js
test('that equal values are equal', () => {
  expect(false).toBe(true);
});
```

In order to run the test we need to install the Jest package using NPM. From the console install the package. The `-D` parameter tells NPM to install Jest as a development package. That keeps it from being included when we do production release builds.

```sh
npm install jest -D
```

Now, replace the scripts section of the `package.json` file to contain a new command that will run our tests with Jest.

```json
"scripts": {
  "test": "jest"
},
```

With that in place we can run the `test` command and our test will execute.

```sh
➜ npm run test

 FAIL  ./store.test.js
  ✕ that unequal values are not equal (1 ms)

  ● that unequal values are not equal

    expect(received).toBe(expected) // Object.is equality

    Expected: true
    Received: false

      3 |
      4 | test('that unequal values are not equal', () => {
    > 5 |   expect(false).toBe(true);
        |                 ^
      6 | });
      7 |
      8 | // describe('endpoints', () => {

      at Object.toBe (store.test.js:5:17)

Test Suites: 1 failed, 1 total
Tests:       1 failed, 1 total
Snapshots:   0 total
Time:        0.276 s, estimated 1 s
```

We can then fix our test by rewriting it to be the following.

**store.test.js**

```js
test('that equal values are equal', () => {
  expect(true).toBe(true);
});
```

This time when we run the test command with NPM we get a better result.

```sh
➜  npm run test

 PASS  ./store.test.js
  ✓ that equal values are equal (1 ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        0.223 s, estimated 1 s
Ran all test suites.
```

This example didn't actually test any of our code, but from the test function you can write JavaScript that calls any of the code in your program. Let's do this to actually make calls to our endpoints.

## Testing endpoints

To test our endpoints we need another package that can proxy HTTP requests into our Express service. To do this we will use an NPM package called `supertest`.

```sh
npm install supertest -D
```

We can then alter `store.test.js` to import our Express service and also the request function from SuperTest that we will use to make HTTP requests.

To make an HTTP request you pass the Express app to the SuperTest request function and then chain on the HTTP verb function that you want to call, with the URL path of the endpoint. You can then chain on as many `expect` functions as you would like. In the following example we will expect that the HTTP status code of 200 (OK) is returned, and that the body of the response contains the object that we expect the endpoint to return.

If something goes wrong, the `end` function will contain an error and we pass the error along to the `done` function. Otherwise we just call `done` without the error.

**store.test.js**

```js
const request = require('supertest');
const app = require('./server');

test('getStore returns the desired store', (done) => {
  request(app)
    .get('/store/provo')
    .expect(200)
    .expect({ name: 'provo' })
    .end((err) => (err ? done(err) : done()));
});
```

Now if we run this test we should see that it passes without error.

```sh
➜  npm run test

 PASS  ./store.test.js
  ✓ getStore returns the desired store (16 ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        0.237 s, estimated 1 s
```

We can write a test that hits our updateStore endpoint as follows.

```js
const request = require('supertest');
const app = require('./server');

test('getStore returns the desired store', (done) => {
  request(app)
    .get('/store/provo')
    .expect(200)
    .expect({ name: 'provo' })
    .end((err) => (err ? done(err) : done()));
});

test('updateStore saves the correct values', (done) => {
  request(app)
    .put('/store/provo')
    .send(service)
    .expect(200)
    .expect({ name: 'provo' })
    .end((err) => (err ? done(err) : done()));
});
```
