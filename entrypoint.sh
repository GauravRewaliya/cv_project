#!/bin/sh
# entrypoint.sh

./bin/rails db:migrate
./bin/rails db:seed

# Start the Rails server
./bin/rails server -b 0.0.0.0 -p 3000