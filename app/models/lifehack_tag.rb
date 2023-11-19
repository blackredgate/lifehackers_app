class LifehackTag < ApplicationRecord
  belongs_to :lifehack

  validates :ltag_name, presence: true
end
