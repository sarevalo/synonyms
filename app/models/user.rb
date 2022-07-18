# User model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable

  def authenticate!(name, password)
    user = User.find_for_database_authentication(name: name)

    user if user.valid_for_authentication? { user.valid_password?(password) } && user.active_for_authentication?
  end
end
