# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

question1 = Question.find_or_initialize_by(title: 'SQL vs. no-SQL')
question1.options = [
  Option.find_or_initialize_by(question_id: question1.id, title: 'SQL'),
  Option.find_or_initialize_by(question_id: question1.id, title: 'no-SQL')
]
question1.save

question2 = Question.find_or_initialize_by(title: 'iOS vs. Android vs. Windows Phone')
question2.options = [
  Option.find_or_initialize_by(question_id: question2.id, title: 'iOS'),
  Option.find_or_initialize_by(question_id: question2.id, title: 'Android'),
  Option.find_or_initialize_by(question_id: question2.id, title: 'Windows Phone')
]
question2.save
