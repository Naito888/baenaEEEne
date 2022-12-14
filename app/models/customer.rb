class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, {presence: true, length: {maximum: 8}}

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :follows, source: :followed
  has_many :followers, through: :reverse_of_follows, source: :follower
  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # フォローしたときの処理
  def follow(customer_id)
    follows.create(followed_id: customer_id)
  end

  # フォローを外すときの処理
  def unfollow(customer_id)
    follows.find_by(followed_id: customer_id).destroy
  end

  # フォローしているか判定
  def following?(cutomer)
    followings.include?(cutomer)
  end

  def self.guest
    find_or_create_by(email: 'guest@gmail.com') do |cutomer|
      cutomer.password = SecureRandom.urlsafe_base64
      cutomer.password_confirmation = cutomer.password
      cutomer.name = 'ゲスト'
    end
  end



end
