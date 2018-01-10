class DeleteSubredditIdFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :subreddit_id
  end
end
