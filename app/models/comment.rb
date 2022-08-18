class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates_presence_of :comment
end
