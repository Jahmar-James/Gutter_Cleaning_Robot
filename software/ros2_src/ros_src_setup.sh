#!/bin/bash
set -e

# Navigate to the workspace root
cd "$(dirname "$0")/.."

# Clone the main repository if not already cloned
if [ ! -d "uros_ws/src" ]; then
  git clone https://github.com/username/my_ros2_project.git
fi

# Import external repositories
vcs import src < .rosinstall

# Build the workspace
colcon build

echo "Setup complete!"
echo "To use this workspace, run 'source $(pwd)/install/setup.bash'"
