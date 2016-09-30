---
layout: post
title:  OpenDCS Tools
author: Stephen Roy<stephen.roy@coanda.ca>
date:   2016-09-20 16:41:00 -0700
description:
categories: testing
permalink:
---

### Introduction

The following are functional requirements for tool applications that will be used for evaluating system performance.
<!--break-->

<b>Tools</b>
 * System Monitor (dcs-top)
 * System Analyzer (dcs-analyze)

### System Monitor (dcs-top)

This is a monitor of system performance similar to top. It provides information about local hardware performance.

### System Analyzer

#### NAME
dcs-analyzer - A generic system component

#### SYNOPSIS
dcs-analyzer [OPTIONS] \<command\> [\<arguments\>]

#### DESCRIPTION
dcs-analyzer is generic system component that can be used to test system functionality or as a stand in for an undefined component. It can configured to to communicate with other dcs components using a variety of protocols. Different commands set the mode of operation and these have arguments that control the analyzer or to run tests.

#### OPTIONS

(See the man page for more detail)

<div class="table-responsive">
  <table class="table">
    <thead>
      <tr>
        <th>Option</th>
        <th>Data Type</th>
        <th>Accepted Values</th>
        <th>Default Values</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>--help</td>
        <td>\</td>
        <td>\</td>
        <td>\</td>
      </tr>
      <tr>
        <td>--port</td>
        <td>int</td>
        <td>1025 < port < 65535</td>
        <td>5588</td>
      </tr>
      <tr>
        <td>--bind</td>
        <td>string</td>
        <td>0.0.0.0 ... 255.255.255.255</td>
        <td>0.0.0.0</td>
      </tr>
      <tr>
        <td>--protocol</td>
        <td>string</td>
        <td>TCP, IPC, INPROC</td>
        <td>TCP</td>
      </tr>
      <tr>
        <td>--log</td>
        <td>string</td>
        <td>\</td>
        <td>dcs-analyzer.log</td>
      </tr>
      <tr>
        <td>--config</td>
        <td>string</td>
        <td>\</td>
        <td>dcs-analyzer.xml</td>
      </tr>
    </tbody>
  </table>
</div>

#### Commands
<b>arguments</b>

  * --test [test-name] [test-arguments] Run a test
  * --run [script] Run a script

##### publish

<b>tests</b>

  * sweep [type] [start] [stop] [points] [samples]
    * type - Either log or linear
    * start - The initial message rate
    * stop - The final message rate
    * points - The number of rates
    * samples - The number of messages sent at each rate

##### subscribe

<b>tests</b>

  *
  * --block-size The number of rows of data per message-size
  * --message-rate The number of messages per second

##### request

<b>tests</b>

  * --row-size The numer of samples per row of data
  * --block-size The number of rows of data per message-size
  * -- message-rate The number of messages per second

##### reply

<b>arguments</b>

  * --row-size The numer of samples per row of data
  * --block-size The number of rows of data per message-size
  * -- message-rate The number of messages per second

#### Examples

Command: dcs-analyzer --port=5588 publish --message-size=1024

Case - Perform a ping test between two hosts

host A command: dcs-analyzer request --port=6000 --host=127.0.0.1
host B command: dcs-analyzer reply --port=6000 --bind=127.0.0.1


#### REPL (read-eval-print-loop) INTERFACE

The REPL interface is an interactive mode that is entered after the dcs-analyzer is called.

(This section contains text copied from the python man page) The REPL interface resembles that of the UNIX shell: when called with standard input connected  to a tty device,  it prompts for commands and executes them until an EOF is read; when called with a file name argument or with a file as standard input, it reads and executes a script from that file; when  called with -c  command, it executes the REPL commands.

The following commands can be executed from the command line in interactive mode.

| command | argument/s                 | return              | description |
| ------: | :------------------------: | :------------------:| :---------- |
| help    | command                    | help information    | help for command(s)           |
| set     | parameter                  | parameter value     | set a parameter value |
| get     | parameter                  | parameter value     | get a parameter value|
| start   | (none)                     | a start message     | start publishing messages|
| stop    | (none)                     | a stop message      | stop publishing messages|
| log     | sub-command                |                     |                               |
| ping    | url                        | time value          | time taken for url to respond |
| test    | test name                  | test result         | run a test                 |

notes:

Command: <b>help [command]</b>
  * <b>command:</b> a command name
  * <b>return:</b> help information on a particular command or a summary of the available commands if no argument is provided, or an error message if the command does not exist.

Command: <b>set [parameter] [value]</b>
  * <b>parameter:</b> port, bind, protocol, log, rlength, blength, mrate
  * <b>value</b>: see accepted values
  * <b>return:</b> the set value or and error message if the command fails.

Command: <b>get [parameter]</b>
  * <b>parameter:</b> port, bind, protocol, log, rlength, blength, mrate
  * <b>return:</b> the set value or and error message if the command fails.

Command: <b>start</b>
  * <b>return:</b> a start message

Command: <b>stop</b>
  * <b>return:</b> a stop message

Command: <b>log [sub-command]</b>
  * <b>sub-command:</b>
    * <b>start:</b> echo standard output to the log file
    * <b>stop:</b> stop writing to and close the log file
  * <b>return:</b> the path to the log file

Command: <b>ping [url]</b>
  * <b>url:</b> The address of a subscriber component
  * <b>return:</b> the difference between the subscriber receive time and publisher message time stamp value

Command: <b>test [test-name]</b>
  * <b>test-name:</b>
    * <b>latency [url] [rate] [samples]:</b>

      Evaluates the latency between this and a remote subscriber
      * <b>url:</b> the remote subscriber url
      * <b>rate:</b> the message rate
      * <b>samples</b> the number of samples taken
      * <b>return:</b> test report
        * data values: latency, cpu and mem vs. time
    * <b>bandwidth [url] [sweep] [start] [stop] [points] [samples]:</b>

      Evaluates the latency, cpu performance as a function of messaging rate
      * <b>url:</b> the remote subscriber url
      * <b>sweep:</b> log or linear
      * <b>start:</b> the lower message rate (messages / second)
      * <b>stop:</b> the upper message rate (messages / second)
      * <b>points:</b> the number of data points
      * <b>samples</b> the number of samples taken at each point
      * <b>return:</b> test report
        * data values: data rate, latency, cpu, mem
        * mean, maximum, minimum values for each data value
    * <b>jitter [url] [rate] [samples]:</b>

      Evaluates...
      * <b>url:</b> the remote subscriber url
      * <b>rate:</b> the message rate
      * <b>samples:</b> the number of samples taken
      * <b>return:</b> test report
        * data values: latency, cpu and mem vs. time
    * <b>mylatency [rate]:</b>

      Eva
      * <b>return:</b>
    * <b>mybandwidth [sweep] [start] [stop] [points]</b>

      Eva.
      * <b>return:</b> test report
    * <b>myjitter [rate]</b>

      Eva
      * <b>rate:</b> the message rate
      * <b>return:</b> test report

#### Subscribe

Command: sub-analyzer [OPTIONS]

Description: A command line application that will implement the following options:

| option        | data type           | accepted values     | default values    |
| -----------:  | -------------------:| ----------------:   | ----------------: |
| --port        | int                 | 0 < port < 65535    |  5588             |
| --bind        | string              |                     |  0.0.0.0          |
| --protocol    | string              | TCP, IPC, INPROC    |  TCP              |
| --log         | string              |                     |  pub-analyzer.log |
| --rlength     | int                 | 0 < rlength < 65535 |  1                |
| --blength     | int                 | 0 < blength < 65535 |  1                |


##### REPL (read-eval-print-loop)

The following commands can be executed from the command line once the program has started.


  | command | argument/s                 | return        | description |
  | ------: | :------------------------: | :------------------:| :---------- |
  | help    | command                    | help information    | help for command(s)           |
  | set     | parameter                  | parameter value     | set a parameter value |
  | get     | parameter                  | parameter value     | get a parameter value|
  | start   | (none)                     | a start message     | start publishing messages|
  | stop    | (none)                     | a stop message      | stop publishing messages|
  | log     | sub-command                | (see sub-commands)  | write data to a log file|
  | ping    | url                        | time value          | time taken for url to respond |
  | test    | test name                  | test result         | run a test                 |

#### Request

#### Reply

#### NOTES:

 * publisher can send information about tests as a message at the start of the test
 * subscriber is responsible for receiving test message but must be running at the start
 * publish|subscribe|request|reply are commands of the analyzer tool
 * need to separate common command line arguments from command specific arguments
 * use signalling to intercept control chracters.
