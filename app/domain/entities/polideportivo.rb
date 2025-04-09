class Polideportivo
    attr_reader :id, :nombre, :direccion, :canchas
  
    def initialize(id:, nombre:, direccion:)
      @id = id
      @nombre = nombre
      @direccion = direccion
      @canchas = []
    end
  
    def agregar_cancha(cancha)
      @canchas << cancha
    end
  end
  