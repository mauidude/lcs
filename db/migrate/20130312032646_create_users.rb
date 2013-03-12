class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, length: 20, null: false
      t.string :last_name, length: 20, null: false

      t.timestamps
    end
  end
end
