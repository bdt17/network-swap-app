workers 0
threads 1, 5
environment ENV.fetch("RAILS_ENV") { "production" }
port        ENV.fetch("PORT") { 3000 }
worker_timeout 60
silence_single_worker_warning true
