#!/bin/bash

set -e

detect_os()
{
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        OS=$ID
    else
        echo "ERROR: Cannot detect OS. /etc/os-release missing."
        exit 1
    fi
}

update_package_list()
{
    case "$OS" in
        ubuntu|debian)
            sudo apt-get update
            ;;
        arch)
            sudo pacman -Sy
            ;;
        *)
            echo "Unsupported OS: $OS"
            exit 1
            ;;
    esac
}

is_installed()
{
    local pkg=$1
    case "$OS" in
        ubuntu|debian)
            dpkg -s "$pkg" &>/dev/null
            ;;
        arch)
            pacman -Q "$pkg" &>/dev/null
            ;;
    esac
}

install_missing_packages()
{
    local packages=("$@")
    local missing=()
    for pkg in "${REQUIRED_PACKAGES[@]}"; do
        if ! is_installed "$pkg"; then
            missing+=("$pkg")
        fi
    done

    if [ "${#missing[@]}" -eq 0 ]; then
        echo "INFO: All required packages are already installed."
    else
        echo "INFO: Installing: ${missing[*]}"
        case "$OS" in
            ubuntu|debian)
                sudo apt-get install -y "${missing[@]}"
                ;;
            arch)
                sudo pacman -S --noconfirm "${missing[@]}"
                ;;
        esac
    fi
}

check_and_install()
{
    local packages=("$@")
    if [ "${#packages[@]}" -eq 0 ]; then
        echo "USAGE: $0 package1 package2 ..."
        exit 1
    fi
    detect_os
    echo "INFO: Detected OS ($OS)"
    update_package_list
    install_missing_packages "${packages[@]}"
    echo "INFO: Done"
}

check_and_install "$@"
