class PolideportivoService
    def initialize(polideportivo_repository)
      @repository = polideportivo_repository
    end
  
    def crear_polideportivo(nombre, direccion)
      polideportivo = Polideportivo.new(id: SecureRandom.uuid, nombre: nombre, direccion: direccion)
      @repository.save(polideportivo)
    end
  
    def editar_polideportivo(id, nombre, direccion)
      polideportivo = @repository.find_by_id(id)
      raise 'Polideportivo no encontrado' unless polideportivo
  
      polideportivo.nombre = nombre
      polideportivo.direccion = direccion
      @repository.save(polideportivo)
    end
  
    def eliminar_polideportivo(id)
      @repository.delete(id)
    end
  end
  