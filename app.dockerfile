# Application's Dockerfile

FROM phusion/passenger-ruby22

# Set correct environment variables
ENV HOME /root

WORKDIR /home/app/voting-app

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Start nginx/passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# Add the nginx site and config
ADD docker/app/voting-app.conf /etc/nginx/sites-enabled/voting-app.conf
ADD docker/app/rails-env.conf /etc/nginx/main.d/rails-env.conf

# Add the Rails app
COPY . /home/app/voting-app
RUN chown -R app:app /home/app/voting-app

# Enable ssh access
# RUN rm -f /etc/service/sshd/down
# COPY id_rsa.pub /root/.ssh/authorized_keys

COPY docker/app/bundle.sh /etc/my_init.d/60_bundle.sh
