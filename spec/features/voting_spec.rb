require 'rails_helper'

describe 'Voting', js: true do
  let!(:question) do
    Question.create(title: 'To be or not to be?', options: [
      Option.new(title: 'To be'),
      Option.new(title: 'Not to be')
    ])
  end

  specify 'user votes and sees results page' do
    visit question_path(question)

    expect(page).to have_content(question.title)

    # first vote for first option
    find(:xpath, '//form[1]//input').click
    visit question_path(question)
    # second vote for second option
    find(:xpath, '//form[2]//input').click

    expect(page).to have_current_path(question_results_path(question))
    # each option has 50%
    expect(page.body).to have_content('["To be",50.0]')
    expect(page.body).to have_content('["Not to be",50.0]')
  end
end
