# IP check
By Wallace McGee

Copy at your leasure, May 2025.

## Description
This script does a 'ping' of each IP address and reports success or failure.

I can check either an ip4 or MAC address.

It runs in a loop each 60 seconds (or whatever you set).

The output is written to *ip_check.csv* as well as the console.

## Reason for existance
I have some Swann security cameras that randomly disconnect and reconnect. Since Swann don't capture any logs of camera disconnects and reconnects (but they do send push notifications of these events) they suggested I do my own logging to see if the cameras are accessible via a ping when they report they are disconnected.

Since I am not always present when they disconnect or reconnect, I setup this PowerShell script (thanks Gemini) to monitor them and log results to a file we can all analyse after the fact.


## First time setup
1. Make sure OneDrive is running (strange but true)
2. Open a PowerShell as Administrator
3. Run `Set-ExecutionPolicy RemoteSigned`
4. To run the script `run.bat`
