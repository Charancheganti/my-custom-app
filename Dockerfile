# 1. Use an official lightweight Node.js base image
FROM node:18-alpine

# 2. Set the working directory inside the container
WORKDIR /usr/src/app

# 3. Copy your local files into the container
COPY index.html .
COPY server.js .

# 4. Expose port 80 to the outside world
EXPOSE 80

# 5. Define the command to run your app
CMD [ "node", "server.js" ]
