class User < ActiveRecord::Base
  
  concerned_with :authentication, :validations

  # new columns need to be added here to be writable through mass assignment
  attr_accessible :username, :email, :password, :password_confirmation

  LANGUAGES = [['English', 'en']]

  def name
    "#{first_name} #{last_name}"
  end

  def after_create
    Emailer.deliver_welcome(self)
  end

end
