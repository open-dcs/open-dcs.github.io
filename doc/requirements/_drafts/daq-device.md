---
layout: post
title: DAQ Device Plugin Requirements
---

## General

* Connects to hardware, eg. data acquisition, actuator controller
* Can have *input* signals/channels
* Can have *output* signals/channels
* Is configurable using a consistent DCS configuration format<!--break-->
* Is given a direct connection to the DAQ daemon main process when loaded
* Uses the daemon message queue after it has been configured
* Plugin should describe the features it provides using maskable flags
* Receives all messages but filters only those with its unique identifier, or
  with a global identifier for broadcasts, or a group identifier, eg:
* Can use different protocols to communicate with the device, eg. RS232, Modbus
  TCP, Comedi
* sends messages for alarms, measurements, status, etc. using the plugin's
  unique identifier as the key to the message object

  ```json
  "*": { "command": "shutdown" }
  ```
  or
  ```json
  "grp0": { "command": "shutdown" }
  ```
* Changes the output value of an analog output channel, eg:

  ```json
  "dev0": {
    "ao0":{
      "timestamp":"xxx", "value":4.32
    }
  }
  ```

* Sends messages for alarms, measurements, status, etc. using the plugin unique
  identifier as the key to the message object, eg:
  ```json
  "dev0": {
    "ai0": { "timestamp": "xxx", "value": 1.23 },
    "ai1": { "timestamp": "xxx", "value": 2.15 }
  }
  ```
  or
  ```json
  "dev0": { "status": "device open" }
  ```

## Use Cases

The list below uses _send_ and _receive_ to describe the queues but the actual
implementation may use just a single queue for all messages.

* Configure a device
  * General acquisition parameters
    * acquisition rate
    * asynchronous/polling
  * Channel specific parameters
    * tag
    * range
* Register to a set of messages in the daemon queue
* Read messages from the receive queue that match the identifier
* Process a message from the receive queue
* Generate a timestamp for messages being sent
* Add a message to the send queue
* Start/stop a device acquisition (input & output)

## Configuring

* Using XML
  ```xml
  <daq:device name="mf-dev" type="comedi">
    <!-- Can be [Aa]sync[hronous]|[Pp]oll[ing] -->
    <daq:property name="acq-type">async</daq:property>
    <!-- Acquisition rate is in S/s -->
    <daq:property name="acq-rate">1000</daq:property>
    <!-- Not concerned with details of subdevice vs. channel groups yet -->
    <daq:object name="sub-dev0" type="subdevice">
      <daq:object name="ai-ch0" type="ai-chan">
        <!-- ... -->
      </daq:object>
    </daq:object>
  </daq:device>
  ```

<!--
vim: ft=liquid
-->
