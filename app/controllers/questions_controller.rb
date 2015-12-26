class QuestionsController < ApplicationController
  def create
    question = Question.new(question_params)

    if question.save
      redirect_to question_path(question)
    else
      render 'dashboard/index', locals: { question: question, questions: questions }
    end
  end

  def show
    question = Question.find(params[:id])

    render :show, locals: { question: question }
  end

  def results
    question = Question.find(params[:question_id])
    data = QuestionResults.new(question).data

    render :results, locals: { question: question, data: data }
  end

  private

  def questions
    Question.recent
  end

  def question_params
    params.require(:question).permit(:title, options_attributes: [:id, :title, :_destroy])
  end
end
