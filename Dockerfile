FROM ruby:3.3-slim

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /rails

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local frozen 1 && \
    bundle install && \
    rm -rf ~/.bundle/ "/usr/local/bundle"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# Copy app
COPY . .

# Use Rack::Handler directly - NO config.ru needed
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "$PORT"]

EXPOSE $PORT
