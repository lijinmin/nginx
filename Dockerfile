# Dockerfile for installing and running Nginx

# Select ubuntu as the base image
From registry.cn-hangzhou.aliyuncs.com/ubuntu-14-04/ubuntu14.04

# Install nginx
RUN apt-get update
RUN apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD config/nginx-app.conf /etc/nginx/conf.d/

# Publish port 80
EXPOSE 80

# Start nginx when container starts
ENTRYPOINT /usr/sbin/nginx
