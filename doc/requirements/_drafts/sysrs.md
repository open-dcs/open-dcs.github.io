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

{% comment %} Start of new format {% endcomment %}

{% comment %}
Acronyms for requirements:
// for specific and quality requirements ?
ID    - requirement identifier
TAG   - short form of name
DESC  - description
RAT   - rationale
DEP   - dependencies
// for quality requirements ?
GIST  - rough summary
SCALE - the unit for the req to be measured in
METER - the way in which the measurement will be performed, can specify test
PAST  - benchmark typ. for products dev'd in past
REC   - (record) benchmark represents best value achieved for meter
MUST  - minimal goal value
PLAN  - desired goal value
WISH  - value aimed for under-optimal circumstances (don't do this one)
{% endcomment %}

## Specific Requirements

This section contains all of the functional and quality requirements of the
system. A detailed description of the system and all its features is given.

### External Interface Requirements

This section provides a detailed description of all inputs into and outputs from
the system. A description of the hardware, sofware, and communication interfaces
are given.

#### User Interfaces

| ID:   | __UIR-0001__ |
| TAG:  | GNOME Guidelines |
| DESC: | All user interface design elements that uses GTK+ should follow [GNOME Human Interface Guidelines](https://developer.gnome.org/hig/stable/) |
| RAT:  | Produce a high quality experience for the user. |
| DEP:  | None |

---

ID: __UIR-0002__<br>
TAG: Web login/register page<br>
DESC: A user of the web interfaces to any of the daemon services should see a
log-in page when the application is loaded, see UIR-0002-1 . If the user has not
registered, the log-in page should give the option to do so.<br>
RAT:  A user must be registered to login to systems that have restricted access.<br>
DEP: FR-0001<br>

{% comment %}see - https://getbootstrap.com/examples/signin/{% endcomment %}

---

ID: __UIR-0003__<br>
TAG: HMI login<br>
DESC: A user of the HMI should receive a log-in page when the
application is opened, see Figure UIR-0003-1. Once a user has logged in a session
token will be used to authenticate with the remote system components.<br>
RAT: Authentication is required to use remote system components that have
restricted access.<br>
DEP: UIR-0001, FR-0001<br>

|---
| ![UIR-0003-1](/assets/img/requirements/UIR-0003-1.png "Figure UIR-0003-1")
|---
| *Figure UIR-0003-1*

---

ID: __UIR-0004__<br>
TAG: View only guest login<br>
DESC: If the user is not recognized by the system the option to proceed
as a view-only guest should be presented, see Figure UIR-0004-1.<br>
RAT: Allow limited access to unauthorized users.<br>
DEP: UIR-0001, FR-0001<br>

|---
| ![UIR-0004-1](/assets/img/requirements/UIR-0004-1.png "Figure UIR-0004-1")
|---
| *Figure UIR-0004-1*

---

{% comment %}
This is a general requirement for setting anything from the HMI
{% endcomment %}

ID: __UIR-0005__<br>
TAG: Configure settings<br>
DESC: A user of the HMI shall be able to view and configure settings from a
selected category.<br>
RAT: It should be possible to view and change all settings from the HMI.<br>
DEP: UIR-0001

|---
| ![UIR-0005-1](/assets/img/requirements/UIR-0005-1.png "Figure UIR-0005-1")
|---
| *Figure UIR-0005-1*

---

ID: __UIR-000#__<br>
TAG: Configure daemon settings<br>
DESC: A user of any daemon service can configure the different settings that it
has available using a common layout presented as a web page using bootstrap, and
is hosted by that daemon.<br>
RAT: It should be possible to view and change all settings for any daemon
service from a web page.<br>
DEP: UIR-0001

---

ID: __UIR-0006__<br>
TAG: Configure network settings<br>
DESC: A user of the HMI shall be able to display and configure the network.<br>
RAT: To see which system components are connected and how they are configured<br>
DEP: UIR-0001, UIR-0005

---

ID: __UIR-0007__<br>
TAG: Configure logging daemon settings<br>
DESC: A user of the HMI shall be able to display and configure data logging
daemon settings using the web page it provides by drawing it in a WebKit widget,
see Figure #.<br>
RAT: It should be possible to view and change the parameters affecting the
logging daemon.<br>
DEP: UIR-0001, UIR-0006<br>

---

ID: __UIR-0008__<br>
TAG: Configure data acquisition daemon settings<br>
DESC: A user of the HMI shall be able to display and configure data aquisition
daemon settings using the web page it provides by drawing it in a WebKit widget,
see Figure #.<br>
RAT: It should be possible to view and change the parameters affecting the
data acquissition daemon.<br>
DEP: UIR-0001, UIR-0006<br>

---

ID: __UIR-0009__<br>
TAG: Configure feedback control daemon settings<br>
DESC: A user of the HMI shall be able to display and configure feedback control
daemon settings using the web page it provides by drawing it in a WebKit widget,
see Figure #.<br>
RAT: It should be possible to view and change the parameters affecting the
feedback control daemon.<br>
DEP: UIR-0001, UIR-0006<br>

---

ID: __UIR-0010__<br>
TAG: Configure HMI layout
DESC: A user of the HMI should be able to display and configure the flexible layout
configuration for itself, see Figure #.<br>
RAT: It should be possible to view and change the parameters affecting the
feedback control daemon.<br>
DEP: UIR-0001, UIR-0006<br>

---

ID: __UIR-0011__<br>
TAG: Configure HMI plugin
DESC: A user of the HMI should be able to display and configure HMI addin plugin
settings, see Figure #.<br>
RAT: It should be possible to view and change what and how information is
displayed.<br>
DEP: UIR-0001, UIR-0010

---

{% comment %}
TODO make mention in the next three requirements on how configuring each uses
the web page provided by the plugin and is accessed through the daemon web/rest
server that does the settings for itself
{% endcomment %}

ID: __UIR-0012__<br>
TAG: Configure device plugin
DESC: A user of the HMI should be able to display and configure the device plugins
loaded by any data acquisition daemons that it is connected to, see Figure #.<br>
RAT: It should be possible to view and change parameters that affect devices<br>
DEP: UIR-0001, UIR-0008<br>

---

ID: __UIR-0013__<br>
TAG: Configure logging back end plugin
DESC: A user of the HMI should be able to display and configure the backend plugins
loaded by any data logging daemons that it is connected to, see Figure #.
RAT: It should be possible to what and how data is stored and retrieved.<br>
DEP: UIR-0001, UIR-0007<br>

---

ID: __UIR-0014__<br>
TAG: Configure feedback controller plugin<br>
DESC: A user of the HMI should be able to display and configure the controller plugins
loaded by any feedback control daemons that it is connected to, see Figure #.<br>
RAT: It should be possible to display and configure the parameter that affect
feedback control, <br>
DEP: UIR-0001, UIR-0009<br>

#### Hardware Interfaces

ID: __HWIR-0001__<br>
TAG: RS-232 Serial Port<br>
DESC: A serial port data acquisition device should be able to connect to the
system.<br>
RAT: Plugin device development will make use of serial port core functionality.<br>

---

ID: __HWIR-0002__<br>
TAG: Ethernet<br>
DESC: The system shall communicate using 10BASE-T, 100BASE-TX and 1000BASE-T.<br>
RAT: The physical system components connect to the network useing Ethernet.<br>

---

ID: __HWIR-0003__<br>
TAG: Number of Ethernet Ports<br>
DESC: The number of ports required shall depend on how the system configuration
for a particular application and whether it needs to connect to remote hardware.<br>
RAT:<br>

---

ID: __HWIR-0004__<br>
TAG: Processor speed<br>
DESC: The system components shall each have a 400 MHz or faster processor.<br>
RAT: The software requires a reasonably fast processor to handle the data and
run a user interface.<br>

---

D: __HWIR-0005__<br>
TAG: Display<br>
DESC: A 1920 x 1080 (16:9) monitor should be used.<br>
RAT: A good user experience that represents a reasonable amount of data
necessarily requires a display with sufficient resolution.<br>

#### Software Interfaces

ID: __SWIR-0001__<br>
TAG: Operating System<br>
DESC: The software architecture shall be 64-bit GNU+Linux (e.g. Fedora 25)<br>
RAT: n/a<br>
DEP: n/a<br>

#### Communications Interfaces

ID: __CIR-0001__<br>
TAG: Internet Protocol<br>
DESC: The system shall use TCP/IP v4<br>
RAT:<br>
DEP:<br>

### Functional Requirements

#### Common Requirements

{% comment %}
When is pub/sub used vs. req/reply? See https://ayende.com/blog/3265/request-reply-vs-pub-sub
"
10 Apr 2008
22:20 PM Nathan
Isn't pub/sub VS request/response an infrastructure issue? Or at least an
architectural one. It sounds like your talking about Event Driven Architecture.
Isn't the question - should a messaging system consist entirely of pub/sub
channels, or is it also appropriate to have request/response channels for
certain types of calls? If the discussion is purely about coding style, (wrap
the async call with a sync api or use a callback) it probably doesn't make a
bit of difference in the end and isn't really about pub/sub or
request/response. If it's more than an API /coding style discussion though I
simply agree with you, I think, in that for certain types of communication
eventing-only will make the overall system rather more complicated that
necessary regardless of how you design the endpoint API. I haven't spent too
much time studying EDA concepts but if EDA enthusiasts promote only pub/sub
channels and nothing but it seems extreme to me, too.
"

{% endcomment %}

ID: __FR-0001__<br>
TAG: Connectivity<br>
DESC: Requirements that enable communication between and are common to all system
components that shall be met.<br>
RAT: Interoperability of the system components requires a common messaging queue.
DEP: FR-0002, FR-0003, FR-0004<br>

---

ID: __FR-0002__<br>
TAG: Publishing socket<br>
DESC: A configurable ZeroMQ publishing socket shall be available.<br>
RAT: A daemon shall be able to publish data on a ZeroMQ socket.<br>
DEP: none<br>

---

ID: __FR-0003__<br>
TAG: Subscribing socket
DESC: A configurable ZeroMQ subscribing socket shall be available.<br>
RAT: A daemon can subscribe to published data from other system components.<br>
DEP: none<br>

---

ID: __FR-0004__<br>
TAG: Request/Reply Socket<br>
DESC: A ZeroMQ request/reply socket shall be available.<br>
RAT: A daemon can request and receive data from a connected system component.<br>
DEP: none<br>

#### Data acquisition

ID: __FR-xxxx__<br>
TAG: Data acquisition common system requirements<br>
DESC: The common requirements shall be met<br>
RAT:<br>
DEP: FR-0001<br>

---

ID: __FR-xxxx__<br>
TAG: Publish data<br>
DESC: Data messages shall be published on the socket containing: <br>
 * Channel measurements
 * Time stamps
 * Broadcast status/warnings
RAT:<br>
DEP: FR-0002<br>

---

ID: __FR-xxxx__<br>
TAG: Subscribe to messages <br>
DESC: The data acquisition system component shall be able to subscribe to
published messages including: <br>
 * ????
RAT:<br>
DEP: FR-0003<br>

---

ID: __FR-xxxx__<br>
TAG: Start <br>
DESC: The data acquisition system component shall start publishing data in
response to a request to do so if it has not already started: <br>
 * ????
RAT:<br>
DEP: FR-0002<br>

---

ID: __FR-xxxx__<br>
TAG: Stop <br>
DESC: The data acquisition system component shall stop publishing data in
response to a request to do so. <br>
 * ????
RAT:<br>
DEP: FR-0002<br>

---

{% comment %}
OR ....
{% endcomment %}

ID: __FR-xxxx__<br>
TAG: Automatic start <br>
DESC: The data acquisition system component shall start publishing data
immediately <br>
 * ????
RAT:<br>
DEP: FR-0002<br>

#### Data logging

ID: __FR-xxxx__<br>
TAG: Data logging common system requirements<br>
DESC: These common requirements shall be met<br>
RAT:<br>
DEP: FR-0001<br>

---

ID: __FR-xxxx__<br>
TAG: Publish back end malfunction warning
DESC: Data messages shall be published as a warning when its back end data
storage is not functioning.
RAT: To allow the subscribing GUI interface to alert the user.<br>
DEP: FR-0002<br>

---

ID: __FR-xxxx__<br>
TAG: Subscribe to published data from data acquisition system.
DESC:
RAT:
DEP: FR-0003<br>

#### Feedback control

ID: __FR-xxxx__<br>
TAG: Feedback control common system requirements<br>
DESC: These common requirements shall be met<br>
RAT: <br>
DEP: FR-0001<br>

---

ID: __FR-xxxx__<br>
TAG: Subscribe to input data<br>
DESC: The logging system will subscribe to published data from the data
acquisition system and filter out the channel measurement data that it needs.<br>
RAT: Input data is required for its calculations.
DEP: FR-0003<br>

---

ID: __FR-xxxx__<br>
TAG: Publish output data<br>
DESC: The logging system shall publish the data resultant of it calculations.<br>
RAT: Output data is required to control process variable outputs.
DEP: FR-0002<br>

#### Human Machine Interface (HMI)
{% comment %}
Is this the same User Interface requirements?
{% endcomment %}

ID: __FR-xxxx__<br>
TAG: Data acquisition common system requirements<br>
DESC: These common requirements shall be met<br>
RAT:<br>
DEP: FR-0001<br>

---

ID: __FR-xxxx__
TAG: Customization
DESC: The layout of interface elements shall be customizable.
RAT: The system needs to be flexible so that data can be presented in a useful manner.
DEP: none

---

ID: __FR-xxxx__<br>
TAG: Subscribe to data acquisition system data.
DESC:
RAT:
DEP: FR-0003 <br>

### Non-functional Requirements
{% comment %} aka quality requirements {% endcomment %}

#### Performance

The requirements in this section provide a detailed specification of the user
interaction with the software and measurements placed on the system performance.

{% comment %} Qualitative {% endcomment %}

##### Usage of the data log query feature

ID:QR#<br>
GIST: Data log query response time<br>
SCALE:<br>
METER:<br>
MUST:<br>
PLAN:<br>
WISH:<br>


##### Usage of the data acquisition message publish feature

##### Usage of the data acquisition message subscribe feature

{% comment %} Quantitative {% endcomment %}

##### Configuration modification request response time

ID:<br>
GIST:<br>
SCALE:<br>
METER:<br>
MUST:<br>
PLAN:<br>
WISH:<br>

##### Configuration information request response time

##### Sample rate capacity of data acquisition daemon

##### Sample rate capacity of data logging daemon

##### Sample rate capacity of feedback control daemon

##### System dependability of the data acquisition daemon

ID: QR#<br>
GIST: The fault tolerance of the system.<br>
SCALE: If the system loses its connection to the building network, another
connected component, or a malformed message, the user should be informed.<br>
METER: Measurements obtained from 100 hours of usage during testing<br>
MUST: 99.99% of the time<br>
WISH: 100% of the time<br>

##### System dependability of the data logging daemon

ID: QR#<br>
GIST: The fault tolerance of the system.<br>
SCALE: If the system loses its connection to the building network, another
connected component, or a malformed message, the user should be informed.<br>
METER: Measurements obtained from 100 hours of usage during testing<br>
MUST: 99.99% of the time<br>
WISH: 100% of the time<br>

##### System dependability of the feedback control daemon

ID: QR#<br>
GIST: The fault tolerance of the system.<br>
SCALE: If the system loses its connection to the building network, another
connected component, or a malformed message, the user should be informed.<br>
METER: Measurements obtained from 100 hours of usage during testing<br>
MUST: 99.99% of the time<br>
WISH: 100% of the time<br>

#### Design Constraints

This section includes the design constraints on the software caused by the
hardware.

##### Network bandwidth

ID: QR#<br>
GIST: TCP/IP network bandwidth.<br>
<!--SCALE: The application's need for network capacity.<br>-->
SCALE: Mbps<br>
<!--METER: Mbps<br>-->
METER: Measure the total number of message bits sent in a 1 minute time span.<br>
MUST: More than 100 Mbps<br>
PLAN: More than 500 Mbps<br>
WISH: More than 100 Mbps<br>
Mbps: DEFINED: Megabits per second<br>

##### Network latency

ID: QR#<br>
GIST: TCP/IP Network latency<br>
SCALE: microseconds<br>
METER: Measure the time difference between the time a message was sent and when
it was received<br>
MUST: 100ms<br>
PLAN: 100us<br>
WISH: 1us<br>

##### Data acquisition device speed

ID: QR#<br>
GIST: Data acquisition device speed<br>
SCALE: S/s<br>
METER: Measurement obtained by counting the number of single measurement values
acquired in 1 minute.<br>
MUST: 10 S/s<br>
PLAN: 1 kS/s<br>
WISH: 1 MS/s<br>
S/s: DEFINED: Samples per second

##### Hard drive read/write speed

ID: QR#<br>
GIST: Hard drive transfer rate<br>
SCALE: Mbps<br>
METER: The transfer rate is given by the manufacturer.<br>
MUST: 100 Mbps<br>
PLAN: 500 Mbps<br>
WISH: More than 500 Mbps<br>

##### Application memory usage

ID: QR#<br>
GIST: The recommended RAM space required to meet the performance and user
experience requirements.<br>
SCALE: Gb<br>
METER: The quantity of the installed RAM.<br>
MUST: 2 Gb<br>
PLAN: 8 Gb <br>
WISH: 32 Gb <br>
Gb: DEFINED: Gigabytes<br>

##### Application processor usage

ID: QR#<br>
GIST: The CPU useage.
SCALE: percent<br>
METER: Use the htop utility to measure this iver a 1 hour time period.
MUST: less than 50%<br>
PLAN: less than 25%<br>
WISH: less than 20%<br>

#### Software System Attributes

##### Reliability

ID: QR#<br>
GIST: Continuous operation<br>
SCALE: days<br>
METER: Observe a full functioned system running continuously for a number of days<br>
MUST: 90 days<br>
PLAN: 180 days<br>
WISH: 365 days<br>

##### Availability

ID: QR#<br>
GIST:<br>
SCALE:<br>
METER:<br>
MUST:<br>
PLAN:<br>

---

ID: QR#<br>
TITLE: Network connection<br>
DESC: The applications should be connected to a building network<br>
RAT: In order for the applications to speak with each other<br>
DEP: none<br>

---

ID: QR#<br>
TITLE: Remote access<br>
DESC: A user can access the system from outside the building network over a
secure network connection<br>
RAT: In order for a user to remotely monitor or download data from the system<br>
DEP: none<br>


##### Security

ID: QR2<br>
TITLE: Control access<br>
DESC: The daemons should provide a means to enable or disable secure
communications through an authentication mechanism.<br>
RAT: It should be possible to prevent unauthenticated requests.<br>
DEP: none

---

ID: QR#
GIST:
SCALE:
METER:
MUST:
PLAN:


##### Maintainability

ID: QR#
TITLE: Software upgrades<br>
DESC: Bug fixes and software upgrades can be applied using a package manager.<br>
RAT: Maintaining the software should be made simple by using an automated system.<br>
DEP: none

##### Portability

ID: QR#
TITLE:
DESC:
RAT:
DEP:

{% comment %} End of new format {% endcomment %}

The system should be designed to provide the following functionality:

1. Data acquisition
1. Data logging
1. Feedback control
  <!-- or real time automation-->
  <!-- and real time data manipulation -->
  <!-- Should there be non-real time manipulation? Maybe we need to distinguish? -->
1. Human Machine Interface (HMI)

The system shall:

* Be configurable using a consistent file format
* Be able to transmit data and settings using a standardized messaging format
* Interact with data acquisition hardware
* Record data received from the data acquisition hardware
* Provide the ability to retrieve and manage data records
* Route data and messages freely between its distributed components
* Measure process variables and generate any output signals of a control system
* Provide an HMI for an operator to view and interact with data and distribute
  components
* Define a consistent REST API format for the distributed components to use
* Define a consistent DBus API format for the distributed components to use

The system should:

* monitor and log the activity and status of its distributed components
*

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
<!-- Should there be anything about DBUS here? -->
<!-- How about ProfinetIO and Modbus? -->

### Plugins

<!-- Maybe add a link to information on how to make your own plugin -->
<!-- Any reference to libpeas here? -->

The applications implement a common plugin system, which further enhances the
modularity and flexibility of the system. An example of this would be the data
acquisition daemon which can have a plugin for a particular piece of DAQ
hardware. A new type of device is added to the system by creating and
installing a plugin that interacts with the application in a standardized fashion.

<!--
What about things like ProfinetIO and MODBUS? Is this supported in the library?
Is this supported for inter application communication (ie. it replaces ZMQ)?
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

{% comment %}
Does it bear repeating that the system is modular and can be distributed and
therefore the partitioning is configurable?
{% endcomment %}

## Safety Requirements

{% comment %}
Consider the fact that it can be used to control high power motors and equipment
and that there is an inherent risk in that. Maybe some safety features need to
be added for such things (e.g. Automatically check that an emergency stop is
present. Design fail safe software if possible.)

Can a remote user operate controls that could harm someone?
{% endcomment %}

## User Interface

<!-- Should there be a user manual? -->

### Data Representation

* Graphs
  * Strip charts
  * Two dimensional plots (rectangular, polar)
  * Three dimensional plots (Cartesian, spherical)
  * Heat mapping
  * Access to archived data for graphing
* Numerical output
  * Tree view
  * Control view
  * Values overlaid onto a drawing

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
