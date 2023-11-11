class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :lifehack
  
  validates :user_id, uniqueness: {scope: :lifehack_id}
end
