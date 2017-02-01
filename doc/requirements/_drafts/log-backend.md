---
layout: post
title: Logging Backend Plugin Requirements
---

## General

* Connects to a database host if it's meant to use a database
* Is configurable
* Is given a direct connection to the log daemon main process when loaded
* Uses the daemon message queue after it has been configured<!--break-->
* Plugin should describe the features it provides using maskable flags, e.g.
  BACKEND\_FLAGS\_PROVIDES\_EXPORT or BACKEND\_FLAGS\_PROVIDES\_QUERY
* Receives all messages but filters only those with its unique identifier, or
  with a global identifier for broadcasts, or a group identifier, eg:
  ```json
  "*": { "stop": "1h" }
  ```
  or
  ```json
  "csv0": { "start": "now" }
  ```
* Sends messages for alarms, status, etc. using the plugin unique identifier as
  the key to the message object, eg:
  ```json
  "db0": { "status": "running" }
  ```
* Inserts a record eg:
  ```json
  "db0": {
    "insert": {
      "ai0": { "timestamp": "xxx", "value": 1.23 },
      "ai1": { "timestamp": "xxx", "value": 2.15 }
    }
  }
  ```

## Use Cases

The list below uses _send_ and _receive_ to describe the queues but the actual
implementation may use just a single queue for all messages.

* Configure a backend
  * General configuration parameters
    * database name if applicable
    * address if applicable
    * backend type, eg. CSV, XML, JSON, MySQL, Redis
* Writes a header (document) or table record (database) containing:
  * column information
  * unit information, eg. Volts, mA, PSI
  * date
* Register to a set of messages in the daemon queue
* Read messages from the receive queue that match the identifier
* Process a message from the receive queue
* Add a message to the send queue
* Generate status messages for failures with timestamp, eg. database host
  offline, disk full

## Configuring

* XML to configure MySQL backend
  ```xml
  <log:backend name="db0" type="mysql">
    <log:property name="user">logger</log:property>
    <log:property name="pass">dumbpass</log:property>
    <log:property name="host">192.168.168.99</log:property>
    <log:property name="port">3306</log:property>
    <log:property name="database">dcs</log:property>>
  </log:backend>
  ```
* XML to configure CSV backend
  ```xml
  <!-- TBD -->
  ```
* XML to configure Redis backend
  ```xml
  <!-- TBD -->
  ```

<!--
vim: ft=liquid
-->
