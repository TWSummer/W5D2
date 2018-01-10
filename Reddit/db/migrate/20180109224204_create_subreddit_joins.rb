class CreateSubredditJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :subreddit_joins do |t|
      t.integer :post_id
      t.integer :subreddit_id
      t.timestamps
    end

    add_index :subreddit_joins, :post_id
    add_index :subreddit_joins, :subreddit_id
  end
end
