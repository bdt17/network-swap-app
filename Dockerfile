FROM ruby:3.3-slim

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /rails

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local frozen 1 && \
    bundle install

# Copy application code
COPY . .

# Create minimal config.ru that works with rackup
RUN echo 'require "./app.rb"; run ThomasIT' > config.ru

# Expose port and run with rackup (Render passes PORT env var)
EXPOSE ${PORT:-3000}
CMD ["sh", "-c", "bundle exec rackup config.ru --host 0.0.0.0 --port ${PORT:-3000}"]
