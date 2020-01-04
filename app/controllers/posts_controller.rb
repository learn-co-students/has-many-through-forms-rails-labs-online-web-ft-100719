class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.comments.build
  end

  def create
    raise @post.inspect
    @post = Post.create(post_params)

    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, 
                                 :content, 
                                 category_ids:[], 
                                 categories_attributes: [:name],
                                 comments: [:comment_content,
                                            :user_ids])
  end
end
