# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Install dependencies for MongoDB (if needed)
RUN apt-get update && apt-get install -y mongodb

# Create a working directory
WORKDIR /app

# Install Node.js 16
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor -o /usr/share/keyrings/nodesource-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/nodesource-archive-keyring.gpg] https://deb.nodesource.com/node_16.x $(lsb_release -cs) main" > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs

# Copy the package.json and package-lock.json files to the container
COPY client/package*.json ./client/
COPY backend/package*.json ./backend/

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
