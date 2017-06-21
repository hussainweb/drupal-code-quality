FROM adamculp/php-code-quality:latest

WORKDIR $TARGET_DIR

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs && \
    apt-get install -y python && \
    apt-get install -y python-pip && \
    pip install codespell && \
    npm i -g eslint

RUN ln -s $TARGET_DIR/vendor/bin/phpcs /usr/local/bin

RUN composer require --prefer-dist "drupal/coder:dev-8.x-2.x" && \
    git clone http://git.drupal.org/sandbox/coltrane/1921926.git drupalsecure && \
    git clone https://github.com/klausi/pareviewsh.git

RUN vendor/bin/phpcs --config-set installed_paths $TARGET_DIR/vendor/drupal/coder/coder_sniffer/,$TARGET_DIR/drupalsecure
