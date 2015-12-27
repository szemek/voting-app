# Load balancer's Dockerfile
FROM nginx

RUN apt-get update -qq && apt-get install -y ruby

COPY docker/balancer/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /opt/scripts

COPY docker/balancer/configure.rb /opt/scripts/configure.rb
COPY docker/balancer/default.conf.erb /opt/scripts/default.conf.erb

COPY docker/balancer/init /opt/scripts/init

CMD ["/opt/scripts/init"]
