---
layout: post
title:  Screenshots
author: Geoff Johnson <geoff.jay@gmail.com>
date:   2016-10-19 17:45:45 -0700
description: Some screenshots showing possible configurations.
categories: opendcs updates
---

OpenDCS spawned from an application that has been used for a number of years in
a research setting where projects involve measuring and controlling processes
using data acquisition devices. Future posts will do a better job of showing how
to configure the various application components, I just thought I'd post some
images to show some examples of different application configurations.
<!--break-->

#### Example 1

Shows an application configuration with:

* 32 channel comedi PCI input DAQ card (Advantech PCI-1713)
* 2 x 8 channel comedi PCI output DAQ card (Advantech PCI-1723)
* 32 analog input channels
* 16 analog output channels
* 13 PID control loops
* 3 manual analog output interface elements
* 13 analog input interface elements
* a logging interface element *(upper left)*
* a channel tree displaying measured inputs and outputs *(left)*
* 3 stripcharts set to display one or more measured inputs

[![ex1]][ex1]{: target="_blank" }

#### Example 2

Shows an application configuration with:

* a logging interface element *(upper left)*
* a channel tree displaying measured inputs *(middle left)*
* a custom plugin to communicate with a Futek IM650 torque cell *(middle-bottom
  left)*
* a custom plugin to communicate with a Siemens S110 PLC over Modbus *(bottom
  left)*
* 2 stripcharts set to display one or more measured inputs

[![ex2]][ex2]{: target="_blank" }

#### Example 3

Shows an application configuration with:

* 32 channel comedi PCI input DAQ card (Advantech PCI-1713)
* 8 channel comedi PCI output DAQ card (Advantech PCI-1723)
* 32 analog input channels
* 8 analog output channels
* a logging interface element *(upper left)*
* a channel tree displaying measured inputs *(middle left)*
* 2 PID control loops *(middle-bottom left)*
* a custom plugin to control a sequence of actions of digital output channels
  *(bottom left)*
* 3 stripcharts set to display one or more measured inputs

[![ex3]][ex3]{: target="_blank" }

[ex1]:{{ site.baseurl }}/assets/img/screenshots/config-example1.png
[ex2]:{{ site.baseurl }}/assets/img/screenshots/config-example2.png
[ex3]:{{ site.baseurl }}/assets/img/screenshots/config-example3.png

<!--
vim: ft=liquid
-->
