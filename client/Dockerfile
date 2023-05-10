FROM node:16-alpine
WORKDIR /client
RUN npm install -g http-server
COPY package*.json .
RUN npm install
RUN npx browserslist@latest --update-db
COPY . .
RUN npm run build
EXPOSE 8080
CMD [ "http-server", "dist" ]
