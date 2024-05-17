#include "bicycle_sim/test_circle.h"

void test_circle::Prepare(void)
{
    /* ROS topics */
    vehicleCommand_publisher = Handle.advertise<std_msgs::Float64MultiArray>("/car_input", 1);

    /* Initialize node state */
    RunPeriod = RUN_PERIOD_DEFAULT;

    steer = speed = 0.0;

    ROS_INFO("Node %s ready to run.", ros::this_node::getName().c_str());
}

void test_circle::RunPeriodically(float Period)
{
    ros::Rate LoopRate(1.0/Period);

    ROS_INFO("Node %s running periodically (T=%.2fs, f=%.2fHz).", ros::this_node::getName().c_str(), Period, 1.0/Period);

    while (ros::ok())
    {
        PeriodicTask();

        ros::spinOnce();

        LoopRate.sleep();
    }
}

void test_circle::Shutdown(void)
{
    ROS_INFO("Node %s shutting down.", ros::this_node::getName().c_str());
}

void test_circle::PeriodicTask(void)
{
    /* Circle trajectory generation */
    // Trajectory parameters (these parameters should be moved to the parameter server)
    const double R = 1.0;
    const double w = 2.5;

    // Trajectory computation
    xref    = R*(std::cos(w*ros::Time::now().toSec())-1.0);
    dxref   = -std::pow(w,1.0)*R*std::sin(w*ros::Time::now().toSec());
    ddxref  = -std::pow(w,2.0)*R*std::cos(w*ros::Time::now().toSec());
    dddxref =  std::pow(w,3.0)*R*std::sin(w*ros::Time::now().toSec());
    yref    = R*std::sin(w*ros::Time::now().toSec());
    dyref   =  std::pow(w,1.0)*R*std::cos(w*ros::Time::now().toSec());
    ddyref  = -std::pow(w,2.0)*R*std::sin(w*ros::Time::now().toSec());
    dddyref = -std::pow(w,3.0)*R*std::cos(w*ros::Time::now().toSec());

    /* Vehicle commands */
    // Vehicle parameters (these parameters should be moved to the parameter server)
    const double L = 0.26;

    // Flatness transformation
    speed = std::sqrt(std::pow(dxref,2.0)+std::pow(dyref,2.0));
    steer = std::atan((dxref*ddyref-dyref*ddxref)/std::pow(std::pow(dxref,2.0)+std::pow(dyref,2.0),1.5)*L);

    /* Publishing vehicle commands (t, msg->data[0]; velocity, msg->data[1]; steer rate of change, msg->data[2]) */
    std_msgs::Float64MultiArray msg;
    msg.data.push_back(ros::Time::now().toSec());
    msg.data.push_back(speed);
    msg.data.push_back(steer);
    vehicleCommand_publisher.publish(msg);
}
