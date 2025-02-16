# frozen_string_literal: true

class Post < ApplicationRecord
  validates :active, inclusion: { in: [true, false] }, allow_nil: false
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true
end
