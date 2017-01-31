---
layout: post
title:  Testing and Validation Specification
author: Stephen Roy<stephen.roy@coanda.ca>
date:   2016-09-14 14:29:00 -0700
---

{% comment %}
A lot of these ideas are, or may be, out of date. This file needs to be reviewed
before being moved into _posts.
{% endcomment %}

What follows are ideas for OpenDCS software development. The purpose of this
document is to capture these ideas in advance of the completion of a formal set
of documentation. From here it may possible to identify technical challenges and
thereby give cause to take steps early on to overcome them.<!--break-->

Given that, the software requirements can be achieved within a process that
implements clearly defined requirements, software design specifications,
prototyping, and testing. A successful strategy may be, rather than make a
single pass, to instead iterate through this process several times such that
technical challenges and limitations that lie hidden in the lower level
components will be exposed early on and the top level design re-evaluated.

In general, the performance requirements of OpenDCS should specify:

* Data channel capacity - the number of channels available in the network.
* Data processing capacity - the amount of live data the system is able buffer
  and hold while processing.
* Data storage capacity - the quantity of data that can be archived in the file
  system.
* Data storage and retrieval speed - the rate at which data archive can be
  written to and queried.
* Data acquisition rate - the speed at which data measurements can be acquired
  and sent.
* Data transmission latency - the time difference between the instant of
  measurement and the moment when the data becomes available to a process; a
  graph, for example.
* Fault tolerance - does the system respond favorably to, for example, a single
  point network failure, a power outage etc.

An approach to designing for performance could be to view the system from two
perspectives. Firstly, the network performance would be specified for different
prototypical topologies. Given these broad categories, a specification for each
could be formalized. These may include the following examples.

* A single PC containing a single acquisition device  that runs a minimal GUI
  and writes locally to a single log database and acquires at 10 Hz (10
  Samples/sec/channel).
* A single PC with 3 synchronized devices that write to a single log.
* A network containing multiple PC’s and hardware devices that provides data
  through web services. Data acquisition speeds are dependant on the particular
  measurement, however, all data is synchronized using IEEE 1588 PTP. Data is
  stored in a database and mirrored at different sites.

Secondly, each network element can be specified individually in terms of its
external and internal requirements. External requirements are derived from the
assumptions made in the network design. Each element will have internal
requirements that are not software requirements explicitly but rather, a design
specification that will guide the software development.

Tests should evaluate the software from both perspectives. They should evaluate
basic functionality, of course, but beyond that, should quantify and validate
the performance requirements. For a particular element it would be desirable to
know the limits of performance that lie beyond the formal requirements and make
use of those margins by relaxing the requirements of another element if needed.

## Data Acquisition Daemon (dcs-daq)

The DAQ daemon sends (eg. PUB) data that consists of time stamped channel
values. If the implementation uses a ZeroMQ socket to achieve this then we can
identify it as a potential performance bottleneck for data throughput.

### Prototype for Characterizing ZeroMQ Data Throughput Limits

To do this we will need to consider the following:

* The number of publishing sockets
* The size of the message
* Is the data from the devices aggregated in any way
* If so, does it need to synchronized internally, not at all, or system wide.

As a first pass proof of concept these could be used:

* 1 socket
* A single channel message (eg. "ai0": { "timestamp": "xxx", "value": 1.23 })
  where the timestamp conforms to ISO 8601 and the value is a floating point
  double number.
* The single channel messages are consolidated into rows.
* The data is internally synchronized and comes from three device sources so
  each row of data needs only a single time stamp.

To prototype this in a realistic way, generate streaming DAQ data from 3 PCI1710
devices that are triggered by an external source. Each device will create its
own datastream that gets queued onto its respective buffer. The buffers are read
three at a time to create the time stamped row messages. These messages are
queued (or not?) and sent out on a ZMQ publishing socket.

A receiving program can connect to the socket and read the data and compare it
to a real time clock. Taking the difference between the real time clock and the
time stamp will give the latency. The receiving program can write these values
to a file and also print to stdout, a finite length average along with the
maximum and minimum values since the program started.

### Things to try:

* Find the acquisition speed limit by increasing the external clock frequency
  until something fails.
* Increase the number of publishing and receiving sockets and repeat the test.
* Try sending single values rather than row messages
* Monitor the CPU performance with top. Log it if possible.

<!--
vim: ft=liquid
-->
