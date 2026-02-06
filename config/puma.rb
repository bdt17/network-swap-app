port        ENV.fetch("PORT", 3000)
environment ENV.fetch("RAILS_ENV", "development")
worker_processes ENV.fetch("WEB_CONCURRENCY") { 1 }
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

preload_app!

plugin :tmp_restart
