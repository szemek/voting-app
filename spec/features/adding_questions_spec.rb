require 'rails_helper'

describe 'Adding questions', js: true do
  let(:question) { 'To be or not to be?' }

  specify 'user fill form & save question' do
    visit '/'

    within '#new_question' do
      fill_in 'question_title', with: question

      find_link('Add option').click

      find(:xpath, "//div[@id='options']//input").set('To be')

      find_button('Save question').click
    end

    expect(page).to have_content(question)
    expect(page).to have_current_path(question_path(Question.last))
  end
end
