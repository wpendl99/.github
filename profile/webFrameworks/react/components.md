# Components

**Required reading** - [Reactjs.org - Components and Props](https://reactjs.org/docs/components-and-props.html)

React components allow you to modularize the functionality of your application. This is useful to logical pieces and for enabling code reuse.

## The render function

One of the primary purposes of a component is to generate user interface. This is done with the components `render` function. Whatever is returned from the render function is inserted into the component HTML element.

As a simple example, a JSX file containing a React component element named `Demo` whould cause React to load the `Demo` component, call the render function, and insert the result into the place of the `Demo` element.

**JSX**

```jsx
<div>
 Component: <Demo />
<div>
```

Notice that `Demo` is not a valid HTML element.

**React component**

```javascript
class demo extends React.Component {
  render() {
    <b>Hello</b>;
  }
}
```

**Resulting HTML**

```html
<div>
  Component: <b>Hello</b>
  <div></div>
</div>
```

## Properties

React components also allow you to pass information to them in the form of element properties. The component receives the properties in its constructor and then can display them when it renders.

**JSX**

```jsx
<div>
 Component: <Demo who="world" />
<div>
```

Notice that `Demo` is not a valid HTML element.

**React component**

```jsx
class demo extends React.Component {
  render() {
    <b>Hello {this.props.who</b>;
  }
}
```

**Resulting HTML**

```html
<div>
  Component: <b>Hello world</b>
  <div></div>
</div>
```

## State

In addition to properties, a component can have internal state. State is declared in the constructor for the component. Just like properties you can reference state in the render function.

```jsx
class Demo extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      outlook: 'beautiful',
    };
  }
  render() {
    return (
      <b>
        Hello {this.state.outlook} {this.props.who}
      </b>
    );
  }
}
```

**Resulting HTML**

```html
<div>
  Component: <b>Hello beautiful world</b>
  <div></div>
</div>
```

You can manipulate state by creating functions on the component that are called by a user clicking on a button.

```jsx
class Demo extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      outlook: 'beautiful',
    };
  }
  changeOutlook() {
    this.setState({
      outlook: 'exciting',
    });
  }
  render() {
    return (
      <b>
        Hello {this.state.outlook} {this.props.who}
        <br />
        <button onClick={() => this.changeOutlook()}>change</button>
      </b>
    );
  }
}
```

## Reactivity

A component's properties and state are used by the React framework to determine the reactivity of the interface. Whenever a component's state or properties change the render function for the component and all of its dependent component render functions are called.

## ☑ Assignment

Create a fork of this [CodePen](https://codepen.io/leesjensen/pen/eYKVYOR) and experiment.

When you are done submit your CodePen URL, along with a discription of something your found interesting, to the Canvas assignment.
