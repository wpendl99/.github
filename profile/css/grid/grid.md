# CSS Grid

**Recommend reading**: [MDN Grid](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Basic_Concepts_of_Grid_Layout)

The `grid` display layout is useful when you want to display a group of child elements in a responsive grid. We start with a container element and a bunch of children that we have laid out in a grid.

```html
<div class="container">
  <div class="card"></div>
  <div class="card"></div>
  <div class="card"></div>
  <div class="card"></div>
  <div class="card"></div>
  <div class="card"></div>
  <div class="card"></div>
  <div class="card"></div>
  <div class="card"></div>
</div>
```

We turn this into a responsive grid by including the CSS `display` property with the value of `grid` on the container element. This tells the browser that all of the children of this element are to be displayed in a grid flow. The next property `grid-template-columns` specifies that we want to repeat the number of column by auto-filling columns until we have enough columns to fill the width of the grid with each column taking a minimum of 300 pixels or a maximum of one equal fractional unit (`1fr`) of the grid width.

We finish off the grid configuration by saying that we want all rows to be exactly 300 pixels high with the `grid-auto-rows` property and the use the `grid-gap` property that we want at least a 1 em gap between our grid items.

```css
.container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  grid-auto-rows: 300px;
  grid-gap: 1em;
}
```

Here is what the finished product looks like.

![CSS grid](cssGrid.gif)

You can experiment with the source on [CodePen](https://codepen.io/leesjensen/pen/GRGXoWP).
