#ifndef CAR_TRAJECTORY_CONTROL_H_
#define CAR_TRAJECTORY_CONTROL_H_

#include "ros/ros.h"
#include <std_msgs/Float64MultiArray.h>
#include <car_fblin.h>

#define NAME_OF_THIS_NODE "car_trajectory_control"


class car_trajectory_control
{
  private: 
    ros::NodeHandle Handle;

    /* ROS topics */
    ros::Subscriber vehicleState_subscriber;
    ros::Publisher vehicleCommand_publisher, controllerState_publisher;

    /* Parameters from ROS parameter server */
    double P_dist, l, K_p_x, K_p_y, K_i_x, K_i_y, T_i_x, T_i_y;;

    /* ROS topic callbacks */
    void vehicleState_MessageCallback(const std_msgs::Float64MultiArray::ConstPtr& msg);

    /* Node periodic task */
    void PeriodicTask(void);
    
    /* Node state variables */
    car_fblin* controller;
    double xref, yref, dxref, dyref;
    double xP, yP, xPref, yPref;
    double old_x_ref, old_y_ref;
    double old_x, old_y;
    double vPx, vPy, v, phi;
    double T;
    double saved_I_x, saved_I_y;

  public:
    float RunPeriod;

    void Prepare(void);
    
    void RunPeriodically(float Period);
    
    void Shutdown(void);

};

#endif /* CAR_TRAJECTORY_CONTROL_H_ */
