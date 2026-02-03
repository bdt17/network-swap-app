FROM ruby:3.3-slim

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /rails
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local frozen 1 && bundle install
COPY . .

RUN chmod +x start.rb
EXPOSE ${PORT:-3000}
CMD ["bundle", "exec", "ruby", "start.rb"]
