class Form
  include MongoMapper::Document

  key :name, String
  key :description, String

  has_many :questions
  #accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true

  #attr_accessible :questions_attributes

  def questions_attributes=(params)
  	params
  end

 
end
