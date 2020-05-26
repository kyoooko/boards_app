class CommentsController < ApplicationController
  def create
    # binding.pry
    comment=Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to comment.board
    else
      # redirect_to :back, flash: {
      #   comment: comment,
      #   error_messages: comment.errors.full_messages
      # }
       # rails5.１以降は下記
       flash[:comment]=comment
       flash[:error_messages]=comment.errors.full_messages
       redirect_back fallback_location: comment.board
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.board, flash: { notice: 'コメントが削除されました' }
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id,:name,:comment)
  end

end
