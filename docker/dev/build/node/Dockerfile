FROM node:15-alpine

RUN apk update && apk upgrade

RUN mkdir /app

ARG APP_PATH

COPY ${APP_PATH} /app

WORKDIR /app

CMD ["npm", "run", "dev"]
