class Token
  include MongoMapper::Document

  key :token, String
  key :user_id, ObjectId
  key :form_id, ObjectId

  belongs_to :form
  belongs_to :user

  before_save :create_token


  protected #Verifies that the functions above aren't executed anywhere else = security

  def create_token
    @token_user = self.token
    @token_user = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Form.exists?(token: random_token)
    end
  end


end