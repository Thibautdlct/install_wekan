# Install wekan
Scripts to install and start [wekan](https://github.com/wekan/wekan)

## Installation
Copy the scripts to your linux server and run `sh install.sh`.

## Running
Run the app with `sh start.sh`
The web app starts by default on port 60835.
You can establish an ssh tunnel with `ssh -f -N -L 60835:127.0.0.1:60835 you@remote.server.org` and view the application with your local browser at [http://127.0.0.1:60835](http://127.0.0.1:60835)