FROM ruby:3.4-slim

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /rails

# Bundle install (Sinatra ONLY)
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local frozen 1 && \
    bundle install && \
    rm -rf ~/.bundle/ "/usr/local/bundle"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# Copy app
COPY . .

# Precompile (Sinatra doesn't need bootsnap)
EXPOSE $PORT

# PURE Sinatra - NO Rails/Bootsnap
CMD ["ruby", "config.ru"]
