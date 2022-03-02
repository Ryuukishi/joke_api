# frozen_string_literal: true

class CreateJokes < ActiveRecord::Migration[7.0]
  def change
    create_table :jokes do |t|
      t.text :body
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
