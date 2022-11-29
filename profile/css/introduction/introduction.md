# Cascading Style Sheets

<img src="cssLogo.png" width=100/>

**Suggested reading**

- [MDN CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)
- [W3C CSS specification](https://www.w3.org/Style/CSS/) - This official specification reference purposes

Cascading Style Sheets (CSS) converts the structure and content of HTML into a vibrant, responsive, experience. The initial objective of CSS was to allow HTML the author, reader, and browser to cascade style definitions in order to determine how a page was rendered. Håkon Lie (the principle author) had no idea how far from that original vision CSS would eventual stray. In modern web applications CSS does style the web page, but conformity across browsers and users in paramount to the success of application. A user may select a browser setting to control basic things like the base font size for readability reasons, but that is about where the user's control ends. Instead CSS focus is more on the authors design and adapting it to the device that the page is rendered on, rather than anything the browser or user defines.

The ability of CSS to style a web page has increased significantly from its original implementation. With modern CSS a web programmer can animate the page, deploy custom fonts, respond to user actions, and dynamically alter the entire layout of the page based on the size of a device and its orientation.

Functionally, CSS is primarily concerned with defining `rulesets`, or simply a `rules`. A rule is comprised of a `selector` that selects the elements to apply the rule to. A rule is comprised of one or more `declarations` that represent the `property` to style with the given `property value`.

For example consider the following rule.

```css
p {
  font-family: sans-serif;
  font-size: 2em;
  color: navy;
  text-shadow: 3px 3px 1px #cccccc;
}
```

The selector `p` selects all paragraph elements in the HTML document that the CSS is applied to. The four specified declarations then: 1) change the font to use a san-serif font, 2) increase the font size to be twice as big as the default font, 3) change the color to be navy, and create a gray shadow for the text. The result looks like this.

![CSS simple rule](cssSimpleRule.jpg)

## Associating CSS with HTML

There are three ways that you can associate CSS with HTML. The first way is to use the `style` attribute of an HTML element and explicitly assign one or more declarations.

```html
<p style="color:green">CSS</p>
```

The next way to associate CSS is to use the HTML `style` element to define CSS within the HTML document. The `style` element should appear in the `head` element of the document so that the rules apply to all elements of the document.

```html
<head>
  <style>
    p {
      color: green;
    }
  </style>
</head>
<body>
  <p>CSS</p>
</body>
```

The final way to associate CSS is to use the HTML `link` element to create a hyperlink reference to an external file containing CSS rules. The `link` element must appear in the `head` element of the document so that the rules apply to all elements of the document.

```html
<link rel="stylesheet" href="styles.css" />
```

```css
p {
  color: green;
}
```

All of the above examples are equivalent, but using the `link` element usually is preferred.

## Cascading styles

Because elements inherit the rules applied to their parents you often end up with the same declaration property to a single element multiple times. For example, we might set the `body` element color to be red and then the `paragraph` element color to be green, and then the `span` element to be blue, and finally a specific `span` element to be black.

```html
<body>
  <p><span style="color:black">CSS</span></p>
</body>
```

```css
body {
  color: red;
}
p {
  color: green;
}
span {
  color: blue;
}
```

In this case the rules cascade down from the highest nodes in the DOM tree to the lowest level. Any declaration property defined at a lower level will override the higher declaration. You can see this happening if you use the browser's debugger (press `F12` in Chrome) while viewing a web page and they look at the styles applied on a specific element. For the case defined above you would see that each of the higher level declarations is crossed out until you get to the one defined explicitly defined on the element.

![CSS cascade](cssCascading.jpg)

## CSS Versions

As with HTML, CSS has evolved significantly over the years. The following version table gives you an idea of when certain features were added and therefore how stable the support for them are.

| Year      | Version | Features                                                                                   |
| --------- | ------- | ------------------------------------------------------------------------------------------ |
| 1996      | CSS1    | selectors, font, color, background, alignment, margin, border, padding                     |
| 1998      | CSS2    | positioning, z-index, bidirectional text, shadows                                          |
| 2011      | CSS2.1  | removed incompatible features                                                              |
| 1999-2021 | CSS3    | enhancements for media, box, background, borders, color, template, multi-column, selectors |

Beginning with CSS3 the specification was divided into modules so that they could be implemented at different levels of maturity. Whether these modules will culminate in a CSS4 specification has not yet been decided.
