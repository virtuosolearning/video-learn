class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates_presence_of :comment

  scope :by_lesson, -> (lesson) { where(lesson_id: lesson.id) }
end
