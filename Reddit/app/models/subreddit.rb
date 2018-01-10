class Subreddit < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :moderators
  has_many :subreddit_joins, inverse_of: :subreddit

  has_many :posts,
    through: :subreddit_joins,
    source: :post

  has_many :mod_users,
    through: :moderators,
    source: :user

end
