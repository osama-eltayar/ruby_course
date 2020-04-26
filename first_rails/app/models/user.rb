require 'bcrypt'

class User < ApplicationRecord
    attr_accessor  :password, :password_confirmation
    

    EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
    validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
    validates :password, :confirmation => true #password_confirmation attr
    validates_length_of :password, :in => 6..20, :on => :create

    before_save :encrypt_password
    # after_save :clear_password

    def encrypt_password
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
        end
    end

    def self.authenticate(username_or_email="", login_password="")
        # render_bind plain: username_or_email.inspect
        
        if  EMAIL_REGEX.match(username_or_email)    
            user = User.find_by_email(username_or_email)
            # abort user.inspect
        else
            user = User.find_by_username(username_or_email)
            # abort user.inspect
        end
        if user && user.match_password(login_password)
            # abort user.inspect
            return user
        else
            # abort ("no user")
            return false
        end
    end 

    def match_password(login_password="")
        encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
    end
    # def clear_password
    #     self.password = nil
    # end
end
