class PostsController < ApplicationController

  def new
    @post = Post.new
    @subreddits = Subreddit.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def index
    @posts = Post.all[0..50]
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = Comment.where(post_id: @post.id)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    post = current_user.posts.find_by(id: params[:id])
    if post
      if post.update(post_params)
        redirect_to subreddit_url(post.subreddit)
      else
        flash.now[:errors] = post.errors.full_messages
        render :edit
      end
    else
      redirect_to posts_url
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if post.user == current_user
      post.destroy
    end
    redirect_to subreddits_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, subreddit_ids: [])
  end
end
