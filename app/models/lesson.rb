class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers
  has_many :words, through: :answers
  has_many :choices, through: :answers
  
  def next_word
    (category.words - words).first
  end

  def lesson_result
    choices.where(is_correct: true).count #get all choices where is_corerct is true
                                          #Count all choices where is_correct is true
  end
end
