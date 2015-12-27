require 'rails_helper'

describe Question do
  context 'invalid' do
    let(:question) { Question.new }

    it 'requires title and option' do
      expect(question.valid?).to eq(false)

      expect(question.errors).to include(:title)
      expect(question.errors).to include(:options)
    end
  end

  context 'valid' do
    let(:option1) { Option.new(title: 'To be') }
    let(:option2) { Option.new(title: 'Not to be') }
    let(:question) { Question.new(title: 'To be or not to be?', options: [option1, option2]) }

    it 'is valid with title and options' do
      expect(question.valid?).to eq(true)
    end
  end
end
