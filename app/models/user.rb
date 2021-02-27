class User < ApplicationRecord
   has_many :tasks
   has_many :customers, through: :tasks
   # has_secure_password
end
