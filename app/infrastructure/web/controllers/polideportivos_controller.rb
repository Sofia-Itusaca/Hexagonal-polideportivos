require 'sinatra'
require_relative '../../../application/services/polideportivo_service'
require_relative '../../../infrastructure/persistence/repositories/in_memory_polideportivo_repository'

polideportivo_repository = InMemoryPolideportivoRepository.new
polideportivo_service = PolideportivoService.new(polideportivo_repository)

# Verifica autenticación solo para rutas protegidas
before do
  protected_routes = ['/polideportivos', '/propietario/polideportivos']
  if protected_routes.include?(request.path_info) && !session[:usuario_id]
    halt(401, 'No autenticado')
  end
end

# Crear un polideportivo
post '/polideportivos' do
  nombre = params[:nombre]
  direccion = params[:direccion]
  polideportivo_service.crear_polideportivo(nombre, direccion)
  "Polideportivo creado exitosamente"
end

# Listar polideportivos (solo para admins)
get '/polideportivos' do
  halt(403, 'No autorizado') unless session[:rol] == 'admin'
  # Aquí va la lógica para listar polideportivos
end
