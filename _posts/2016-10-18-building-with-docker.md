---
layout: post
title:  Building OpenDCS with Docker
author: Geoff Johnson <geoff.jay@gmail.com>
date:   2016-10-18 16:38:28 -0700
description: Using Docker with OpenDCS for testing.
categories: opendcs updates
---

A new [repository][docker-repo]{:target="_blank"} has been setup to house
Dockerfiles that will (hopefully) be used for testing and deployment of OpenDCS
components.<!--break--> The images used will likely be Debian, but may be
switched to Fedora or Ubuntu if there's issues with package versions not being
current enough.

## Prerequisites

A working installation of docker is required, instructions for doing this on a
number of distributions can be read
[here](https://docs.docker.com/engine/installation/){:target="_blank"}.

## Usage

There is currently only a single Dockerfile that will be used to test building
the project as a whole with all UI components disabled for obvious reasons.
These commands are currently all that is required.

{% highlight bash %}
git clone https://github.com/open-dcs/dcs-docker.git
cd dcs-docker
docker build .
{% endhighlight %}

## Plans

Being able to build and deploy individual components for testing and for
production is planned. Dockerfiles will be written to produce a working
environment that contains these in separate builds:

* data acquisition daemon
* data logging daemon
* control daemon
* messaging proxy

[docker-repo]: https://github.com/open-dcs/dcs-docker.git

<!--
vim: ft=liquid
-->
