---
layout: post
title:  Unit Tests in OpenDCS
author: Geoff Johnson <geoff.jay@gmail.com>
date:   2016-09-21 16:15:02 -0700
description: A summary of the unit testing framework that has been added to OpenDCS.
visible: 1
categories: doc testing
---

The unit test framework that is used in OpenDCS is based off of the work done by
the developers of [libgee][libgee], specifically the TestCase class that extends
what's available in [GTest][gtest] which is included in GLib.
<!--break-->

## Building Tests

To build the unit test applications as part of OpenDCS the argument to enable
building must be added when generating the output of autotools.

{% highlight bash %}
./autogen.sh
{% endhighlight %}

## Executing Tests

The tests have been broken into different sections in case there is the future
need to provide conditional builds of some of the sections, eg. omitting support
for a GUI.

Running all of the tests available for one of the categories is done using
`gtester`, for example the core components:

{% highlight bash %}
gtester --verbose tests/test-dcs-core
{% endhighlight %}

Which results in:

{% highlight bash %}
TEST: tests/test-dcs-core... (pid=24910)
  /DcsObject/[DcsObject] Test equivalency:                             OK
  /DcsObject/[DcsObject] Test comparison:                              OK
PASS: tests/test-dcs-core
{% endhighlight %}

Individual test cases can also be specified using a path argument such as:

{% highlight bash %}
gtester --verbose -p /DcsObject tests/test-dcs-core
{% endhighlight %}

Which at this time results in the same thing so it will be omitted until there's
something more interesting to add.

[gtest]: http://developer.gnome.org/glib/unstable/glib-Testing.html
[libgee]: https://live.gnome.org/Libgee
