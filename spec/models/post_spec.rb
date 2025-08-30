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

  context "when destroying a post" do
    it "can't destroy if the post is active" do
      post = FactoryBot.create(:post, active: true)
      expect(post.destroy).to be_falsey
    end

    it "can destroy if the post is not active" do
      post = FactoryBot.create(:post, active: false)
      expect(post.destroy).to be_truthy
    end
  end
end
