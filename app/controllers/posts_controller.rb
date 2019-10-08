class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) # see below
  end

  private

  # for security reasons, to prevent that only permit the title and content from
  # being input to the form when creating a post, otherwhise you could submit any data to the server
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
