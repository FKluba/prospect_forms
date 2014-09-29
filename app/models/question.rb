class Question
  include MongoMapper::Document

  key :question, String

  has_many :answers
  has_many :users

end
