class CreateDownvotes < ActiveRecord::Migration
  def change
  	create_table :downvotes do |t|
	    t.integer :value
	    t.belongs_to :user
	    t.belongs_to :post

	    t.timestamps null: false
	end
  end
end
