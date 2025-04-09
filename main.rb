# main.rb
require 'sinatra'
require_relative 'config/environment'

enable :sessions

set :views, File.expand_path('./app/infrastructure/web/views', __dir__) # Configuración para vistas
set :bind, '0.0.0.0'
set :port, 3000
#puts "main.."

get '/' do
    redirect '/login'
end
