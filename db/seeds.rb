# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

User.create!(email: 'user@example.com', password: 'password')

excel_course_1 = Course.create!(title: 'Intro to Excel', description: 'In this course, we introduce basic concepts in Excel.')
excel_course_2 = Course.create!(title: 'Advanced Excel', description: 'In this course, we introduce advanced concepts in Excel.')

powerpoint_course_1 = Course.create!(title: 'Intro to Powerpoint', description: 'In this course, we introduce basic concepts in Powerpoint.')
powerpoint_course_2 = Course.create!(title: 'Advanced Powerpoint', description: 'In this course, we introduce advanced concepts in Powerpoint.')


Lesson.create!(title: 'Excel lesson 1', video_link: 'https://www.youtube.com/embed/k1VUZEVuDJ8', is_excel: true, course: excel_course_1)
Lesson.create!(title: 'Excel lesson 2', video_link: 'https://www.youtube.com/embed/bhZckWTLkJM', is_excel: true, course: excel_course_1)
Lesson.create!(title: 'Excel lesson 3', video_link: 'https://www.youtube.com/embed/47yu50CsH00', is_excel: true, course: excel_course_2)
Lesson.create!(title: 'Excel lesson 4', video_link: 'https://www.youtube.com/embed/c8qePWuYleg', is_excel: true, course: excel_course_2)

Lesson.create!(title: 'Powerpoint lesson 1', video_link: 'https://www.youtube.com/embed/u7Tku3_RGPs', is_powerpoint: true, course: powerpoint_course_1)
Lesson.create!(title: 'Powerpoint lesson 2', video_link: 'https://www.youtube.com/embed/YcOq9LnBshY', is_powerpoint: true, course: powerpoint_course_1)
Lesson.create!(title: 'Powerpoint lesson 3', video_link: 'https://www.youtube.com/embed/u7Tku3_RGPs', is_powerpoint: true, course: powerpoint_course_2)
Lesson.create!(title: 'Powerpoint lesson 4', video_link: 'https://www.youtube.com/embed/YcOq9LnBshY', is_powerpoint: true, course: powerpoint_course_2)
