class PostsController < ApplicationController
# before the actions in the array are executed, the private find_post method is executed
before_action :find_post, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path # redirecting user to index page after deleting the post
  end

  private

  # for security reasons, to prevent that only permit the title and content from
  # being put into the form when creating a post, otherwhise you could submit any data to the server
  def post_params
    params.require(:post).permit(:title, :content)
  end

  # getting rid of repetitions of Post.find --> DRY (don't repeat yourself)
  def find_post
    @post = Post.find(params[:id])
  end
end
