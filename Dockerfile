FROM instoll/lamp-stack:0.5.0

ENV APPROOT /var/www/html

# Overwrite default configs.
COPY httpd/httpd.conf /etc/httpd/conf
COPY php/php.ini      /etc

RUN echo "Install Composer global dependencies" && \
      composer global require hirak/prestissimo && \
    echo "Install WP CLI" && \
      composer create-project wp-cli/wp-cli /usr/share/wp-cli --no-dev && \
      ln -s /usr/share/wp-cli/bin/wp /usr/bin/wp && \
    echo "Install NodeJS dependencies" && \
      npm install -g yarn

WORKDIR $APPROOT
