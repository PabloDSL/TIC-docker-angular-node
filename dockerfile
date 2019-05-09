FROM johnpapa/angular-cli as frontend
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN ng build --prod


FROM node:10-alpine as backend
WORKDIR /app
COPY /node-server /app
RUN npm install --production


FROM node:10-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY --from=backend /app /usr/src/app
COPY --from=frontend /app/dist /usr/src/app

EXPOSE 3000
CMD [ "node", "index.js" ]