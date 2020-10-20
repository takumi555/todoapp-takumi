class Board < ApplicationRecord
  
  
  has_one_attached :eyecatch
  has_many :tasks, dependent: :destroy

  belongs_to :user
end
