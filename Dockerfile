FROM nginx:alpine
COPY /www/src /usr/share/nginx/html
COPY /www/images /usr/share/nginx/html
EXPOSE 80