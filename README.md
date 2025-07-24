# VmHealthChecker

# VM Healthcheck

This repository contains a shell script to analyze the health of a virtual machine based on CPU, memory, and disk space.

## Usage

1. Clone this repository:
   ```sh
   git clone https://github.com/your-username/VM-healthcheck.git
   cd VM-healthcheck
   ```

2. Make the script executable:
   ```sh
   chmod +x vm_health_check.sh
   ```

3. Run the script:
   ```sh
   ./vm_health_check.sh
   ```

## How it works

- The script checks CPU, memory, and disk utilization.
- If **all three** are **less than 60% used**, the VM is declared **HEALTHY**.
- If **any** parameter is **60% or higher**, it is **UNHEALTHY**.
