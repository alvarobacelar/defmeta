# Dockerfile

FROM phusion/passenger-ruby22
# MAINTAINER Ross Fairbanks "ross.fairbanks@gmail.com"

# Set correct environment variables.
ENV HOME /root
ENV RAILS_ENV=production \
    DB_USER="redmineuser" \
    DB_PASS="root!@#1nf0" \
    DB_HOST="10.0.0.17" \
    DB_BASE="redmine" \
    DOMAIN="defmetas.infoway-pi.com.br"

# Use baseimage-docker's init system.
CMD ["start.sh"]

# Expose Nginx HTTP service
EXPOSE 80

# Start Nginx / Passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# Add the nginx site and config
ADD nginx.conf /etc/nginx/sites-enabled/webapp.conf
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf

# Install bundle of gems
WORKDIR /home/app/webapp
#ADD Gemfile /tmp/
#ADD Gemfile.lock /tmp/
#RUN bundle install

VOLUME /home/app/webapp

# Add the Rails app
#ADD . /home/app/webapp
RUN chown -R app:app /home/app/webapp

# Clean up APT and bundler when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
