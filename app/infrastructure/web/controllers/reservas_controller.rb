require 'sinatra'
require_relative '../../../application/services/reserva_service'
require_relative '../../../infrastructure/persistence/repositories/in_memory_reserva_repository'
require_relative '../../../infrastructure/persistence/repositories/in_memory_polideportivo_repository'

# Repositorios necesarios para el servicio
reserva_repository = InMemoryReservaRepository.new
polideportivo_repository = InMemoryPolideportivoRepository.new

# Inicialización del servicio
reserva_service = ReservaService.new(reserva_repository, polideportivo_repository)

post '/reservas' do
  cliente = params[:cliente]
  cancha_id = params[:cancha_id]
  fecha = params[:fecha]
  hora = params[:hora]

  reserva_service.crear_reserva(cliente, cancha_id, fecha, hora)
  "Reserva creada exitosamente"
end
