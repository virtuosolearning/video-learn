class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :children, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

  validates :body, presence: true, length: { maximum: 500 }
end