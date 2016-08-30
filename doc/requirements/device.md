## Devices

A device plugin:

* connects to hardware, eg. data acquisition, actuator controller
* can use different protocols to communicate with the device, eg. RS232, Modbus TCP, Comedi
* can have 'input' signals/channels
* can have 'output' signals/channels
* is configurable using a consistent DCS style
* describes the features it provides using mask-able flags
* receives all messages seen on the message bus it is connected to, but filters only those with its unique identifier, a global identifier for broadcasts, or a group identifier
* sends messages for alarms, measurements, status, etc. using the plugin's unique identifier as the key to the message object

### Message Examples

#### Receiving

1. Change the output value of an analog output channel:
   ```javascript
   "plug0": {
     "ao0": {
       "timestamp": "2016-09-29 15:57:12",
       "value": 1.234
     }
   }
   ```
2. Tell all devices to shutdown:
   ```javascript
   "*": { "command": "shutdown" }
   ```
3. Send an acquisition start/restart to a group of devices:
   ```javascript
   "grp0": { "command": "restart-acquisition" }
   ```

#### Sending

1. Publish a set of configured channel measurements:
   ```javascript
   "plug0": {[
     "ai0": { "timestamp": "2016-09-29 15:57:12", "value": "1.23" },
     "ai1": { "timestamp": "2016-09-29 15:57:12", "value": "2.34" },
     "ai2": { "timestamp": "2016-09-29 15:57:12", "value": "3.45" },
     "ai3": { "timestamp": "2016-09-29 15:57:12", "value": "4.56" }
   ]}
   ```
2. Publish the status of the device:
   ```javascript
   "plug0": { "status": "active" }
   ```
