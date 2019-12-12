# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer "camwalkuk@gmail.com"

# tell docker what port to expose
EXPOSE 8080

# copy the server
COPY server.js .

# enter into command line
CMD node server.js
