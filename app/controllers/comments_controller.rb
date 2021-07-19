# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :comment_params
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render book_or_report_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def book_or_report_path
    if @book
      'books/show'
    elsif @report
      'reports/show'
    end
  end
end
