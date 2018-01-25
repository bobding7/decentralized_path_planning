// Generated by gencpp from file control_node/QueryDBResponse.msg
// DO NOT EDIT!


#ifndef CONTROL_NODE_MESSAGE_QUERYDBRESPONSE_H
#define CONTROL_NODE_MESSAGE_QUERYDBRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <control_node/Belief.h>

namespace control_node
{
template <class ContainerAllocator>
struct QueryDBResponse_
{
  typedef QueryDBResponse_<ContainerAllocator> Type;

  QueryDBResponse_()
    : out_belief()  {
    }
  QueryDBResponse_(const ContainerAllocator& _alloc)
    : out_belief(_alloc)  {
  (void)_alloc;
    }



   typedef  ::control_node::Belief_<ContainerAllocator>  _out_belief_type;
  _out_belief_type out_belief;




  typedef boost::shared_ptr< ::control_node::QueryDBResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::control_node::QueryDBResponse_<ContainerAllocator> const> ConstPtr;

}; // struct QueryDBResponse_

typedef ::control_node::QueryDBResponse_<std::allocator<void> > QueryDBResponse;

typedef boost::shared_ptr< ::control_node::QueryDBResponse > QueryDBResponsePtr;
typedef boost::shared_ptr< ::control_node::QueryDBResponse const> QueryDBResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::control_node::QueryDBResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::control_node::QueryDBResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace control_node

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'control_node': ['/home/puneet/foxconnmultiagent/catkin_ws/src/control_node/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::control_node::QueryDBResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::control_node::QueryDBResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::control_node::QueryDBResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::control_node::QueryDBResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::control_node::QueryDBResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::control_node::QueryDBResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::control_node::QueryDBResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dd13073dcb0013bac8559abc5c945654";
  }

  static const char* value(const ::control_node::QueryDBResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdd13073dcb0013baULL;
  static const uint64_t static_value2 = 0xc8559abc5c945654ULL;
};

template<class ContainerAllocator>
struct DataType< ::control_node::QueryDBResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "control_node/QueryDBResponse";
  }

  static const char* value(const ::control_node::QueryDBResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::control_node::QueryDBResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Belief out_belief\n\
\n\
\n\
================================================================================\n\
MSG: control_node/Belief\n\
Path2D[] belief\n\
\n\
================================================================================\n\
MSG: control_node/Path2D\n\
int8 id\n\
int32 timestamp\n\
Pose2D[] poses\n\
\n\
================================================================================\n\
MSG: control_node/Pose2D\n\
float32 x\n\
float32 y\n\
float32 yaw\n\
";
  }

  static const char* value(const ::control_node::QueryDBResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::control_node::QueryDBResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.out_belief);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct QueryDBResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::control_node::QueryDBResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::control_node::QueryDBResponse_<ContainerAllocator>& v)
  {
    s << indent << "out_belief: ";
    s << std::endl;
    Printer< ::control_node::Belief_<ContainerAllocator> >::stream(s, indent + "  ", v.out_belief);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CONTROL_NODE_MESSAGE_QUERYDBRESPONSE_H
