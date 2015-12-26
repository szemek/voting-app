class QuestionResults
  attr_reader :question

  def initialize(question)
    @question = question
  end

  def data
    options.map do |option|
      [option.title, (option.votes.count * 100.0 ) / total_votes_count]
    end
  end

  private

  def total_votes_count
    @total_votes_count ||= votes.count
  end

  def votes
    @votes ||= question.votes
  end

  def options
    @options = question.options
  end
end
