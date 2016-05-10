class User < ActiveRecord::Base
	has_many :evaluations
	has_secure_password
	
	#default values
	after_initialize :init
    def init
      self.active  ||= true	
      self.admin  ||= false	
    end
	#name
	validates_length_of :name,
  		:within => 3..50,
  		:too_short => 'Nome tem que ter no minimo 3 caracters',
  		:too_long => 'Nome tem que ter no maximo 50 caracters'

	#email
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :email, :presence => { :message => 'Email nao pode ser vazio' },
		length: { maximum: 50}, uniqueness: true,
		format: { with: VALID_EMAIL_REGEX, :message => 'Insira um e-mail válido'}

  	#gender
	validates :gender, :presence => { :message => 'Escolha seu genero' }

	#login
	validates_length_of :login,
				  		:within => 4..15,
				  		:too_short => 'Apelido com no minimo 4 caracters',
				  		:too_long => 'Apelido com no maximo 15 caracters'

			  		
				  		

  	

end

	