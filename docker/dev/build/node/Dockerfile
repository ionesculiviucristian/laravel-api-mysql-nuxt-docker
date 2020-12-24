FROM node:15-alpine

RUN apk update && apk upgrade

RUN mkdir /app

COPY /app /app

WORKDIR /app

CMD ["npm", "run", "dev"]
