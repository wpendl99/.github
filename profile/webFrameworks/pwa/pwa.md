# Progressive web application

Advantages of PWA

1. Works offline - service workers
1. Fast mobile installation to home screen
1. No app store (no 20% fee)
1. Performance. High level of browser caching
1. Same code base for all devices
1. Better SEO score

Steps to make PWA

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

## Examples

https://www.simicart.com/blog/progressive-web-apps-examples/

![Spotify install](pwaSpotifyInstall.jpg)

![Spotify service worker](pwaSpotifyServiceWorker.jpg)

![Spotify app](pwaSpotifyMobileApp.jpg)

![Spotify app](pwaSpotifyDesktopApp.jpg)

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
