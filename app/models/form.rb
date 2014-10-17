class Form
  include MongoMapper::Document

  key :name, String
  key :description, String
  key :user_ids, Array
  key :token, String

  has_many :questions
  has_many :users
  has_many :tokens

  plugin MongoMapper::Plugins::Associations::NestedAttributes
  accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true

  after_create :create_user_tokens
  before_update :update_user_tokens
  #before_create :create_token

  def users
    User.where(:id.in => self.user_ids)
  end

  def create_user_tokens
    self.users.each do |u|
      Token.create(
        form_id: self.id,
        user_id: u.id
      )
    end
  end

  def update_user_tokens
    if (user_ids_changed? == true)
      @ids_to_delete = self.user_ids_was - self.user_ids
      @ids_to_delete = nil
    else
      #else nothing
    end
  end 

  #def create_token(length, characters)
  #self.token = self.generate_token(length, characters) while self.token.nil? || self.class.exists?(:conditions => {:token => self.token})
  #end


  


end