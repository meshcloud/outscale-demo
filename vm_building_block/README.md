# Outscale Virtual Machine Building Block
## Description
- This Building Block creates a Virtual Machine in the Public Cloud
- An Outscale Security Group will be created to allow traffic to connect to the VM on port 22 for SSH and port 8080 to connect to a hosted application
- Once created, you can SSH into the VM and run the commands found below to install Docker and run a simple Hello World application in Node.js

## Required Inputs
- VM Image ID
- VM Type
- Range of IPs that will be allowed to connect to the VM
- Outscale Subregion

## Outputs
- Private Key for SSH connection
- Commands to run to establish SSH connection to VM
- Exposed Ports on the VM

## To SSH into VM
- Copy the value from the output "keypair_private_key" into a file (key.rsa) on your local machine
- Run the commands found in the output "ssh_commands" to modify the permissions on key.rsa then SSH into the VM
- You should now be connected to your VM. You can run commands as needed to host your application
  - Example commands to install Docker, clone a Github Repo (Hello World Node.js app), then build and run a Docker image. App can be visited at port 8080 of the VM Public IP
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
git clone https://github.com/IBM/node-hello-world.git
cd node-hello-world
sudo docker build -t node-hello-world:latest .
sudo docker run -it -p 8080:8080 --name node-hello-world node-hello-world:latest
```