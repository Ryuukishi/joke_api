# frozen_string_literal: true

class Joke < ApplicationRecord
  belongs_to :category

  def self.find_by_category(input)
    category = Category.find_by(name: input.titleize)
    return self.where(category: category )
  end

end
