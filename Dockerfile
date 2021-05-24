FROM ubuntu
ENV DEBIAN_FRONTEND=non-interactive
RUN apt update
RUN apt install nginx -y
COPY . /var/www/html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]

