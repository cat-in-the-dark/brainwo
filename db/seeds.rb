# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

owner = Owner.create email: 'lol@lol.lol', password: 'qwertyui', password_confirmation: 'qwertyui'
quiz = owner.quizzes.create name: 'Supre quiz', status: :moderated
question_1 = quiz.questions.create title: 'question_1', description: 'ggggg', answer: 'answer'
question_2 = quiz.questions.create title: 'question_2', description: 'description', answer: 'answer'