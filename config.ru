require_relative "lib/meowme"

set :env, :production
disable :run

run Sinatra::Application
