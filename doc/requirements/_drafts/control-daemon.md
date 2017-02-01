---
layout: post
title: Control Daemon Requirements
---

* The daemon loads control loop plugins using a libpeas engine.
* The daemon has zero or more subscribing sockets to receive changes from other
  services and applications.
  ![control-subscribing](/assets/img/requirements/control-subscribing.png)<!--break-->
*  It has zero or more publishing sockets to send changes from devices to ther
  subscribing sockets.
  ![control-publishing](/assets/img/requirements/control-publishing.png)
* It also has zero to many request/reply pairs for client data requests
  ![control-request-reply](/assets/img/requirements/control-request-reply.png)

## Notes

### General

## Use Cases

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
  "nil": { "nil": "nil" }
  ```

### Sending

* Respond to a request for channel information:
  ```json
  "nil": { "nil": "nil" }
  ```

## Control Loops (is this a Plugin????)

![Control Loops](/assets/img/requirements/control-loops.png)

Vala
```vala
Dcs.Control.SiSoController
Dcs.Control.MiMoController
Dcs.Controller
```
```vala
public delegate TransFunc calculate ();

calculate = (() => {
    stdout.printf ("hi");
});

calculate ();
```
![Control Loops](/assets/img/calculate-transfer.png)

JSON
```json
"ctrl0": { "sp": 2.5 }
```
or
```
"ctrl0": { "sp": { "ai0": "value" } }
```

The control daemon will have one or more control loops. A control loop is a term
generally used to describe a feedback system. The basic form requires only a
single input and single output signal. The setpoint could be a parameter value
but could also be a signal value. The forward path (A) would be a function of one,
variable, commonly referred to as the error. The feedback path (B) would
similarily transform a single variable. A PID controller is a particular
implementation of a control loop.

Consider calling this a controller instead of a control loop.
Aspects of a generic controller are:

* Multiple inputs and outputs
* Access to past values of inputs and outputs
* Summation nodes (can be negation)
* Connections between nodes
* A means of transforming variables (transfer functions)
  * Algebraic manipulation of present and past values
  * Requires buffering of signals and intermediate varaibles
  * Linear or nonlinear (e.g. limiter, dead zone)
* Connections (consider using the netlist concept as in circuit simulation)
* State space control (??)

A question that needs to be answered is; can all possible controllers be
implemented in a generic manner as either an IIR or FIR filter? Furthermore,
is a filter just a math channel?

## Message Examples

### Receiving

* Request channel information for the name `ai0`:
  ```json
  "nil": { "nil": "nil" }
  ```

### Sending

* Respond to a request for channel information:
  ```json
  "nil": { "nil": "nil" }
  ```

<!--
vim: ft=liquid
-->
