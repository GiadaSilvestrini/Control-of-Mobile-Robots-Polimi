#include "unicycle_dyn_sim/test_simple.h"

void test_simple::Prepare(void)
{
    /* ROS topics */
    vehicleCommand_publisher = Handle.advertise<std_msgs::Float64MultiArray>("/robot_input", 1);

    /* Initialize node state */
    RunPeriod = RUN_PERIOD_DEFAULT;

    force = tau = 0.0;

    ROS_INFO("Node %s ready to run.", ros::this_node::getName().c_str());
}

void test_simple::RunPeriodically(float Period)
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

void test_simple::Shutdown(void)
{
    ROS_INFO("Node %s shutting down.", ros::this_node::getName().c_str());
}

void test_simple::PeriodicTask(void)
{
    /* Vehicle commands */
    if (ros::Time::now().toSec()<=5.0)
    {
        force = 0.5;
        tau = 0.0;
    }
    else
    {
        force = 0.0;
        tau = 0.01;
    }

    /* Publishing vehicle commands (t, msg->data[0]; velocity, msg->data[1]; steer, msg->data[2]) */
    std_msgs::Float64MultiArray msg;
    msg.data.push_back(ros::Time::now().toSec());
    msg.data.push_back(force);
    msg.data.push_back(tau);
    vehicleCommand_publisher.publish(msg);
}
