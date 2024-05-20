// Auto-generated. Do not edit!

// (in-package test_pkg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class PositionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.new_x_pos = null;
      this.new_y_pos = null;
      this.new_theta_pos = null;
    }
    else {
      if (initObj.hasOwnProperty('new_x_pos')) {
        this.new_x_pos = initObj.new_x_pos
      }
      else {
        this.new_x_pos = 0.0;
      }
      if (initObj.hasOwnProperty('new_y_pos')) {
        this.new_y_pos = initObj.new_y_pos
      }
      else {
        this.new_y_pos = 0.0;
      }
      if (initObj.hasOwnProperty('new_theta_pos')) {
        this.new_theta_pos = initObj.new_theta_pos
      }
      else {
        this.new_theta_pos = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PositionRequest
    // Serialize message field [new_x_pos]
    bufferOffset = _serializer.float32(obj.new_x_pos, buffer, bufferOffset);
    // Serialize message field [new_y_pos]
    bufferOffset = _serializer.float32(obj.new_y_pos, buffer, bufferOffset);
    // Serialize message field [new_theta_pos]
    bufferOffset = _serializer.float32(obj.new_theta_pos, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PositionRequest
    let len;
    let data = new PositionRequest(null);
    // Deserialize message field [new_x_pos]
    data.new_x_pos = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [new_y_pos]
    data.new_y_pos = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [new_theta_pos]
    data.new_theta_pos = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'test_pkg/PositionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e9274e32a26c0f6f73628f8a1e301e2d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 new_x_pos
    float32 new_y_pos
    float32 new_theta_pos
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PositionRequest(null);
    if (msg.new_x_pos !== undefined) {
      resolved.new_x_pos = msg.new_x_pos;
    }
    else {
      resolved.new_x_pos = 0.0
    }

    if (msg.new_y_pos !== undefined) {
      resolved.new_y_pos = msg.new_y_pos;
    }
    else {
      resolved.new_y_pos = 0.0
    }

    if (msg.new_theta_pos !== undefined) {
      resolved.new_theta_pos = msg.new_theta_pos;
    }
    else {
      resolved.new_theta_pos = 0.0
    }

    return resolved;
    }
};

class PositionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.old_x_pos = null;
      this.old_y_pos = null;
      this.old_theta = null;
    }
    else {
      if (initObj.hasOwnProperty('old_x_pos')) {
        this.old_x_pos = initObj.old_x_pos
      }
      else {
        this.old_x_pos = 0.0;
      }
      if (initObj.hasOwnProperty('old_y_pos')) {
        this.old_y_pos = initObj.old_y_pos
      }
      else {
        this.old_y_pos = 0.0;
      }
      if (initObj.hasOwnProperty('old_theta')) {
        this.old_theta = initObj.old_theta
      }
      else {
        this.old_theta = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PositionResponse
    // Serialize message field [old_x_pos]
    bufferOffset = _serializer.float32(obj.old_x_pos, buffer, bufferOffset);
    // Serialize message field [old_y_pos]
    bufferOffset = _serializer.float32(obj.old_y_pos, buffer, bufferOffset);
    // Serialize message field [old_theta]
    bufferOffset = _serializer.float32(obj.old_theta, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PositionResponse
    let len;
    let data = new PositionResponse(null);
    // Deserialize message field [old_x_pos]
    data.old_x_pos = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [old_y_pos]
    data.old_y_pos = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [old_theta]
    data.old_theta = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'test_pkg/PositionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '605ca98fe129f94160b84c9f446ea3e5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 old_x_pos
    float32 old_y_pos
    float32 old_theta
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PositionResponse(null);
    if (msg.old_x_pos !== undefined) {
      resolved.old_x_pos = msg.old_x_pos;
    }
    else {
      resolved.old_x_pos = 0.0
    }

    if (msg.old_y_pos !== undefined) {
      resolved.old_y_pos = msg.old_y_pos;
    }
    else {
      resolved.old_y_pos = 0.0
    }

    if (msg.old_theta !== undefined) {
      resolved.old_theta = msg.old_theta;
    }
    else {
      resolved.old_theta = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: PositionRequest,
  Response: PositionResponse,
  md5sum() { return 'd68d51930d623abd15f8d498c7c8fc85'; },
  datatype() { return 'test_pkg/Position'; }
};
