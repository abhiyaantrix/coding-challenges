# Build stage
FROM ruby:3-alpine AS build

ARG BUNDLE_VERSION

RUN apk --no-cache add --virtual build-dependencies build-base

ENV APP_HOME /coding-challenges
WORKDIR $APP_HOME

COPY Gemfile* ./

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle \
    PATH="${BUNDLE_BIN}:${PATH}"

RUN gem update --system && \
    gem install bundler -v "${BUNDLE_VERSION}" --no-document && \
    bundle config set no-cache 'true' && \
    bundle config set clean 'true' && \
    bundle install --jobs "$(nproc)" --retry 3 && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/* /usr/lib/ruby/gems/*/cache/*

# Runtime stage
FROM ruby:3-alpine

ENV APP_HOME /coding-challenges
ENV BUNDLE_PATH /bundle
ENV PATH="/bundle/bin:${PATH}"

WORKDIR $APP_HOME

# Create group and user with specific UID/GID
# RUN useradd -ms /bin/sh -u 1000 appuser
RUN addgroup -g 1000 -S appgroup && adduser -u 1000 -S appuser -G appgroup

RUN mkdir -p $APP_HOME/coverage $APP_HOME/log $APP_HOME/tmp

COPY --chown=appuser:appgroup . $APP_HOME
COPY --chown=appuser:appgroup --from=build $BUNDLE_PATH $BUNDLE_PATH

RUN chown -R appuser:appgroup $APP_HOME

# Switch to app user
USER appuser

CMD ["rspec"]
