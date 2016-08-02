class User < ActiveRecord::Base
    attr_accessor :remember_token
    before_save  {self.email = email.downcase }
    has_many :microposts
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 200}, format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
    has_secure_password
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    # Returns a random token.
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    
    def remember
        #remember token is the uncoded token that is not saved to the DB
        self.remember_token = User.new_token
        #we encode the remember token into :remember_digest and store this in the DB
        update_attribute(:remember_digest, User.digest(remember_token))
    end
end
