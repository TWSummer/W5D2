class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.all[0..50]
  end

  def show
    @subreddit = Subreddit.find_by(id: params[:id])
  end

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = Subreddit.new(subreddit_params)
    @subreddit.mod_users = [current_user]
    if @subreddit.save
      redirect_to subreddit_url(@subreddit)
    else
      flash.now[:errors] = @subreddit.errors.full_messages
      render :new
    end
  end

  def edit
    @subreddit = Subreddit.find_by(id: params[:id])
  end

  def update
    @subreddit = Subreddit.find_by(id: params[:id])
    if @subreddit
      if @subreddit.mod_users.include?(current_user)
        if @subreddit.update_attributes(subreddit_params)
          render subreddit_url(@subreddit)
        else
          flash[:errors] = @subreddit.errors.full_messages
        end
      else
        redirect_to subreddits_url
      end
    else
      redirect_to subreddits_url
    end
  end

  private

  def subreddit_params
    params.require(:subreddit).permit(:title, :description)
  end
end
