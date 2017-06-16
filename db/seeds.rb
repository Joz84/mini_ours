# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Inscription.destroy_all

validations = ["validation interne", "validation externe", "double echelle"]
quiz_types = ["QCM", "Questions ouvertes", "Questions fermées", "Questions refractaires"]
subcategories = ["maths", "phylo", "anglais", "sexologie"]
levels = ["bon", "moyen", "mauvais"]
10.times do |t|
  i = Inscription.create( moodle_id: t,
                          ours_id: t+1,
                          grouping_validation: validations[rand(3)]
                        )
  10.times do
    DailyTime.create( inscription: i,
                      duration: rand(10000)
                    )
  end
  10.times do
    CourseConsultation.create(  inscription: i,
                                moodle_scorm_id: t*2,
                                state: "Cool"
                              )
  end
  3.times do
    qar = QuizAttemptResult.create( quiz_attempt_moodle_id: nil,
                              inscription: i,
                              quiz_type: quiz_types.sample,
                              quiz_date: DateTime.now,
                              quiz_result: [true, false].sample
                            )
    2.times do
      count = rand(100)
      QuizAttemptSlice.create( questions_count: count,
                               correct_answers_count: rand(count),
                               question_subcategory: subcategories.sample,
                               quiz_attempt_result: qar,
                               level: levels.sample
                             )
    end
  end
end
