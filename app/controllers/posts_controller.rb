class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) # see below

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  # for security reasons, to prevent that only permit the title and content from
  # being input to the form when creating a post, otherwhise you could submit any data to the server
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
