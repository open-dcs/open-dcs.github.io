---
layout: post
title:  Forking Dactl as OpenDCS
author: Geoff Johnson <geoff.jay@gmail.com>
date:   2016-08-24 11:33:16 -0700
description: Launching OpenDCS using Dactl as a starting point.
categories: opendcs updates
---

Dactl was designed to function as a standalone application, a mutli-threaded
executable for acquiring and logging data, and performing basic feedback
control. It did that for several years but the time, and opportunity, came to
make it what I'd wanted to for a long while, a distributed system.<br/>
<!--break-->

Breaking up the application into a set of services and smaller applications
should open up the door for more capable systems that are not limited by the
inherent constraints that come with trying to stuff everything into one box.

The GitHub repository for [Dactl][dactl-repo] was forked to
[OpenDCS][opendcs-repo] to begin the project of migrating everything to a set of
distributed components that communicate using a message bus.

More information to come.

[dactl-repo]: http://github.com/coanda/dactl
[opendcs-repo]: http://github.com/open-dcs/dcs
