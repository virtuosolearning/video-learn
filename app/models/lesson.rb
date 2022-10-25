class Lesson < ApplicationRecord
  belongs_to :course
  has_many :comments, as: :commentable, dependent: :destroy
end
