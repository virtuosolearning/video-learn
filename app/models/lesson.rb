class Lesson < ApplicationRecord
  include Commentable
  belongs_to :course
end
