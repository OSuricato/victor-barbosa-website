class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :link, presence: true, format: URI::regexp(%w[http https])
  belongs_to :user
  belongs_to :post_category
  has_many :comments, dependent: :destroy
end
