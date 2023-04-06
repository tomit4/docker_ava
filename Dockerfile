# syntax=docker/dockerfile:1

# use the node image with alpine linux
FROM node:18-alpine

# create an app directory
RUN mkdir /app
WORKDIR /app

# install npm packages
COPY package.json .
COPY package-lock.json .
RUN npm install

# copy our project into our ava image
COPY . .
