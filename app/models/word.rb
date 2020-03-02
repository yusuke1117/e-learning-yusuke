class Word < ApplicationRecord
  validates :content, presence: true
  validates :choices, presence: true
  validate :has_one_correct
  validate :has_unique_choices

  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices

  def correct_answer
    choices.find_by(is_correct: true).content
  end


  private
  def has_one_correct
    if choices.select {|choice| choice.is_correct == true}.count != 1
      return errors.add :base, "Must have one correct choice"
    end
  end

  def has_unique_choices
    if choices.uniq { |choice| choice.content }.count < choices.length
      return errors.add :base, "Must have unique choices"
    end
  end
end
