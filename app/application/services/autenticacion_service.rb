class AutenticacionService
  def initialize(usuario_repository)
    @usuario_repository = usuario_repository
  end

  def autenticar(email, password)
    usuario = @usuario_repository.find_by_email(email)
    if usuario
      puts "Usuario autenticado: #{usuario.nombre}"
      puts "Contraseña ingresada: #{password}"
      puts "Hash ingresado: #{Digest::SHA256.hexdigest(password)}"
      puts "Hash almacenado: #{usuario.instance_variable_get(:@hashed_password)}"
    else
      puts "Usuario no encontrado para el email: #{email}"
    end
    raise 'Credenciales inválidas' unless usuario&.verificar_password(password)
    usuario
  end
  
end
