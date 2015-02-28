class Article < ActiveRecord::Base
  belongs_to :genre
  has_many :reviews, dependent: :destroy #删除article同时删除reviews
  validates :title , presence: true , length: {maximum: 60, minimum: 5}
  validates :content , presence: true
  validates :genre_id , presence: true
end
