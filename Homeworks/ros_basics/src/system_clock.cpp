#include "ros/ros.h"
#include "std_msgs/Float64.h"
#include <sstream>

class SystemClock{
public:

  SystemClock() {
	 this->pub_clock = this->n.advertise<std_msgs::Float64>("clock", 1000);
	 this->n.getParam("increment", this->increment);
  }
  float clock=0;
  float increment;
  ros::Publisher pub_clock;  

private:
  ros::NodeHandle n;
};

int main(int argc, char **argv) {
  ros::init(argc, argv, "clock");
  SystemClock clock_node;
  ros::Rate LoopRate(1.0/5);
  
  while (ros::ok())
	{
		clock_node.clock= clock_node.clock + clock_node.increment;
		std_msgs::Float64 send;
		send.data= clock_node.clock;
		clock_node.pub_clock.publish(send);
		ros::spinOnce();
		LoopRate.sleep();
	}
  return 0;
}