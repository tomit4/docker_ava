# Docker with Ava Tutorial

This small repo is just a simple demonstration of both how to build a basic
docker image and also serves as a brief introduction to the ava javascript
testing suite.

The tutorial series I followed comes from [Baylor Breaks It Down](https://invidious.snopyta.org/search?q=baylor+breaks+it+ava+testing)'s' youtube channel.

Inspect the files for yourself, but of particular interest is the introduction
to a basic Dockerfile:

```

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
```
Additionally, you'll want to ensure that you change your package.json's test
field:

```
{
  "name": "docker_ava",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "ava"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "ava": "^5.2.0"
  }
}
```

And finally you'll want to build the ava project:
```
docker build -t ava .
```
And also run it:
```
docker run ava npm run test
```

The tutorial series also provided a cool little addition to my neovim
configuration, which allows to call ava directly from neovim using \<leader\>t:
```
-- runs npm tests without having to leave vim
vim.keymap.set("n", "<leader>t", ":w|!npm test<cr>")
```
