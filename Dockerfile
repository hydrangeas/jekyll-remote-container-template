FROM jekyll/jekyll

# Docker side
ENV PROJECT_ROOTDIR /srv/jekyll
WORKDIR $PROJECT_ROOTDIR

# Copy current directory files
COPY $PWD $PROJECT_ROOTDIR
RUN bundle install

RUN jekyll build

EXPOSE 4000
ENV HOST 0.0.0.0

# !! IMPORTANT !!
ENV JEKYLL_ENV docker

CMD ["jekyll", "serve", "--watch", "--force_polling"]
