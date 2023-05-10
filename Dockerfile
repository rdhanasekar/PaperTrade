FROM node:16-alpine AS frontend
WORKDIR /client
# RUN npm install -g http-server
COPY ./client/package*.json .
RUN npm install
RUN npx browserslist@latest --update-db
COPY ./client .
COPY ./common ../common
RUN npm run build
# EXPOSE 8080
# CMD [ "http-server", "dist" ]

FROM node:lts-alpine as backend
WORKDIR /server
COPY ./server/package*.json .
RUN npm install
COPY ./server .
COPY ./common ../common
COPY --from=frontend ./client/dist ./public
RUN npm run build
EXPOSE 9090
CMD [ "node", "./dist/index.js" ]
