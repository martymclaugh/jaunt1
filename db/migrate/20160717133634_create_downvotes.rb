class CreateDownvotes < ActiveRecord::Migration
  def change
  	create_table :downvotes do |t|
	    t.integer :value
	    t.belongs_to :user
	    t.belongs_to :post

	    t.timestamps null: false
	end
	add_index :downvotes, [:user_id, :post_id], unique: true
  end
end
 