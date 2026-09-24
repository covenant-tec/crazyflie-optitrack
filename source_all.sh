#!/bin/bash

# Retrieve absolute path of the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

echo "Configuring environment"

# ROS 2 Environment
if [ -z "$ROS_DISTRO" ]; then
    if [ -d "/opt/ros/jazzy" ]; then
        source /opt/ros/jazzy/setup.bash
        echo "ROS 2 jazzy sourced"
    else
        AVAILABLE_ROS=$(ls /opt/ros 2>/dev/null | head -n 1)
        if [ -n "$AVAILABLE_ROS" ]; then
            source "/opt/ros/$AVAILABLE_ROS/setup.bash"
            echo "ROS 2 $AVAILABLE_ROS sourced"
        else
            echo "WARNING: No ROS 2 installation found in /opt/ros/"
        fi
    fi
else
    if [ -f "/opt/ros/$ROS_DISTRO/setup.bash" ]; then
        source "/opt/ros/$ROS_DISTRO/setup.bash"
        echo "ROS 2 $ROS_DISTRO sourced"
    fi
fi

# Local Workspace Environment
WORKSPACE_SETUP="$SCRIPT_DIR/src/install/setup.bash"
if [ -f "$WORKSPACE_SETUP" ]; then
    source "$WORKSPACE_SETUP"
    echo "Local workspace sourced"
else
    echo "WARNING: Workspace setup script not found at $WORKSPACE_SETUP"
fi

# Python Virtual Environment
VENV_ACTIVATED=0
VENV_ARG="$1"

if [ -n "$VENV_ARG" ]; then
    if [ -f "$VENV_ARG/bin/activate" ]; then
        source "$VENV_ARG/bin/activate"
        echo "Virtual environment sourced: $VENV_ARG"
        VENV_ACTIVATED=1
    elif [ -f "$VENV_ARG" ] && [[ "$VENV_ARG" == *"activate" ]]; then
        source "$VENV_ARG"
        echo "Virtual environment sourced: $VENV_ARG"
        VENV_ACTIVATED=1
    else
        echo "ERROR: Activation script not found in $VENV_ARG"
    fi
else
    POSSIBLE_VENVS=(
        "$SCRIPT_DIR/.venv"
        "$SCRIPT_DIR/venv"
        "$SCRIPT_DIR/../.venv"
        "$SCRIPT_DIR/../venv"
    )

    for venv_path in "${POSSIBLE_VENVS[@]}"; do
        if [ -f "$venv_path/bin/activate" ]; then
            source "$venv_path/bin/activate"
            echo "Virtual environment automatically sourced: $venv_path"
            VENV_ACTIVATED=1
            break
        fi
    done
fi

if [ $VENV_ACTIVATED -eq 0 ]; then
    echo "WARNING: No Python virtual environment detected."
    echo "Activate it manually or pass the path as an argument."
    echo "Usage: source source_all.sh /path/to/.venv"
fi
