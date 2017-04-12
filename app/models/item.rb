class Item < ApplicationRecord
  belongs_to :user
  default_scope { order('created_at DESC') }
  
  scope :visible_to, -> (user)
end
