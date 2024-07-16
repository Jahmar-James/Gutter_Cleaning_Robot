# My ROS2 Project

This project is a ROS2 workspace containing packages for XYZ functionality. The `src` directory contains all the source code and external dependencies.

## Folder Structure

The directory structure is organized as follows:

```
uros_ws/
├── src/
│   ├── repos/
│   │   ├── external_package1/
│   │   ├── external_package2/
│   ├── your_package1/
│   ├── your_package2/
│   ├── setup.sh
│   ├── .rosinstall
├── build/ -> /path/to/symlinked/build
├── install/ -> /path/to/symlinked/install
├── log/ -> /path/to/symlinked/log
└── README.md
```

## Setup Instructions

### Prerequisites

- ROS2 Foxy Fitzroy (or your ROS2 distribution)
- Python3
- vcs tool: `sudo apt-get install python3-vcstool`

### Cloning and Building the Project

To set up this project on your local machine, follow these steps:

1. **Clone the Repository**
   ```sh
   git clone https://github.com/username/my_ros2_project.git
   cd my_ros2_project/uros_ws/src
   ```

2. **Run the Setup Script**
   ```sh
   ./ros_src_setup.sh
   ```

### Using the Workspace

To use this workspace in a terminal session, source the setup script:

```sh
source /path/to/your/workspace/install/setup.bash
```

For convenience, you can create an alias in your `~/.bashrc` or `~/.zshrc`:

```sh
alias source_my_ros2_project='source /path/to/your/workspace/install/setup.bash'
```

Now, you can simply run `source_my_ros2_project` in any terminal session to set up your environment.

### External Dependencies

This project uses several external packages. These are managed using a `.rosinstall` file.

### Importing External Packages

To clone all external packages, run the following command from the workspace root:

```sh
vcs import src < .rosinstall
```

### Updating External Packages

To update all external packages, run:

```sh
vcs pull src
```

