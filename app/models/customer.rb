class Customer < ApplicationRecord
   has_many :tasks
   has_many :users, through: :tasks

   def full_name
      "#{first_name} #{last_name}"
   end

end
