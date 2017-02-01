---
layout: post
title:  System Requirements Specification for OpenDCS
author: Geoff Johnson <geoff.jay@gmail.com>
date:   2016-09-07 19:20:10 -0700
description: An SRS for the OpenDCS as an entire system.
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
## What is OpenDCS?

It is a framework consisting of a suite of applications that is used to create a
distributed data acquisition and control network.

## Why?

 * It simplifies software development because of its modular implementation.
 * It simplifies configuration of a distributed control system.
 * It simplifies customization and feature addition.
 * It enables networked functionality.
   * It can distribute CPU load and memory requirements.
   * Remote access for monitoring and configuration is possible.
   * Remote location of sensors and equipment is possible.
 * It enables the use of simple embedded devices with limited functionality.
 * It enables simultaneous exchange of data between nodes (ie. You don't need to
   worry about multitask management as much)

## Who will use it?

 * Researchers with complex instrumentation, data acquisition and
   control requirements working in a laboratory environment.
 * People who require industrial automation capability without the complexity,
   and expense of commercially available software.
 * People who want to add functionality by creating their own software that is
   freely and easily integrated with OpenDCS.

## Functionality
<!--What does the system do?-->
OpenDCS
The system has four main functions:
 * Data acquisition
 * Data logging
 * Feedback control <!-- ..or real time automation--> <!-- and real time data manipulation -->
 <!-- Should there be non-real time manipulation? Maybe we need to distinguish?
 -->
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

### External Interfaces
<!-- excluding GUI. Maybe call it "Data Exchange and Communication" -->

 * ZeroMQ: Communication between applications uses [ZeroMQ](http://zeromq.org)
 * REST API
<!--Should there be anything about DBUS here?-->
<!--How about ProfinetIO and Modbus?-->

### Plugins

<!-- Maybe add a link to information on how to make your own plugin-->
<!--Any reference to libpeas here?-->

 The applications implement a common plugin system, which further enhances the
 modularity and flexibility of the system. An example of this would be the data
 acquisition daemon which can have a plugin for a particular piece of DAQ
 hardware. A new type of device is added to the system by creating and
 installing a plugin that interacts with the application in a standardized fashion.

 <!--What about things like ProfinetIO and MODBUS? Is this supported in the
 library? Is this supported for inter application communication (ie. it replaces
 ZMQ)?
 -->

## Performance

General performance requirements are:

 * The system shall have as fast a response time.
   * High speed data acquisition is possible.
   * High speed control systems are possible.
   * The GUI responds quicly to input an provides real time updates to the
     display.
<!--
   -What about timing accuracy and synchronization? Should there be at least a
   -placeholder for that?
   -->

## Hardware / Software Performance Partitioning

<!--
   -Does it bear repeating that the system is modular and can be distributed and
   -therefore the partitioning is configurable?
   -->

## Safety Requirements

<!--
   -Consider the fact that it can be used to control high power motors and equipment
   -and that there is an inherent risk in that. Maybe some safety features need to
   -be added for such things (e.g. Automatically check that an emergency stop is
   -present. Design fail safe software if possible.)
   -
   -Can a remote user operate controls that could harm someone?
   -
   -->
## User Interface

<!--Should there be a user manual?-->
### Data Representation
 * Graphs
  * Strip charts
  * Two dimensional plots (rectangular, polar)
  <!--* Three dimensional plots (Cartesian, spherical)-->
  * Heat mapping
  * Access to archived data for graphing
 * Numerical output
  * Tree view
  * Control view
  * Values overlaid onto a drawing:w

### Controls
 * PID control widget
 * Analog output setting widget
 * Digital output setting widget
 * Activation of logging functions

### System Configuration
 * Edit the system configuration

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
