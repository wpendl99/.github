# Progressive web application

📖 **Suggested reading**:

- [MDN PWA](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps)
- [web.dev PWA](https://web.dev/learn/pwa/)

The idea of creating a single application that works both on desktop and mobile devices is not a new concept. When Steve Jobs introduced the iPhone in 2007 he had exactly that vision.

> "you can write amazing Web 2.0 and Ajax apps that look exactly and behave exactly like apps on the iPhone. And these apps can integrate perfectly with iPhone services. And guess what?
> There’s no SDK that you need! You’ve got everything you need if you know how to write apps using the most modern web standards to write amazing apps for the iPhone today.
> So developers, we think we’ve got a very sweet story for you. You can begin building your iPhone apps today"
>
> — Steve Jobs, (**Source**: [2007 MacWorld keynote](https://youtu.be/VQKMoT-6XSg))

Unfortunately for the world, Apple quickly realized the incredibly lucrative market that existed if they created a closed application space that they controlled. And so in the same year that the iPhone was released, the Apple App Store was born and software companies started paying Apple 30% of all transactions made on the iPhone.

While the tax on app store participate was unfortunate, the focus on device native application was worse. This moved the software industry away from the universal application platform that web technologies enabled, to one where developers are forced to create completely different design, functionality, and code for each device. One for iPhone, one for Android, one for XBox, one for Samsung TVs, one for the desktop, and so forth. While this is great for the employability of software engineers, it is terrible for software companies and users.

When companies, such as Microsoft and Google realized the negative impact that native applications were having on the industry, they began to evangelize a return to standard web technologies that would work on any device. They introduced browser APIs, defined standards, and created frameworks that made it easier to build universal web applications. This technology was eventually branded as `Progressive Web Applications` or PWA.

## Advantages of PWA

While PWA builds on the standard core of HTML, CSS, and JavaScript, along with the delivery of content and software updates over HTTP, it takes web applications to the next level with the following benefits.

1. **Works offline** - Using the browser's Service Worker API, a PWA can control the caching of files locally on browser and make it so that the application can run when completely disconnected from the internet. This means that your app will still work when networks are spotty while riding the subway, or rappelling down a back country slot canyon.
1. **Fast mobile installation to home screen** - A user no longer has to navigate an app store to find and completely download a native application. Instead they click on a single button in their browser and the PWA will instantly be placed on their home screen. If the app is meant to function offline, it can incrementally cache the necessary files while the user is actually using the application.
1. **No app store tax** - As companies like [Epic](https://en.wikipedia.org/wiki/Epic_Games_v._Apple) learned through expensive experience and litigation, if you want to be in the app store you will pay a significant price. App stores play a heavy hand in the submission, approval, and update process required to be listed in an the store. For those companies that are [denied inclusion](https://www.theverge.com/2020/6/16/21293419/hey-apple-rejection-ios-app-store-dhh-gangsters-antitrust) in the app store, there is no recourse. They simply cannot capture that market share. PWA technology removes the app store broker from the equation, and allows the software company to deal directly with the consumer.
1. **Instant updates** - When a PWA needs to push out security of feature updates, it does not require the app store's approval, and does not force the user to go through a complicated update process. Instead they just update their web application and push it to production. The next time the user accesses the application they will see the changes.
1. **Performance** - Because the PWA completely controls the level of browser caching, it can provides high levels of performance that are no longer dependent on network connectivity constraints.
1. **Same code base for all devices** - Freed from the overhead of developing and maintaining multiple platforms, software companies can now redeploy their resources to providing functionality that actually benefits the user.
1. **Better SEO score** - Starting in 2018 Google announced that mobile friendly applications, with PWAs specifically recognized, will have a significantly higher placement is Google search results. This means that if your web application is not a PWA then it will need to spend more on marketing in order to catch up with competitors.

Finally, PWA technology enables small software companies to successfully compete in the mobile market. According to research provided by Statista, mobile devices generate almost 60% of internet traffic. Those numbers are even higher for Africa (75%) and Asia (69%).

![Mobile usage statistics](mobileUsageStatistics.jpg)

> Source: _[statista](https://www.statista.com/statistics/306528/share-of-mobile-internet-traffic-in-global-regions/)_

With a PWA, a small software company can easily reach mobile device customers, and even provide offline web applications where network coverage is spotty or only sometimes available. This is important even for mature markets such as the United States there are still significant portions of the population that do not have reliable broadband access.

![Broadband availability US](broadbandAvailabilityUS.jpg)

> Source _[US Census Bureau](https://www.census.gov/library/visualizations/2018/comm/broadband.html?cid=embedded_infographic)_

## Where PWAs don't make sense

With all of the advantages of PWAs, there are some situations where a native application is necessary.

1. **Apple incompatibility** - While much of PWA technology works fine with iOS and Safari, Apple is slow to give up their strategic economic advantages. Therefore, some technologies do not yet work as well on the iPhone as they do on other devices. For example, iOS does not support standard push notification. Additionally, you must use Safari in order to install a PWA to the home screen when using an iPhone. Hopefully, in the near future, Apple will give in to increasing community pressure and enable a better experience for their customers by removing these inconvenient incompatibilities.
1. **Advanced device features** - A PWA can access a devices location, storage, haptic feedback, contacts, camera, battery, shortcuts, device orientation, fingerprint sensor, and even Bluetooth through the [browser supported APIs](https://developer.mozilla.org/en-US/docs/Web/API). However, if an application requires the use of specific device features such as the flashlight or atmospheric pressure sensor then you might be forced to build a device native application.

# Example PWAs

https://www.simicart.com/blog/progressive-web-apps-examples/

![Spotify install](pwaSpotifyInstall.jpg)

![Spotify service worker](pwaSpotifyServiceWorker.jpg)

![Spotify app](pwaSpotifyMobileApp.jpg)

![Spotify app](pwaSpotifyDesktopApp.jpg)

# Steps to make PWA

1. Manifest and icons
1. Service worker for caching
1. Offline fallbacks

## Manifest and icons

Used https://favicon.io/favicon-converter/ to generate the proper icon files from our icon.

Added the references for the different icons to public/index.html

```html
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png" />
```

copied over fav icons from generator.

created a maskable icon using https://maskable.app/editor

Modified manifest.json to contain all the proper icons.

```js
  "icons": [
    {
      "src": "favicon.ico",
      "sizes": "64x64 32x32 24x24 16x16",
      "type": "image/x-icon"
    },
    {
      "src": "/android-chrome-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/android-chrome-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    },
    {
      "src": "/maskable_icon.png",
      "sizes": "192x192",
      "type": "image/png",
      "purpose": "any maskable"
    }
  ],
```

## Service Worker

copy over into /src

service-worker.js
serviceWorkerRegistration.js

Add to index.jsx

```js
import * as serviceWorkerRegistration from './serviceWorkerRegistration';
serviceWorkerRegistration.register();
```

ran to install Google work-box service worker support

```sh
npm install workbox-core workbox-expiration workbox-precaching workbox-routing workbox-strategies
```

Deployed to production

Ran LightHouse to text PWA compatibility

![Lighthouse report](serviceWorkerLighthouseReport.jpg)

Installed on my android phone and desktop

## Offline fallbacks

(authenticated.jsx) Remove user name from local storage so that we don't try and run in offline if we have logged out.

```jsx
function logout() {
  fetch(`/api/auth/logout`, {
    method: 'delete',
  }).then(() => {
    localStorage.removeItem('userName');
    props.onLogout();
  });
}
```

(app.jsx) removed check to server to see if we are authenticated. Just assume we are if we have a username.

```jsx
// Use the presence of the 'userName' in local storage to determine if we previously authenticated.
const [userName, setUserName] = React.useState(localStorage.getItem('userName') || '');
const currentAuthState = userName ? AuthState.Authenticated : AuthState.Unauthenticated;
const [authState, setAuthState] = React.useState(currentAuthState);
```

Display offline error if you can't login

```jsx
async function loginOrCreate(endpoint) {
  try {
    const response = await fetch(endpoint, {
      method: 'post',
      //...
    });
    //...
  } catch {
    setDisplayError(
      `⚠ It appears that you are currently offline. You can play Simon offline, but you must be initially online to create or login to your account.`
    );
  }
}
```

![Offline message](serviceWorkerLoginOffline.jpg)

(about.jsx) Display default quote

```jsx
fetch('https://api.quotable.io/random')
  .then((response) => response.json())
  .then((data) => {
    this.setState({ quote: data.content, quoteAuthor: data.author });
  })
  .catch(() => {
    // Use offline fallback classic quote
    this.setState({
      quote: `Always bet on JavaScript`,
      quoteAuthor: `Brendan Eich`,
    });
  });
```

## Create

https://create-react-app.dev/docs/making-a-progressive-web-app/

https://dev.to/alexgurr/turning-a-react-app-into-a-pwa-with-offline-detection-service-workers-and-theming-142i

npx create-react-app testpwa --template cra-template-pwa

or

npm install register-service-worker

add `service-worker.js` and add import in `index.jsx`.

## Manifest

manifest.json

## Service worker

index.js
serviceWorkerRegistration.unregister();

## Device testing

![iPhone Safari](deviceTestingSafari.jpg)
