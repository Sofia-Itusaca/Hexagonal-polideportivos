class Reserva
    attr_reader :id, :cliente, :cancha, :fecha, :hora
  
    def initialize(id:, cliente:, cancha:, fecha:, hora:)
      @id = id
      @cliente = cliente
      @cancha = cancha
      @fecha = fecha
      @hora = hora
    end
  end
  