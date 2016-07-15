class Posts < ActiveRecord::Migration
  def change
      create_table :posts do |t|
      t.string :text
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
