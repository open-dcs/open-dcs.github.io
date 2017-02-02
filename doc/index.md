---
layout: category
title: Documentation
categories: doc
---

OpenDCS started as a school project, as that goes there's usually a block of
documents that are required to demonstrate that you know what you're doing, even
when you don't. This level is probably mostly for that and some of it was/will
be done under duress so try not to judge too harshly.

# History

For the commit history of [Dactl][dactl] at the point that OpenDCS was forked
see [here][history].

# Requirements

## [System Requirements Specification][opendcs-sysrs]

This is a single document that describes the system as a whole including
proposed functionality, applications, interfaces, as well as other nonfunctional
requirements.

## Software Requirements Specification

All of the SRS documents are provided at the pages referenced in this list:

* [Data Acquisition Daemon][daqd-srs]
* [Control Daemon][controld-srs]
* [Data Logging Daemon][logd-srs]

# Design

# Documentation

## Valadoc Reference

The programming reference pages have been developed using the valadoc tool which
generates its output from the comments contained in the class files.

* [v0.1](/doc/valadoc/dcs-0.1/)

## REST API

## DBus API

## ZeroMQ API

# Testing

# Presentation

[dactl]: https://github.com/coanda/dactl
[history]: /doc/dactl/2016/08/31/history.html
[opendcs-sysrs]: /doc/requirements/2016/09/07/sysrs.html
[daqd-srs]: /doc/requirements/2016/09/07/daqd-srs.html
[controld-srs]: /doc/requirements/2016/09/07/controld-srs.html
[logd-srs]: /doc/requirements/2016/09/07/logd-srs.html

<!--
vim: ft=liquid
-->
