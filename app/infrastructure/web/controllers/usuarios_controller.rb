require 'sinatra'
require_relative '../../../application/services/autenticacion_service'
require_relative '../../../infrastructure/persistence/repositories/in_memory_usuario_repository'

set :views, File.expand_path('../../infrastructure/web/views', __dir__)

usuario_repository = InMemoryUsuarioRepository.new
autenticacion_service = AutenticacionService.new(usuario_repository)

enable :sessions

get '/login' do
  erb :login
end

post '/login' do
  email = params[:email]
  password = params[:password]

  begin
    usuario = autenticacion_service.autenticar(email, password)
    session[:usuario_id] = usuario.id
    session[:rol] = usuario.rol

    if usuario.admin?
      redirect '/polideportivos'
    elsif usuario.propietario?
      redirect '/propietario/polideportivos'
    else
      "Rol no reconocido"
    end
  rescue => e
    "Error: #{e.message}"
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end
