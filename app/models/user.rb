class User
  include MongoMapper::Document

  key :last_name, String
  key :first_name, String
  key :age, Integer
  key :tel, String
  key :email, String
  key :location, String
  key :society, String

  has_many :answers

end
