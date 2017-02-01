---
layout: post
title:  Configuring an OpenDCS DAQ Daemon
author: Geoff Johnson <geoff.jay@gmail.com>
date:   2016-08-31 10:13:22 -0700
description: DAQ daemon configuration example.
categories: opendcs updates
---

Hollow concept for now, but maybe an actual place for a how-to of configuring
the DAQ daemon in the future.
<br/><!--break-->

### XML Configuration Example

{% highlight xml linenos %}
<?xml version="1.0" encoding="ISO-8859-1"?>
<dcs xmlns:daq="urn:libdcs-daq" xmlns:net="urn:libdcs-net">
  <property name="log">/var/log/dcs/daq.log</property>

  <daq:objects>
    <daq:devices>
      <daq:device type="arduino" id="dev0">
        <daq:object type="channel-plug" id="plug0">
          <daq:property name="uri">/channels/ai0</daq:property>
        </daq:object>
        <daq:object type="channel-plug" id="plug1">
          <daq:property name="uri">/channels/ai1</daq:property>
        </daq:object>
        <daq:object type="channel-plug" id="plug2">
          <daq:property name="uri">/channels/ai2</daq:property>
        </daq:object>
        <daq:object type="channel-plug" id="plug3">
          <daq:property name="uri">/channels/ai3</daq:property>
        </daq:object>
      </daq:device>
    </daq:devices>

    <daq:object type="channel" id="ai0">
      <daq:property name="measurement-type">analog</daq:property>
      <daq:property name="measurement-direction">input</daq:property>
    </daq:object>
    <daq:object type="channel" id="ai1">
      <daq:property name="measurement-type">analog</daq:property>
      <daq:property name="measurement-direction">input</daq:property>
    </daq:object>
    <daq:object type="channel" id="ai2">
      <daq:property name="measurement-type">analog</daq:property>
      <daq:property name="measurement-direction">input</daq:property>
    </daq:object>
    <daq:object type="channel" id="ai3">
      <daq:property name="measurement-type">analog</daq:property>
      <daq:property name="measurement-direction">input</daq:property>
    </daq:object>
  </daq:objects>

  <net:objects>
    <net:object type="publisher">
      <net:property name="address">*</net:property>
      <net:property name="transport">tcp</net:property>
      <net:property name="port">6000</net:property>
    </net:object>
  </net:objects>
</dcs>
{% endhighlight %}

<!--
vim: ft=liquid
-->
