class User
  include MongoMapper::Document

  key :last_name, String
  key :first_name, String
  key :age, Integer
  key :tel, String
  key :email, String
  key :location, String
  key :society, String
  key :token, String
  key :form_id, ObjectId

  has_many :answers
  has_many :tokens

  def full_name
  	"#{first_name} #{last_name}"
  end

  #def user_form_id

  #end


end