class Movie < ApplicationRecord
  validates :title, presence: true
  validates :year, comparison: { greater_than: 1899 }
  validates :plot, presence: true
  validates :director, presence: true
  has_many :actors #returns array of many actors
end
