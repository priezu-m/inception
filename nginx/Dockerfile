FROM debian:12

EXPOSE 80
EXPOSE 443

RUN apt update && apt upgrade && apt install nginx openssl -y
RUN yes '' | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.key -out crt.crt

COPY nginx.conf /etc/nginx/nginx.conf

RUN apt clean -y

CMD ["nginx", "-g", "daemon off;"]
