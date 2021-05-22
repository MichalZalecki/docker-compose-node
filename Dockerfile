FROM node:16.1.0-buster AS builder

WORKDIR /app

COPY package.json /app/

# with Yarn
COPY yarn.lock /app/
RUN yarn install --frozen-lockfile

# or with NPM
#COPY package-lock.json /home/app/
#RUN npm ci

COPY . .

RUN npm run build

FROM nginx:1.19.10-alpine
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.default.conf /etc/nginx/conf.d/default.conf
