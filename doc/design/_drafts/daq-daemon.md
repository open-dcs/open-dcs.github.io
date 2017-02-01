---
layout: post
title: DAQ Daemon Design
---

* has zero or more subscribing sockets to receive messages from other services and applications
  ![Subscribing Example][ex-sub]<!--break-->
* has zero or more publishing sockets to send messages using device data to other subscribing entities
  ![Subscribing Example][ex-pub]
* has zero or more REQ/REP pairs for each client that connects to make requests of the daemon
  ![Subscribing Example][ex-rep]
* has a RESTful API for HTTP requests
* has a DBus API for Linux IPC

## Message Examples

### Receiving

1. Change the output value of an analog output channel:
   ```javascript
   "device0": {
     "ao0": {
       "timestamp": "2016-09-29 15:57:12",
       "value": 1.234
     }
   }
   ```
2. Tell all devices to shutdown:
   ```javascript
   "*": { "command": "shutdown" }
   ```
3. Send an acquisition start/restart to a group of devices:
   ```javascript
   "grp0": { "command": "restart-acquisition" }
   ```

### Sending

1. Publish a set of configured channel measurements:
   ```javascript
   "device0": {[
     "ai0": { "timestamp": "2016-09-29 15:57:12", "value": "1.23" },
     "ai1": { "timestamp": "2016-09-29 15:57:12", "value": "2.34" },
     "ai2": { "timestamp": "2016-09-29 15:57:12", "value": "3.45" },
     "ai3": { "timestamp": "2016-09-29 15:57:12", "value": "4.56" }
   ]}
   ```
2. Publish the status of the device:
   ```javascript
   "device0": { "status": "active" }
   ```

[ex-sub]: {{ site.baseurl }}/assets/img/daq-daemon-sub.svg
[ex-pub]: {{ site.baseurl }}/assets/img/daq-daemon-pub.svg
[ex-rep]: {{ site.baseurl }}/assets/img/daq-daemon-rep.svg

<!--
vim: ft=liquid
-->
