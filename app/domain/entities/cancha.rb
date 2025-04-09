class Cancha
    attr_reader :id, :nombre, :tipo, :polideportivo_id
  
    def initialize(id:, nombre:, tipo:, polideportivo_id:)
      @id = id
      @nombre = nombre
      @tipo = tipo
      @polideportivo_id = polideportivo_id
    end
  end
  