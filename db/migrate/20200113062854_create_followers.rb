class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :user, foreign_key: true
      t.integer :follower_id, index: true
      t.timestamps
    end
  end
end
