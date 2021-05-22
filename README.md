# Docker and Docker Compose for frontend and Node.js development

This repo contains a minimal Docker setup with reasonable defaults for development with Node.js.

**Read the article that explains more about optimizations and isolating host's node modules from the container: https://michalzalecki.com/docker-compose-node/**

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app), but it doesn't matter. Whether you have a build step for your backend code, or you bundle your frontend application, the goals are similar when using Docker:

1. For development, reload code when you modify it locally to test the changes (`npm run start`)
1. Isolate container and host node_modules, so native dependencies don't mix
1. For production, use a lightweight container with minimal dependencies (`npm run build`)

## Use Docker

For production

    # build the image
    docker build -t docker-compose-node .

    # run the container
    docker run -it --rm -p 8080:80 docker-compose-node

    # execute command in running docker container
    docker exec -it $(docker ps -q | head) sh

## Use Docker Compose

For development

    # build image and run the container
    docker compose up -V --build

    # execute command in running docker container
    docker compose exec app bash
    docker compose exec app npm run test

    # (optionally) push image to the registry
    docker compose push
