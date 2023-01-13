# simon-websocket

![Simon](../simon.png)

This deliverable demonstrates peer to peer communication using WebSocket. The functionality that Simon provides for peer communication is intentionally limited to display notifications between users. This was done so that the application would clearly demonstrate how WebSocket works rather than clutter the application with functionality that uses WebSockets.

You can view this application running here: [Example Simon WebSocket](https://simon-websocket.cs260.click)

## Handling WebSocket requests

After installing the `ws` NPM package the next step is to attach a WebSocket listener to the HTTP server that was created in an earlier deliverable. This work is all done in the PeerProxy class implemented in the `peerProxy.js` file. The PeerProxy class contains the protocol upgrade from HTTP to WebSocket, tracks new WebSocket connections, passes (or proxies) requests between connections, and implements ping/pong to keep connections alive.

## Displaying and generating WebSocket messages

The `public/play.js` file contains the functions for connecting, broadcasting, receiving, and displaying events using WebSocket.

![Simon WebSocket](simonWebSocket.jpg)

Leveraging the concepts demonstrated in this deliverable, you can implement addition functionality that uses peer to peer interactions. For example, you could make it so each connected peer has to complete one of the Simon patterns in turn.

## Study this code

Get familiar with what this code teaches.

- Clone the repository to your development environment.
  ```sh
  git clone https://github.com/webprogramming260/simon-websocket.git
  ```
- Set up your environment variables with your Atlas credentials.
- Review the code and get comfortable with everything it represents.
- View the code in your browser by hosting it from a VS Code debug session.
- See how data is populated in the database by viewing the contents of the database using the MongoDB Atlas console.
- Make modifications to the code as desired. Experiment and see what happens.

## Make your own version

- Using VS Code, open the `simon` directory for the repository you used for the last Simon assignment.
- Modify the project and add WebSocket support. Refer to the example class application repository for guidance. Remember that you do not need to create an original work. Just focus on learning the concepts that the example project provides. However, you will learn more if you type everything out, and not just copy and paste the code.
- Set the footer link to point to your code repository. (e.g. https://github.com/yourname/simon)
- Periodically commit and push your code to your repository as you hit different milestones. (4 commits are required for full credit.)
- Periodically deploy to your production environment using a copy of the `deployService.sh` script found in the [example class application](https://github.com/webprogramming260/simon-websocket/blob/main/deployService.sh). Take some time to understand how it works.

  ```sh
  ./deployService.sh -k <yourpemkey> -h <yourdomain> -s simon
  ```

  For example,

  ```sh
  ./deployService.sh -k ~/keys/production.pem -h yourdomain.click -s simon
  ```

- Update your `start up` repository README.md to record and reflect on what you learned.
- When you have completed your version. Do a final push of your code and deploy to your production environment using the `deployService.sh` script.
- Make sure your project is visible from your production environment (e.g. https://simon.yourdomain.click).
- Submit the URL to your production environment for grading using the Canvas assignment page.

## Grading Rubric

- 20% - Project hosted from your production environment
- 30% - Properly creates and manages a WebSocket connection
- 30% - Displays communication between peers
- 10% - At least four Git commits for the project (Initial, milestone, ..., milestone, final)
- 10% - Notes in your start up repository README.md about what you have learned
