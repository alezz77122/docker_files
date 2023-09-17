FROM node:14 as base


FROM base as devolpment
WORKDIR /app
COPY package.json .
ARG NODE_ENV
RUN npm install
COPY . .
EXPOSE 4000
CMD [ "npm", "run" ,"start-dev" ]

FROM base as prodection
WORKDIR /app
COPY package.json .
ARG NODE_ENV
RUN npm install --only=prodection
COPY . .
EXPOSE 4000
CMD [ "npm","start" ]