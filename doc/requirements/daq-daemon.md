## DAQ Daemon

The data acquisition daemon:

* loads device plugins using a libpeas engine
* has zero or more subscribing sockets to receive messages from other services and applications
  ![Subscribing Example][ex-sub]
* has zero or more publishing sockets to send messages using device data to other subscribing entities
* has zero or more REQ/REP pairs for each client that connects to make requests of the daemon
* has a RESTful API for HTTP requests
* has a DBus API for Linux IPC

[ex-sub]: daq-daemon-sub.svg
[ex-pub]: daq-daemon-pub.svg
[ex-rep]: daq-daemon-rep.svg
