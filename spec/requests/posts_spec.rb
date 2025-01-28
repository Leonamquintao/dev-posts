# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "returns a successful response" do
      get posts_path
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /show" do
    it "returns a successful response" do
      post = FactoryBot.create(:post)
      get post_path(post)
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /create" do
    it "creates a new post" do
      post = FactoryBot.attributes_for(:post)
      post posts_path, params: { post: post }
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /update" do
    it "updates an existing post" do
      post = FactoryBot.create(:post)
      put post_path(post), params: { post: { title: "New Title" } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /destroy" do
    it "deletes an existing post" do
      post = FactoryBot.create(:post)
      delete post_path(post)
      expect(response.body).to eq({ message: "Post deleted" }.to_json)
      expect(response).to have_http_status(:ok)
    end
  end
end
