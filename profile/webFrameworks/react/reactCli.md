# React CLI

**Required reading** - [Create React App Getting Started](https://create-react-app.dev/docs/getting-started)

Use `create-react-app` to build a simple templated react project. If you want an even simpler one use `nano-react-app`. This one use [Vite](https://vitejs.dev/) instead of [webpack](https://webpack.js.org/). The main difference is that Vite uses native ECMAScript modules instead of transpiling the web frameworks modules into JavaScript.

You can unbundle functionality from the resulting `create-react-app` project with `npm run eject`. For example to remove `web-vitals` do `npm run eject web-vitals`. This just moves all of the packages up a level. What you really want to do is `npm uninstall web-vitals` along with removing the testing stuff.
