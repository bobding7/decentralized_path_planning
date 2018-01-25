// Generated by gencpp from file mstar/PlanPathRequest.msg
// DO NOT EDIT!


#ifndef MSTAR_MESSAGE_PLANPATHREQUEST_H
#define MSTAR_MESSAGE_PLANPATHREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <mstar/Pose2DList.h>
#include <mstar/Pose2DList.h>

namespace mstar
{
template <class ContainerAllocator>
struct PlanPathRequest_
{
  typedef PlanPathRequest_<ContainerAllocator> Type;

  PlanPathRequest_()
    : robotIDs()
    , startPosition()
    , goalPosition()  {
    }
  PlanPathRequest_(const ContainerAllocator& _alloc)
    : robotIDs(_alloc)
    , startPosition(_alloc)
    , goalPosition(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<int8_t, typename ContainerAllocator::template rebind<int8_t>::other >  _robotIDs_type;
  _robotIDs_type robotIDs;

   typedef  ::mstar::Pose2DList_<ContainerAllocator>  _startPosition_type;
  _startPosition_type startPosition;

   typedef  ::mstar::Pose2DList_<ContainerAllocator>  _goalPosition_type;
  _goalPosition_type goalPosition;




  typedef boost::shared_ptr< ::mstar::PlanPathRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mstar::PlanPathRequest_<ContainerAllocator> const> ConstPtr;

}; // struct PlanPathRequest_

typedef ::mstar::PlanPathRequest_<std::allocator<void> > PlanPathRequest;

typedef boost::shared_ptr< ::mstar::PlanPathRequest > PlanPathRequestPtr;
typedef boost::shared_ptr< ::mstar::PlanPathRequest const> PlanPathRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mstar::PlanPathRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mstar::PlanPathRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace mstar

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'mstar': ['/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::mstar::PlanPathRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mstar::PlanPathRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mstar::PlanPathRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mstar::PlanPathRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mstar::PlanPathRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mstar::PlanPathRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mstar::PlanPathRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "204d82065e1ba988caff1953ea51490a";
  }

  static const char* value(const ::mstar::PlanPathRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x204d82065e1ba988ULL;
  static const uint64_t static_value2 = 0xcaff1953ea51490aULL;
};

template<class ContainerAllocator>
struct DataType< ::mstar::PlanPathRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mstar/PlanPathRequest";
  }

  static const char* value(const ::mstar::PlanPathRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mstar::PlanPathRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int8[] robotIDs\n\
Pose2DList startPosition\n\
Pose2DList goalPosition\n\
\n\
================================================================================\n\
MSG: mstar/Pose2DList\n\
Pose2D[] path2D\n\
================================================================================\n\
MSG: mstar/Pose2D\n\
float32 x\n\
float32 y\n\
float32 yaw\n\
int8 timeStamp\n\
";
  }

  static const char* value(const ::mstar::PlanPathRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mstar::PlanPathRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.robotIDs);
      stream.next(m.startPosition);
      stream.next(m.goalPosition);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PlanPathRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mstar::PlanPathRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mstar::PlanPathRequest_<ContainerAllocator>& v)
  {
    s << indent << "robotIDs[]" << std::endl;
    for (size_t i = 0; i < v.robotIDs.size(); ++i)
    {
      s << indent << "  robotIDs[" << i << "]: ";
      Printer<int8_t>::stream(s, indent + "  ", v.robotIDs[i]);
    }
    s << indent << "startPosition: ";
    s << std::endl;
    Printer< ::mstar::Pose2DList_<ContainerAllocator> >::stream(s, indent + "  ", v.startPosition);
    s << indent << "goalPosition: ";
    s << std::endl;
    Printer< ::mstar::Pose2DList_<ContainerAllocator> >::stream(s, indent + "  ", v.goalPosition);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MSTAR_MESSAGE_PLANPATHREQUEST_H
