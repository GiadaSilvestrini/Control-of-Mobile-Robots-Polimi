// Generated by gencpp from file test_pkg/PositionResponse.msg
// DO NOT EDIT!


#ifndef TEST_PKG_MESSAGE_POSITIONRESPONSE_H
#define TEST_PKG_MESSAGE_POSITIONRESPONSE_H


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
struct PositionResponse_
{
  typedef PositionResponse_<ContainerAllocator> Type;

  PositionResponse_()
    : old_x_pos(0.0)
    , old_y_pos(0.0)
    , old_theta(0.0)  {
    }
  PositionResponse_(const ContainerAllocator& _alloc)
    : old_x_pos(0.0)
    , old_y_pos(0.0)
    , old_theta(0.0)  {
  (void)_alloc;
    }



   typedef float _old_x_pos_type;
  _old_x_pos_type old_x_pos;

   typedef float _old_y_pos_type;
  _old_y_pos_type old_y_pos;

   typedef float _old_theta_type;
  _old_theta_type old_theta;





  typedef boost::shared_ptr< ::test_pkg::PositionResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::test_pkg::PositionResponse_<ContainerAllocator> const> ConstPtr;

}; // struct PositionResponse_

typedef ::test_pkg::PositionResponse_<std::allocator<void> > PositionResponse;

typedef boost::shared_ptr< ::test_pkg::PositionResponse > PositionResponsePtr;
typedef boost::shared_ptr< ::test_pkg::PositionResponse const> PositionResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::test_pkg::PositionResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::test_pkg::PositionResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::test_pkg::PositionResponse_<ContainerAllocator1> & lhs, const ::test_pkg::PositionResponse_<ContainerAllocator2> & rhs)
{
  return lhs.old_x_pos == rhs.old_x_pos &&
    lhs.old_y_pos == rhs.old_y_pos &&
    lhs.old_theta == rhs.old_theta;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::test_pkg::PositionResponse_<ContainerAllocator1> & lhs, const ::test_pkg::PositionResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace test_pkg

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::test_pkg::PositionResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::test_pkg::PositionResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::test_pkg::PositionResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::test_pkg::PositionResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_pkg::PositionResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_pkg::PositionResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::test_pkg::PositionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "605ca98fe129f94160b84c9f446ea3e5";
  }

  static const char* value(const ::test_pkg::PositionResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x605ca98fe129f941ULL;
  static const uint64_t static_value2 = 0x60b84c9f446ea3e5ULL;
};

template<class ContainerAllocator>
struct DataType< ::test_pkg::PositionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "test_pkg/PositionResponse";
  }

  static const char* value(const ::test_pkg::PositionResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::test_pkg::PositionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 old_x_pos\n"
"float32 old_y_pos\n"
"float32 old_theta\n"
"\n"
;
  }

  static const char* value(const ::test_pkg::PositionResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::test_pkg::PositionResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.old_x_pos);
      stream.next(m.old_y_pos);
      stream.next(m.old_theta);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PositionResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::test_pkg::PositionResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::test_pkg::PositionResponse_<ContainerAllocator>& v)
  {
    s << indent << "old_x_pos: ";
    Printer<float>::stream(s, indent + "  ", v.old_x_pos);
    s << indent << "old_y_pos: ";
    Printer<float>::stream(s, indent + "  ", v.old_y_pos);
    s << indent << "old_theta: ";
    Printer<float>::stream(s, indent + "  ", v.old_theta);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TEST_PKG_MESSAGE_POSITIONRESPONSE_H
