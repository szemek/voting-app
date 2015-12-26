class DashboardController < ApplicationController
  def index
    render 'dashboard/index', locals: { questions: questions, question: question }
  end

  private

  def questions
    Question.recent
  end

  def question
    Question.new
  end
end
