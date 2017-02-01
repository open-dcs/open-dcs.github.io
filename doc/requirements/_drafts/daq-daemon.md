---
layout: post
title: DAQ Daemon Requirements
---

* The daemon shall load device plugins using a libpeas engine.
* The daemon has zero or more subscribing sockets to receive changes from other
  services and applications.
  ![DAQ Publishing](/assets/img/requirements/daq-publishing.png)<!--break-->
*  It has zero or more publishing sockets to send changes from devices to ther
  subscribing sockets.
  ![DAQ Subscribing](/assets/img/requirements/daq-subscribing.png)
* It also has zero to many request/reply pairs for client data requests
  ![DAQ Request Reply](/assets/img/requirements/daq-request-reply.png)

## Notes

### General

* May need to use separate internal queues to handle messages for input and
  output devices, maybe not

## Use cases

### Subscriber

* Configure a subscribing socket
* Subscribe to a publisher
* Filter incoming messages
* Process data from a publisher

### Publisher

May not have start and stop functionality in favor of an always transmitting
approach where if a message is added to the send queue it is immediate sent. One
argument to have it would be to trigger acquistion events such as a camera
capture if a process measurement exceeds some limit.

* Configure a publishing socket
* Add messages to the send queue
* Start publishing messages from the send queue
* Stop publishing

### Request/Reply

* Configure a request/reply socket
* Send a request message
* Receive a reply message
* Receive a request message and send a response as a reply

### Device Plugin

* Configure one or more device plugin(s)

## Message Examples

### Receiving

* Request channel information for the name `ai0`:
  ```json
  "nil": "nil"
  ```

### Sending

* Respond to a request for channel information:
  ```json
  "nil": "nil"
  ```

<!--
vim: ft=liquid
-->
