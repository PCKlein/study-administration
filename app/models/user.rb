# validates email and password

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  ROLES = %i[admin student guest]

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true

end
