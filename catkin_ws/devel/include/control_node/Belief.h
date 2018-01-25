// Generated by gencpp from file control_node/Belief.msg
// DO NOT EDIT!


#ifndef CONTROL_NODE_MESSAGE_BELIEF_H
#define CONTROL_NODE_MESSAGE_BELIEF_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <control_node/Path2D.h>

namespace control_node
{
template <class ContainerAllocator>
struct Belief_
{
  typedef Belief_<ContainerAllocator> Type;

  Belief_()
    : belief()  {
    }
  Belief_(const ContainerAllocator& _alloc)
    : belief(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::control_node::Path2D_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::control_node::Path2D_<ContainerAllocator> >::other >  _belief_type;
  _belief_type belief;




  typedef boost::shared_ptr< ::control_node::Belief_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::control_node::Belief_<ContainerAllocator> const> ConstPtr;

}; // struct Belief_

typedef ::control_node::Belief_<std::allocator<void> > Belief;

typedef boost::shared_ptr< ::control_node::Belief > BeliefPtr;
typedef boost::shared_ptr< ::control_node::Belief const> BeliefConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::control_node::Belief_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::control_node::Belief_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::control_node::Belief_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::control_node::Belief_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::control_node::Belief_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::control_node::Belief_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::control_node::Belief_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::control_node::Belief_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::control_node::Belief_<ContainerAllocator> >
{
  static const char* value()
  {
    return "48eb5de553b40f592849c01a2b98d2d4";
  }

  static const char* value(const ::control_node::Belief_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x48eb5de553b40f59ULL;
  static const uint64_t static_value2 = 0x2849c01a2b98d2d4ULL;
};

template<class ContainerAllocator>
struct DataType< ::control_node::Belief_<ContainerAllocator> >
{
  static const char* value()
  {
    return "control_node/Belief";
  }

  static const char* value(const ::control_node::Belief_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::control_node::Belief_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Path2D[] belief\n\
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

  static const char* value(const ::control_node::Belief_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::control_node::Belief_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.belief);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Belief_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::control_node::Belief_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::control_node::Belief_<ContainerAllocator>& v)
  {
    s << indent << "belief[]" << std::endl;
    for (size_t i = 0; i < v.belief.size(); ++i)
    {
      s << indent << "  belief[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::control_node::Path2D_<ContainerAllocator> >::stream(s, indent + "    ", v.belief[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CONTROL_NODE_MESSAGE_BELIEF_H