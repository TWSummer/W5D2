class Comment < ApplicationRecord
  validates :content, null: false

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  belongs_to :post

  belongs_to :parent,
    primary_key: :id,
    foreign_key: :parent_id,
    class_name: "Comment",
    optional: true

  has_many :child_comments,
    primary_key: :id,
    foreign_key: :parent_id,
    class_name: "Comment"

end
