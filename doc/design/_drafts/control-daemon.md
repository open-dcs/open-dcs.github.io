---
layout: post
title: Control Daemon Design
---

{% comment %}
The messaging examples should go into the API documentation for ZeroMQ.
{% endcomment %}

## Message Examples

### Receiving

1. ... :
   ```javascript
   "loop0": {
     "ao0": {
       "timestamp": "2016-09-29 15:57:12",
       "value": 1.234
     }
   }
   ```
   <!--break-->
2. ... :
   ```javascript
   "*": { "command": "shutdown" }
   ```
3. ... :
   ```javascript
   "grp0": { "command": "restart-acquisition" }
   ```

### Sending

1. ... :
   ```javascript
   "loop0": {[
     "": { "", "": "" }
   ]}
   ```
2. ... :
   ```javascript
   "loop0": { "status": "active" }
   ```

<!--
vim: ft=liquid
-->
