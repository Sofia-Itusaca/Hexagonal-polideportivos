class ReservaService
    def initialize(reserva_repository, polideportivo_repository)
      @reserva_repository = reserva_repository
      @polideportivo_repository = polideportivo_repository
    end
  
    def crear_reserva(cliente, cancha_id, fecha, hora)
      # Lógica de negocio para validar reserva
      reserva = Reserva.new(id: SecureRandom.uuid, cliente: cliente, cancha: cancha_id, fecha: fecha, hora: hora)
      @reserva_repository.save(reserva)
    end
  end

  