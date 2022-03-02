# frozen_string_literal: true

joke_categories = ['Puns', 'Programming', 'Knock Knock', 'Limericks']

if Category.all.length.zero?
  joke_categories.each do |category|
    Category.create(name: category)
    puts "created #{category} category"
  end
end
 