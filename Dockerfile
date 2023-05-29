# Base image
FROM ruby:3.1

# Setting the working directory
WORKDIR /app

# Installing dependencies
RUN apt-get update && \
    apt-get install -y nodejs yarn libpq-dev && \
    gem install bundler

# Copying the Gemfile and Gemfile.lock into the image
COPY Gemfile Gemfile.lock ./

RUN bundle install

# Copying the application code into the image
COPY . .

EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
