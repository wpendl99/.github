# Hypertext Markup Language

**Suggested reading**:

- [MDN HTML](https://developer.mozilla.org/en-US/docs/Web/HTML)
- [W3C specification](https://html.spec.whatwg.org/multipage/) - This official specification is only for reference

<img src="htmlLogo.png" width=100/>

HyperText Markup Language (HTML) provides the foundation content structure that all web applications build on. HTML was originally designed to be a publishing format for web documents, or pages. From that original definition web programmers have morphed the `web page` concept into a `web application` where a page now represents either a `single page application` (SPA) or a interconnected feature in a larger `multi-page application` (MPA). However, to get to a full application we will need other technologies such as the ability to style (CSS) our pages and make them interactive (JavaScript). For now, we will focus on creating the content structure with HTML.

Here is an example of a simple HTML document.

```html
Hello world
```

## Elements and tags

The first thing you noticed is that this looks like a simple text document. That is because text is a valid HTML. You can start adding structure to your HTML by introducing `elements`, represented by enclosing `tags`, around the text. A simple structural element would be represented with the paragraph tag (`p`). This designates that the text is a structural paragraph of text. When we talk about tags we are referring to a delimited textual name that we use to designate the start and end of an HTML element. Tags are delimited with the less than (`<`) and greater than (`>`) symbols. A closing tag will also have a backslash (`/`) before its name.

```html
<p>Hello world</p>
```

We can continue adding structure to the page with additional elements. Each of these elements contain other elements and create the structure of our web page. The `html` element represents the top level page structure. The `body` element represents the content structure, as opposed to things like metadata about the page and the page title. The `main` element is the main content structure, as opposed to things like headers, footers, asides, and navigation content. These additions result in the following HTML page. However, when we `render` the HTML in a browser it would look exactly the same as our original simple text example.

```html
<html>
  <body>
    <main>
      <p>Hello world</p>
    </main>
  </body>
</html>
```

## Attributes

Every HTML element also has attributes. Attributes describe how a specific details about the element. For example, the `id` attribute gives a unique ID to the element so that you can distinguish it from other elements. The `class` attribute is another common element attribute that designates the element as being classified into a named group of elements. Attributes are written inside the element tag with a name followed by an optional value. You can use either single quotes (`'`) or double quotes (`"`) to delimit attribute values.

## Hyperlinks

One of the core features that made the web so successful was the ability to create hyperlinks that take you from one location to another another with a simple click. A hyperlink in HTML is represented with an anchor (`a`) element that has an attribute containing the address of the hyperlink reference (`href`). A hyperlink to BYU's home page looks like this:

```html
<a href="https://byu.edu">Go to the Y</a>
```

## Complete example

HTML defines a header (`<!DOCTYPE html>`) that tells the browser the type and version of the document. You should always include this at the top of the file. We can now add the header, some attributes, and more content to our document for a full example.

```html
<!DOCTYPE html>
<html lang="en">
  <body>
    <main>
      <h1>Hello world</h1>
      <p class="introduction">
        HTML welcomes you to the amazing world of
        <span class="topic">web programming</span>.
      </p>
      <p class="question">What will this mean to you?</p>
      <p class="assignment">Learn more <a href="instruction.html">here</a>.</p>
    </main>
  </body>
</html>
```

![Intro HTML Example](htmlIntroduction.png)

Notice that the rendered document has almost no styling. That is because the entire purpose of HTML is to provide content and structure. The layout of the content is left entirely up to Cascading Stylesheets (CSS). When styling was introduced with CSS, all of teh HTML elements that defined style such as font, strike, and plaintext were deprecated.

## Common elements

Modern HTML contains over 100 different elements. Here is a short list of HTML elements that you will commonly see.

| element | meaning                                                               |
| ------- | --------------------------------------------------------------------- |
| html    | The page container                                                    |
| head    | Header information                                                    |
| title   | Title of the page                                                     |
| meta    | Metadata for the page such as character set or viewport settings      |
| script  | JavaScript reference. Either a external reference, or inline          |
| include | External content reference                                            |
| body    | The entire content body of the page                                   |
| header  | Header of the main content                                            |
| footer  | Footer of the main content                                            |
| nav     | Navigational inputs                                                   |
| main    | Main content of the page                                              |
| section | A section of the main content                                         |
| aside   | Aside content from the main content                                   |
| div     | A block division of content                                           |
| span    | An inline span of content                                             |
| h<1-9>  | Text heading. From h1, the highest level, down to h9 the lowest level |
| p       | A paragraph of text                                                   |
| b       | Bring attention                                                       |
| table   | Table                                                                 |
| tr      | Table row                                                             |
| th      | Table header                                                          |
| td      | Table data                                                            |
| ol,ul   | Ordered or unordered list                                             |
| li      | List item                                                             |
| a       | Anchor the text to a hyperlink                                        |
| img     | Graphical image reference                                             |
| dialog  | Interactive component such as a confirmation                          |
| form    | A collection of user input                                            |
| input   | User input field                                                      |
| audio   | Audio content                                                         |
| video   | Video content                                                         |
| svg     | Scalable vector graphics content                                      |
| iframe  | Inline frame of another HTML page                                     |

## Comments

You can include comments in your HTML files by starting the comment with `<!--` and ending it with `-->`. Any text withing a comment will be completely ignored when the browser renders it.

```html
<!-- commented text -->
```

## Special characters

HTML uses several characters as for defining its file format. If you want to use those characters in your content then you need to escape them using the `entity` syntax. For example, to display a less than symbol (`<`) you would instead use the less than entity (`&lt;`). You can also use the entity syntax to represent any unicode character.

| Character | Entity        |
| --------- | ------------- |
| &amp;     | &amp;amp;     |
| <         | &amp;lt;      |
| >         | &amp;gt;      |
| "         | &quot;        |
| '         | &apos;        |
| &#128512; | &amp;#128512; |

## HTML Versions

Understanding when different HTML features were introduced helps you know what has been around for a long time and probably supported by all browsers, and what is new and may not work everywhere. HTML is pretty stable, but it is still good to check a website like [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/p#browser_compatibility) or [canIUse](https://caniuse.com/mdn-html_elements_p) to make sure.

| Year | Version | Features                                  |
| ---- | ------- | ----------------------------------------- |
| 1990 | HTML1   | format tags                               |
| 1995 | HTML2   | tables, internationalization              |
| 1997 | HTML3   | MathML, CSS, frame tags                   |
| 1999 | HTML4   | external CSS                              |
| 2014 | HTML5   | email, password, media, and semantic tags |

## Rendering HTML

You can save and HTML file to your computer's disk and then open the file using your browser. Another way to easily play with HTML is to use a sandbox like [CodePen](https://codepen.io). However, when you use CodePen it is not necessary to supply the HTML DocType header or the root `html` element since CodePen already assumes you are providing HTML. Here is our example HTML document rendered in CodePen.

![CodePen HTML introduction](htmlIntroductionCodePen.png)

## ☑ Assignment

Create a fork of this [codePen](https://codepen.io/leesjensen/pen/abKYRqN) and experiment.

When you are done submit your CodePen URL, along with a description of something you found interesting, to the Canvas assignment.
