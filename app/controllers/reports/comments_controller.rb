# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
    @report = @commentable
  end

  def show_path
    'reports/show'
  end
end
