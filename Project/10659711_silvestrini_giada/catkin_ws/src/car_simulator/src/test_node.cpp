#include "car_simulator/test.h"


int main(int argc, char **argv)
{
  ros::init(argc, argv, NAME_OF_THIS_NODE);
  
  test test_node;
   
  test_node.Prepare();
  
  test_node.RunPeriodically(test_node.RunPeriod);
  
  test_node.Shutdown();
  
  return (0);
}

