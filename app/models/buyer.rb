 class Buyer < ApplicationRecord
   belongs_to :item
   belongs_to :user
   has_one :shopping
 end
