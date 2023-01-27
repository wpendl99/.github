# Reactivity

Making the UI react to changes in user input or data, is one of the architectural foundations of React. React enables reactivity with three major pieces of a React component: `props`, `state`, and `render`.

When a component's JSX is rendered, React parses the JSX creates a list of any references to the component's `state` or `prop` objects. React then monitors those objects and if it detects that they have changed it will call the component's `render` function so that the impact of the change is visualized.

The following example contains two components. A parent Survey component and a child Question component. The Survey has a state named `color`. The Question has a property named `color`. The Survey passes its `color` state to the Question as a property. This means that any change to the Survey's color will also be reflected in the Question's color. This is a powerful means for a parent to control a child's functionality.

The Question component also has a state named `answer`. The value of answer is displayed as part of the Question's content. The user can interact with this state through HTML radio input elements. When one of the inputs is changed the Question's `onChange` function is called and the answer state is updated to reflect the user's choice. This automatically causes the display of the answer to be updated.

Notice in the example that there are two ways to define state. The function `React.useState` is used for function style components, and the class property `state` and function `updateState` are used for class style components. Since Survey is a function component and Question is a class component, examples of both are demonstrated.

```jsx
// The Survey component is a React function component and
// so state is stored using React.useState.
const Survey = () => {
  const [color, updateColor] = React.useState('#737AB0');

  // When the color changes update the state
  const onChange = (e) => {
    updateColor(e.target.value);
  };

  return (
    <div>
      <h1>Survey</h1>
      <p>
        <span>Pick a color: </span>
        {/* Pass the Survey color state as a property to the input element.
            When to color changes the input property will also be updated and rendered. */}
        <input type='color' onChange={(e) => onChange(e)} value={color} />
      </p>

      {/* Pass the Survey color state as a property to the Question.
          When to color changes the Question property will also be updated and rendered. */}
      <Question color={color} />
    </div>
  );
};

// The Question component is a React class component and
// so state is stored on the component. Properties passed to the
// component are stored in the props object.
class Question extends React.Component {
  constructor(props) {
    // Props must be passed to the parent component for React to detect changes.
    // The color property from the parent is stored in props.
    super(props);
    // Initialize the state
    this.state = { answer: 'pending...' };
  }
  onChange({ target }) {
    // Update the state using the class setState function.
    // Note that the update is asynchronous. Always use setState to mutate state.
    this.setState({ answer: target.value });
  }
  render() {
    return (
      <div>
        <span>Do you like this</span>
        <span style={{ color: this.props.color }}> color</span>?<label>
          <input type='radio' name='answer' value='yes' onChange={(e) => this.onChange(e)} />
          Yes
        </label>
        <label>
          <input type='radio' name='answer' value='no' onChange={(e) => this.onChange(e)} />
          No
        </label>
        <p>Your answer: {this.state.answer}</p>
      </div>
    );
  }
}

ReactDOM.render(<Survey />, document.getElementById('root'));
```

## ☑ Assignment

Create a fork of this [codePen](https://codepen.io/leesjensen/pen/NWzYzXE) and experiment.

When you are done submit your CodePen URL, along with a comment about something you found interesting, to the Canvas assignment.

Don't forget to update your GitHub start up repository README.md with all of the things you learned and want to remember.
