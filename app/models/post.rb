class Post < ApplicationRecord

  belongs_to :customer
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :caption, {presence: true, lengh: {maximum: 50}}

  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

  def self.search(search)
    if search != ""
      Post.where(['caption LIKE(?)', "%#{search}%"])
    else
      Post.includes(:customer).order('created_at DESC')
    end
  end


end
