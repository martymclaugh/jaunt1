class CreateUpvotes < ActiveRecord::Migration
  	def change
	  create_table :upvotes do |t|
	      t.integer :value
	      t.belongs_to :user
	      t.belongs_to :post

	      t.timestamps null: false
	  end
	  add_index :upvotes, [:user_id, :post_id], unique: true
	end
end
