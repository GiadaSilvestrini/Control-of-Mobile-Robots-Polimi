#include "bicycle_sim/test_circle.h"


int main(int argc, char **argv)
{
  ros::init(argc, argv, NAME_OF_THIS_NODE);
  
  test_circle test_circle_node;
   
  test_circle_node.Prepare();
  
  test_circle_node.RunPeriodically(test_circle_node.RunPeriod);
  
  test_circle_node.Shutdown();
  
  return (0);
}

