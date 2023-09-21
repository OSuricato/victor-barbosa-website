class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post_category
  has_many :comments, dependent: :destroy
end
