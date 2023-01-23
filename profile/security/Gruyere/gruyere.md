# Gruyere
Now you're going to learn how to secure a website by breaking into an intentionally insecure one. `Gruyere` is a fake website filled with with many security holes (pun intended) built by Bruce Leban, Mugdha Bendre, and Parisa Tabriz. 

1. Go to this link: [google-gruyere.appspot.com](https://google-gruyere.appspot.com/) and click the continue button after you've read the text.

1. In a new tab, open the [start](https://google-gruyere.appspot.com/start) link. This creates a new instance of the `Gruyere` website for you to use.

1. We'll start with a Cross-Site Scripting (XSS) attack where you inject potentially malicious javascript into a user's browser. Create an account on the sign up page. **Do not use your real credentials to sign up**. There are methods available that would allow an attacker to see your password.

## Cross-Site Scripting (XSS)

1. When you sign into the account, a few new pages will open up, namely the `My Snippets` and `New Snippets` pages. Navigate to the `New Snippets` page.

1. Notice the note that says `Limited HTML is now supported in snippets (e.g., <b>, <i>, etc.)!` Type some rudimentary HTML like 
    ```html
    <h3>This is my first snippet</h3>
    ```
    into the textbox and hit submit. Navigate to the `Home` page and see that your snippet is rendered like it was part of the web page, instead of including the HTML tags. We will use this feature to make another user's browser run whatever code we want!

1. You know that you can include javascript within an HTML tag. Maybe it's possible that the website will send that javascript to a user as a legitimate part of the website? A good way to tell if your XSS attack was succesful is by using the ```alert()``` function. Try entering
    ```html
    <script>alert("Attack method 1")</script>
    ```
    as a new snippet. This snippet is referred to as a `payload`.

1. That was a good idea, but it looks like the backend knows to sanitize the ```<script>``` tag from user input. There is another way to run javascript in HTML, using attributes. Try submitting
    ```html
    <h3 onclick="alert('Attack method 2')">Click here!</h3>
    ```
    as a new snippet.

1. It seems that the website seems to be sanitizing out portions of snippets by using a list of banned words. You can prove by either looking at the source code provided on the `Gruyere` information page or by looking at your developer tools and seeing that it turned your payload into 
    ```html
    <h3 blocked="alert('Attack method 2')">Click here!</h3>
    ```
1. A reasonable next step would be learning if there were any words that can be used to run code that aren't on the list of banned words. It turns out that the `onmouseover` event is not included in the list of banned words. Try
    ```html
    <a onmouseover="alert('Attack method 3')">Click here!</a>
    ```
    as your payload.
1. If an alert pops up when you visit the `Home` page, you've successfully pulled off a Cross-Site Scripting attack! 

Though causing an alert to run on a website that you don't control seems mundane, imagine that instead you were able to inject a piece of javascript that sends a user's credentials to you. This attack could've been prevented if the programmer took better care to manage the banned words list, but the real issue is that the website allows user-submitted HTML to be inserted into the DOM.

Feel free to go through all the challenges that `Gruyere` offers from [this](https://google-gruyere.appspot.com/#0__hackers) link. 