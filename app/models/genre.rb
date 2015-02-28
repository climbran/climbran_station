class Genre < ActiveRecord::Base
  before_save { self.name = name.downcase.capitalize }
  has_many :articles
  validates :name , presence: true, uniqueness: { case_senstitive: false }#唯一性验证，大小写不敏感
  validates :amount, presence: true
end
