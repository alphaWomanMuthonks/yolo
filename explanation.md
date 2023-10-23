# YOLO PROJECT IMPLEMENTED BY ANSIBLE ,DOCKER and VAGRANT

The Yolo project includes three containers: `client`, `backend`, and `mongo`.

## Choice of the Base Image

- **Client Container**and **Backend Container**: They are based on the node:16-alpine ,its lightweight and compatible with the application.

- **MongoDB Container**: The MongoDB container utilizes the official `mongo:jammy` image. The specific version (`jammy`) is used to ensure compatibility with the application's requirements.

## Dockerfile Directives

- **Client Container**: The Dockerfile for the `client` service is located in the `./client` directory. It includes directives such as `FROM`, `COPY`, `RUN`, and `CMD`. These directives set up the Node.js environment, copy application code, install dependencies, and define the command to start the client application.

- **Backend Container**: The Dockerfile for the `backend` service is located in the `./backend` directory and similarly includes directives like `FROM`, `COPY`, `RUN`, and `CMD` tailored to our Python-based backend application.

- **MongoDB Container**: No custom Dockerfile is required for the MongoDB container as we use the official image provided by MongoDB.

## SETUP THE VAGRANT VIRTUAL MACHINE

-To setup a virtual machine using vagrant, use latest Ubuntu server like bento/ubuntu-22.04 which is a suitable choice

-Add as a Virtualbox using: vagrant box add bento/ubuntu-22.04

-Initialise the virtual machine : vagrant init bento/ubuntu-22.04

-Configure the vagrant file with ansible:  config.vm.provision "ansible" do |ansible|
                                            ansible.playbook = "playbook.yml" 
                                           end

-Start the Virtual machine : Vagrant up

## SET PLAYBOOK.YML

-Give a name,

-Specify the hosts

-List the roles available (e.g., client, backend, common)

-Define tasks if available.

## ROLES

-I implemented 3 roles:backend,client,mongo and common.

-Each role defines the tasks required to be implemented in the main.yml

-Common is used for any task that needs to be done on all machines.

## SET ANSIBLE.CFG

-Set the host key checking to false in order not to check the ssh keys.

-State inventory file,remote user and location of your private key file.

## DEBUG and RUN THE APPLICATION

-Debug the application by running the command: ansible-playbook playbook.yml --check.

-Debugging can be done by running the playbook with -v flag (verbose) to get a detailed information on the errors.

-Run the application by executing the following command: ansible-playbook playbook.yml



