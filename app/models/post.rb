# frozen_string_literal: true

class Post < ApplicationRecord
  validates :active, inclusion: { in: [true, false] }, allow_nil: false
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true

  before_destroy :prevent_destroy_if_active

  private

  def prevent_destroy_if_active
    return unless active?

    errors.add(:base, "Cannot destroy an active post")
    throw(:abort)
  end
end
