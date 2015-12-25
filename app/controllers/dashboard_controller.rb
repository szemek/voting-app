class DashboardController < ApplicationController
  def index
    @question = Question.new
  end
end
