class CreateSubreddits < ActiveRecord::Migration[5.1]
  def change
    create_table :subreddits do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end

    add_index :subreddits, :title, unique: true
  end
end
