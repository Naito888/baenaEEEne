class Like < ApplicationRecord

  belongs_to :customer
  belongs_to :post
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

end
