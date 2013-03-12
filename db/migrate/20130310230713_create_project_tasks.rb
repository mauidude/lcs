class CreateProjectTasks < ActiveRecord::Migration
  def change
    create_table :project_tasks do |t|
      t.date :week, null: false
      t.integer :hours, null: false
      t.references :project, null: false
      t.references :task, null: false

      t.timestamps
    end

    add_index :project_tasks, :project_id
    add_index :project_tasks, :task_id
  end
end
