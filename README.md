# fastfetch-cli-installer-ubuntu

A lightweight, POSIX-compliant shell script to automate the installation of **Fastfetch** on Ubuntu desktops and servers using the latest PPA.

## 🚀 Quick Install

Run the following command in your terminal to add the repository and install Fastfetch:

```bash
curl -fsSL https://is.gd/ubuntufastfetch | sudo bash
```

*Note: You can also pipe to `sh` as the script is POSIX compliant.*

## 📋 What does this script do?

This script automates the standard installation process to ensure a hands-off experience:

1.  **Privilege Check:** Automatically detects if `sudo` is required.
2.  **Prerequisites:** Installs `software-properties-common` to ensure `add-apt-repository` is available.
3.  **Repo Management:** Adds the `ppa:zhangsongcui3371/fastfetch` repository (Ubuntu 22.04+).
4.  **Installation:** Updates package lists and installs the latest binary.

## 🐧 Compatibility

*   **OS:** Ubuntu 22.04 (Jammy Jellyfish) and newer.
*   **Shells:** Compatible with `sh`, `bash`, `zsh`, and `dash`.

## 📦 Manual Execution

If you prefer not to pipe `curl` directly to `bash`, you can run the steps manually:

```bash
# Download the script
wget https://is.gd/ubuntufastfetch -O install_fastfetch.sh

# Inspect the code (optional but recommended)
cat install_fastfetch.sh

# Make executable and run
chmod +x install_fastfetch.sh
sudo ./install_fastfetch.sh
```

## 📄 Credits

*   **Fastfetch Project:** [fastfetch-cli/fastfetch](https://github.com/fastfetch-cli/fastfetch)
*   **PPA Maintainer:** [zhangsongcui3371](https://launchpad.net/~zhangsongcui3371/+archive/ubuntu/fastfetch)
