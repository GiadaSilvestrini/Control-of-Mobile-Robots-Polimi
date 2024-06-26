// Generated by gencpp from file test_pkg/Position.msg
// DO NOT EDIT!


#ifndef TEST_PKG_MESSAGE_POSITION_H
#define TEST_PKG_MESSAGE_POSITION_H

#include <ros/service_traits.h>


#include <test_pkg/PositionRequest.h>
#include <test_pkg/PositionResponse.h>


namespace test_pkg
{

struct Position
{

typedef PositionRequest Request;
typedef PositionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Position
} // namespace test_pkg


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::test_pkg::Position > {
  static const char* value()
  {
    return "d68d51930d623abd15f8d498c7c8fc85";
  }

  static const char* value(const ::test_pkg::Position&) { return value(); }
};

template<>
struct DataType< ::test_pkg::Position > {
  static const char* value()
  {
    return "test_pkg/Position";
  }

  static const char* value(const ::test_pkg::Position&) { return value(); }
};


// service_traits::MD5Sum< ::test_pkg::PositionRequest> should match
// service_traits::MD5Sum< ::test_pkg::Position >
template<>
struct MD5Sum< ::test_pkg::PositionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::test_pkg::Position >::value();
  }
  static const char* value(const ::test_pkg::PositionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::test_pkg::PositionRequest> should match
// service_traits::DataType< ::test_pkg::Position >
template<>
struct DataType< ::test_pkg::PositionRequest>
{
  static const char* value()
  {
    return DataType< ::test_pkg::Position >::value();
  }
  static const char* value(const ::test_pkg::PositionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::test_pkg::PositionResponse> should match
// service_traits::MD5Sum< ::test_pkg::Position >
template<>
struct MD5Sum< ::test_pkg::PositionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::test_pkg::Position >::value();
  }
  static const char* value(const ::test_pkg::PositionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::test_pkg::PositionResponse> should match
// service_traits::DataType< ::test_pkg::Position >
template<>
struct DataType< ::test_pkg::PositionResponse>
{
  static const char* value()
  {
    return DataType< ::test_pkg::Position >::value();
  }
  static const char* value(const ::test_pkg::PositionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TEST_PKG_MESSAGE_POSITION_H
