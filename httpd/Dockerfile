# Dockerfile for building httpd docker image for apsim web services.
FROM httpd:2.4

# Copy in vrtual host config files from the hosts directory.
COPY ./hosts/*.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf.d/

# Copy certificates.
COPY .certs/server.crt /usr/local/apache2/conf/server.crt
COPY .certs/server-chain.crt /usr/local/apache2/conf/server-chain.crt
COPY .certs/server.key /usr/local/apache2/conf/server.key

# Copy in config file overrides.
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf
