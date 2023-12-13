class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lifehacks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :item_comments, dependent: :destroy
  has_many :item_favorites, dependent: :destroy
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.user_name = "ゲストユーザー" 
      user.is_deleted = false
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
  
end
