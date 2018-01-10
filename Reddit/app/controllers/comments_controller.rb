class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.author = current_user
    comment.post_id = params[:post_id]
    if comment.save
      redirect_to post_url(comment.post_id)
    else
      flash.now[:errors] = comment.errors.full_messages
      redirect_to post_url(comment.post_id)
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
