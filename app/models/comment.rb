class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :lifehack
  
  validates :comment, presence: true
end
