---
layout: post
title:  System Requirements Specification for OpenDCS
author: Geoff Johnson <geoff.jay@gmail.com>
date:   2016-09-07 19:20:10 -0700
description: An SRS for the OpenDCS as an entire system.
categories: requirements
permalink: /doc/requirements/opendcs-srs
---

<!--
The following is a high level list of requirements that should be addressed in a
System Specification:

Define the functions of the system
Define the Hardware / Software Functional Partitioning
Define the Performance Specification
Define the Hardware / Software Performance Partitioning
Define Safety Requirements
Define the User Interface (A good user's manual is often an overlooked part of
the System specification. Many of our customers haven't even considered that
this is the right time to write the user's manual.)
Provide Installation Drawings/Instructions.
Provide Interface Control Drawings (ICD's, External I/O)
-->

The system requirements for OpenDCS are described in this section, it contains
information about the functionality of the system as a whole. OpenDCS is a
platform that has the potential to integrate with electrical and mechanical
systems so it is necessary to comment on the software interactions with such
systems, but due to the nature of the design it would be impossible to enforce
strict rules governing external systems that are mechanical, electrical and
software.<br/>
<!--break-->

## Functionality
The system has four main functions:
 * Data acquisition
 * Data logging
 * Feedback control
 * Graphical user interface

The system shall:
 * Control the data acquisition hardware.
 * Record the data from the data acquisition hardware.
 * Retrieve and manage data records.
 * Route data and messages freely between nodes of the network.
 * Measure the process variables and generate the output signals of a control system.
 * Provide a graphical user interface to the data and controls.
 * Provide a REST API service for the system.
 * Load a configuration from a file.

The system should
 * Monitor and log the system activity and status.


## Hardware / Software Functional Partitioning

### Applications
The system uses consists of the following applications:
 * Data acquisition daemon
 * Data logging daemon
 * Control system daemon
 * Graphical user interface daemon

 Communication between applications is over [ZeroMQ](http://zeromq.org) or via
 REST API. Multiple instances of a particular daemon are possible. These are self
 contained applications that operate independent of the system as a whole.
 This modular approach serves several purposes that include:

 * Distribution of services to multiple locations.
 * Distribution of CPU load and hardware requirements.
 * Modularity, which simplifies software design, useage and maintainence.

### Plugins

 The applications implement a common plugin system, which further enhances the
 modularity and flexibility of the system. An example of this would be the data
 acquisition daemon which can have a plugin for a particular piece of DAQ
 hardware. A new type of device is added to the system by creating and
 installing a plugin that interacts with the application in a standardized fashion.

## Performance

General performance requirements are:

 * The system shal have as fast a response time.
   * High speed data acquisition is possible.
   * High speed control systems are possible.
   * The GUI responds quicly to input an provides real time graphical output.

## Hardware / Software Performance Partitioning

## Safety Requirements

## User Interface

## Installation Instructions

## Interface Control Drawings

<hr/>

References:

1. [Requirements Specification for Process-Control Systems][ieee-req]
2. [How to Write a Software Requirements Specification][microtools]

[ieee-req]: http://sunnyday.mit.edu/papers/tcas-tse.pdf
[microtools]: http://www.microtoolsinc.com/Howsrs.php

<!--
vim: ft=liquid
-->
