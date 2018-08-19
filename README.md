#CoffeeMonkey Server

This is how you get the coffee monkey server ...


## To get it up and running locally

To get dependencies:

    $ bundle install
    
To setup the database:

    $ bundle exec rake db:setup
    $ bundle exec rake db:migrate

To run:

    $ bundle exec rackup 
    

## Build and run the docker container

    $ docker build -t coffee-monkey-server:1.0 .
    
    $ docker run -d \
        --name coffee-monkey-server \
        -p 4567:4567 \
        coffee-monkey-server:1.0
    
