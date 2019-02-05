FROM ruby:2.5.3

ADD pgdg.list /etc/apt/sources.list.d/

RUN wget -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y postgresql-client-9.6 mysql-client sqlite3 --no-install-recommends && \
    apt-get install -y build-essential imagemagick libmagic-dev nodejs-legacy xvfb fontconfig libxfont1 xfonts-base xfonts-encodings xfonts-utils x11-common && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn && \
    rm -rf /var/lib/apt/lists/*

ADD Gemfile* /app/
RUN cd /app && \
    gem install bundler && \
    gem cleanup && \
    bundle install --full-index -j3 && \
    cd .. && \
    rm -rf /app
