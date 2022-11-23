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

## Function Components

In addition to the class style components demonstrated above, React also supports function style components. The return value of the function is the equivalent of a class component's render function.

```jsx
const Hello = () => {
  let name = 'world';

  return <p>Hello {name}x</p>;
};
```

Properties are supported as a parameter to the function.

```jsx
const Hello = (props) => {
  let name = 'world';

  return (
    <p>
      {props.prefix} {name}x
    </p>
  );
};

ReactDOM.render(<Hello prefix='Goodbye' />, document.getElementById('root'));
```

You can also store state with hook functions. The `React.useState` function returns a variable that contains the current state and a function to update the state. The following example sets the state to 'yes' when the paragraph text is clicked.

```jsx
const Hello = (props) => {
  let name = 'world';
  const [clicked, updateClicked] = React.useState('no');

  const onClicked = (e) => {
    console.log('c');
    updateClicked('yes');
  };

  return (
    <p onClick={(e) => onClicked(e)}>
      {props.prefix} {name}, clicked: {clicked}
    </p>
  );
};

ReactDOM.render(<Hello prefix='Goodbye' />, document.getElementById('root'));
```

You should note that you can use JSX even without a function. A simple variable representing JSX will work anyplace you would otherwise provide a component.

```jsx
const hello = <div>Hello</div>;

ReactDOM.render(hello, document.getElementById('root'));
```

## Reactivity

A component's properties and state are used by the React framework to determine the reactivity of the interface. Whenever a component's state or properties change the render function for the component and all of its dependent component render functions are called.

## ☑ Assignment

Create a fork of this [CodePen](https://codepen.io/leesjensen/pen/Yzvaver) and experiment.

When you are done submit your CodePen URL, along with a description of something your found interesting, to the Canvas assignment.
