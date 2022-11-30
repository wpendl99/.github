# Responsive design

**Suggested reading**: [MDN Responsive design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)

Modern web applications are expected to run well on a large variety of computing devices. This includes everything from desktops, to mobile phones, to shopping kiosks, to car dashboards. This ability to reconfigure the interface so the application accommodates and takes advantage of the screen size and its orientation is called `responsive design`.

Much of HTML and CSS is already fluid due to the fact that it responds to the browser window being resized, but the following features help to completely reconfigure the application when the situation requires it.

## Viewport meta tag

When smart mobile devices started gaining popularity they started to be used to look at websites. However, the websites were optimized desktop displays and not little tiny screens. To solve this mobile browsers automatically started scaling the website so that it looked better on a small screen. Unfortunately, as web applications started being responsive the browsers scaling got in the way. The solution is to include a meta tag in the `head` element of all your HTML pages. This tells the browser to keep the scale 1 to 1.

```html
<meta name="viewport" content="width=device-width,initial-scale=1" />
```

## Media queries

One of the main CSS features that help us create responsive applications is the `@media` selector. This selector dynamically detects the size and orientation of the device and applies the appropriate CSS rules to represent the structure of the HTML in a way that accommodates the change.

We can use the `@media` selector to tell us which side of the screen (technically the viewport) is the longest. A media query takes one or more predicates separated by boolean operators. In our case we simply want to know if the screen is oriented in portrait mode (short side on top) or not.

```css
@media (orientation: portrait) {
  div {
    transform: rotate(270deg);
  }
}
```

Here is the result demonstrated by using the browser's debugger and switching into phone and then responsive mode. You can also view the [CodePen](https://codepen.io/leesjensen/pen/rNKZOva) and play with it yourself.

![CSS Media orientation](cssMediaOrientation.gif)

You can also use media queries to make entire pieces of your application disappear. For example, if we had an aside that was helpful when the screen is wide, but need to disappear when the screen got narrow we could use the following media query.

```css
@media (orientation: portrait) {
  aside {
    display: none;
  }
}
```

![CSS Media orientation](cssMediaDisappear.gif)

Here is the [CodePen](https://codepen.io/leesjensen/pen/NWzLGmJ) for this example.

## Grid and Flexbox

The final two responsive technologies are Grid and Flexbox. These are both CSS display modes that automatically respond to screen sizes to position and resize their child elements. We will discuss each of these in detail in the following instruction.
