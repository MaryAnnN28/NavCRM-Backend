class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :task_type
      t.string :description
      t.string :due_date
      t.string :time_due
      t.text :notes
      t.integer :user_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
