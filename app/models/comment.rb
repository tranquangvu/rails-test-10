class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent,  class_name: "Comment"
  has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

  validates :content, presence: true

  default_scope    { order(:created_at) }
  scope :roots, -> { where(parent_id: nil) }
end
