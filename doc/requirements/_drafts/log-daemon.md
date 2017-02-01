---
layout: post
title: Logging Daemon Requirements
---

* The daemon shall load backend plugins using a libpeas engine.
* The daemon has zero or more subscribing sockets to receive changes from other
  services and applications.
  ![log-subscribing](/assets/img/requirements/log-subscribing.png)<!--break-->
* It has zero or more publishing sockets to send changes from devices to ther
  subscribing sockets.
  ![log-publishing](/assets/img/requirements/log-publishing.png)
* It also has zero to many request/reply pairs for client data requests
  ![log-request-reply](/assets/img/requirements/log-request-reply.png)

## Notes

### General

* To facilitate loading data into different backends that have been received
  through a query made to the logging backend the daemon may need to provide a
  data structure that holds the results of the query.

## Use Cases

* Generate a list of data for a given query that could include for example:
  * date range
  * time range
  * device
  * user
  * channel subset
  * data source
* Insert records of data received from a publisher into a configured backend
* Insert a single data record sent over a REQ/REP, REST, or DBus into a
  configured backend
* Start logging
* Stop logging
* Request an export of queried data to be done by a loaded plugin

### Subscriber

* Configure a subscribing socket
* Subscribe to a publisher
* Filter incoming messages
* Process data from a publisher

### Publisher

* Configure a publishing socket
* Add messages to the send queue
* Start publishing messages from the send queue
* Stop publishing

### Request/Reply

* Configure a request/reply socket
* Send a request message
* Receive a reply message
* Receive a request message and send a response as a reply

## Message Examples

### Receiving

* Request channel information for the name `ai0`:
  ```json
  ```

### Sending

* Respond to a request for channel information:
  ```json
  ```

## Back End Plugin

* Configure one or more device plugin(s)

## Message Examples

### Receiving

* Request all channel measurement values for the name `ai0` between two time
  values:
  ```json
  ```

### Sending

* Respond to a request for all channel measurement values for the name `ai0`
  between two time values:
  ```json
  ```

<!--
vim: ft=liquid
-->
