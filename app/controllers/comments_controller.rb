# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :comment_params
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
