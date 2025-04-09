require 'digest'

class Usuario
  attr_reader :id, :nombre, :email, :rol

  def initialize(id:, nombre:, email:, rol:, password:)
    @id = id
    @nombre = nombre
    @rol = rol
    @hashed_password = hash_password(password) # Guardar contraseña hasheada
  end

  def verificar_password(password)
    hashed = hash_password(password)
    puts "Hash de la contraseña ingresada: #{hashed}"
    puts "Hash almacenado: #{@hashed_password}"
    hashed == @hashed_password
  end

  def admin?
    @rol == 'admin'
  end

  def propietario?
    @rol == 'propietario'
  end

  private

  def hash_password(password)
    Digest::SHA256.hexdigest(password)
  end
end
