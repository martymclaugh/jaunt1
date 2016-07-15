class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name, presence: true
      t.string :username, presence: true, uniqueness: true
      t.string :email, presence: true, uniqueness: true
      t.string :password_hash

      t.timestamps null: false
    end
  end
end
