# frozen_string_literal: true

# using @posts, instances variables rails
# know to share those with your irb templates
# and you can use them in your views

class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      render json: { message: "Post deleted" }, status: :ok
    else
      render json: { message: "Post not found" }, status: :not_found
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end
