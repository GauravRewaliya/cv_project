#!/bin/sh
# production_run.sh
        # need !!ENV_VARIALE
rails assets:precompile RAILS_ENV=production
rails server