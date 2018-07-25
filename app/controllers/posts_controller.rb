class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    set_post!
    @post.category = post_params(:category)
    @post.content = post_params(:content)
    @post.title = post_params(:title)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
  end

  private

  def post_params(*args)
    params.permit(*args)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
