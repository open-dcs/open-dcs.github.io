---
layout: post
title:  Software Requirements Specification for dcs-logd
author: Geoff Johnson <geoff.jay@gmail.com>
date:   2016-09-07 19:15:14 -0700
description: An SRS for the OpenDCS data logging daemon.
categories: requirements
permalink: /doc/requirements/dcs-logd-srs
---

{% comment %}
This ...
{% endcomment %}
The requirements specification for the set of OpenDCS classes that are used in
writing and reading logged process data is described in this section.<br/>
<!--break-->

{% comment %}
### Purpose

### Scope

### Definitions, Acronyms, and Abbreviations

### References

### Overview
{% endcomment %}

## Functionality

{% comment %}
What is the software supposed to do?
{% endcomment %}

## External Interface Requirements

{% comment %}
How does the software interact with people, the system's hardware, other
hardware, and other software?
{% endcomment %}

### User Interfaces

{% comment %}
There won't be any user interface for the daemon so this should be removed or
just provide a comment stating this.
{% endcomment %}

### Hardware Interfaces

{% comment %}
Logical and physical characteristics of each interface between the software
product and the hardware components of the system. eg. supported devices,
communication protocols, and data/control interactions between the hardware and
the system.
{% endcomment %}

### Software Interfaces

{% comment %}
The connections between this and other specific software components (which in
the case of OpenDCS will be the other daemons) including databases, operating
systems, tools, libraries. Describe the purpose of each.
{% endcomment %}

### Communications Interfaces

{% comment %}
Define pertinent message formatting. Identify communication standards that will
be used such as HTTP. Specify communication security or encryption issues, data
transfer rates, and synchronization mechanisms.
{% endcomment %}

## Nonfunctional Requirements

### Performance

{% comment %}
What is the speed, availability, response time, recovery time of various
software functions, etc.?
{% endcomment %}

### Safety

{% comment %}
Specify any concerns of loss, damage, or harm that could result from the use of
the product. Define safeguards or actions that must be taken, as well as actions
that must be prevented.
{% endcomment %}

### Security

{% comment %}
Privacy issues surrounding use of the product or protection of the data used or
created by the product.
{% endcomment %}

### Software Quality Attributes

{% comment %}
What are the portability, correctness, maintainability, etc.
{% endcomment %}

## Design Constraints

{% comment %}
Are there any required standards in effect, implementation language, policies
for database integrity, resource limits, operating environment(s) etc.?
{% endcomment %}

{% comment %}
Other sections that don't make sense in a blog post:
 - Appendix A: Glossary
 - Appendix B: Analysis Models
 - Appendix C: Issues List
{% endcomment %}

<!--
vim: ft=liquid
-->
