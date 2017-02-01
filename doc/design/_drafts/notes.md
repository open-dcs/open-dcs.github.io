---
layout: post
title: OpenDCS Notes
---

## General

* msgpack to reduce JSON message sizes
* Travis CI or Coveralls for code coverage information
* Slack channels integrated with CI and github for updates
* Implement semver for project versioning
* Use ghpages and jekyll to have blog at open-dcs.github.io<!--break-->
* To monitor traffic during development use zmqc
* Implement RESTful services in daemons
* Consider having per library config.vapi files, or not
* Consider having `-h` at the top level before the plugin loader (may not be
  relevant still)
* Look into using Valum to handle REST services
* A proxy service could be used to provide management to a sector of a system
  from a centralized service, provide load balancing, and enable high
  availability of any DCS service

## Programming Problems/Features

* For REST services would be nice to have service.add\_routes (routes) that
  behaves similar to OptionEntry bulk add in OptionContext
* Directories for the different plugin types needs to be setup in the build
  system so that device, backend, loop, and UI plugins are all only loaded when
  the paths are loaded by the application that needs them
* Add the ability to configure separate plugin paths, either through a config
  file or as a command line argument
* Services and clients need to understand a message structure that uses JSON as
  the format, possibly something like:
  ```json
  "data": {
    "aich-group": {
      "row0": {
        "timestamp": "20160101120000.000000",
        "values": [ 0.0, 0.0, 0.0 ]
      },
      "row1": {
        "timestamp": "20160101120000.100000",
        "values": [ 0.0, 0.0, 0.0 ]
      }
    }
  }
  ```
* Possibly make classes for Dcs.DAQ.Group and Dcs.DAQ.AsyncGroup that are used
  to serialize and deserialize group messages

## Known Issues to Address

* Include directories are wrong on a couple of the libraries
* The girepository directory isn't consistent across the libraries

<!--
vim: ft=liquid
-->
