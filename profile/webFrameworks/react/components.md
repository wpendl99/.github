# Components

[Simple app example](https://codepen.io/leesjensen/pen/MWXOzbQ) of components, properties and methods.

```
class Square extends React.Component {
  render() {
    return (
      <button className="square" onClick={() => { console.log('click');}}>
        {this.props.x}
      </button>
    );
  }
}
```
