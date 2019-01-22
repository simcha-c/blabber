# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  location_id     :integer
#  password_digest :string
#  session_token   :string
#

class User < ApplicationRecord
  # custom validation
  # validate :has_username

  #--Test validations that we write
  # validates :username, :session_token, presence: true, uniqueness: true
  # validates :password_digest, presence: true
  # validates :password, length: { minimum: 6 }, allow_nil: true

  after_initialize :ensure_session_token
  #model hook, cannot be used inside of controllers

  # before_validation happens right before we try to save something to the database
  # after_initialize happens immediately after we create a new instance of our class

  attr_reader :password

  # user belongs to a location
  # user is related to a blab (a user has many blabs that 
  # they wrote)

  # 3 types of associations:
  # belongs_to, has_many, has_one
  # the model that has the foreign_key will have a belongs_to association
  # the model without the foreign_key will have a has_many/has_one association
  # ex: User will have a belongs_to association with location

  # this belongs_to association enforces that we need to have a 
  # location_id before saving an instance to the database
  
  #--Test associations that we write
  # don't need to test rails code. Belongs_to methods are tested by
  # rails
  belongs_to :location,
    class_name: 'Location',
    primary_key: :id,
    foreign_key: :location_id

  has_many :authored_blabs,
    class_name: 'Blab',
    primary_key: :id,
    foreign_key: :author_id

  #-- Test public facing methods

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username) # could be a user, could be nil
    return nil unless user && user.is_password?(password) # is_password? only executes if user is a User object, not nil
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    # `create` takes a plaintext password, hashes and salts it and spits out a digest
  end

  def reset_session_token!
    # remember to not only generate a new session token, but also to save it to the database
    # this will not work if you don't save to the database
    self.update!(session_token: self.class.generate_session_token)
    # return the new token for convenience
    self.session_token
  end

  def is_password?(password)
    # password_digest is just a string
    # convert it into a BCrypt::Password object so that we can call #is_password? on it
    bcrypt_password = BCrypt::Password.new(self.password_digest) # just turns it into a Password object, doesn't hash it again
    bcrypt_password.is_password?(password) # this is_password? is a different method entirely
  end

  # FGRIPE
  # F = User.find_by_credentials
  # G = generate_session_token
  # R = reset_session_token!
  # I = is_password?
  # P = password=
  # E = ensure_session_token

  private

  def ensure_session_token
    # this will run whenever we instantiate a User object
    # that could happen because we're creating a new record,
    # or because we pulled one out of the database
    # that's why we use conditional assignment
    self.session_token ||= self.class.generate_session_token
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64 # a random base64 number/string
  end  

  # def has_username
  #   # self is the user instance we are trying to save
  #   unless self.username.present?
  #     errors[:username] << "Can't be blank"
  #   end
  # end

  # def active_record_testing 
  #   # --- returns instance, fires immediately ---
  #   fires_now = authored_blabs.first
  # 
  #   
  # 
  #   # --- returns active record relation, doesnt fire yet --
  #    relation = authored_blabs.where('body ilike "%m%"')
  #  
  #    
  # end
end
