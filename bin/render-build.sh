#!/bin/bash
bundle install
rails assets:precompile
rails db:migrate
rails db:seed
rails runner "User.create!(email: 'agent@thomasit.com', password: 'ThomasIT2026!', password_confirmation: 'ThomasIT2026!')"
