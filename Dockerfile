# Node.js image
# Use the node:14 base image
FROM node:14

# Install MongoDB
RUN apt-get update && apt-get install -y mongodb

# Start the MongoDB service
RUN service mongod start

# Create a working directory
WORKDIR /app

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


#Start the Node.js app
CMD [ "npm", "start" ]
