## Logging Daemon

The data logging daemon:

* loads backend plugins using a libpeas engine

### Message Examples

#### Receiving

1. ... :
   ```javascript
   "backend0": {
     "ao0": {
       "timestamp": "2016-09-29 15:57:12",
       "value": 1.234
     }
   }
   ```
2. ... :
   ```javascript
   "*": { "command": "shutdown" }
   ```
3. ... :
   ```javascript
   "grp0": { "command": "restart-acquisition" }
   ```

#### Sending

1. ... :
   ```javascript
   "backend0": {[
     "": { "", "": "" }
   ]}
   ```
2. ... :
   ```javascript
   "backend0": { "status": "active" }
   ```
