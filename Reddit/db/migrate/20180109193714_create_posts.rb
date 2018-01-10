class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :title, null: false
      t.text :url
      t.text :content
      t.integer :subreddit_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :posts, :subreddit_id
    add_index :posts, :user_id
    add_index :posts, :title
  end
end
