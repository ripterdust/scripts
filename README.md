# List of scripts used in our daily job

## Installation

You can install all the scripts with the next command:

`sudo chmod 777 install.sh && ./install.sh`

|  **Script name** |                 **Ussage**                |                                           **Description**                                          |
|:----------------:|:-----------------------------------------:|:--------------------------------------------------------------------------------------------------:|
| **install.sh**   | sudo chmod 777 install.sh && ./install.sh | This script installs all the next scripts in the computer                                          |
| **localParams**  | localParams                               | This script generate the local-params file. You must be in the febe repo in order to make it work. |


You can also only install the local-params script by running this command
`wget https://raw.githubusercontent.com/ripterdust/scripts/refs/heads/main/install-local-params.sh && chmod +x ./install-local-params.sh && ./install-local-params.sh && rm -rf ~/install-local-params.sh`
