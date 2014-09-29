class Answer
  include MongoMapper::Document

  key :answer, String
  key :question_id, ObjectId
  key :user_id, ObjectId

  belongs_to :question
  belongs_to :user


end
