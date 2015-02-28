class Review < ActiveRecord::Base
  belongs_to :article
  default_scope -> { order(created_at: :asc) }
  validates :article_id ,presence: true
  validates :content, presence: true, length: {maximum: 200 }
end
