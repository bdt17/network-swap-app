# Render requires this exact binding
bind "tcp://0.0.0.0:#{ENV.fetch('PORT', 3001)}"

# Phase 14/10 Thomas IT Production
workers ENV.fetch("WEB_CONCURRENCY") { 2 }
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

preload_app!

port        ENV.fetch("PORT")        { 3001 }
environment ENV.fetch("RAILS_ENV")   { "production" }

plugin :tmp_restart
