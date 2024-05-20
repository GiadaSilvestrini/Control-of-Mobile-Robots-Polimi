// Auto-generated. Do not edit!

// (in-package test_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class wheels_rpm {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.rpm_fl = null;
      this.rpm_fr = null;
      this.rpm_rr = null;
      this.rpm_rl = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('rpm_fl')) {
        this.rpm_fl = initObj.rpm_fl
      }
      else {
        this.rpm_fl = 0.0;
      }
      if (initObj.hasOwnProperty('rpm_fr')) {
        this.rpm_fr = initObj.rpm_fr
      }
      else {
        this.rpm_fr = 0.0;
      }
      if (initObj.hasOwnProperty('rpm_rr')) {
        this.rpm_rr = initObj.rpm_rr
      }
      else {
        this.rpm_rr = 0.0;
      }
      if (initObj.hasOwnProperty('rpm_rl')) {
        this.rpm_rl = initObj.rpm_rl
      }
      else {
        this.rpm_rl = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type wheels_rpm
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [rpm_fl]
    bufferOffset = _serializer.float64(obj.rpm_fl, buffer, bufferOffset);
    // Serialize message field [rpm_fr]
    bufferOffset = _serializer.float64(obj.rpm_fr, buffer, bufferOffset);
    // Serialize message field [rpm_rr]
    bufferOffset = _serializer.float64(obj.rpm_rr, buffer, bufferOffset);
    // Serialize message field [rpm_rl]
    bufferOffset = _serializer.float64(obj.rpm_rl, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type wheels_rpm
    let len;
    let data = new wheels_rpm(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [rpm_fl]
    data.rpm_fl = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rpm_fr]
    data.rpm_fr = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rpm_rr]
    data.rpm_rr = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rpm_rl]
    data.rpm_rl = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'test_pkg/wheels_rpm';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cb85f5cc617f2c19f53f5347bdd97298';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float64 rpm_fl
    float64 rpm_fr
    float64 rpm_rr
    float64 rpm_rl
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new wheels_rpm(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.rpm_fl !== undefined) {
      resolved.rpm_fl = msg.rpm_fl;
    }
    else {
      resolved.rpm_fl = 0.0
    }

    if (msg.rpm_fr !== undefined) {
      resolved.rpm_fr = msg.rpm_fr;
    }
    else {
      resolved.rpm_fr = 0.0
    }

    if (msg.rpm_rr !== undefined) {
      resolved.rpm_rr = msg.rpm_rr;
    }
    else {
      resolved.rpm_rr = 0.0
    }

    if (msg.rpm_rl !== undefined) {
      resolved.rpm_rl = msg.rpm_rl;
    }
    else {
      resolved.rpm_rl = 0.0
    }

    return resolved;
    }
};

module.exports = wheels_rpm;
