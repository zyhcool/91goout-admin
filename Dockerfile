FROM node:lts-alpine3.9 as builder

RUN mkdir -p /usr/src/91goout-admin/

WORKDIR /usr/src/91goout-admin/

COPY . /usr/src/91goout-admin/

RUN npm install

RUN npm run build


FROM nginx:stable-alpine

COPY --from=builder /usr/src/91goout-admin/build /usr/share/nginx/html

CMD ["nginx" "-g" "daemon off"]