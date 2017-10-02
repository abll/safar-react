#The Docker File for Front End Safar Project. Planning for it to be a MEAN stack application.
#This is the Docker Image For the Sails node.js app

#Node Version 8.5
FROM node:8.5-alpine

#Update Alpine OS
RUN apk update && apk upgrade

#Expose the Port Needed For Sails
EXPOSE 1337

# Make An Application Folder
RUN mkdir /safar

# Make An App Directory For Safar
WORKDIR /safar

# Copy Local Directory Into Container
COPY . .

# Removing Node Modules To Prevent Conflicts
RUN rm -r node_modules

#Install Dependency
RUN npm install && npm cache verify 

#Start Sails Application Prod Mode
CMD node app.js --prod