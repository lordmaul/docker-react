FROM node:16-alpine as builder

WORKDIR /home/frontend/live
COPY ./package.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /home/frontend/live/build /usr/share/nginx/html

