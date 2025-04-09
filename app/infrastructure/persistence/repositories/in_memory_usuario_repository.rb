require_relative '../../../domain/entities/usuario'

class InMemoryUsuarioRepository < UsuarioRepository
  def initialize
    @usuarios = {}
    cargar_usuarios
  end

  def find_by_email(email)
    puts "Buscando usuario con email: #{email}"
    @usuarios.values.find { |usuario| usuario.email == email }
  end
  

  private

  def cargar_usuarios
    admin = Usuario.new(
      id: SecureRandom.uuid,
      nombre: 'Administrador',
      email: 'admin@example.com',
      rol: 'admin',
      password: 'admin123'
    )

    puts "Hash del admin: #{Digest::SHA256.hexdigest('admin123')}" # Depuración
    puts "Hash generado al inicializar admin: #{admin.instance_variable_get(:@hashed_password)}"

    propietario = Usuario.new(
      id: SecureRandom.uuid,
      nombre: 'Propietario',
      email: 'propietario@example.com',
      rol: 'propietario',
      password: 'prop123'
    )
      puts "Hash del propietario: #{Digest::SHA256.hexdigest('prop123')}" # Depuración
      puts "Hash generado al inicializar propietario: #{propietario.instance_variable_get(:@hashed_password)}"

  
    @usuarios[admin.id] = admin
    @usuarios[propietario.id] = propietario
  end
end
