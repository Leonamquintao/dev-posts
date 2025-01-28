# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :model do
  context "with a valid factory" do
    it "has a valid factory" do
      expect(FactoryBot.build(:post)).to be_valid
    end
  end

  context "when creating a post" do
    it "is valid with valid attributes" do
      post = FactoryBot.build(:post)
      expect(post).to be_valid
    end

    it "is not valid without a title" do
      post = FactoryBot.build(:post, title: nil)
      expect(post).not_to be_valid
    end

    it "is not valid without a body" do
      post = FactoryBot.build(:post, body: nil)
      expect(post).not_to be_valid
    end

    it "is not valid without an author" do
      post = FactoryBot.build(:post, author: nil)
      expect(post).not_to be_valid
    end
  end
end
