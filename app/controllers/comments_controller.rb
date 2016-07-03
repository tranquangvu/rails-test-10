class CommentsController < ApplicationController
  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    @success = comment.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
