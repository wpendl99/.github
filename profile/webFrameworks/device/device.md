# Device features

🚧

https://www.youtube.com/watch?v=ppwagkhrZJs

- Notification - https://developer.mozilla.org/en-US/docs/Web/API/notification
- Shortcuts - in the manifest you can specify access shortcuts for your app
- Contacts - Only on chrome android
  - https://developer.chrome.com/articles/contact-picker/
  - https://developer.mozilla.org/en-US/docs/Web/API/Contact_Picker_API
- Location - Well supported
  - https://developer.mozilla.org/en-US/docs/Web/API/Navigator/geolocation
  - https://developer.mozilla.org/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API
  - windows.addEventListener('devicemotion', (e) => {}) to get acceleration and rotation.
  - Sensors panel in dev tools to simulate position and rotation.
- Bluetooth - Chrome, edge
  - BLE simulator
  - navigator.bluetooth.requestDevices
  - https://developer.mozilla.org/en-US/docs/Web/API/Bluetooth/requestDevice
- Idle detection - Chrome opera
  - https://developer.mozilla.org/en-US/docs/Web/API/IdleDetector
- File system access - chrome, edge, opera, safari
  - https://developer.mozilla.org/en-US/docs/Web/API/File_System_Access_API
