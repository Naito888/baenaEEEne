class Like < ApplicationRecord

  belongs_to :customer
  belongs_to :post

  def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

end
