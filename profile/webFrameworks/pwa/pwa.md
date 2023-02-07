# Progressive web application

Advantages of PWA

1. Works offline - service workers
1. Fast mobile installation to home screen
1. No app store (no 20% fee)
1. Performance. High level of browser caching
1. Same code base for all devices
1. Better SEO score

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
