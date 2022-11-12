class Like < ApplicationRecord

  belongs_to :customer
  belongs_to :post

  validates_uniqueness_of :post_id, scope: :customer_id

  def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
