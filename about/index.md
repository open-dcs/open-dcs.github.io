---
layout: page
title: About
---

OpenDCS is a project that came from a need to create data acquisition systems
where components of the acquistion as well as the interface were configurable.
Original projects were basic applications that loaded .ini files with linear
calibrations for voltage and current measurements, UI layout was manual and
tedious. A later revision added configurable and moved everything into a
loosely structured XML format, UI layout was still manual. The next iteration
broke the data acquisition side into a library that used XML files to configure
every component, this was/is [libcld](https://github.com/geoffjay/libcld), the
applications that used it were simplified for the measurement of physical
parameters, data logging, and feedback control, UI layout was still manual.

The application was refactored into a project named
[dactl](https://github.com/coanda/dactl) and XML configuration of the common UI
components was added, this removed the need to create a dedicated executable
for a new data acquisition and control system. Whenever a new system was
required with a different chart layout, more PID feedback control loops, more
measurement devices, etc. All that was needed was to edit the XML and load the
application. The limitations of this application were continually addressed by
adding a GModule based plugin system to extend the UI and add new hardware
compatibity without having to modify libcld which was starting to age poorly.

The plugins worked well for the need but were started to show limitations in
how they were designed so OpenDCS was devised to separate the core components
into a distributed system using ZeroMQ as the messaging bus. These core
components include data acquisition and control (dcs-daq), data logging
(dcs-log), and an HMI (dcsg). Each of these have libpeas developed plugin
systems for adding new hardware devices, logging backends, and custom interface
elements.

<!--
vim: ft=liquid
-->
