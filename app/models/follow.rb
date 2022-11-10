class Follow < ApplicationRecord
  belongs_to :follower, class_name: "Customer"
  belongs_to :followed, class_name: "Customer"

  validates_uniqueness_of :follwed_id, scope: :customer_id

  # フォローをした、されたの関係
  # has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  # has_many :reverse_of_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  # has_many :followings, through: :follows, source: :followed
  #  has_many :followers, through: :reverse_of_follows, source: :followerl
end
