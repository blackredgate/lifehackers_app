class Lifehack < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :lifehack_tags, dependent: :destroy
  accepts_nested_attributes_for :lifehack_tags, allow_destroy: true

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @lifehack = Lifehack.where("title LIKE?", "#{word}")
    elsif search == "partial_match"
      @lifehack = Lifehack.where("body LIKE?", "%#{word}%")
    else
      @lifehack = Lifehack.all
    end
  end
end
