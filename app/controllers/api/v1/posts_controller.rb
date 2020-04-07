class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    if logged_in?
      @posts = current_user.posts

      render json: PostSerializer.new(@posts)
    else
      render json: {
        error: "You aren't logged in!!!"
      }
    end
  end

  def show
    render json: @post
  end

  def create
    @post = current_user.posts.build(post_params)
      if @post.save
        render json: PostSerializer.new(@post), status: :created
      else
        error_resp = {
          error: @post.errors.full_messages.to_sentence
        }
        render json: error_resp, status: :unprocessable_entity
      end
  end

  def update
    if @post.update(post_params)
      render json: PostSerializer.new(@post), status: :ok
    else
      error_resp = {
        error: @post.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
