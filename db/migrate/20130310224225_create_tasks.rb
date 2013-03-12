class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :cost_code, length: 10, null: false
      t.string :description, length: 256, null: false

      t.timestamps
    end

    add_index :tasks, :cost_code, unique: true
  end
end
