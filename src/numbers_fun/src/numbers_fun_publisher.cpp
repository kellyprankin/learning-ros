#include <chrono>
#include <memory>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"

using namespace std::chrono_literals;

class NumbersFunPublisher : public rclcpp::Node
{
    public:
        NumbersFunPublisher()
            : Node("number_publisher"), count_(0)
        {
            publisher_ = this->create_publisher<std_msgs::msg::String>("topic", 10);
            timer_ = this->create_wall_timer(500ms, std::bind(&NumbersFunPublisher::timer_callback, this));
        }

    private:

        void timer_callback()
        {
            auto message = std_msgs::msg::String();
            message.data = "Random number:" + std::to_string(rand() % 100000 + 1);

            RCLCPP_INFO(this->get_logger(), "Publishing: '%s'", message.data.c_str());
            publisher_->publish(message);
        }

        size_t count_;
        rclcpp::TimerBase::SharedPtr timer_;
        rclcpp::Publisher<std_msgs::msg::String>::SharedPtr publisher_;
};

int main(int argc, char * argv[])
{
     srand (time(NULL));
     rclcpp::init(argc, argv);
     rclcpp::spin(std::make_shared<NumbersFunPublisher>());
     rclcpp::shutdown();

     return 0;
}