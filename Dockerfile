#Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Install dependencies for MongoDB (if needed)
# Add MongoDB repository key and repository information
RUN apt-get update && apt-get install -y gnupg
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb http://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# Update package lists and install MongoDB
RUN apt-get update && apt-get install -y mongodb-org


# Create a working directory
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY client/package*.json ./client/
COPY backend/package*.json ./backend/

# Install Node.js 16
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor -o /usr/share/keyrings/nodesource-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/nodesource-archive-keyring.gpg] https://deb.nodesource.com/node_16.x $(lsb_release -cs) main" > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs


# Install client dependencies
RUN cd client && npm install

# Install backend dependencies
RUN cd backend && npm install

# Copy the client and backend source code to the container
COPY client/ ./client/
COPY backend/ ./backend/

# Expose port 3000 for the Node.js app
EXPOSE 3000

# Define the command to start your Node.js application
CMD ["npm", "start"]
# # Use the official Node.js 14 base image
# FROM node:14

# # Create a working directory for your app
# WORKDIR /app

# # Copy package.json and package-lock.json to the container
# COPY package*.json ./

# # Install app dependencies
# RUN npm install

# # Copy the rest of the application source code to the container
# COPY . .

# # Expose the port that your Node.js app will listen on
# EXPOSE 3000

# # Define the command to start your Node.js application
# CMD ["npm", "start"]
