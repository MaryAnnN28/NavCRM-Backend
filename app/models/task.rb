class Task < ApplicationRecord
   belongs_to :user
   belongs_to :customer

   def full_name
      "#{customer.first_name} #{customer.last_name}"
   end
   
end
