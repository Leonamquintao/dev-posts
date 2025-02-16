# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.boolean :active, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.string :author, null: false
      t.timestamps
    end
  end
end
