---
layout: post
title:  OpenDCS Performance Test Plan
author: Stephen Roy<stephen.roy@coanda.ca>
date:   2016-09-30 12:20:00 -0700
description:
permalink:
---

## Performance Tests

The emphasis of OpenDCS performance is on its ability to acquire and process
data efficiently, responsively and reliably. <!--break-->Initially these tests
are intended to reveal system vulnerablilities and are defined in a way that
will facilitate further analysis. Conformance tests will be added later that
ensure compliance to a minimum standard.

## Test Environment

All tests will be performed using the following:

* Intel® Core™ i5-4690 CPU @ 3.50GHz × 4
* Memory: 7.7 GiB
* OS: Fedora 23
* OS Type: 64-bit
* Kernel Version: 4.7.2-101.fc23.x86_64

#### Publish Test

The utility program **dcs-test-publish** is used to test the performance of a
generic publishing socket. A number of tests can be performed to evaluate and
characterize itself. Published data does not need a subscriber though it may be
useful to connect a **dcs-test-subscribe**to it for the purpose of monitoring.

##### Maximum Publishing Rate

The test utility will be sending messages at progressively increasing rates in
order to determine its maximum publish rate or, more generally, its bandwidth.
Messages can be configured as single point, single row, blocked single or blocked
row. The message rate for each configuration will be increased from a minimum
value once the performance metrics have stabilized.

The performance metrics are:

* **latency** - the difference in time between the time value of the first
  generated point in a message and the time value at which the message was sent.
* **jitter** - the variablility of the latency.
* %CPU
* %Memory

An example command to set the publisher :

Publish data continuously on 127.0.0.1:5588 at 1000 messages per second. The
message consists of 16 values per timestamp in blocks of 10. Write the status to
a log file once every second. Start transmitting data immediately.

```bash
dcs-test-publish -b 127.0.0.1 -p 5588 -t TCP \
-m 1000 -R 16 -B 10 -n 100000 -l ./log.txt -g 1 start
```

The log file will contain the performance metrics data. If these have not
reached a steady state then increase the number of blocks that are sent **-n**.

Commands can also be run sequentially using the **-s** option if an automated
test is desired.

#### Subscribe Test

The utility program **dcs-test-publish** and **dcs-test-subscribe** are used
together in this test which evaluates the performance of a generic subscriber.

##### Maximum Subscribing Rate

As in the publisher test, a publishing utility will be sending messages at
progressively increasing rates. The publisher must be running on a separate
computer so that it will not influence the CPU performance of the subscrier
computer.  Messages can be configured as single point, single row, blocked
single or blocked row. The message rate for each configuration will be increased
from a minimum value once the performance metrics have stabilized.

Given that any subscriber test will require a publisher, it is yet to be
determined if the maximum subscribing data rate will limited by the publisher.

The performance metrics are:

* **latency** - the difference between the time the message was received and
  the time that the data was processes. This is somewhat open to
  interperetation. The intent is to find out how much time is spent in a queue
  or in processing.
* **jitter** - the variablility of the latency.
* %CPU
* %Memory

An example command to set the publisher :

Subscribe data continuously from 127.0.0.1:5588. Receive 100 messages Write the
status to a log file once every second. Start receiving data immediately data
immediately.

```bash
dcs-subscribe -a 127.0.0.1 -p 5588 -t TCP -n 10 -l ./log.txt -g 1 start
```

#### Publish-Subscribe Test

This test combines the previous two tests to evaluate the end-to-end performance
of the publish-subscribe configuration. These three tests can all be run
simultaneously as one inclusive test.  The performance metrics are:

* **latency** - the difference between the time a message was sent and when it was
  received.
* **jitter** - the variablility of the latency.
* %CPU
* %Memory

#### Request Test

The request functionality depends on itself to generate and send requests
without delay. The test utility will be sending messages at progressively
increasing rates in order to determine its maximum request rate or, more
generally, its bandwidth.  Messages can be configured by setting it to a fixed
value or as a random length generic message. The message rate for each
configuration will be increased from a minimum value once the performance
metrics have stabilized.  The performance metrics are:

* **latency** - the difference between the time the message is generated and
  when it was sent.
* **jitter** - the variablility of the latency.
* %CPU
* %Memory

An example command to set the requester:

Send 5000 requests to 127.0.0.1:5588 at 1000 requests per second. The message
length is 500 bytes. Write the status to a log file 12 times every second. Start
transmitting data immediately.

```bash
dcs-request -a 127.0.0.1 -p 5588 -t TCP -C 5000 \
-m 1000 -L 500 -l ./log.txt -g 12 start
```

The log file will contain the performance metrics data. If these have not
reached a steady state then the messaging rate will need to be increased **-n**.

Commands can also be run sequentially using the **-s** option if an automated
test is desired.

#### Reply Test

The reply test requires a request utility running on a separate computer to
generate requests. The reply utility will be receiving messages at progressively
increasing rates in order to determine its maximum receive rate or, more
generally, its bandwidth.  Messages can be configured by setting it to a fixed
value or as a random length generic message. The message rate for each
configuration will be increased from a minimum value once the performance
metrics have stabilized.  The performance metrics are:

* **latency**
  * **send latency** - the difference between the time a request is generated
    and when it was sent.
  * **receive latency** - the difference between the time a reply was received
    and when it was processed.
* **jitter** - the variablility of the latency.
* %CPU
* %Memory

An example command to set the requester:

Send 5000 replys from 127.0.0.1:5588. Write the status to a log file 12 times
every second. Start responding to requests immediately.

```bash
dcs-reply -a 127.0.0.1 -p 5588 -t TCP -C 5000 -l ./log.txt -g 12 start
```

The log file will contain the performance metrics data. If these have not
reached a steady state then the messaging rate will need to be increased **-n**.

Commands can also be run sequentially using the **-s** option if an automated
test is desired.

#### Request-Reply Test

This test combines the previous two tests to evaluate the end-to-end performance
of the request-reply configuration. These three tests can all be run
simultaneously as one larger test. The performance metrics are:

* latency
  * **request latency** - the difference between the time a request was sent
    and when it was received.
  * **reply latency** - the difference betweeen the time a reply was sent and
    and when the is was received.
* **jitter** - the variablility of the latency.
* %CPU
* %Memory


#### Analysis

To analyze the results, plot the performance metrics versus the bit rate, rather
than the message rate. A measure of bandwidth could serve as a summary for the
test where, for example, it is the bit rate at which the %CPU drops to 50% or
the latency value is twice the value it is at the minimum bit rate. This is
comparable to the familiar 3 dB bandwidth.

The results of these tests will aid in the design of an optimal messaging format
as well as reveal speed limitations of the communications and individual
components. Looking at the relative contributions from each of these will give a
perspective view on areas that need improvement.

## External Links

[Software performance testing](https://en.wikipedia.org/wiki/Software_testing) (Wikipedia)

<!--
vim: ft=liquid
-->
