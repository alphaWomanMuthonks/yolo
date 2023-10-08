# Node.js image
FROM node:14

# working directory
WORKDIR /app

# Install MongoDB and start the MongoDB service
RUN apt-get update && apt-get install -y mongodb
RUN service mongod start

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

#Start the Node.js app
CMD [ "npm", "start" ]
