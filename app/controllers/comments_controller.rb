class CommentsController < ApplicationController
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
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      if @comment.update(content: params[:content])
        format.json { render json: { content: @comment.content } }
      else
        format.json { render json: { errors: @comment.errors.message }}
      end
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
