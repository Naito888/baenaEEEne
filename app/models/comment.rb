class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :post

  validates :comment, {presence: true, lengh: {maximum: 50}}

end
