FROM node:15-alpine

RUN apk update && apk upgrade

RUN mkdir /app
WORKDIR /app

RUN ls -la

RUN npm install && npm run build

EXPOSE 5000

CMD ["npm", "start"]

