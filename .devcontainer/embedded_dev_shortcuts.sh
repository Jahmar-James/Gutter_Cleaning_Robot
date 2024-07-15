# ROS Aliases for ROS 2 and micro-ROS on ESP32

alias source_ros="source /opt/ros/$ROS_DISTRO/setup.bash"
alias source_micro_ros="source /uros_ws/install/local_setup.bash"
alias menuconfig="idf.py menuconfig"

# Build the workspace
alias build_ros="colcon build --symlink-install"
alias build_idf="idf.py build"

# Flash the built project to an ESP device using a simplified port number
function flash() {
    if [ -z "$1" ]; then
        echo "Error: No port number specified. Usage: flash <port_number>"
        return 1
    fi
    idf.py -p "/dev/ttyUSB$1" flash
} # Usage: flash <port_number> 


# Clean the workspace
alias clean_ros="colcon build --packages-select-clean"
alias clean_idf="idf.py fullclean"

# Change directory to commom workspace
alias cd_ros="cd ~/../uros_ws/src"
alias cd_ws="cd ~/../workspace"
alias cd_idf="cd ~/../esp-idf-projects"
alias cd_opt="cd ~/../opt" 


# Utility aliases for listing ROS 2 nodes, topics, services, and parameters to monitor the system
alias list_nodes="ros2 node list"
alias list_topics="ros2 topic list"
alias list_services="ros2 service list"
alias list_params="ros2 param list"

# Echo a topic (e.g., list messages from a topic)
alias echo_topic="ros2 topic echo"

# Display info about a topic or node
alias topic_info="ros2 topic info"
alias node_info="ros2 node info"

# List all available serial ports
function list_ports() {
    echo "Available serial ports:"
    ls /dev/ttyUSB* /dev/ttyACM* 2>/dev/null
}

# Monitor serial output from the ESP device using a simplified port number
function monitor() {
    if [ -z "$1" ]; then
        echo "Error: No port number specified. Usage: monitor <port_number>"
        return 1
    fi
    idf.py -p "/dev/ttyUSB$1" monitor
} # Usage: monitor <port_number>

# Run a ROS 2 node
alias run_node="ros2 run"

# Build and source the workspace
function build_and_source() {
    if colcon build; then
        echo "Build succeeded, sourcing the workspace."
        source /uros_ws/install/local_setup.bash
    else
        echo "Build failed, not sourcing the workspace."
        return 1
    fi
}
alias bas_ros="build_and_source"

# Add tmux for session management
alias tmux_ros="tmux new -s ros_session"
alias tmux_attach="tmux attach -t ros_session"
alias tmux_kill="tmux kill-session -t ros_session"
