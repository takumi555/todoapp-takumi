class Board < ApplicationRecord
  
  validates :title, presence: true
  validates :content, presence: true

  
  has_one_attached :eyecatch
  has_many :tasks, dependent: :destroy

  belongs_to :user
end
