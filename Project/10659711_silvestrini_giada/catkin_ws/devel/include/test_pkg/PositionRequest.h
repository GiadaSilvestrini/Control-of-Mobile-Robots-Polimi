// Generated by gencpp from file test_pkg/PositionRequest.msg
// DO NOT EDIT!


#ifndef TEST_PKG_MESSAGE_POSITIONREQUEST_H
#define TEST_PKG_MESSAGE_POSITIONREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace test_pkg
{
template <class ContainerAllocator>
struct PositionRequest_
{
  typedef PositionRequest_<ContainerAllocator> Type;

  PositionRequest_()
    : new_x_pos(0.0)
    , new_y_pos(0.0)
    , new_theta_pos(0.0)  {
    }
  PositionRequest_(const ContainerAllocator& _alloc)
    : new_x_pos(0.0)
    , new_y_pos(0.0)
    , new_theta_pos(0.0)  {
  (void)_alloc;
    }



   typedef float _new_x_pos_type;
  _new_x_pos_type new_x_pos;

   typedef float _new_y_pos_type;
  _new_y_pos_type new_y_pos;

   typedef float _new_theta_pos_type;
  _new_theta_pos_type new_theta_pos;





  typedef boost::shared_ptr< ::test_pkg::PositionRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::test_pkg::PositionRequest_<ContainerAllocator> const> ConstPtr;

}; // struct PositionRequest_

typedef ::test_pkg::PositionRequest_<std::allocator<void> > PositionRequest;

typedef boost::shared_ptr< ::test_pkg::PositionRequest > PositionRequestPtr;
typedef boost::shared_ptr< ::test_pkg::PositionRequest const> PositionRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::test_pkg::PositionRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::test_pkg::PositionRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::test_pkg::PositionRequest_<ContainerAllocator1> & lhs, const ::test_pkg::PositionRequest_<ContainerAllocator2> & rhs)
{
  return lhs.new_x_pos == rhs.new_x_pos &&
    lhs.new_y_pos == rhs.new_y_pos &&
    lhs.new_theta_pos == rhs.new_theta_pos;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::test_pkg::PositionRequest_<ContainerAllocator1> & lhs, const ::test_pkg::PositionRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace test_pkg

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::test_pkg::PositionRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::test_pkg::PositionRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::test_pkg::PositionRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::test_pkg::PositionRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_pkg::PositionRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_pkg::PositionRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::test_pkg::PositionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e9274e32a26c0f6f73628f8a1e301e2d";
  }

  static const char* value(const ::test_pkg::PositionRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe9274e32a26c0f6fULL;
  static const uint64_t static_value2 = 0x73628f8a1e301e2dULL;
};

template<class ContainerAllocator>
struct DataType< ::test_pkg::PositionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "test_pkg/PositionRequest";
  }

  static const char* value(const ::test_pkg::PositionRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::test_pkg::PositionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 new_x_pos\n"
"float32 new_y_pos\n"
"float32 new_theta_pos\n"
;
  }

  static const char* value(const ::test_pkg::PositionRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::test_pkg::PositionRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.new_x_pos);
      stream.next(m.new_y_pos);
      stream.next(m.new_theta_pos);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PositionRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::test_pkg::PositionRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::test_pkg::PositionRequest_<ContainerAllocator>& v)
  {
    s << indent << "new_x_pos: ";
    Printer<float>::stream(s, indent + "  ", v.new_x_pos);
    s << indent << "new_y_pos: ";
    Printer<float>::stream(s, indent + "  ", v.new_y_pos);
    s << indent << "new_theta_pos: ";
    Printer<float>::stream(s, indent + "  ", v.new_theta_pos);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TEST_PKG_MESSAGE_POSITIONREQUEST_H
