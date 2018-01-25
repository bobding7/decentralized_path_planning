// Generated by gencpp from file path_db/QueryDBRequest.msg
// DO NOT EDIT!


#ifndef PATH_DB_MESSAGE_QUERYDBREQUEST_H
#define PATH_DB_MESSAGE_QUERYDBREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <path_db/Belief.h>

namespace path_db
{
template <class ContainerAllocator>
struct QueryDBRequest_
{
  typedef QueryDBRequest_<ContainerAllocator> Type;

  QueryDBRequest_()
    : type()
    , in_belief()  {
    }
  QueryDBRequest_(const ContainerAllocator& _alloc)
    : type(_alloc)
    , in_belief(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _type_type;
  _type_type type;

   typedef  ::path_db::Belief_<ContainerAllocator>  _in_belief_type;
  _in_belief_type in_belief;




  typedef boost::shared_ptr< ::path_db::QueryDBRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::path_db::QueryDBRequest_<ContainerAllocator> const> ConstPtr;

}; // struct QueryDBRequest_

typedef ::path_db::QueryDBRequest_<std::allocator<void> > QueryDBRequest;

typedef boost::shared_ptr< ::path_db::QueryDBRequest > QueryDBRequestPtr;
typedef boost::shared_ptr< ::path_db::QueryDBRequest const> QueryDBRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::path_db::QueryDBRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::path_db::QueryDBRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace path_db

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'path_db': ['/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::path_db::QueryDBRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::path_db::QueryDBRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_db::QueryDBRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_db::QueryDBRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_db::QueryDBRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_db::QueryDBRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::path_db::QueryDBRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f580b5985424d93b1188f02ce96c778a";
  }

  static const char* value(const ::path_db::QueryDBRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf580b5985424d93bULL;
  static const uint64_t static_value2 = 0x1188f02ce96c778aULL;
};

template<class ContainerAllocator>
struct DataType< ::path_db::QueryDBRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "path_db/QueryDBRequest";
  }

  static const char* value(const ::path_db::QueryDBRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::path_db::QueryDBRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string type\n\
Belief in_belief\n\
\n\
================================================================================\n\
MSG: path_db/Belief\n\
Path2D[] belief\n\
\n\
================================================================================\n\
MSG: path_db/Path2D\n\
int8 id\n\
int32 timestamp\n\
Pose2D[] poses\n\
\n\
================================================================================\n\
MSG: path_db/Pose2D\n\
float32 x\n\
float32 y\n\
float32 yaw\n\
";
  }

  static const char* value(const ::path_db::QueryDBRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::path_db::QueryDBRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.type);
      stream.next(m.in_belief);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct QueryDBRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::path_db::QueryDBRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::path_db::QueryDBRequest_<ContainerAllocator>& v)
  {
    s << indent << "type: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.type);
    s << indent << "in_belief: ";
    s << std::endl;
    Printer< ::path_db::Belief_<ContainerAllocator> >::stream(s, indent + "  ", v.in_belief);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PATH_DB_MESSAGE_QUERYDBREQUEST_H
