// Generated by gencpp from file mstar/Planner.msg
// DO NOT EDIT!


#ifndef MSTAR_MESSAGE_PLANNER_H
#define MSTAR_MESSAGE_PLANNER_H

#include <ros/service_traits.h>


#include <mstar/PlannerRequest.h>
#include <mstar/PlannerResponse.h>


namespace mstar
{

struct Planner
{

typedef PlannerRequest Request;
typedef PlannerResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Planner
} // namespace mstar


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::mstar::Planner > {
  static const char* value()
  {
    return "2c33b00954b55861c63aadbc1c315126";
  }

  static const char* value(const ::mstar::Planner&) { return value(); }
};

template<>
struct DataType< ::mstar::Planner > {
  static const char* value()
  {
    return "mstar/Planner";
  }

  static const char* value(const ::mstar::Planner&) { return value(); }
};


// service_traits::MD5Sum< ::mstar::PlannerRequest> should match 
// service_traits::MD5Sum< ::mstar::Planner > 
template<>
struct MD5Sum< ::mstar::PlannerRequest>
{
  static const char* value()
  {
    return MD5Sum< ::mstar::Planner >::value();
  }
  static const char* value(const ::mstar::PlannerRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::mstar::PlannerRequest> should match 
// service_traits::DataType< ::mstar::Planner > 
template<>
struct DataType< ::mstar::PlannerRequest>
{
  static const char* value()
  {
    return DataType< ::mstar::Planner >::value();
  }
  static const char* value(const ::mstar::PlannerRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::mstar::PlannerResponse> should match 
// service_traits::MD5Sum< ::mstar::Planner > 
template<>
struct MD5Sum< ::mstar::PlannerResponse>
{
  static const char* value()
  {
    return MD5Sum< ::mstar::Planner >::value();
  }
  static const char* value(const ::mstar::PlannerResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::mstar::PlannerResponse> should match 
// service_traits::DataType< ::mstar::Planner > 
template<>
struct DataType< ::mstar::PlannerResponse>
{
  static const char* value()
  {
    return DataType< ::mstar::Planner >::value();
  }
  static const char* value(const ::mstar::PlannerResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MSTAR_MESSAGE_PLANNER_H
