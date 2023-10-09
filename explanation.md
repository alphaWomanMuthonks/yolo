# YOLO PROJECT

The Yolo project includes three containers: `client`, `backend`, and `mongo`.

## Choice of the Base Image

- **Client Container**: The `client` container is based on the `yolo-client:v1.0.0` image. This custom image is tagged with a version (`v1.0.0`) to indicate the specific version of our client application. The image is used as a starting point for our client service.

- **Backend Container**: Similarly, the `backend` container is based on the `yolo-backend:v1.0.0` image, which also includes version tagging for clear identification.

- **MongoDB Container**: The MongoDB container utilizes the official `mongo:jammy` image. The specific version (`jammy`) is used to ensure compatibility with the application's requirements.

## Dockerfile Directives

- **Client Container**: The Dockerfile for the `client` service is located in the `./client` directory. It includes directives such as `FROM`, `COPY`, `RUN`, and `CMD`. These directives set up the Node.js environment, copy application code, install dependencies, and define the command to start the client application.

- **Backend Container**: The Dockerfile for the `backend` service is located in the `./backend` directory and similarly includes directives like `FROM`, `COPY`, `RUN`, and `CMD` tailored to our Python-based backend application.

- **MongoDB Container**: No custom Dockerfile is required for the MongoDB container as we use the official image provided by MongoDB.

## Docker Compose Networking

I have implemented Docker Compose networking to ensure that the containers can communicate with each other effectively. 
All services (`client`, `backend`, and `mongo`) are connected to a custom bridge network named `yolo-network`. 
This choice allows for seamless inter-container communication using their service names within the `yolo-network`.

## Docker Compose Volume Definition

- **Client and Backend Containers**: To facilitate live code updates, I have defined volume mappings for the `client` and `backend` services. 
These mappings bind the host directories to the corresponding containers, enabling code changes on the host to be reflected inside the containers without the need for rebuilding.

- **MongoDB Container**: For the `mongo` service,volume mapping ensures that data remains intact even when the container is stopped or removed.

## Git Workflow

I have followed a structured Git workflow. 
I made frequent commits,
This approach enhances codebase organization and easy track of code implementation.

## Running Applications and Debugging

The Yolo app is launched using the `docker-compose up -d` command. 
During setup, I encountered and resolved issues, such as port conflicts and dependencies, by using Docker commands like `docker logs`, `docker ps`, and `docker-compose logs`.
Monitored container status with `docker-compose ps` aided in identifying and addressing issues effectively.

## Docker Image Tag Naming

I named Docker images descriptively and included version tags for clear identification.
Helps manage and track different versions of images.

## Screenshot of DockerHub Image

I included a screenshot of the deployed image on DockerHub, clearly displaying the version of the image. This screenshot is included in the project documentation to facilitate version tracking.

