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

## Updating the Workspace

To pull the latest changes across all repositories:

```bash
vcs pull src
```

---

## Credits

The core architecture, firmware, and packages were developed by [Kevin Martinez](https://github.com/Fairbrook).

Meta-repository created by [Alejandro Mojarras](https://github.com/Mojarras7).
