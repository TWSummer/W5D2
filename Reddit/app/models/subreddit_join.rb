class SubredditJoin < ApplicationRecord
  belongs_to :post
  belongs_to :subreddit
end
