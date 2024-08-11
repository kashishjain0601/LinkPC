# LinkPC
This app permits individuals to remotely supervise and handle the activities occurring on their personal computers using their smartphones. The application has a user-friendly interface that enables users to terminate processes, power off, or put their PCs in hibernation mode.

# Basic Architecture

(1). A mobile app (to manage your PC)
The frontend includes a simple UI containing the control options for the PC (shut-down / hibernate / terminate-process/ etc.). 

As soon as the users click on the "Login with Google" button, they would be prompted to choose an email id with which they want to login.

After the authentication, the user would be logged in and the first screen visible would be the "Profile" screen. This page would have the username and the list of the remote devices that are connected to it.

We also have the task screen that would list all the ongoing tasks on the connected device. The users can terminate tasks running on their PC from this screen. 

The main functionality of the app is on the "Options" screen. This screen has the options to either sleep, hibernate, restart or shutdown the connected PC. The battery status of the device would also be displayed on the top. 

We have used electron.js for developing the Desktop app, Flutter for the mobile app(both Android and IOS) and a FireBase backend. We have used the modular Google Oauth for the login system making it more convenient for the user. We have also tried implementing the battery status feature that indicates the current battery percentage of the device.
