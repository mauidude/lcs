class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, length: 100, null: false

      t.timestamps
    end

    add_index :projects, :name, unique: true
  end
end
