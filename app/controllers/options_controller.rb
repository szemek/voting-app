class OptionsController < ApplicationController
  def vote
    Vote.create(question: question, option: option)

    redirect_to question_results_path(question)
  end

  private

  def question
    Question.find(params[:question_id])
  end

  def option
    question.options.find(params[:option_id])
  end
end
