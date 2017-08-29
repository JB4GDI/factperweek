class FeedbacksController < ApplicationController

  def create
    @fact = Fact.find(params[:fact_id])
    @fact.feedbacks.create(feedback_params)
    redirect_to root_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:comment, :author)
  end

end