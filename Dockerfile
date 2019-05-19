FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /budget_for_life
WORKDIR /budget_for_life
COPY Gemfile /budget_for_life/Gemfile
COPY Gemfile.lock /budget_for_life/Gemfile.lock
RUN bundle install
COPY . /budget_for_life

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
