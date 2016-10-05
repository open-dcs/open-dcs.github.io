---
layout: post
title:  OpenDCS GUI Manual Page
author: Geoff Johnson <geoff.jay@gmail.com>
date:   2016-09-29 16:31:41 -0700
description: A man page for the OpenDCS Gtk3 application.
categories: manuals
permalink: /doc/man/dcsg
---

## Name

`dcsg` — A service for acquiring data from data acquisition devices.
<!--break-->

## Synopsis

`dcsg [-c `*`path`*`] [-h] [ `*`command`*` [ `*`arg`*` ] ... ]`

## Description

*dcsg* is a Gtk application used to communicate with other OpenDCS services to
allow an operator to interact with the systems and the data they provide. Data
is received using the OpenDCS message format over ZeroMQ.

## Options

The following options are supported:

`-c, --config=`*`path`*

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Launch the application using settings in the provided configuration file.

`-h, --help`

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Prints the help...

## Examples

**Example 1. Some useful example...**

Provide some information here...

`dcsg -c dcsg.dcf -vvv`

## See Also

[dcs(1)](dcs.html) ,
[dcs-publish(1)](dcs-publish.html) ,
[dcs-subscribe(1)](dcs-subscribe.html) ,
[dcs-request(1)](dcs-request.html) ,
[dcs-reply(1)](dcs-reply.html) ,
[dcs-daqd(1)](dcs-daqd.html) ,
[dcs-logd(1)](dcs-logd.html) ,
[dcs-controld(1)](dcs-controld.html) ,
[dcsg(1)](dcsg.html)

## Notes

OpenDCS home page:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[http://open-dcs.github.io](http://open-dcs.github.io)

More documentation with examples:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[http://open-dcs.github.io/doc](http://open-dcs.github.io/doc)
