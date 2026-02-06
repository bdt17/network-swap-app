# frozen_string_literal: true

Rails.application.routes.draw do
  root to: proc { [200, { 'Content-Type' => 'text/html' }, [File.read(Rails.root.join('public/index.html'))]] }
  get '/health', to: proc { [200, { 'Content-Type' => 'text/plain' }, ['OK']] }
  get '*path', to: proc { [200, { 'Content-Type' => 'text/html' }, [File.read(Rails.root.join('public/index.html'))]] }
end
