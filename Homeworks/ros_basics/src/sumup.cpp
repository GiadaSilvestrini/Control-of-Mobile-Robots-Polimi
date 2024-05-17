#include "ros/ros.h"
#include "std_msgs/Float64.h"
#include <sstream>

class SumUp {
public:

  SumUp() {
    this->sub_reader = this->n.subscribe("value", 1000, &SumUp::compute, this);
	this->pub_sum = this->n.advertise<std_msgs::Float64>("sum", 1000);
  }

  void compute(const std_msgs::Float64::ConstPtr &msg ){
    sum=sum+ msg->data;
	if(i==1){
		sum= sum*1;
		std_msgs::Float64 send;
		send.data= sum;
		this->pub_sum.publish(send);
		ROS_INFO("The result is %f",  sum);
	}
	i++;
  }

  void run() {
    ros::spin();
  }

private:
  ros::NodeHandle n;
  ros::Subscriber sub_reader;
  ros::Publisher pub_sum;
  float sum= 0;
  float i=0;
};

int main(int argc, char **argv) {
  ros::init(argc, argv, "sumup");
  SumUp sum_up;
  sum_up.run();
  return 0;

}