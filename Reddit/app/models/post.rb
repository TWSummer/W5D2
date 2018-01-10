class Post < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :subreddit_joins, inverse_of: :post, dependent: :destroy

  has_many :subreddits,
    through: :subreddit_joins,
    source: :subreddit

    has_many :comments
end
