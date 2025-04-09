require_relative '../../../domain/repositories/polideportivo_repository'

class InMemoryPolideportivoRepository < PolideportivoRepository
  def initialize
    @polideportivos = {}
  end

  def save(polideportivo)
    @polideportivos[polideportivo.id] = polideportivo
  end

  def find_by_id(id)
    @polideportivos[id]
  end

  def delete(id)
    @polideportivos.delete(id)
  end
end
