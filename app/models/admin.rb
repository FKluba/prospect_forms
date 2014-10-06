class Admin
  include MongoMapper::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Les paramètres sont email (de type email, requiert une adresse valide)
  # et password (mot de passe de 6 lettres minimum)

end
