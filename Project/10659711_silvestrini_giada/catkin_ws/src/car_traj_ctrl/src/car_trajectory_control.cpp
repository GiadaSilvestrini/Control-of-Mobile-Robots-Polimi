#include "car_trajectory_control/car_trajectory_control.h"

#include <unistd.h>
#include <cmath>


void car_trajectory_control::Prepare(void)
{
    /* Retrieve parameters from ROS parameter server */
    std::string FullParamName;

    // run_period
    FullParamName = ros::this_node::getName()+"/run_period";
    if (false == Handle.getParam(FullParamName, RunPeriod))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());

    // Controller parameters
    FullParamName = ros::this_node::getName()+"/P_dist";
    if (false == Handle.getParam(FullParamName, P_dist))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());

    FullParamName = ros::this_node::getName()+"/l";
    if (false == Handle.getParam(FullParamName, l))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());

    FullParamName = ros::this_node::getName()+"/K_p_x";
    if (false == Handle.getParam(FullParamName, K_p_x))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());

    FullParamName = ros::this_node::getName()+"/K_p_y";
    if (false == Handle.getParam(FullParamName, K_p_y))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());

    FullParamName = ros::this_node::getName()+"/K_i_x";
    if (false == Handle.getParam(FullParamName, K_i_x))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());

    FullParamName = ros::this_node::getName()+"/K_i_y";
    if (false == Handle.getParam(FullParamName, K_i_y))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());

    FullParamName = ros::this_node::getName()+"/T_i_x";
    if (false == Handle.getParam(FullParamName, T_i_x))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());

    FullParamName = ros::this_node::getName()+"/T_i_y";
    if (false == Handle.getParam(FullParamName, T_i_y))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());

    FullParamName = ros::this_node::getName()+"/old_x";
    if (false == Handle.getParam(FullParamName, old_x))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());

    FullParamName = ros::this_node::getName()+"/old_y";
    if (false == Handle.getParam(FullParamName, old_y))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());
    
    FullParamName = ros::this_node::getName()+"/old_x_ref";
    if (false == Handle.getParam(FullParamName, old_x_ref))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());
    
    FullParamName = ros::this_node::getName()+"/old_y_ref";
    if (false == Handle.getParam(FullParamName, old_y_ref))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());

    FullParamName = ros::this_node::getName()+"/T";
    if (false == Handle.getParam(FullParamName, T))
        ROS_ERROR("Node %s: unable to retrieve parameter %s.", ros::this_node::getName().c_str(), FullParamName.c_str());
    
    saved_I_x = 0;
    saved_I_y = 0;

    /* ROS topics */
    vehicleState_subscriber = Handle.subscribe("/car_state", 1, &car_trajectory_control::vehicleState_MessageCallback, this);
    vehicleCommand_publisher = Handle.advertise<std_msgs::Float64MultiArray>("/car_input", 1);
    controllerState_publisher = Handle.advertise<std_msgs::Float64MultiArray>("/controller_state", 1);

    /* Create controller class */
    controller = new car_fblin(P_dist);

    // Initialize controller parameters
    controller->set_carParam(l);

    ROS_INFO("Node %s ready to run.", ros::this_node::getName().c_str());
}

void car_trajectory_control::RunPeriodically(float Period)
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

void car_trajectory_control::Shutdown(void)
{
    // Delete controller object
    delete controller;

    ROS_INFO("Node %s shutting down.", ros::this_node::getName().c_str());
}

void car_trajectory_control::vehicleState_MessageCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
{
    // Input command: t, msg->data[0]; x, msg->data[1]; y, msg->data[2]; theta, msg->data[3];
    // linear velocity, msg->data[4]; angular velocity, msg->data[5]
    /*  Set vehicle state */
    controller->set_carState(msg->data.at(1), msg->data.at(2), msg->data.at(3));
}

void car_trajectory_control::PeriodicTask(void)
{
    /* 8-shaped trajectory generation */
    // Trajectory parameters (these parameters should be moved to the parameter server)
    const double a = 2.0;
    const double w = (2 * M_PI) / T;

    // Trajectory computation
    xref    = a*std::sin(w*ros::Time::now().toSec());
    dxref   = w*a*std::cos(w*ros::Time::now().toSec());
    yref    = a*std::sin(w*ros::Time::now().toSec())*std::cos(w*ros::Time::now().toSec());
    dyref   = w*a*(std::pow(std::cos(w*ros::Time::now().toSec()),2.0)-std::pow(std::sin(w*ros::Time::now().toSec()),2.0));

    /*  Compute the control action */
    // Transform trajectory to point P
    controller->reference_transformation(xref, yref, xPref, yPref);
    controller->output_transformation(xP, yP);

    // Trajectory tracking law
    saved_I_x += (K_i_x*T_i_x/T_i_x)*((xPref-xP)-(old_x_ref-old_x));
    saved_I_y += (K_i_y*T_i_y/T_i_x)*((yPref-yP)-(old_y_ref-old_y));
    vPx = dxref+K_p_x*(xPref-xP)+saved_I_x;
    vPy = dyref+K_p_y*(yPref-yP)+saved_I_y;
    old_x_ref = xPref;
    old_y_ref = yPref;
    old_x = xP;
    old_y = yP;

    // Linearization law
    controller->control_transformation(vPx, vPy, v, phi);;

    /*  Publish vehicle commands */
    std_msgs::Float64MultiArray vehicleCommandMsg;
    vehicleCommandMsg.data.push_back(ros::Time::now().toSec());
    vehicleCommandMsg.data.push_back(v);
    vehicleCommandMsg.data.push_back(phi);
    vehicleCommand_publisher.publish(vehicleCommandMsg);

    /*  Publish controller state */
    std_msgs::Float64MultiArray controllerStateMsg;
    controllerStateMsg.data.push_back(ros::Time::now().toSec());
    controllerStateMsg.data.push_back(xref);
    controllerStateMsg.data.push_back(yref);
    controllerStateMsg.data.push_back(xPref);
    controllerStateMsg.data.push_back(yPref);
    controllerStateMsg.data.push_back(xP);
    controllerStateMsg.data.push_back(yP);
    controllerStateMsg.data.push_back(vPx);
    controllerStateMsg.data.push_back(vPy);
    controllerStateMsg.data.push_back(v);
    controllerStateMsg.data.push_back(phi);
    controllerState_publisher.publish(controllerStateMsg);
}
