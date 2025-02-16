# frozen_string_literal: true

# using @posts, instances variables rails
# know to share those with your irb templates
# and you can use them in your views

class PostsController < ApplicationController
  # with this, the methods inside the array will no longer the request
  # of having  "@post = Post.find(params[:id])" on the declaration, it uses
  # the private before_action method declared on the bottom of the file.
  # I just used these methods as example personally I prefer the verbose way.
  before_action :find_blog_post, only: %i[activate deactivate destroy]
  def index
    # @posts = Post.all
    # Find only the actives one
    @posts = Post.where(active: true).order(:id)
    if @posts.all # instead @posts.all
      render json: @posts
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def create
    @post = Post.create(post_params.merge(active: true))
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

  def activate
    if @post.update(active: true)
      render json: @post, status: :ok
    else
      Rails.logger.error(@post.errors.full_messages)
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def deactivate
    if @post.update(active: false)
      render json: @post, status: :ok
    else
      Rails.logger.error(@post.errors.full_messages)
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def inactive
    @posts = Post.where(active: false).order(:id)
    if @posts.any?
      render json: @posts
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      render json: { message: "Post deleted" }, status: :ok
    else
      render json: { message: "Post not found" }, status: :not_found
    end
  end

  def preview
    @posts = Post.all
    render :preview
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author)
  end

  def find_blog_post
    @post = Post.find(params[:id])
  end
end
