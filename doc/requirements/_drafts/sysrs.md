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

{% comment %}
http://www.cse.chalmers.se/~feldt/courses/reqeng/examples/srs_example_2010_group2.pdf
http://www.nyu.edu/classes/jcf/g22.2440-001_sp07/handouts/Assignment1SampleSolution.pdf
https://books.google.ca/books?id=qxxtl3pch9wC&pg=PA105&lpg=PA105&dq=quality+requirement+gist&source=bl&ots=2cD4RuGzuZ&sig=Qe5CZqpnACDFEkqFdwAS5ExBWjA&hl=en&sa=X&ved=0ahUKEwi9ufCriPDRAhUCxWMKHYYpARkQ6AEIIzAB#v=onepage&q=quality%20requirement%20gist&f=false
https://en.wikipedia.org/wiki/Functional_requirement
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

| ID: | __UIR-0002__ |
| TAG: | Web login/register page |
| DESC: | A user of the web interfaces to any of the daemon services should see a log-in page when the application is loaded, see UIR-0002-1 . If the user has not registered, the log-in page should give the option to do so. |
| RAT: |  A user must be registered to login to systems that have restricted access. |
| DEP: | FR-0001 |

|---
| ![UIR-0002-1](/assets/img/requirements/UIR-0002-1.png "Figure UIR-0002-1")
|---
| *Figure UIR-002-1*

{% comment %} source code for this is in assets/html/requirements {% endcomment %}

---

| ID: | __UIR-0003__ |
| TAG: | HMI login |
| DESC: | A user of the HMI should receive a log-in page when the application is opened, see Figure UIR-0003-1. Once a user has logged in a session token will be used to authenticate with the remote system components. |
| RAT: | Authentication is required to use remote system components that have restricted access. |
| DEP: | UIR-0001, FR-0001 |

|---
| ![UIR-0003-1](/assets/img/requirements/UIR-0003-1.png "Figure UIR-0003-1")
|---
| *Figure UIR-0003-1*

---

| ID: | __UIR-0004__ |
| TAG: | View only guest login |
| DESC: | If the user is not recognized by the system the option to proceed as a view-only guest should be presented, see Figure UIR-0004-1. |
| RAT: | Allow limited access to unauthorized users. |
| DEP: | UIR-0001, FR-0001 |

|---
| ![UIR-0004-1](/assets/img/requirements/UIR-0004-1.png "Figure UIR-0004-1")
|---
| *Figure UIR-0004-1*

---

{% comment %}
This is a general requirement for setting anything from the HMI
{% endcomment %}

| ID: | __UIR-0005__ |
| TAG: | Configure settings |
| DESC: | A user of the HMI shall be able to view and configure settings from a selected category. |
| RAT: | It should be possible to view and change all settings from the HMI. |
| DEP: | UIR-0001

|---
| ![UIR-0005-1](/assets/img/requirements/UIR-0005-1.png "Figure UIR-0005-1")
|---
| *Figure UIR-0005-1*

---

| ID: | __UIR-0006__ |
| TAG: | Configure daemon settings |
| DESC: | A user of any daemon service can configure the different settings that it has available using a common layout presented as a web page using bootstrap, and is hosted by that daemon. |
| RAT: | It should be possible to view and change all settings for any daemon service from a web page. |
| DEP: | UIR-0001

|---
| ![UIR-0006-1](/assets/img/requirements/UIR-0006.png "Figure UIR-0006")
|---
| *Figure UIR-0006-1*

---

| ID: | __UIR-0007__ |
| TAG: | Configure network settings |
| DESC: | A user of the HMI shall be able to display and configure the network. |
| RAT: | To see which system components are connected and how they are configured |
| DEP: | UIR-0001, UIR-0005

---

| ID: | __UIR-0008__ |
| TAG: | Configure logging daemon settings |
| DESC: | A user of the HMI shall be able to display and configure data logging daemon settings using the web page it provides by drawing it in a WebKit widget, see Figure #. |
| RAT: | It should be possible to view and change the parameters affecting the logging daemon. |
| DEP: | UIR-0001, UIR-0006 |

|---
| ![UIR-0008-1](/assets/img/requirements/UIR-0008.png "Figure UIR-0008-1")
|---
| *Figure UIR-0008-1*

---

| ID: | __UIR-0009__ |
| TAG: | Configure data acquisition daemon settings |
| DESC: | A user of the HMI shall be able to display and configure data aquisition daemon settings using the web page it provides by drawing it in a WebKit widget, see Figure #. |
| RAT: | It should be possible to view and change the parameters affecting the data acquissition daemon. |
| DEP: | UIR-0001, UIR-0006 |

|---
| ![UIR-0009-1](/assets/img/requirements/UIR-0009.png "Figure UIR-0009-1")
|---
| *Figure UIR-0009-1*

---

| ID: | __UIR-0010__ |
| TAG: | Configure feedback control daemon settings |
| DESC: | A user of the HMI shall be able to display and configure feedback control daemon settings using the web page it provides by drawing it in a WebKit widget, see Figure #. |
| RAT: | It should be possible to view and change the parameters affecting the feedback control daemon. |
| DEP: | UIR-0001, UIR-0006 |

|---
| ![UIR-0010](/assets/img/requirements/UIR-0010.png "Figure UIR-0010")
|---
| *Figure UIR-0010*

---

| ID: | __UIR-0011__ |
| TAG: | Configure HMI layout
| DESC: | A user of the HMI should be able to display and configure the flexible layout configuration for itself, see Figure #. |
| RAT: | It should be possible to view and change the parameters affecting the feedback control daemon. |
| DEP: | UIR-0001, UIR-0006 |

---

| ID: | __UIR-0012__ |
| TAG: | Configure HMI plugin
| DESC: | A user of the HMI should be able to display and configure HMI addin plugin settings, see Figure #. |
| RAT: | It should be possible to view and change what and how information is displayed. |
| DEP: | UIR-0001, UIR-0011

---

{% comment %}
TODO make mention in the next three requirements on how configuring each uses
the web page provided by the plugin and is accessed through the daemon web/rest
server that does the settings for itself
{% endcomment %}

| ID: | __UIR-0013__ |
| TAG: | Configure device plugin
| DESC: | A user of the HMI should be able to display and configure devices. The HMI will access the plugin's configuration web page through a web server on the DAQ daemon , see Figure #. |
| RAT: | It should be possible to view and change parameters that affect devices |
| DEP: | UIR-0001, UIR-0009 |

|---
| ![UIR-0013](/assets/img/requirements/UIR-0013.png "Figure UIR-0013")
|---
| *Figure UIR-0013*

---

| ID: | __UIR-0014__ |
| TAG: | Configure logging back end plugin
| DESC: | A user of the HMI should be able to display and configure the logging back end. The HMI will access the plugin's configuration web page through a web server on the logging daemon , see Figure #. |
| RAT: | It should be possible to configure what and how data is stored and retrieved. |
| DEP: | UIR-0001, UIR-0008 |

|---
| ![UIR-0014](/assets/img/requirements/UIR-0014.png "Figure UIR-0014")
|---
| *Figure UIR-0014*

---

| ID: | __UIR-0015__ |
| TAG: | Configure feedback controller plugin |
| DESC: | A user of the HMI should be able to display and configure feedback controllers. The HMI will access the controller plugin's configuration web page through a web server on the feedback controller daemon , see Figure #. |
| RAT: | It should be possible to display and configure the parameter that affect feedback control,  |
| DEP: | UIR-0001, UIR-0010 |

|---
| ![UIR-0015](/assets/img/requirements/UIR-0015.png "Figure UIR-0015")
|---
| *Figure UIR-0015*

#### Hardware Interfaces

| ID: | __HWIR-0001__ |
| TAG: | RS-232 Serial Port |
| DESC: | A serial port data acquisition device should be able to connect to the system. |
| RAT: | Plugin device development will make use of serial port core functionality. |

---

| ID: | __HWIR-0002__ |
| TAG: | Ethernet |
| DESC: | The system shall communicate using 10BASE-T, 100BASE-TX and 1000BASE-T. |
| RAT: | The physical system components connect to the network useing Ethernet. |

---

| ID: | __HWIR-0003__ |
| TAG: | Number of Ethernet Ports |
| DESC: | The number of ports required shall depend on how the system configuration for a particular application and whether it needs to connect to remote hardware. |
| RAT: | |

---

| ID: | __HWIR-0004__ |
| TAG: | Processor speed |
| DESC: | The system components shall each have a 400 MHz or faster processor. |
| RAT: | The software requires a reasonably fast processor to handle the data and run a user interface. |

---

| D: | __HWIR-0005__ |
| TAG: | Display |
| DESC: | A 1920 x 1080 (16:9) monitor should be used. |
| RAT: | A good user experience that represents a reasonable amount of data necessarily requires a display with sufficient resolution. |

#### Software Interfaces

| ID: | __SWIR-0001__ |
| TAG: | Operating System |
| DESC: | The software architecture shall be 64-bit GNU+Linux (e.g. Fedora 25) |
| RAT: | n/a |
| DEP: | n/a |

#### Communications Interfaces

| ID: | __CIR-0001__ |
| TAG: | ZeroMQ |
| DESC: | The system shall use ZeroMQ for publishing and subscribing making requests and replying to them |
| RAT: | ZeroMQ has many performance and usability advantages that make it idealfor this application see [ZeroMQ website](http://zeromq.org)
| DEP: | |

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

| ID: | __FR-0001__ |
| TAG: | Connectivity |
| DESC: | Requirements that enable communication between and are common to all system components that shall be met. |
| RAT: | Interoperability of the system components requires a common messaging queue.
| DEP: | FR-0002, FR-0003, FR-0004 |

---

| ID: | __FR-0002__ |
| TAG: | Publishing socket |
| DESC: | A configurable ZeroMQ publishing socket shall be available. |
| RAT: | A daemon shall be able to publish data on a ZeroMQ socket. |
| DEP: | none |

---

| ID: | __FR-0003__ |
| TAG: | Subscribing socket
| DESC: | A configurable ZeroMQ subscribing socket shall be available. |
| RAT: | A daemon can subscribe to published data from other system components. |
| DEP: | none |

---

| ID: | __FR-0004__ |
| TAG: | Request/Reply Socket |
| DESC: | A ZeroMQ request/reply socket shall be available. |
| RAT: | A daemon can request and receive data from a connected system component. |
| DEP: | none |

#### Data acquisition

| ID: | __FR-xxxx__ |
| TAG: | Data acquisition common system requirements |
| DESC: | The common requirements shall be met |
| RAT: | |
| DEP: | FR-0001 |

---

| ID: | __FR-xxxx__ |
| TAG: | Publish data |
| DESC: | Data messages shall be published on the socket containing channel measurements, timestamps, and broadcast status/warnings |
| RAT: | |
| DEP: | FR-0002 |

---

| ID: | __FR-xxxx__ |
| TAG: | Subscribe to messages  |
| DESC: | The data acquisition system component shall be able to subscribe to published messages including:  |
| RAT: | |
| DEP: | FR-0003 |

---

| ID: | __FR-xxxx__ |
| TAG: | Start  |
| DESC: | The data acquisition system component shall start publishing data in response to a request to do so if it has not already started:  |
| RAT: | |
| DEP: | FR-0002 |

---

| ID: | __FR-xxxx__ |
| TAG: | Stop  |
| DESC: | The data acquisition system component shall stop publishing data in response to a request to do so.  |
| RAT: | |
| DEP: | FR-0002 |

---

{% comment %}
OR ....
{% endcomment %}

| ID: | __FR-xxxx__ |
| TAG: | Automatic start  |
| DESC: | The data acquisition system component shall start publishing data immediately  |
| RAT: | |
| DEP: | FR-0002 |

#### Data logging

| ID: | __FR-xxxx__ |
| TAG: | Data logging common system requirements |
| DESC: | These common requirements shall be met |
| RAT: | |
| DEP: | FR-0001 |

---

| ID: | __FR-xxxx__ |
| TAG: | Publish back end malfunction warning
| DESC: | Data messages shall be published as a warning when its back end data storage is not functioning.
| RAT: | To allow the subscribing GUI interface to alert the user. |
| DEP: | FR-0002 |

---

| ID: | __FR-xxxx__ |
| TAG: | Subscribe to published data from data acquisition system.
| DESC: |
| RAT: |
| DEP: | FR-0003 |

#### Feedback control

| ID: | __FR-xxxx__ |
| TAG: | Feedback control common system requirements |
| DESC: | These common requirements shall be met |
| RAT: |  |
| DEP: | FR-0001 |

---

| ID: | __FR-xxxx__ |
| TAG: | Subscribe to input data |
| DESC: | The logging system will subscribe to published data from the data acquisition system and filter out the channel measurement data that it needs. |
| RAT: | Input data is required for its calculations.
| DEP: | FR-0003 |

---

| ID: | __FR-xxxx__ |
| TAG: | Publish output data |
| DESC: | The logging system shall publish the data resultant of it calculations. |
| RAT: | Output data is required to control process variable outputs.
| DEP: | FR-0002 |

#### Human Machine Interface (HMI)
{% comment %}
Is this the same User Interface requirements?
{% endcomment %}

| ID: | __FR-xxxx__ |
| TAG: | Data acquisition common system requirements |
| DESC: | These common requirements shall be met |
| RAT: | |
| DEP: | FR-0001 |

---

| ID: | __FR-xxxx__
| TAG: | Customization
| DESC: | The layout of interface elements shall be customizable.
| RAT: | The system needs to be flexible so that data can be presented in a useful manner.
| DEP: | none

---

| ID: | __FR-xxxx__ |
| TAG: | Subscribe to data acquisition system data.
| DESC: |
| RAT: |
| DEP: | FR-0003  |

### Non-functional Requirements
{% comment %} aka quality requirements {% endcomment %}

#### Performance

The requirements in this section provide a detailed specification of the user
interaction with the software and measurements placed on the system performance.

{% comment %} Qualitative {% endcomment %}

##### Usage of the data log query feature

| ID: |QR# |
| GIST: | Data log query response time |
| SCALE: | |
| METER: | |
| MUST: | |
| PLAN: | |
| WISH: | |


##### Usage of the data acquisition message publish feature

##### Usage of the data acquisition message subscribe feature

{% comment %} Quantitative {% endcomment %}

##### Configuration modification request response time

| ID: | |
| GIST: | |
| SCALE: | |
| METER: | |
| MUST: | |
| PLAN: | |
| WISH: | |

##### Configuration information request response time

##### Sample rate capacity of data acquisition daemon

##### Sample rate capacity of data logging daemon

##### Sample rate capacity of feedback control daemon

##### System dependability of the data acquisition daemon

| ID: | QR# |
| GIST: | The fault tolerance of the system. |
| SCALE: | If the system loses its connection to the building network, another connected component, or a malformed message, the user should be informed. |
| METER: | Measurements obtained from 100 hours of usage during testing |
| MUST: | 99.99% of the time |
| WISH: | 100% of the time |

##### System dependability of the data logging daemon

| ID: | QR# |
| GIST: | The fault tolerance of the system. |
| SCALE: | If the system loses its connection to the building network, another connected component, or a malformed message, the user should be informed. |
| METER: | Measurements obtained from 100 hours of usage during testing |
| MUST: | 99.99% of the time |
| WISH: | 100% of the time |

##### System dependability of the feedback control daemon

| ID: | QR# |
| GIST: | The fault tolerance of the system. |
| SCALE: | If the system loses its connection to the building network, another connected component, or a malformed message, the user should be informed. |
| METER: | Measurements obtained from 100 hours of usage during testing |
| MUST: | 99.99% of the time |
| WISH: | 100% of the time |

#### Design Constraints

This section includes the design constraints on the software caused by the
hardware.

##### Network bandwidth

| ID: | QR# |
| GIST: | TCP/IP network bandwidth. |
<!--SCALE: The application's need for network capacity.<br>-->
| SCALE: | Mbps |
<!--METER: Mbps<br>-->
| METER: | Measure the total number of message bits sent in a 1 minute time span. |
| MUST: | More than 100 Mbps |
| PLAN: | More than 500 Mbps |
| WISH: | More than 100 Mbps |
| Mbps: DEFINED: | Megabits per second |

##### Network latency

| ID: | QR# |
| GIST: | TCP/IP Network latency |
| SCALE: | microseconds |
| METER: | Measure the time difference between the time a message was sent and when it was received |
| MUST: | 100ms |
| PLAN: | 100us |
| WISH: | 1us |

##### Data acquisition device speed

| ID: | QR# |
| GIST: | Data acquisition device speed |
| SCALE: | S/s |
| METER: | Measurement obtained by counting the number of single measurement values acquired in 1 minute. |
| MUST: | 10 S/s |
| PLAN: | 1 kS/s |
| WISH: | 1 MS/s |
| S/s: DEFINED: | Samples per second

##### Hard drive read/write speed

| ID: | QR# |
| GIST: | Hard drive transfer rate |
| SCALE: | Mbps |
| METER: | The transfer rate is given by the manufacturer. |
| MUST: | 100 Mbps |
| PLAN: | 500 Mbps |
| WISH: | More than 500 Mbps |

##### Application memory usage

| ID: | QR# |
| GIST: | The recommended RAM space required to meet the performance and user experience requirements. |
| SCALE: | Gb |
| METER: | The quantity of the installed RAM. |
| MUST: | 2 Gb |
| PLAN: | 8 Gb  |
| WISH: | 32 Gb  |
| Gb: DEFINED: | Gigabytes |

##### Application processor usage

| ID: | QR# |
| GIST: | The CPU useage.
| SCALE: | percent |
| METER: | Use the htop utility to measure this iver a 1 hour time period.
| MUST: | less than 50% |
| PLAN: | less than 25% |
| WISH: | less than 20% |

#### Software System Attributes

##### Reliability

| ID: | QR# |
| GIST: | Continuous operation |
| SCALE: | days |
| METER: | Observe a full functioned system running continuously for a number of days |
| MUST: | 90 days |
| PLAN: | 180 days |
| WISH: | 365 days |

##### Availability

| ID: | QR# |
| GIST: | |
| SCALE: | |
| METER: | |
| MUST: | |
| PLAN: | |

---

| ID: | QR# |
| TITLE: | Network connection |
| DESC: | The applications should be connected to a building network |
| RAT: | In order for the applications to speak with each other |
| DEP: | none |

---

| ID: | QR# |
| TITLE: | Remote access |
| DESC: | A user can access the system from outside the building network over a secure network connection |
| RAT: | In order for a user to remotely monitor or download data from the system |
| DEP: | none |


##### Security

| ID: | QR2 |
| TITLE: | Control access |
| DESC: | The daemons should provide a means to enable or disable secure communications through an authentication mechanism. |
| RAT: | It should be possible to prevent unauthenticated requests. |
| DEP: | none

---

| ID: | QR#
| GIST: |
| SCALE: |
| METER: |
| MUST: |
| PLAN: |


##### Maintainability

| ID: | QR#
| TITLE: | Software upgrades |
| DESC: | Bug fixes and software upgrades can be applied using a package manager. |
| RAT: | Maintaining the software should be made simple by using an automated system. |
| DEP: | none

##### Portability

| ID: | QR#
| TITLE: |
| DESC: |
| RAT: |
| DEP: |

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
