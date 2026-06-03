FROM node:25-alpine AS build
ADD . /app
WORKDIR /app
RUN npm install && \
    npm run build 

FROM nginx:1.29.3-alpine AS runtime
LABEL project="mynodejsproject"
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 3000    