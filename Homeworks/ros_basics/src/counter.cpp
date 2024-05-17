#include "ros/ros.h"
#include "std_msgs/Float64.h"
#include <sstream>

class Counter {
public:

  Counter() {
    this->sub_reader = this->n.subscribe("clock", 1000, &Counter::setClock, this);
    this->pub_count = this->n.advertise<std_msgs::Float64>("value", 1000);
  }

  void setClock(const std_msgs::Float64::ConstPtr&msg ){
    count++;
	if(count==10){
		std_msgs::Float64 send;
		send.data= count;
		this->pub_count.publish(send);
		//count=-15;
	}
  }

  void run() {
    ros::spin();
  }

private:
  ros::NodeHandle n;
  ros::Subscriber sub_reader;
  ros::Publisher pub_count;
  float count= -15;
};

int main(int argc, char **argv) {
  ros::init(argc, argv, "counter");
  Counter counter_n;
  counter_n.run();
  return 0;

}