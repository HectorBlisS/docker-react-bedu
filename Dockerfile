FROM node:alpine as react-prod
WORKDIR '/app'
COPY ./package*.json ./
RUN yarn
COPY . ./
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=react-prod /app/build /usr/share/nginx/html