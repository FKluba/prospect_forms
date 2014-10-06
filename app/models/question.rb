class Question
  include MongoMapper::Document

  key :question, String

  belongs_to :form

  has_many :answers
  has_many :users

end
