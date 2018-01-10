class ModeratorsController < ApplicationController

  def new
    @sub_id = params[:subreddit_id]
  end

  def create
    @sub_id = params[:subreddit_id]
    user = User.find_by(username: params[:username])
    if user
      moderator = Moderator.new(user_id: user.id, subreddit_id: @sub_id)
      if moderator.save
        redirect_to subreddit_url(@sub_id)
      else
        flash.now[:errors] = ["Unknown error"]
        render :new
      end
    else
      flash.now[:errors] = ["User not found"]
      render :new
    end
  end

  def destroy

  end
end
