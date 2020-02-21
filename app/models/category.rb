class Category < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :words

  has_many :lessons
end
