Here’s the `README.md` with the additional commands formatted and clarified as requested:

```markdown
# Server Setup Script

This Bash script automates the setup of a server by installing essential packages, creating a swap file, and configuring the environment with Node.js, Apache2, and PM2 for managing Node.js applications.

## Prerequisites

- **Root Privileges**: This script requires root or `sudo` privileges to install software packages and modify system configurations.
- **Debian-based System**: The script is tailored for Debian-based distributions like Ubuntu.

## Features

The script performs the following setup tasks:

1. **Update Package Lists**: Ensures your package lists are current for reliable installations.
2. **Install curl**: Installs `curl` if it is not already present on the system.
3. **Add Swap Memory**: Adds a 1GB swap file if not already configured.
4. **Install Node.js (v18)**: Installs Node.js version 18, if not already present.
5. **Install Apache2**: Installs the Apache2 web server if it’s not already installed.
6. **Install PM2**: Installs PM2 globally for managing Node.js applications, along with `npm` if it is not already installed.

## Usage

To use this script, follow these steps:

1. **Clone the Repository**: Clone this repository or download the script file directly to your server.

   ```bash
   git clone git@github.com:mojahid0862/server_setup.git
   cd server_setup
   ```

2. **Give Execute Permissions**: Grant execution permissions to the script.

   ```bash
   chmod +x server-setup.sh
   ```

3. **Start the Script**: Run the script with root privileges.

   ```bash
   sudo ./server-setup.sh
   ```

## Detailed Functionality

### 1. Package Update

   Ensures that your package list is up to date:

   ```bash
   apt-get update -y
   ```

### 2. curl Installation

   Installs `curl`, a command-line tool for transferring data, if it is not already installed.

### 3. Swap Memory Setup

   Checks if a swap file is already in place. If not, creates a 1GB swap file, configures permissions, activates it, and ensures it is enabled on reboot.

### 4. Node.js Installation

   Installs Node.js version 18 if it is not already present on the system.

### 5. Apache2 Installation

   Installs the Apache2 web server if it is not already installed. This setup is ideal for hosting static websites or acting as a reverse proxy.

### 6. PM2 and npm Installation

   - Installs `npm` if it is missing.
   - Adds npm’s global binary directory to `PATH` to ensure PM2 is accessible.
   - Installs PM2 globally, allowing you to manage and keep Node.js applications running continuously.

## Output

The script will print the status of each step, indicating whether a component was already installed or if the installation was successful. Any errors encountered during installation will halt the script and display an error message.

## Notes

- **Compatibility**: Designed for Debian-based systems. Commands may vary on other Linux distributions.
- **Logging**: Consider redirecting output to a log file for debugging or auditing purposes.

## Troubleshooting

- **Permission Denied**: Ensure you’re running the script with root or `sudo` privileges.
- **PATH Issues**: The script attempts to add npm’s global directory to `PATH` if PM2 is not immediately accessible. Ensure to restart your shell or log in/out if issues persist.

## Contributing

Feel free to open issues or submit pull requests for improvements. Contributions are welcome!

---

By automating your server setup with this script, you can ensure a consistent environment every time you deploy a new instance. Happy coding!
```

This version has everything organized with the commands clearly shown, making it easier for users to follow along. Let me know if any further customization is needed!