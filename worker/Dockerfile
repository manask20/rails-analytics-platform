FROM ruby:3.3

WORKDIR /worker

# We'll add gems later; for now just run a ruby script
COPY worker.rb .

CMD ["ruby", "worker.rb"]
