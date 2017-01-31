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

## System Requirements Specification

This is a single document that describes the system as a whole, it can be read
[here][opendcs-srs].

## Software Requirements Specification

All of the SRS documents are provided at the pages referenced in this list:

* [Data Acquisition Daemon][dcs-daqd-srs]
* [Control Daemon][dcs-controld-srs]
* [Data Logging Daemon][dcs-logd-srs]

# Design

# Documentation

## Valadoc Reference

The programming reference pages have been developed using the valadoc tool which
generates its output from the comments contained in the class files.

* [v0.1](/doc/ref/dcs-0.1/)

## REST API

## DBus API

## ZeroMQ API

# Testing

# Presentation

[dactl]: https://github.com/coanda/dactl
[history]: /doc/dactl/2016/08/31/history.html
[opendcs-srs]: /doc/requirements/opendcs-srs.html
[dcs-daqd-srs]: /doc/requirements/dcs-daqd-srs.html
[dcs-controld-srs]: /doc/requirements/dcs-controld-srs.html
[dcs-logd-srs]: /doc/requirements/dcs-logd-srs.html
