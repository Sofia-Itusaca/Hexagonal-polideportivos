require 'sinatra'

# Cargar todas las entidades del dominio
Dir[File.join(__dir__, '../app/domain/entities/*.rb')].sort.each { |file| require_relative file }

# Cargar todos los repositorios del dominio (interfaces)
Dir[File.join(__dir__, '../app/domain/repositories/*.rb')].sort.each { |file| require_relative file }

# Cargar controladores
require_relative '../app/infrastructure/web/controllers/usuarios_controller'
require_relative '../app/infrastructure/web/controllers/reservas_controller'
require_relative '../app/infrastructure/web/controllers/polideportivos_controller'

# Inicialización de repositorios concretos
require_relative '../app/infrastructure/persistence/repositories/in_memory_usuario_repository'
require_relative '../app/infrastructure/persistence/repositories/in_memory_reserva_repository'
require_relative '../app/infrastructure/persistence/repositories/in_memory_polideportivo_repository'

reserva_repository = InMemoryReservaRepository.new
polideportivo_repository = InMemoryPolideportivoRepository.new

# Inicialización de servicios
require_relative '../app/application/services/autenticacion_service'
require_relative '../app/application/services/reserva_service'
require_relative '../app/application/services/polideportivo_service'

reserva_service = ReservaService.new(reserva_repository, polideportivo_repository)

puts "Configuración del entorno cargada"
