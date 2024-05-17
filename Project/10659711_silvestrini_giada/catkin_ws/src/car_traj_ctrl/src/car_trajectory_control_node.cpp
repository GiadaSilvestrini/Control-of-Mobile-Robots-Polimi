#include "car_trajectory_control/car_trajectory_control.h"


int main(int argc, char **argv)
{
  ros::init(argc, argv, NAME_OF_THIS_NODE);
  
  car_trajectory_control car_trajectory_control_node;
   
  car_trajectory_control_node.Prepare();
  
  car_trajectory_control_node.RunPeriodically(car_trajectory_control_node.RunPeriod);
  
  car_trajectory_control_node.Shutdown();
  
  return (0);
}

