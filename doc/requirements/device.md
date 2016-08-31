## Devices

A device plugin:

* connects to hardware, eg. data acquisition, actuator controller
* can use different protocols to communicate with the device, eg. RS232, Modbus TCP, Comedi
* can have 'input' signals/channels
* can have 'output' signals/channels
* is configurable using a consistent DCS configuration format
* describes the features it provides using mask-able flags
* defines a filter for messages that it expects the daemon to receive and queue for it
* receives all messages seen on the message queue it is connected to
* sends messages for alarms, measurements, status, etc. using the plugin's unique identifier as the key to the message object

### Features
