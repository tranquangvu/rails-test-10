class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    @success = comment.save
  end

  def edit; end

  def update
    respond_to do |format|
      if @comment.update(content: params[:content])
        format.json { render json: { content: @comment.content } }
      else
        format.json { render json: { errors: @comment.errors.message }}
      end
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
