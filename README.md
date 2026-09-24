# crazyflie-optitrack

Official meta-repository for the covenant-tec architecture, providing a unified ROS 2 workspace for controlling Crazyflie 2.X quadcopters using OptiTrack motion capture systems.

This workspace aggregates the distributed repositories comprising Kevin Martinez's doctoral research project into a single environment.

## Components

This workspace integrates the following core repositories:

- `crazybridge`: Core ROS 2 bridge for Crazyflie communication.
- `crazybridge_interfaces`: Custom ROS 2 message definitions.
- `optitrack_client`: Motion capture data streaming client.
- `crazyflie-firmware`: Custom modified firmware for open-loop thrust and OptiTrack integration.

## Installation

Ensure the ROS 2 vcstool package is installed on your system.

```bash
sudo apt install python3-vcstool
```

Clone this meta-repository to your local machine.

```bash
git clone https://github.com/covenant-tec/crazyflie-optitrack.git
cd crazyflie-optitrack
```

Import the components into the workspace.

```bash
mkdir -p src firmware
vcs import . < crazyflie-optitrack.repos
```

## Build & Workspace Structure

The `colcon build` command should be executed from within the `src` directory for this architecture. Following compilation, the `install` and `build` directories will reside inside `src`.

## Scripts

### [source_all.sh](source_all.sh)

This script automates the environment setup required to run the workspace. It detects and sources the installed ROS 2 distribution (prioritizing Jazzy), sources the local workspace (`src/install/setup.bash`), and activates a Python virtual environment if one is found in the directory hierarchy or provided as an argument.

```bash
# Source automatically
source source_all.sh

# Source with explicit virtual environment
source source_all.sh /path/to/.venv
```

## Updating the Workspace

To pull the latest changes across all repositories:

```bash
vcs pull src
```

---

## Credits

The core architecture, firmware, and packages were developed by [Kevin Martinez](https://github.com/Fairbrook).

Meta-repository created by [Alejandro Mojarras](https://github.com/Mojarras7).
