class CreateModerators < ActiveRecord::Migration[5.1]
  def change
    create_table :moderators do |t|
      t.integer :user_id, null: false
      t.integer :subreddit_id, null: false

      t.timestamps
    end

    add_index :moderators, :user_id
    add_index :moderators, :subreddit_id
  end
end
