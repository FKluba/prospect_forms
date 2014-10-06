class Form
  include MongoMapper::Document

  key :name, String
  key :description, String


  has_many :questions
  #accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true

  def questions_attributes=(param)
  end
end
