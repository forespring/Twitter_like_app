class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :content, null: false, limit: 140

      t.timestamps null: false
    end
  end
end
