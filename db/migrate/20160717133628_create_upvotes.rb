class CreateUpvotes < ActiveRecord::Migration
  	def change
	  create_table :upvotes do |t|
	      t.integer :value
	      t.belongs_to :user
	      t.belongs_to :post

	      t.timestamps null: false
	  end
	end
end
