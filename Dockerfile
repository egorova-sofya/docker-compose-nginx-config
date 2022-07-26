# nextls application instruction

FROM node:16.15.1

RUN npm install -g npm@8.12.2

RUN npm install --global pm2

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

COPY package-lock.json /app

RUN npm i

COPY . /app

EXPOSE 80

RUN npm run build

CMD [ "pm2-runtime", "start", "npm", "--", "start" ]
