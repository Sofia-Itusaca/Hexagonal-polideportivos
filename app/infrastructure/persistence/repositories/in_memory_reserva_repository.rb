require_relative '../../../domain/repositories/reserva_repository'

class InMemoryReservaRepository < ReservaRepository
  def initialize
    @reservas = {}
  end

  def save(reserva)
    @reservas[reserva.id] = reserva
  end

  def find_by_id(id)
    @reservas[id]
  end
end
