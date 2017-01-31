---
layout: post
title:  OpenDCS Performance Specification
author: Stephen Roy<stephen.roy@coanda.ca>
date:   2016-09-16 11:18:00 -0700
---

## Introduction

OpenDCS is a set of distributed components that communicate using ZeroMQ as the
messaging bus. This plan will evaluate both the component and system level
performance. Key metrics of performance in general are:

* Speed
* Latency
* Capacity
* Availablility
* Accuracy
* Reliablility
<!--break-->

Each component and system is specified in order to meet the general metrics of
performance, which would address the following:

* Data channel capacity - the number of channels available in the network.
* Data processing capacity - the amount of live data the system is able buffer
  and hold while processing.
* Data storage capacity - the quantity of data that can be archived in the
  file system.
* Data storage and retrieval speed - the rate at which data archive can be
  written to and queried.
* Data acquisition rate - the speed at which data measurements can be acquired
  and sent.
* Data transmission latency - the time difference between the instant of
  measurement and the moment when the data becomes available to a process; a
  graph, for example.
* Clock Synchronization and timestamp accuracy.
* Fault tolerance - does the system respond favorably to, for example, a
  single point network failure, a power outage etc.

### Normalized Performance

Since it is difficult to specify the software performance independent of the
hardware and operating system, normalized specification may be given for the
purpose of comparing different systems.  Dhrystone is used to benchmark the test
environment. The result of this test is "stated in DMIPS/MHz, where DMIPS result
is further divided by CPU frequency, to allow for easier comparison of CPUs
running at different clock rates" [Wikipedia].

Normalized latency would then be:

  * Latency [us] / Dhrystone [DMIPS/MHz] = Latency (normalized)
    [DMIPS<sup>-1</sup>]

The benchmark test could be changed to something that reflects the scaled
performance for the given requirements of the test.

## Background

OpenDCS is a project that came from a need to create data acquisition systems
where components of the acquisition as well as the interface were configurable.
Original projects were basic applications that loaded .ini files with linear
calibrations for voltage and current measurements, UI layout was manual and
tedious. A later revision added configurable and moved everything into a loosely
structured XML format, UI layout was still manual. The next iteration broke the
data acquisition side into a library that used XML files to configure every
component, this was/is libcld, the applications that used it were simplified for
the measurement of physical parameters, data logging, and feedback control, UI
layout was still manual.

The application was refactored into a project named dactl and XML configuration
of the common UI components was added, this removed the need to create a
dedicated executable for a new data acquisition and control system. Whenever a
new system was required with a different chart layout, more PID feedback control
loops, more measurement devices, etc. All that was needed was to edit the XML
and load the application. The limitations of this application were continually
addressed by adding a GModule based plugin system to extend the UI and add new
hardware compatibity without having to modify libcld which was starting to age
poorly.

The plugins worked well for the need but were started to show limitations in how
they were designed so OpenDCS was devised to separate the core components into a
distributed system using ZeroMQ as the messaging bus. These core components
include data acquisition and control (dcs-daq), data logging (dcs-log), and an
HMI (dcsg). Each of these have libpeas developed plugin systems for adding new
hardware devices, logging backends, and custom interface elements.

## Performance Specification

### System Performance

The system is configurable and so it is not useful to refer to it as a generic
type. System performance will depend on system design. It is intended that the
component specifications will be used to optimize the system design. In lieu of
a generalized system perfomance specification, reference design specifications
are given.

#### Reference System 0: PCI Data Acquistition System

Details:

* DAQ device: Advantech PCI-1710 Multifunction
* A single dcs-daq running on a PC as described in the test specification:
  * Intel® Core™ i5-4690 CPU @ 3.50GHz × 4
  * Memory: 7.7 GiB
  * OS: Fedora 23
  * OS Type: 64-bit
  * Kernel Version: 4.7.2-101.fc23.x86\_64
* A single dcs-log running on a separate PC:
  * Intel® Core™ i5-4570S CPU @ 2.90GHz × 4
  * Memory: 7.7 GiB
  * OS: Fedora 23
  * OS Type: 64-bit
  * Kernel Version: 4.5.5-201.fc23.x86\_64
* Data Acquisition Rates: 10 S/s, 1 kS/s, 100 kS/s
* Data Logging Rates: 10 S/s, 1 kS/s, 100 kS/s

Specification:

* Latency: XXX us, XXX cycles (normalized)
* Timing Jitter: XXX us, XXX cycles (normalized)

### Component Performance

All of the OpenDCS components use the ZMQ message queue and can be abstracted as one or more of the following:

* Publisher
* Subscriber
* Requester
* Responder

Specifically, the system components are:

* Data Acquisition Daemon (dcs-daq)
* Data Logging Daemon (dcs-log)
* Control Daemon (dcs-control)
* GUI (dcsg)
* Tools
  * System Monitor (dcs-top)
  * Subscriber Analyzer (dcs-sub)
  * Publisher Analyzer (dcs-pub)
  * Requester Analyzer (dcs-req)
  * Responder Analyzer (dcs-rep)

[Maybe all the tools above could be realised in one component type]

#### Publisher

  * Bandwidth: > XXX Mbit/s, < XXX
  * Normalized Bandwidth: XXX Mbit/cycle
  * Latency: XXX microseconds
  * Normalized Latency: XXX cycles
  * Timing Jitter: XXX microseconds
  * Bit Error Rate: XXX e-9

#### Subscriber

  * Bandwidth: > XXX Mbit/s, < XXX
  * Relative Bandwidth: XXX Mbit/cycle
  * Latency: XXX microseconds
  * Normalized Latency: XXX cycles
  * Timing Jitter: XXX microseconds
  * Bit Error Rate: XXX e-9

#### Requester

  * Bandwidth: > XXX Mbit/s, < XXX
  * Normalized Bandwidth: XXX Mbit/cycle
  * Latency: XXX microseconds
  * Normalized Latency: XXX cycles
  * Timing Jitter: XXX microseconds
  * Bit Error Rate: XXX e-9

#### Responder

  * Bandwidth: > XXX Mbit/s, < XXX
  * Relative Bandwidth: XXX Mbit/cycle
  * Latency: XXX microseconds
  * Normalized Latency: XXX cycles
  * Timing Jitter: XXX microseconds
  * Bit Error Rate: XXX e-9

### Data Acquisition Daemon (dcs-daq)

(TBD: provide a link)

### Data Logging Daemon (dcs-log)

(TBD: provide a link)

### Control Daemon (dcs-control)

(TBD: provide a link)

### GUI (dcsg)

(TBD: provide a link)

<!--
vim: ft=liquid
-->
